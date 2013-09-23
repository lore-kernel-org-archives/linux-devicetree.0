From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH 2/5] mfd: arizona: Add device tree binding for max_channels_clocked
Date: Mon, 23 Sep 2013 19:30:40 +0100
Message-ID: <1379961043-23762-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
References: <1379961043-23762-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1379961043-23762-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org
Cc: sameo@linux.intel.com, rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, swarren@wwwdotorg.org, ijc+devicetree@hellion.org.uk, rob@landley.net, broonie@kernel.org, patches@opensource.wolfsonmicro.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
List-Id: devicetree@vger.kernel.org

Add device tree bindings for the pdata max_channels_clocked, that allows
the user to limit the number of channels clocked on a single AIF.

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
---
 Documentation/devicetree/bindings/mfd/arizona.txt |    7 +++++++
 drivers/mfd/arizona-core.c                        |    5 +++++
 2 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/arizona.txt b/Documentation/devicetree/bindings/mfd/arizona.txt
index e2cecfc..9eeef62 100644
--- a/Documentation/devicetree/bindings/mfd/arizona.txt
+++ b/Documentation/devicetree/bindings/mfd/arizona.txt
@@ -40,6 +40,11 @@ Optional properties:
     the chip default will be used.  If present exactly five values must
     be specified.
 
+  - wlf,max-channels-clocked : The maximum number of channels to be clocked on
+    each AIF, useful for I2S systems with multiple data lines being mastered.
+    If specified three cells must supplied one for each AIF, specify zero for
+    AIFs that should be handled normally.
+
 Example:
 
 codec: wm5102@1a {
@@ -59,4 +64,6 @@ codec: wm5102@1a {
 		0xffffffff
 		0xffffffff
 	>;
+
+	wlf,max-channels-clocked = <2 0 0>;
 };
diff --git a/drivers/mfd/arizona-core.c b/drivers/mfd/arizona-core.c
index 986abc5..b3337ee 100644
--- a/drivers/mfd/arizona-core.c
+++ b/drivers/mfd/arizona-core.c
@@ -605,6 +605,11 @@ static int arizona_of_get_core_pdata(struct arizona *arizona)
 
 	arizona_of_get_gpio_defaults(arizona, "wlf,gpio-defaults");
 
+	arizona_of_read_u32_array(arizona, "wlf,max-channels-clocked",
+				  false,
+				  pdata->max_channels_clocked,
+				  ARRAY_SIZE(pdata->max_channels_clocked));
+
 	return 0;
 }
 
-- 
1.7.2.5
