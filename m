From: Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: [PATCH RFC v3 0/4] MIPS: add vmlinu{x,z}.bin appended dtb support
Date: Sun, 12 Apr 2015 12:24:57 +0200
Message-ID: <1428834301-12721-1-git-send-email-jogo@openwrt.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Aaro Koskinen <aaro.koskinen-X3B1VOXEql0@public.gmane.org>, Markos Chandras <markos.chandras-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Daniel Schwierzeck <daniel.schwierzeck-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, James Hartley <James.Hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch series implements vmlinux.bin and vmlinuz.bin appended dtb
support, and adds a user for the vmlinux one.

The first two patches add the appropriate support for vmlinux.bin and
vmlinuz.bin. Since enabling it for both does not make sense (and is
potentially dangerous) I made it a choice for which variant it should be
enabled.

Patches three and four then add BMIPS as a test user for this
implementation. vmlinuz.bin was tested by selecting SYS_SUPPORTS_ZBOOT
and setting zload-y to 0x81000000 (ramstart + 16 MiB, so the kernel
is loaded behind CFE), then wrapping vmlinuz_w_dtb.bin in the CFE
expected lzma with appropriate header to unpack there.

For easier testing/using I changed boot/dts/brcm to build all dts files
as dtb blobs in case no built in dtb is selected.

Completely untested on anything except MIPS32 / big endian.

Obviously it won't work with an ELF kernel. I did not have a reasonable
idea how to do that except by parsing the elf header from head.S, and
that seemed a bit insane.

Regards
Jonas

Changes RFC v2 -> v3
* Switched to UHI specs interface instead of manipulating initial_boot_params
* fixed boot on !SMP
* Changed PTR_LW to lw and PTR_LI to li to ensure 32bit loads/
  comparisons are done also on 64 bit
* Added vmlinuz.bin support
* Added bmips as a user

Changes RFC v1 -> v2

* changed all occurences of vmlinux to vmlinux.bin
* clarified this applies to the raw vmlinux.bin without decompressor
* s/initial_device_params/initial_boot_params/



Jonas Gorski (4):
  MIPS: add support for vmlinux.bin appended dtb
  MIPS: add support for vmlinuz.bin appended dtb
  MIPS: BMIPS: build all dtbs if no builtin dtb
  MIPS: BMIPS: accept UHI interface for passing a dtb

 arch/mips/Kconfig                   |   45 +++++++++++++++++++++++++++++++++++
 arch/mips/bmips/setup.c             |    2 ++
 arch/mips/boot/compressed/head.S    |   16 +++++++++++++
 arch/mips/boot/compressed/ld.script |    6 ++++-
 arch/mips/boot/dts/brcm/Makefile    |   13 ++++++++++
 arch/mips/kernel/head.S             |   16 +++++++++++++
 arch/mips/kernel/vmlinux.lds.S      |    8 ++++++-
 7 files changed, 104 insertions(+), 2 deletions(-)

-- 
1.7.10.4
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
