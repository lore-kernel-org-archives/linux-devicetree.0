From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 08/22] rtc: Add device tree probing to the Gemini driver
Date: Sun, 22 Jan 2017 13:19:50 +0100
Message-ID: <20170122121950.10449-1-linus.walleij@linaro.org>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <rtc-linux+bncBDE6RCFOWIARB3WGSLCAKGQE72LYNWA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Janos Laube <janos.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Paulius Zaleckas <paulius.zaleckas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, openwrt-devel-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This adds bindings and simple probing for the Cortina Systems Gemini
SoC RTC.

Cc: Janos Laube <janos.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Paulius Zaleckas <paulius.zaleckas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
RTC maintainers: please just apply this to the RTC tree when you
are pleased with it. It is functionally orthogonal to the rest of
the series and just in a series for context.
---
 Documentation/devicetree/bindings/rtc/cortina,gemini.txt | 14 ++++++++++++++
 drivers/rtc/rtc-gemini.c                                 |  7 +++++++
 2 files changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/cortina,gemini.txt

diff --git a/Documentation/devicetree/bindings/rtc/cortina,gemini.txt b/Documentation/devicetree/bindings/rtc/cortina,gemini.txt
new file mode 100644
index 000000000000..4ce4e794ddbb
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/cortina,gemini.txt
@@ -0,0 +1,14 @@
+* Cortina Systems Gemini RTC
+
+Gemini SoC real-time clock.
+
+Required properties:
+- compatible : Should be "cortina,gemini-rtc"
+
+Examples:
+
+rtc@45000000 {
+	compatible = "cortina,gemini-rtc";
+	reg = <0x45000000 0x100>;
+	interrupts = <17 IRQ_TYPE_LEVEL_HIGH>;
+};
diff --git a/drivers/rtc/rtc-gemini.c b/drivers/rtc/rtc-gemini.c
index 688debc14348..ccf0dbadb62d 100644
--- a/drivers/rtc/rtc-gemini.c
+++ b/drivers/rtc/rtc-gemini.c
@@ -159,9 +159,16 @@ static int gemini_rtc_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct of_device_id gemini_rtc_dt_match[] = {
+	{ .compatible = "cortina,gemini-rtc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, gemini_rtc_dt_match);
+
 static struct platform_driver gemini_rtc_driver = {
 	.driver		= {
 		.name	= DRV_NAME,
+		.of_match_table = gemini_rtc_dt_match,
 	},
 	.probe		= gemini_rtc_probe,
 	.remove		= gemini_rtc_remove,
-- 
2.9.3

-- 
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
--- 
You received this message because you are subscribed to the Google Groups "rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
