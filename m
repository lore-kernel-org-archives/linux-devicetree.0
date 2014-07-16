From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 4/4] ARM: dts: imx6qdl: Enable CODA960 VPU
Date: Wed, 16 Jul 2014 10:27:59 +0200
Message-ID: <1405499279.3622.4.camel@paszta.hi.pengutronix.de>
References: <1402679641-868-1-git-send-email-p.zabel@pengutronix.de>
	 <1402679641-868-4-git-send-email-p.zabel@pengutronix.de>
	 <20140618151229.GR8860@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140618151229.GR8860@dragon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Mittwoch, den 18.06.2014, 23:12 +0800 schrieb Shawn Guo:
> On Fri, Jun 13, 2014 at 07:14:01PM +0200, Philipp Zabel wrote:
> > This patch adds links to the on-chip SRAM and reset controller nodes
> > and switches the interrupts. Make the BIT processor interrupt, which exists on
> > all variants, the first one. The JPEG unit interrupt, which does not exist on
> > i.MX27 and i.MX5 thus is an optional second interrupt.
> > Use different compatible strings for i.MX6Q/D and i.MX6S/DL, as they have to
> > load separate firmware images for some reason.
> > 
> > Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> 
> The whole series looks good to me.
> 
> Rob,
> 
> Do you want to apply the first patch through DT tree, or may I have your
> ACK to take the whole series via IMX tree?

Hi,

are there any reservations about these patches being merged through
Shawn's IMX tree?

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
