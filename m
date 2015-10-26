From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH_V3 0/4] MIPS: Add Xilfpga platform
Date: Mon, 26 Oct 2015 11:30:53 +0000
Message-ID: <1445859057-47665-1-git-send-email-Zubair.Kakakhel@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

This series is based on v4.3-rc7.

Adds support for the Imagination University Program MIPSfpga platform.

See the first dt-bindings patch for details about the platform.

These patches allow the kernel to boot with UART and gpio support.

Acks from DT (patch 1/4) welcome.

Regards,
ZubairLK

V2 -> V3
Minor typos/nitpicks.
Removed redundant header.
Individual patches have changelogs.

V1 -> V2
Nothing major functional.
Mostly cleanup. Individual patches have changelogs.
Removed the gpio patch from this series as Linus Walleij applied it.

Zubair Lutfullah Kakakhel (4):
  dt-bindings: MIPS: Document xilfpga bindings and boot style
  MIPS: dt: xilfpga: Add xilfpga device tree files.
  MIPS: xilfpga: Add mipsfpga platform code
  MIPS: Add xilfpga defconfig

 .../devicetree/bindings/mips/img/xilfpga.txt       | 83 ++++++++++++++++++++++
 arch/mips/Kbuild.platforms                         |  1 +
 arch/mips/Kconfig                                  | 23 ++++++
 arch/mips/boot/dts/Makefile                        |  1 +
 arch/mips/boot/dts/xilfpga/Makefile                |  9 +++
 arch/mips/boot/dts/xilfpga/microAptiv.dtsi         | 21 ++++++
 arch/mips/boot/dts/xilfpga/nexys4ddr.dts           | 46 ++++++++++++
 arch/mips/configs/xilfpga_defconfig                | 40 +++++++++++
 arch/mips/include/asm/mach-xilfpga/irq.h           | 18 +++++
 arch/mips/xilfpga/Kconfig                          |  9 +++
 arch/mips/xilfpga/Makefile                         |  7 ++
 arch/mips/xilfpga/Platform                         |  3 +
 arch/mips/xilfpga/init.c                           | 57 +++++++++++++++
 arch/mips/xilfpga/intc.c                           | 25 +++++++
 arch/mips/xilfpga/time.c                           | 41 +++++++++++
 15 files changed, 384 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mips/img/xilfpga.txt
 create mode 100644 arch/mips/boot/dts/xilfpga/Makefile
 create mode 100644 arch/mips/boot/dts/xilfpga/microAptiv.dtsi
 create mode 100644 arch/mips/boot/dts/xilfpga/nexys4ddr.dts
 create mode 100644 arch/mips/configs/xilfpga_defconfig
 create mode 100644 arch/mips/include/asm/mach-xilfpga/irq.h
 create mode 100644 arch/mips/xilfpga/Kconfig
 create mode 100644 arch/mips/xilfpga/Makefile
 create mode 100644 arch/mips/xilfpga/Platform
 create mode 100644 arch/mips/xilfpga/init.c
 create mode 100644 arch/mips/xilfpga/intc.c
 create mode 100644 arch/mips/xilfpga/time.c

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
