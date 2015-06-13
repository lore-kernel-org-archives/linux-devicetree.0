From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH] rtc: hym8563: make the irq optional
Date: Sat, 13 Jun 2015 12:34:04 +0200
Message-ID: <2559079.JyXCpe7EYV@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Sometimes the irq line is not connected to any soc-pin. This does
not hinder basic timekeeping functionality of the rtc, so probe
should not fail in this case.

Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
---
 .../devicetree/bindings/rtc/haoyu,hym8563.txt          |  2 +-
 drivers/rtc/rtc-hym8563.c                              | 18 ++++++++++--------
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/haoyu,hym8563.txt b/Documentation/devicetree/bindings/rtc/haoyu,hym8563.txt
index 5c199ee..a8934fe 100644
--- a/Documentation/devicetree/bindings/rtc/haoyu,hym8563.txt
+++ b/Documentation/devicetree/bindings/rtc/haoyu,hym8563.txt
@@ -6,11 +6,11 @@ as well as a clock output of up to 32kHz.
 Required properties:
 - compatible: should be: "haoyu,hym8563"
 - reg: i2c address
-- interrupts: rtc alarm/event interrupt
 - #clock-cells: the value should be 0
 
 Optional properties:
 - clock-output-names: From common clock binding
+- interrupts: rtc alarm/event interrupt
 
 Example:
 
diff --git a/drivers/rtc/rtc-hym8563.c b/drivers/rtc/rtc-hym8563.c
index 0f710e9..e9da795 100644
--- a/drivers/rtc/rtc-hym8563.c
+++ b/drivers/rtc/rtc-hym8563.c
@@ -548,14 +548,16 @@ static int hym8563_probe(struct i2c_client *client,
 		return ret;
 	}
 
-	ret = devm_request_threaded_irq(&client->dev, client->irq,
-					NULL, hym8563_irq,
-					IRQF_TRIGGER_LOW | IRQF_ONESHOT,
-					client->name, hym8563);
-	if (ret < 0) {
-		dev_err(&client->dev, "irq %d request failed, %d\n",
-			client->irq, ret);
-		return ret;
+	if (client->irq > 0) {
+		ret = devm_request_threaded_irq(&client->dev, client->irq,
+						NULL, hym8563_irq,
+						IRQF_TRIGGER_LOW | IRQF_ONESHOT,
+						client->name, hym8563);
+		if (ret < 0) {
+			dev_err(&client->dev, "irq %d request failed, %d\n",
+				client->irq, ret);
+			return ret;
+		}
 	}
 
 	/* check state of calendar information */
-- 
2.1.4


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
