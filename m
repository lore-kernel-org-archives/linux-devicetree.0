From: Tuomas Tynkkynen <tuomas-yrGDUoBaLx3QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: sunxi: Switch MMC nodes away from
 cd-inverted property
Date: Thu, 1 Feb 2018 17:16:00 +0200
Message-ID: <1517498160.5907.6.camel@tuxera.com>
References: <20171222205738.2389-1-tuomas@tuxera.com>
         <20180104150352.rsvtvviafxyuq2jp@flea.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180104150352.rsvtvviafxyuq2jp-ZC1Zs529Oq4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Maxime,

On Thu, 2018-01-04 at 16:03 +0100, Maxime Ripard wrote:
> On Fri, Dec 22, 2017 at 10:57:37PM +0200, Tuomas Tynkkynen wrote:
> > Using the cd-inverted property is not useful when GPIOs are used as
> > card
> > detects since the polarity can be specified with the usual
> > GPIO_ACTIVE_(HIGH|LOW) GPIO flags. It has also caused confusion for
> > U-Boot developers, so migrate all sunxi boards away from cd-
> > inverted.
> > 
> > Signed-off-by: Tuomas Tynkkynen <tuomas-yrGDUoBaLx3QT0dZR+AlfA@public.gmane.org>
> 
> Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

I was assuming these patches will go in through the sunxi tree but I
don't see them applied anywhere, have these patches fallen through the
cracks perhaps?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
