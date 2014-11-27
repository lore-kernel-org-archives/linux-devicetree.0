From: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v8 3/4] ARM: mediatek: Add sysirq in
 mt6589/mt8135/mt8127 dtsi
Date: Thu, 27 Nov 2014 21:31:12 +0800
Message-ID: <1417095072.12707.29.camel@mtksdaap41>
References: <1416902662-19281-1-git-send-email-yingjoe.chen@mediatek.com>
	 <1416902662-19281-4-git-send-email-yingjoe.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416902662-19281-4-git-send-email-yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jiang Liu <jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, hc.yen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yh.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Yijing Wang <wangyijing-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, nathan.chung-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yingjoe.chen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 2014-11-25 at 16:04 +0800, Yingjoe Chen wrote:
> Add sysirq settings for mt6589/mt8135/mt8127
> This also correct timer interrupt flag. The old setting works
> because boot loader already set polarity for timer interrupt.
> Without intpol support, the setting was not changed so gic
> can get the irq correctly.

Hi Matthias,

I think this patch should go through you. Would you take a look at this
patch? Also, mt8135/mt8127 uart support[1] depends on this, should we
send it again?

Thanks.

Joe.C

[1]
http://lists.infradead.org/pipermail/linux-arm-kernel/2014-October/296147.html


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
