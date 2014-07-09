From: Feng Kan <fkan@apm.com>
Subject: [PATCH V8 0/6] Add X-Gene platform reboot mechanism
Date: Tue,  8 Jul 2014 19:15:47 -0700
Message-ID: <1404872153-3594-1-git-send-email-fkan@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: dbaryshkov@gmail.com, catalin.marinas@arm.com, dwmw2@infradead.org, arnd@arndb.de, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, patches@apm.com
Cc: Feng Kan <fkan@apm.com>
List-Id: devicetree@vger.kernel.org

Enable reboot driver for the X-Gene platform. Add generic syscon reboot
driver.

V8 Change:
	- change Kconfig to depend on ARM || ARM64 || COMPILE_TEST

V7 Change:
	- Seem V3 on, the patches were not making in to the mailinglist.
	- Fix build error produced by other ARCH while including this
	  driver. Set to depend on arm64 ARCH for now.

V6 Change:
	- Add documentation for scu node.

V5 Change:
	- Documentation update, endian and access size.

V4 Change:
	- Remove old X-Gene reboot driver
	- Add generic syscon reboot driver
	- Add DTS and Kconfig for X-Gene reboot using syscon method

V3 Change:
	- Remove the reboot driver's use of acpi resource patch.
	- Change the reboot driver to use syscon to parse out 
	  system clock register. Remove the old method of getting
	  register from the reboot driver directly.
	- Remove documentation since its now simple.

V2 Change:
	- Add support for using ACPI resource.


Feng Kan (6):
  power: reset: Add generic SYSCON register mapped reset
  Documentation: power: reset: Add documentation for generic SYSCON
    reboot driver
  Documentation: arm64: add SCU dts binding documentation to linux
    kernel
  arm64: dts: Add X-Gene reboot driver dts node
  arm64: Select reboot driver for X-Gene platform
  power: reset: Remove X-Gene reboot driver

 Documentation/devicetree/bindings/arm/apm/scu.txt  |  17 ++++
 .../bindings/power/reset/syscon-reboot.txt         |  23 +++++
 arch/arm64/Kconfig                                 |   2 +
 arch/arm64/boot/dts/apm-storm.dtsi                 |  12 +++
 drivers/power/reset/Kconfig                        |  13 ++-
 drivers/power/reset/Makefile                       |   2 +-
 drivers/power/reset/syscon-reboot.c                |  91 ++++++++++++++++++
 drivers/power/reset/xgene-reboot.c                 | 103 ---------------------
 8 files changed, 152 insertions(+), 111 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/apm/scu.txt
 create mode 100644 Documentation/devicetree/bindings/power/reset/syscon-reboot.txt
 create mode 100644 drivers/power/reset/syscon-reboot.c
 delete mode 100644 drivers/power/reset/xgene-reboot.c

-- 
1.9.1
