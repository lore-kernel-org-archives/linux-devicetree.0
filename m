From: Wenyou Yang <wenyou.yang@atmel.com>
Subject: [PATCH 2/2] mfd: add documentation for ACT8945A DT bindings
Date: Fri, 8 Jan 2016 10:05:28 +0800
Message-ID: <1452218729-11357-3-git-send-email-wenyou.yang@atmel.com>
References: <1452218729-11357-1-git-send-email-wenyou.yang@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452218729-11357-1-git-send-email-wenyou.yang@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Wenyou Yang <wenyou.yang@atmel.com>
List-Id: devicetree@vger.kernel.org

The Active-semi ACT8945A PMIC is a Multi-Function Device, it has
two subdevices:
 - Regulator
 - Charger

This patch adds documentation for ACT8945A DT bindings.

Signed-off-by: Wenyou Yang <wenyou.yang@atmel.com>
---

 Documentation/devicetree/bindings/mfd/act8945a.txt |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/act8945a.txt

diff --git a/Documentation/devicetree/bindings/mfd/act8945a.txt b/Documentation/devicetree/bindings/mfd/act8945a.txt
new file mode 100644
index 0000000..406db16
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/act8945a.txt
@@ -0,0 +1,16 @@
+Device-Tree bindings for Active-semi ACT8945A MFD driver
+
+Required properties:
+ - compatible: "active-semi,act8945a".
+ - reg: the I2C slave address for the ACT8945A chip
+
+The chip exposes two subdevices:
+ - a regulators: see ../regulator/act8945a-regulator.txt
+ - a charger: see ../power/act8945a-charger.txt
+
+Example:
+	mfd: act8945a@5b {
+		compatible = "active-semi,act8945a";
+		reg = <0x5b>;
+		status = "okay";
+	};
-- 
1.7.9.5
