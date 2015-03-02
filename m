From: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Subject: Re: [rtc-linux] [PATCH 2/2] rtc: mediatek: Add MT63xx RTC driver
Date: Mon, 2 Mar 2015 11:35:04 -0800
Message-ID: <20150302113504.59dff34c8261c9c002aebf5f@linux-foundation.org>
References: <1422437276-41334-1-git-send-email-eddie.huang@mediatek.com>
	<1422437276-41334-3-git-send-email-eddie.huang@mediatek.com>
	<20150223135044.108ea32a65063a50aa36a309@linux-foundation.org>
	<1425284436.8684.11.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425284436.8684.11.camel@mtksdaap41>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tianping Fang <tianping.fang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, yh.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 2 Mar 2015 16:20:36 +0800 Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:

> > WARNING: DT compatible string "mediatek,mt6397-rtc" appears un-documented -- check ./Documentation/devicetree/bindings/
> > #488: FILE: drivers/rtc/rtc-mt6397.c:334:
> > +	{ .compatible = "mediatek,mt6397-rtc", },
> > 
> > 
> Do you include patch "[PATCH 1/2] dt: bindings: Add Mediatek RTC driver
> binding document" in this series ?
> http://lists.infradead.org/pipermail/linux-arm-kernel/2015-January/320425.html
> 
> I think this warning shouldn't happen if include this patch.

I can't find that patch on rtc-linux or linux-kernel.  Resend, please?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
