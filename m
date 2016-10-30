From: Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
Subject: [PATCH v2 6/7] MIPS: qi_lb60: Probe RTC driver from DT
 and use it as power controller
Date: Mon, 31 Oct 2016 00:02:46 +0100
Message-ID: <20161030230247.20538-7-paul@crapouillou.net>
References: <20161030230247.20538-1-paul@crapouillou.net>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <rtc-linux+bncBC433LF43MBBBTHY3HAAKGQEW6AR6VQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20161030230247.20538-1-paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Maarten ter Huurne <maarten-Ph2Y2OKCxY1M656bX5wj8A@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Since we already have a devicetree node for the jz4740-rtc driver, we
don't have to probe it from platform code.

Besides, using the jz4740-rtc driver as the power controller for the
qi_lb60 platform allows us to remove the jz4740 platform power-off code,
since this is the only jz4740-based board upstream.

Signed-off-by: Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
Acked-by: Maarten ter Huurne <maarten-Ph2Y2OKCxY1M656bX5wj8A@public.gmane.org>
---
 arch/mips/boot/dts/ingenic/qi_lb60.dts | 4 ++++
 arch/mips/jz4740/board-qi_lb60.c       | 1 -
 2 files changed, 4 insertions(+), 1 deletion(-)

v2: New patch in this series

diff --git a/arch/mips/boot/dts/ingenic/qi_lb60.dts b/arch/mips/boot/dts/ingenic/qi_lb60.dts
index 2414d63..be1a7d3 100644
--- a/arch/mips/boot/dts/ingenic/qi_lb60.dts
+++ b/arch/mips/boot/dts/ingenic/qi_lb60.dts
@@ -13,3 +13,7 @@
 &ext {
 	clock-frequency = <12000000>;
 };
+
+&rtc_dev {
+	system-power-controller;
+};
diff --git a/arch/mips/jz4740/board-qi_lb60.c b/arch/mips/jz4740/board-qi_lb60.c
index 258fd03..a5bd94b 100644
--- a/arch/mips/jz4740/board-qi_lb60.c
+++ b/arch/mips/jz4740/board-qi_lb60.c
@@ -438,7 +438,6 @@ static struct platform_device *jz_platform_devices[] __initdata = {
 	&jz4740_pcm_device,
 	&jz4740_i2s_device,
 	&jz4740_codec_device,
-	&jz4740_rtc_device,
 	&jz4740_adc_device,
 	&jz4740_pwm_device,
 	&jz4740_dma_device,
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
