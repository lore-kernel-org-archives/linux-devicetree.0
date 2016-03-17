From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 3/5] rtc: rtc-jz4740: Add support for devicetree
Date: Thu, 17 Mar 2016 14:56:32 +0100
Message-ID: <20160317135632.GG3362@piout.net>
References: <1457217531-26064-1-git-send-email-paul@crapouillou.net>
 <1457217531-26064-3-git-send-email-paul@crapouillou.net>
 <20160317120804.GD3362@piout.net>
 <56EAB210.70900@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56EAB210.70900-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Harvey Hunt <harvey.hunt-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 17/03/2016 at 13:33:04 +0000, Harvey Hunt wrote :
> On 17/03/16 12:08, Alexandre Belloni wrote:
> >On 05/03/2016 at 23:38:49 +0100, Paul Cercueil wrote :
> >>Signed-off-by: Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>
> >>---
> >>  drivers/rtc/rtc-jz4740.c | 16 +++++++++++++++-
> >>  1 file changed, 15 insertions(+), 1 deletion(-)
> >>
> >>diff --git a/drivers/rtc/rtc-jz4740.c b/drivers/rtc/rtc-jz4740.c
> >>index 47617bd..3914b1c 100644
> >>--- a/drivers/rtc/rtc-jz4740.c
> >>+++ b/drivers/rtc/rtc-jz4740.c
> >>@@ -17,6 +17,7 @@
> >>  #include <linux/io.h>
> >>  #include <linux/kernel.h>
> >>  #include <linux/module.h>
> >>+#include <linux/of_device.h>
> >>  #include <linux/platform_device.h>
> >>  #include <linux/rtc.h>
> >>  #include <linux/slab.h>
> >>@@ -245,6 +246,13 @@ void jz4740_rtc_poweroff(struct device *dev)
> >>  }
> >>  EXPORT_SYMBOL_GPL(jz4740_rtc_poweroff);
> >>
> >>+static const struct of_device_id jz4740_rtc_of_match[] = {
> >>+	{ .compatible = "ingenic,jz4740-rtc", .data = (void *) ID_JZ4740 },
> >>+	{ .compatible = "ingenic,jz4780-rtc", .data = (void *) ID_JZ4780 },
> >
> >ingenic is not in Documentation/devicetree/bindings/vendor-prefixes.txt,
> >you have to add it there before using it.
> 
> Ingenic is in vendor-prefixes.txt - it was added by Commit f289cc7
> ("devicetree/bindings: add Ingenic Semiconductor vendor prefix").
> 

Indeed, I was looking at an old v4.1 based branch instead of master.

You can forget that comment :)


-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
