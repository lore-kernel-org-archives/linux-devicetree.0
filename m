From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 00/13] Enable building all dtb files
Date: Thu,  8 Oct 2015 12:53:34 -0500
Message-ID: <1444326827-3565-1-git-send-email-robh@kernel.org>
Return-path: <linux-metag-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-metag-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Chris Zankel <chris-YvXeqwSYzG2sTnJN9+BGXg@public.gmane.org>, Max Filippov <jcmvbkbc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-xtensa-PjhNF2WwrV/0Sa2dR60CXw@public.gmane.org, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Ley Foon Tan <lftan-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, nios2-dev-g9ZBwUv/Ih/yUk5EbOjzuce+I+R0W71w@public.gmane.org, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, linux-metag-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yoshinori Sato <ysato-Rn4VEauK+AKRv+LV9MX5uooqe+aC9MnS@public.gmane.org>, uclinux-h8-devel-5NWGOfrQmneRv+LV9MX5uooqe+aC9MnS@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel@list
List-Id: devicetree@vger.kernel.org

This series enables building all the dtb files in the kernel mostly 
independent of the kernel config. The option is only dependent on 
COMPILE_TEST, OF, and the new OF_ALL_DTBS options. This ensures that 
allyesconfig builds can build all dtb files although most arches have to 
build "dtbs" target explicitly. Some arches like ARM include dtbs in the 
default target.

Arch/arm-soc maintainers, Please ack and I will take this series via the DT 
tree.

v2:
- Add OF_ALL_DTBS option hidden behind COMPILE_TEST
- Expand to all architectures (with more than 1 dtb)

Rob


Rob Herring (13):
  of: add config option to enable building of all dtbs
  arc: use common make variables for dtb builds
  arc: enable building of all dtbs
  arm: enable building of all dtbs
  arm64: enable building of all dtbs
  h8300: enable building of all dtbs
  metag: use common make variables for dtb builds
  metag: enable building of all dtbs
  mips: enable building of all dtbs
  nios2: use common make variables for dtb builds
  nios2: enable building of all dtbs
  powerpc: enable building of all dtbs
  xtensa: enable building of all dtbs

 arch/arc/Makefile              |  2 +-
 arch/arc/boot/dts/Makefile     |  6 ++++--
 arch/arm/boot/dts/Makefile     |  3 +++
 arch/arm64/boot/dts/Makefile   |  6 ++++++
 arch/h8300/boot/dts/Makefile   |  3 +++
 arch/metag/Makefile            |  2 +-
 arch/metag/boot/dts/Makefile   |  7 +++----
 arch/mips/boot/dts/Makefile    |  3 +++
 arch/nios2/Makefile            | 10 +++++-----
 arch/nios2/boot/Makefile       | 13 +++----------
 arch/nios2/boot/dts/Makefile   |  6 ++++++
 arch/powerpc/Makefile          |  6 ++++++
 arch/powerpc/boot/Makefile     |  5 ++++-
 arch/powerpc/boot/dts/Makefile |  5 +++++
 arch/xtensa/Makefile           |  4 ++++
 arch/xtensa/boot/dts/Makefile  |  7 ++++++-
 drivers/of/Kconfig             | 10 ++++++++++
 17 files changed, 73 insertions(+), 25 deletions(-)
 create mode 100644 arch/nios2/boot/dts/Makefile
 create mode 100644 arch/powerpc/boot/dts/Makefile

-- 
2.1.4
