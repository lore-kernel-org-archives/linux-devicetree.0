From: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
Subject: [PATCH v2 0/5] Add Spreadtrum Sharkl Platform support
Date: Fri, 17 Oct 2014 17:54:20 +0800
Message-ID: <1413539665-11484-1-git-send-email-chunyan.zhang@spreadtrum.com>
References: <sprd-1017-v2>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <sprd-1017-v2>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: catalin.marinas@arm.com, gregkh@linuxfoundation.org, ijc+devicetree@hellion.org.uk, jslaby@suse.cz, galak@codeaurora.org, broonie@linaro.org, mark.rutland@arm.com, m-karicheri2@ti.com, pawel.moll@arm.com, artagnon@gmail.com, rrichter@cavium.com, robh+dt@kernel.org, will.deacon@arm.com, orsonzhai@gmail.com, geng.ren@spreadtrum.com, zhizhou.zhang@spreadtrum.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, sprdlinux@freelists.org
List-Id: devicetree@vger.kernel.org

Spreadtrum is a rapid growing chip vendor providing smart phone total solutions.

Sharkl Platform is nominated as a SoC infrastructure that supports 4G/3G/2G
standards based on ARMv8 multiple core architecture.Now we have only one
SoC(Sharkl3) based on this Platform in developing.

This patchset adds Sharkl support in arm64 device tree and implements the
basic earlycon serial driver.

This patchset also has patches which address "sprd" prefix and DT compatible
strings for nodes which appear un-documented.

This version code was tesed on Fast Mode successfully.

Changes from v1:
* Addressed review comments:
	- Added "sprd" prefix to vendor-prefixes.txt
	- Created serial/sprd-serial.txt and remove the properties for serial-sprd
	  from of-serial.txt to it.
	- Renamed of-serial.txt to 8250.txt according to Arnd's review comments
	- Splited and revised .dts for Sharkl Platform
	- Changed to PSCI method for cpu power management
	- Revised Kconfig Makefile to match the alphabetical ordering
	- Renamed serial-sprd-earlycon.c to serial-sprd.c

Chunyan Zhang (3):
  Documentation: DT: Renamed of-serial.txt to 8250.txt
  Documentation: DT: Add bindings for Spreadtrum Sharkl Platform
  tty/serial: Add earlycon support for Spreadtrum serial driver

Zhizhou Zhang (2):
  arm64: dts: Add support for Spreadtrum Sharkl3 SoC in dts and Makefile.
  arm64: Add support for Spreadtrum's Sharkl Platform in Kconfig and defconfig

 Documentation/devicetree/bindings/arm/sprd.txt     |   11 ++++
 Documentation/devicetree/bindings/serial/8250.txt  |   50 ++++++++++++++
 .../devicetree/bindings/serial/of-serial.txt       |   50 --------------
 .../devicetree/bindings/serial/sprd-serial.txt     |    6 ++
 .../devicetree/bindings/vendor-prefixes.txt        |    1 +
 arch/arm64/Kconfig                                 |    6 ++
 arch/arm64/boot/dts/Makefile                       |    1 +
 arch/arm64/boot/dts/sprd-sharkl.dtsi               |   33 ++++++++++
 arch/arm64/boot/dts/sprd-sharkl3-fpga.dts          |   41 ++++++++++++
 arch/arm64/boot/dts/sprd-sharkl3.dtsi              |   69 ++++++++++++++++++++
 arch/arm64/configs/defconfig                       |    1 +
 drivers/tty/serial/Kconfig                         |   24 +++++++
 drivers/tty/serial/Makefile                        |    1 +
 drivers/tty/serial/sprd-serial.c                   |   64 ++++++++++++++++++
 14 files changed, 308 insertions(+), 50 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/sprd.txt
 create mode 100644 Documentation/devicetree/bindings/serial/8250.txt
 delete mode 100644 Documentation/devicetree/bindings/serial/of-serial.txt
 create mode 100644 Documentation/devicetree/bindings/serial/sprd-serial.txt
 create mode 100644 arch/arm64/boot/dts/sprd-sharkl.dtsi
 create mode 100644 arch/arm64/boot/dts/sprd-sharkl3-fpga.dts
 create mode 100644 arch/arm64/boot/dts/sprd-sharkl3.dtsi
 create mode 100644 drivers/tty/serial/sprd-serial.c

-- 
1.7.9.5
