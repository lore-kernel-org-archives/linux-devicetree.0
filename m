From: Xiaoting Liu <xiaoting.liu@hxt-semitech.com>
Subject: [PATCH v3 2/4] dt-bindings: hwmon: add dps650ab documentation
Date: Thu, 10 Jan 2019 10:24:33 +0800
Message-ID: <0527fcf7155ea12a2a1be680b3617691e6e26d72.1546918172.git.xiaoting.liu@hxt-semitech.com>
References: <cover.1546918172.git.xiaoting.liu@hxt-semitech.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1546918172.git.xiaoting.liu@hxt-semitech.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org, mark.rutland@arm.com
Cc: openbmc@lists.ozlabs.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, shunyong.yang@hxt-semitech.com, dongsheng.wang@hxt-semitech.com, Xiaoting Liu <xiaoting.liu@hxt-semitech.com>
List-Id: devicetree@vger.kernel.org

Bindings for Delta Electronics DPS-650-AB power supply.

Signed-off-by: Xiaoting Liu <xiaoting.liu@hxt-semitech.com>
---
v3:
  Change patch commit message.
  Add vendor delta to the compatible property.
---
v2:
  Change the patch subject.
---
 Documentation/devicetree/bindings/hwmon/dps650ab.txt | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/dps650ab.txt b/Documentation/devicetree/bindings/hwmon/dps650ab.txt
new file mode 100644
index 000000000000..32d89e4f4956
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/dps650ab.txt
@@ -0,0 +1,11 @@
+Bindings for Delta Electronics DPS-650-AB power supply
+
+Required properties:
+- compatible : "delta,dps650ab"
+- reg        : I2C address, one of 0x58, 0x59.
+
+Example:
+	dps650ab@58 {
+		    compatible = "delta,dps650ab";
+		    reg = <0x58>;
+	};
-- 
1.8.3.1
