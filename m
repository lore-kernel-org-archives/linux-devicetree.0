From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 4/9] ARM: dts: imx28-duckbill: enable spi, i2c and
 uart pins
Date: Tue, 24 Jan 2017 21:00:59 +0800
Message-ID: <20170124130058.GW5662@dragon>
References: <1485123764-14754-1-git-send-email-mhei@heimpold.de>
 <1485123764-14754-5-git-send-email-mhei@heimpold.de>
 <96eabd96-64a6-7fbc-bb4b-223244358a42@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <96eabd96-64a6-7fbc-bb4b-223244358a42-eS4NqCHxEME@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Cc: Michael Heimpold <mhei-Z/Lg1yOAjpkb1SvskN2V4Q@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 23, 2017 at 06:00:02PM +0100, Stefan Wahren wrote:
> Hi,
> 
> Am 22.01.2017 um 23:22 schrieb Michael Heimpold:
> > While at tweak some more settings for the default product:
> > - enable lradc
> > - adjust USB dr mode
> > - add default triggers for LEDs
> > - get rid of regulators simple-bus container
> > - adjust phy reset duration
> 
> since the subject line suggests something different as the actual
> complete patch does, this needs to be changed.
> 
> @Shawn, @Fabio: Do we need a single patch for every point or is it
> possible to squash some?

I prefer to squash if possible.

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
