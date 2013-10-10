From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: [PATCH v6] extcon: palmas: Added a new compatible type *ti,palmas-usb-vid*
Date: Thu, 10 Oct 2013 18:07:27 +0530
Message-ID: <1381408647-24653-1-git-send-email-kishon@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, swarren@wwwdotorg.org, cw00.choi@samsung.com
Cc: ijc+devicetree@hellion.org.uk, rob@landley.net, myungjoo.ham@samsung.com, ldewangan@nvidia.com, kishon@ti.com, gg@slimlogic.co.uk, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The Palmas device contains only a USB VBUS-ID detector, so added a
compatible type *ti,palmas-usb-vid*. Didn't remove the existing compatible
types for backward compatibility.

Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
---
Changes from v5:
* Fixed documentation

Changes from v4:
* added compatible property "ti,twl6035-usb-vid"

Changes from v3:
* Fixed commit log message (VID to VBUS-ID).
* Fixed the Documentation to tell "ti,twl6035-usb" and "ti,palmas-usb" is
deprecated
Changes from [1]:
* Since the old compatible values will be in 3.11 kernel, we shouldn't remove
the old compatible values. So retain the old compatible values.

[1] -> http://www.spinics.net/lists/linux-omap/msg95843.html
 Documentation/devicetree/bindings/extcon/extcon-palmas.txt |    6 +++++-
 drivers/extcon/extcon-palmas.c                             |    2 ++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/extcon/extcon-palmas.txt b/Documentation/devicetree/bindings/extcon/extcon-palmas.txt
index 7dab6a8..45414bb 100644
--- a/Documentation/devicetree/bindings/extcon/extcon-palmas.txt
+++ b/Documentation/devicetree/bindings/extcon/extcon-palmas.txt
@@ -2,7 +2,11 @@ EXTCON FOR PALMAS/TWL CHIPS
 
 PALMAS USB COMPARATOR
 Required Properties:
- - compatible : Should be "ti,palmas-usb" or "ti,twl6035-usb"
+ - compatible: should contain one of:
+   * "ti,palmas-usb-vid".
+   * "ti,twl6035-usb-vid".
+   * "ti,palmas-usb" (DEPRECATED - use "ti,palmas-usb-vid").
+   * "ti,twl6035-usb" (DEPRECATED - use "ti,twl6035-usb-vid").
 
 Optional Properties:
  - ti,wakeup : To enable the wakeup comparator in probe
diff --git a/drivers/extcon/extcon-palmas.c b/drivers/extcon/extcon-palmas.c
index 6c91976..6e83e9a 100644
--- a/drivers/extcon/extcon-palmas.c
+++ b/drivers/extcon/extcon-palmas.c
@@ -269,7 +269,9 @@ static const struct dev_pm_ops palmas_pm_ops = {
 
 static struct of_device_id of_palmas_match_tbl[] = {
 	{ .compatible = "ti,palmas-usb", },
+	{ .compatible = "ti,palmas-usb-vid", },
 	{ .compatible = "ti,twl6035-usb", },
+	{ .compatible = "ti,twl6035-usb-vid", },
 	{ /* end */ }
 };
 
-- 
1.7.10.4
