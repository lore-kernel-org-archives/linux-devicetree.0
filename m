From: Constantine Shulyupin <const@MakeLinux.com>
Subject: [PATCH v3] Documentation: add Device tree bindings for hwmon/nct7802
Date: Tue,  8 Sep 2015 01:27:47 +0300
Message-ID: <1441664902-32360-1-git-send-email-const@MakeLinux.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Constantine Shulyupin <const@MakeLinux.com>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: linux@roeck-us.net
List-Id: devicetree@vger.kernel.org

Add add Device tree bindings for registers
which are not covered by hwmon ABI and are required to
configure specific HW.
---

Changed in v3:
- Fixed vendor prefix
- Added short registers description,
  full registers description is available at
https://www.nuvoton.com/hq/products/cloud-computing/hardware-monitors/desktop-server-series/nct7802y/

Changed in v2:
- Removed nct7802,reg-init
- Added registers initialization by names

Introduced in v1:
 - nct7802,reg-init

Signed-off-by: Constantine Shulyupin <const@MakeLinux.com>
---
 .../devicetree/bindings/hwmon/nct7802.txt          | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/nct7802.txt

diff --git a/Documentation/devicetree/bindings/hwmon/nct7802.txt b/Documentation/devicetree/bindings/hwmon/nct7802.txt
new file mode 100644
index 0000000..5b4c3fe
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/nct7802.txt
@@ -0,0 +1,28 @@
+Nuvoton NCT7802Y Hardware Monitoring IC
+
+Required node properties:
+
+ - "compatible": must be "nuvoton,nct7802"
+ - "reg": I2C bus address of the device
+
+Optional properties:
+
+One byte registers:
+ - nuvoton,start - Start register at index 0x21
+ - nuvoton,mode - Mode register at index 0x22
+ - nuvoton,en_peci - PECI enable register at index 0x23
+ - nuvoton,en_fan - Fan Enable Register at index 0x24
+ - nuvoton,en_v - voltage monitor enable register
+		  at index 0x25
+
+A detailed datasheet for registers and the device is
+available at Nuvoton web site.
+
+Example nct7802 node:
+
+nct7802 {
+	compatible = "nuvoton,nct7802";
+	reg = <0x2a>;
+	nuvoton,start = <0x01>;
+	nuvoton,mode = <0x7E>; // RTD1_MD = 2
+};
-- 
1.9.1
