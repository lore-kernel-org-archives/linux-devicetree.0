From: Flavio Suligoi <f.suligoi@asem.it>
Subject: [PATCH 2/2] rtc: pcf2127: add battery-low INTn generation
Date: Wed, 3 Apr 2019 16:52:45 +0200
Message-ID: <1554303165-24813-2-git-send-email-f.suligoi@asem.it>
References: <1554303165-24813-1-git-send-email-f.suligoi@asem.it>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1554303165-24813-1-git-send-email-f.suligoi@asem.it>
Sender: linux-kernel-owner@vger.kernel.org
To: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Flavio Suligoi <f.suligoi@asem.it>
List-Id: devicetree@vger.kernel.org

The pcf2127 has an automatic battery-low detection function.

In case of battery-low event, an interrupt generation through
the pin INTn (active low) can be enabled, setting the flag BLIE
in the register Control_3.

This function is activated by the "battery-low-hw-alarm" DT property.

Example of use for an NXP i.MX7D board:

&i2c3 {
	clock-frequency = <100000>;
	pinctrl-names = "default";
	pinctrl-0 = <&pinctrl_i2c3>;
	status = "okay";

	pcf2127@51 {
		compatible = "nxp,pcf2127";
		reg = <0x51>;
		battery-low-hw-alarm;
		status = "okay";
	};
};

Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
---
 drivers/rtc/rtc-pcf2127.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 7cb786d..e3805c8 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -228,6 +228,10 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 			const char *name, bool has_nvmem)
 {
 	struct pcf2127 *pcf2127;
+	struct device_node *np;
+	struct i2c_client *client = to_i2c_client(dev);
+	unsigned char buf[2];
+	int err;
 	int ret = 0;
 
 	dev_dbg(dev, "%s\n", __func__);
@@ -245,6 +249,35 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 	if (IS_ERR(pcf2127->rtc))
 		return PTR_ERR(pcf2127->rtc);
 
+	/*
+	 * The pcf2127 has an automatic battery-low detection function.
+	 *
+	 * In case of battery-low event, an interrupt generation through
+	 * the pin INTn (active low) can be enabled, setting the flag BLIE
+	 * in the register Control_3.
+	 */
+	np = of_node_get(dev->of_node);
+	if (!np) {
+		dev_err(dev, "failed to find the RTC pcf2127 node\n");
+		return -ENOENT;
+	}
+	if (of_get_property(np, "battery-low-hw-alarm", NULL)) {
+		dev_info(dev, "enable battery-low hw alarm on INTn pin\n");
+
+		/*
+		 * Set BLIE bit in register Control_3 (override is possible
+		 * because this register is fully zero after reset)
+		 */
+		buf[0] = PCF2127_REG_CTRL3;
+		buf[1] = 0x01;
+		/* write register's data */
+		err = i2c_master_send(client, buf, 2);
+		if (err != 2) {
+			dev_err(dev, "%s: err=%d", __func__, err);
+			return -EIO;
+		}
+	}
+
 	if (has_nvmem) {
 		struct nvmem_config nvmem_cfg = {
 			.priv = pcf2127,
-- 
2.7.4
