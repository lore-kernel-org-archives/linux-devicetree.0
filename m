From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH] drivers/rtc/rtc-palmas.c: support for backup battery charging
Date: Thu, 25 Jul 2013 17:59:03 +0530
Message-ID: <1374755343-32573-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: akpm@linux-foundation.org
Cc: grant.likely@linaro.org, rob.herring@calxeda.com, rob@landley.net, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, rtc-linux@googlegroups.com, gg@slimlogic.co.uk, kishon@ti.com, swarren@nvidia.com, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: devicetree@vger.kernel.org

Palmas series device like TPS65913, TPS80036 supports the backup battery
for powering the RTC when no other energy source is available.

The backup battery is optional, connected to the VBACKUP pin, and can be
nonrechargeable or rechargeable. The rechargeable battery can be charged
from the system supply using the backup battery charger.

Add support for enabling charging of this backup battery.  Also add the DT
binding document and the new properties to have this support.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
 .../devicetree/bindings/rtc/rtc-palmas.txt         |   28 ++++++++++++++
 drivers/rtc/rtc-palmas.c                           |   39 ++++++++++++++++++++
 2 files changed, 67 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/rtc-palmas.txt

diff --git a/Documentation/devicetree/bindings/rtc/rtc-palmas.txt b/Documentation/devicetree/bindings/rtc/rtc-palmas.txt
new file mode 100644
index 0000000..e4b6910
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/rtc-palmas.txt
@@ -0,0 +1,28 @@
+Palmas RTC controller bindings
+
+Required properties:
+- compatible:
+  - "ti,palams-rtc" for palma series of the RTC controller
+- interrupt-parent: Parent interrupt device, must be handle of palams node.
+- interrupts: Interrupt number of RTC submodule on device.
+
+Optional properties:
+- ti,back-bat-chg-enable: The palmas series device like TPS65913 or TPS80036
+	supports the battery backup for powering the RTC when main battery is
+	removed or in very low power state. This flag will enable the backup
+	battery charging.
+- ti,back-bat-chg-current: Configure charging current. Device supports the
+	charging current as < 100mA or >100mA.
+
+Example:
+	palmas: tps65913@58 {
+		:::::::::::
+		palmas_rtc: rtc {
+			compatible = "ti,palmas-rtc";
+			interrupt-parent = <&palmas>;
+			interrupts = <8 0>;
+			ti,back-bat-chg-enable;
+			ti,back-bat-chg-current = <100>;
+		};
+		:::::::::::
+	};
diff --git a/drivers/rtc/rtc-palmas.c b/drivers/rtc/rtc-palmas.c
index a1fecc8..1a7c44a 100644
--- a/drivers/rtc/rtc-palmas.c
+++ b/drivers/rtc/rtc-palmas.c
@@ -238,6 +238,19 @@ static int palmas_rtc_probe(struct platform_device *pdev)
 	struct palmas *palmas = dev_get_drvdata(pdev->dev.parent);
 	struct palmas_rtc *palmas_rtc = NULL;
 	int ret;
+	bool enable_bb_charging = false;
+	u32 bb_charging_current = 100;
+
+	if (pdev->dev.of_node) {
+		u32 pval;
+
+		enable_bb_charging = of_property_read_bool(pdev->dev.of_node,
+					"ti,back-bat-chg-enable");
+		ret = of_property_read_u32(pdev->dev.of_node,
+					"ti,back-bat-chg-current", &pval);
+		if (!ret)
+			bb_charging_current = pval;
+	}
 
 	palmas_rtc = devm_kzalloc(&pdev->dev, sizeof(struct palmas_rtc),
 			GFP_KERNEL);
@@ -254,6 +267,32 @@ static int palmas_rtc_probe(struct platform_device *pdev)
 	palmas_rtc->dev = &pdev->dev;
 	platform_set_drvdata(pdev, palmas_rtc);
 
+	if (enable_bb_charging) {
+		unsigned reg = 0;
+
+		if (bb_charging_current < 100)
+			reg |= PALMAS_BACKUP_BATTERY_CTRL_BBS_BBC_LOW_ICHRG;
+
+		ret = palmas_update_bits(palmas, PALMAS_PMU_CONTROL_BASE,
+			PALMAS_BACKUP_BATTERY_CTRL,
+			PALMAS_BACKUP_BATTERY_CTRL_BBS_BBC_LOW_ICHRG, reg);
+		if (ret < 0) {
+			dev_err(&pdev->dev,
+				"BACKUP_BATTERY_CTRL update failed, %d\n", ret);
+			return ret;
+		}
+
+		ret = palmas_update_bits(palmas, PALMAS_PMU_CONTROL_BASE,
+			PALMAS_BACKUP_BATTERY_CTRL,
+			PALMAS_BACKUP_BATTERY_CTRL_BB_CHG_EN,
+			PALMAS_BACKUP_BATTERY_CTRL_BB_CHG_EN);
+		if (ret < 0) {
+			dev_err(&pdev->dev,
+				"BACKUP_BATTERY_CTRL update failed, %d\n", ret);
+			return ret;
+		}
+	}
+
 	/* Start RTC */
 	ret = palmas_update_bits(palmas, PALMAS_RTC_BASE, PALMAS_RTC_CTRL_REG,
 			PALMAS_RTC_CTRL_REG_STOP_RTC,
-- 
1.7.1.1

