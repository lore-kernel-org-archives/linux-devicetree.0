From: Constantine Shulyupin <const@MakeLinux.com>
Subject: [PATCH v2] Documentation: add Device tree bindings for hwmon/nct7802
Date: Mon,  7 Sep 2015 00:59:49 +0300
Message-ID: <1441576829-15789-1-git-send-email-const@MakeLinux.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Constantine Shulyupin <const@MakeLinux.com>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
List-Id: devicetree@vger.kernel.org

Changed in v2:
- Removed nct7802,reg-init
- Added registers initialization by names

Introduced in v1:
 - nct7802,reg-init

Signed-off-by: Constantine Shulyupin <const@MakeLinux.com>
---
---
 .../devicetree/bindings/hwmon/nct7802.txt          | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/nct7802.txt

diff --git a/Documentation/devicetree/bindings/hwmon/nct7802.txt b/Documentation/devicetree/bindings/hwmon/nct7802.txt
new file mode 100644
index 0000000..56214bf
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/nct7802.txt
@@ -0,0 +1,24 @@
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
+ - nct7802,Start
+ - nct7802,Mode
+ - nct7802,EnPECI
+ - nct7802,EnFan
+ - nct7802,EnV
+
+Example nct7802 node:
+
+nct7802 {
+	compatible = "nuvoton,nct7802";
+	reg = <0x2a>;
+	nct7802,Start = <0x01>;
+	nct7802,Mode = <0x7E>; // RTD1_MD = 2
+};
-- 
1.9.1
