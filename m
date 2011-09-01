From: Rhyland Klein <rklein@nvidia.com>
Subject: [PATCH 2/2] power: bq20z75: Add Device Tree Binding
Date: Thu,  1 Sep 2011 15:22:06 -0700
Message-ID: <1314915726-21580-2-git-send-email-rklein@nvidia.com>
References: <1314915726-21580-1-git-send-email-rklein@nvidia.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1314915726-21580-1-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anton Vorontsov <cbouatmailru@gmail.com>, devicetree-discuss@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, Rhyland Klein <rklein@nvidia.com>
List-Id: devicetree@vger.kernel.org

Adding the binding for the TI bq20z75 fuel gadge and the
bq20z75 driver.

Signed-off-by: Rhyland Klein <rklein@nvidia.com>
---
 .../bindings/power_supply/ti_bq20z75.txt           |   25 ++++++++++++++++++++
 1 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/power_supply/ti_bq20z75.txt

diff --git a/Documentation/devicetree/bindings/power_supply/ti_bq20z75.txt b/Documentation/devicetree/bindings/power_supply/ti_bq20z75.txt
new file mode 100644
index 0000000..7358947
--- /dev/null
+++ b/Documentation/devicetree/bindings/power_supply/ti_bq20z75.txt
@@ -0,0 +1,25 @@
+TI bq20z75
+~~~~~~~~~~
+
+Required properties :
+ - compatible : "ti,bq20z75"
+
+Optional properties :
+ - i2c-retry-count : The number of times to retry i2c transactions on i2c
+   IO failure.
+ - poll-retry-count : The number of times to try looking for new status
+   after an external change notification.
+ - battery-detect : The GPIO which is used to detect battery presence.
+ - battery-detect-present : The state of the GPIO when the battery is
+   present ( 0 or 1).
+
+Example:
+
+	bq20z75@b {
+		compatible = "ti,bq20z75";
+		reg = < 0xb >;
+		i2c-retry-count = <2>;
+		poll-retry-count = <10>;
+		battery-detect = <314>;
+		battery-detect = <0>;
+	}
-- 
1.7.6
