From: Florian Eckert <fe@dev.tdt.de>
Subject: [PATCH v3 2/2] hwmon: (ltq-cputemp) add devicetree bindings documentation
Date: Fri,  1 Sep 2017 08:58:18 +0200
Message-ID: <20170901065818.2037-2-fe@dev.tdt.de>
References: <20170901065818.2037-1-fe@dev.tdt.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170901065818.2037-1-fe@dev.tdt.de>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, linux@roeck-us.net, jdelvare@suse.com
List-Id: devicetree@vger.kernel.org

Document the devicetree bindings for the ltq-cputemp

Signed-off-by: Florian Eckert <fe@dev.tdt.de>
---
 Documentation/devicetree/bindings/hwmon/ltq-cputemp.txt | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/ltq-cputemp.txt

diff --git a/Documentation/devicetree/bindings/hwmon/ltq-cputemp.txt b/Documentation/devicetree/bindings/hwmon/ltq-cputemp.txt
new file mode 100644
index 000000000000..33fd00a987c7
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/ltq-cputemp.txt
@@ -0,0 +1,10 @@
+Lantiq cpu temperatur sensor
+
+Requires node properties:
+- compatible value :
+	"lantiq,cputemp"
+
+Example:
+	cputemp@0 {
+		compatible = "lantiq,cputemp";
+	};
-- 
2.11.0
