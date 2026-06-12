/* SPDX-License-Identifier: GPL-2.0 */
/*
 * With CONFIG_LTO_CLANG, LLD always enables -fdata-sections and
 * -ffunction-sections, which increases the size of the final module.
 * Merge the split sections in the final binary.
 */

#ifdef CONFIG_CFI_CLANG
# include <asm/page.h>
# define ALIGN_CFI 		ALIGN(PAGE_SIZE)
# define SANITIZER_DISCARDS	*(.eh_frame)
#else
# define ALIGN_CFI
# define SANITIZER_DISCARDS
#endif

SECTIONS {
	/*
	 * LLVM may emit .eh_frame with CONFIG_CFI_CLANG despite
	 * -fno-asynchronous-unwind-tables. Discard the section.
	 */
	/DISCARD/ : {
		SANITIZER_DISCARDS
	}

	.bss : {
		*(.bss .bss.[0-9a-zA-Z_]*)
		*(.bss..L*)
	}

	.data : {
		*(.data .data.[0-9a-zA-Z_]*)
		*(.data..L*)
	}

	.rodata : {
		*(.rodata .rodata.[0-9a-zA-Z_]*)
		*(.rodata..L*)
	}

	/*
	 * With CONFIG_CFI_CLANG, we assume __cfi_check is at the beginning
	 * of the .text section, and is aligned to PAGE_SIZE.
	 */
	.text : ALIGN_CFI {
		*(.text.__cfi_check)
		*(.text .text.[0-9a-zA-Z_]* .text..L.cfi*)
	}
}
