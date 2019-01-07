From: Xiaoting Liu <xiaoting.liu@hxt-semitech.com>
Subject: [PATCH v2 2/4] dt-bindings: hwmon: add dps650ab documentation
Date: Mon, 7 Jan 2019 19:00:56 +0800
Message-ID: <0087d2d9c7cd7f38761f76c80d1c37cb2cea6ef2.1546851856.git.xiaoting.liu@hxt-semitech.com>
References: <cover.1546851856.git.xiaoting.liu@hxt-semitech.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1546851856.git.xiaoting.liu@hxt-semitech.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux@roeck-us.net, jdelvare@suse.com, robh+dt@kernel.org, mark.rutland@arm.com, openbmc@lists.ozlabs.org
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, shunyong.yang@hxt-semitech.com, dongsheng.wang@hxt-semitech.com, Xiaoting Liu <xiaoting.liu@hxt-semitech.com>
List-Id: devicetree@vger.kernel.org

Bindings for DPS650AB power, voltage, temperature, and fan monitering.

Signed-off-by: Xiaoting Liu <xiaoting.liu@hxt-semitech.com>
---
v2:
  Change the patch subject.
---
 Documentation/devicetree/bindings/hwmon/dps650ab.txt | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/dps650ab.txt b/Documentation/devicetree/bindings/hwmon/dps650ab.txt
new file mode 100644
index 000000000000..6bbbff89f6d5
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/dps650ab.txt
@@ -0,0 +1,11 @@
+Bindings for DPS650AB power, voltage, temperature, and fan monitering
+
+Required properties:
+- compatible : "dps650ab"
+- reg       : I2C address, one of 0x58, 0x59.
+
+Example:
+       dps650ab@58 {
+                   compatible = "dps650ab";
+                   reg = <0x58>;
+       };
--
1.8.3.1




This email is intended only for the named addressee. It may contain information that is confidential/private, legally privileged, or copyright-protected, and you should handle it accordingly. If you are not the intended recipient, you do not have legal rights to retain, copy, or distribute this email or its contents, and should promptly delete the email and all electronic copies in your system; do not retain copies in any media. If you have received this email in error, please notify the sender promptly. Thank you.
