From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Subject: [PATCH_V2 0/4] MIPS: Add Xilfpga platform
Date: Tue, 20 Oct 2015 17:30:57 +0100
Message-ID: <1445358661-53953-1-git-send-email-Zubair.Kakakhel@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-mips-bounce@linux-mips.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: ralf@linux-mips.org, robh+dt@kernel.org
Cc: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

This series is based on v4.3-rc6.

Adds support for the Imagination University Program MIPSfpga platform.

See the first dt-bindings patch for details about the platform.

These patches allow the kernel to boot with UART and gpio support.

Acks from DT (patch 1/4) welcome.

Regards,
ZubairLK

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
 arch/mips/include/asm/mach-xilfpga/gpio.h          | 19 +++++
 arch/mips/include/asm/mach-xilfpga/irq.h           | 18 +++++
 arch/mips/xilfpga/Kconfig                          |  9 +++
 arch/mips/xilfpga/Makefile                         |  7 ++
 arch/mips/xilfpga/Platform                         |  3 +
 arch/mips/xilfpga/init.c                           | 57 +++++++++++++++
 arch/mips/xilfpga/intc.c                           | 25 +++++++
 arch/mips/xilfpga/time.c                           | 41 +++++++++++
 16 files changed, 403 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mips/img/xilfpga.txt
 create mode 100644 arch/mips/boot/dts/xilfpga/Makefile
 create mode 100644 arch/mips/boot/dts/xilfpga/microAptiv.dtsi
 create mode 100644 arch/mips/boot/dts/xilfpga/nexys4ddr.dts
 create mode 100644 arch/mips/configs/xilfpga_defconfig
 create mode 100644 arch/mips/include/asm/mach-xilfpga/gpio.h
 create mode 100644 arch/mips/include/asm/mach-xilfpga/irq.h
 create mode 100644 arch/mips/xilfpga/Kconfig
 create mode 100644 arch/mips/xilfpga/Makefile
 create mode 100644 arch/mips/xilfpga/Platform
 create mode 100644 arch/mips/xilfpga/init.c
 create mode 100644 arch/mips/xilfpga/intc.c
 create mode 100644 arch/mips/xilfpga/time.c

-- 
1.9.1
