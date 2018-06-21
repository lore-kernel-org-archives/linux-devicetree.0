From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH linux-next v6 09/13] dt-bindings: hwmon: Add documents for PECI hwmon client drivers
Date: Thu, 21 Jun 2018 12:41:21 -0700
Message-ID: <20180621194121.20982-1-jae.hyun.yoo@linux.intel.com>
References: <20180621193721.20588-1-jae.hyun.yoo@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180621193721.20588-1-jae.hyun.yoo@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Haiyue Wang <haiyue.wang@linux.intel.com>, Vernon Mauery <vernon.mauery@linux.intel.com>, James Feist <james.feist@linux.intel.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Andrew Jeffery <andrew@aj.id.au>, Arnd Bergmann <arnd@arndb.de>, Jason M Biils <jason.m.bills@linux.intel.com>, Joel Stanley <joel@jms.id.au>
List-Id: devicetree@vger.kernel.org

This commit adds dt-bindings documents for PECI hwmon client drivers.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Reviewed-by: Haiyue Wang <haiyue.wang@linux.intel.com>
Reviewed-by: James Feist <james.feist@linux.intel.com>
Reviewed-by: Vernon Mauery <vernon.mauery@linux.intel.com>
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Jason M Biils <jason.m.bills@linux.intel.com>
Cc: Joel Stanley <joel@jms.id.au>
---
 .../devicetree/bindings/hwmon/peci-cputemp.txt       | 11 +++++++++++
 .../devicetree/bindings/hwmon/peci-dimmtemp.txt      | 12 ++++++++++++
 2 files changed, 23 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/peci-cputemp.txt
 create mode 100644 Documentation/devicetree/bindings/hwmon/peci-dimmtemp.txt

diff --git a/Documentation/devicetree/bindings/hwmon/peci-cputemp.txt b/Documentation/devicetree/bindings/hwmon/peci-cputemp.txt
new file mode 100644
index 000000000000..19c7da57deab
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/peci-cputemp.txt
@@ -0,0 +1,11 @@
+Bindings for Intel PECI (Platform Environment Control Interface) cputemp driver.
+
+Required properties:
+- compatible : Should be "intel,peci-cputemp".
+
+This node is a subnode of the PECI client MFD.
+
+Example:
+	peci-cputemp {
+		compatible = "intel,peci-cputemp";
+	};
diff --git a/Documentation/devicetree/bindings/hwmon/peci-dimmtemp.txt b/Documentation/devicetree/bindings/hwmon/peci-dimmtemp.txt
new file mode 100644
index 000000000000..08ce163ba831
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/peci-dimmtemp.txt
@@ -0,0 +1,12 @@
+Bindings for Intel PECI (Platform Environment Control Interface) dimmtemp
+driver.
+
+Required properties:
+- compatible : Should be "intel,peci-dimmtemp".
+
+This node is a subnode of the PECI client MFD.
+
+Example:
+	peci-dimmtemp@30 {
+		compatible = "intel,peci-dimmtemp";
+	};
\ No newline at end of file
-- 
2.17.1
