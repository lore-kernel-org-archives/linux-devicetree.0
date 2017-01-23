From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH v2 4/9] ARM: dts: imx28-duckbill: enable spi, i2c and uart
 pins
Date: Mon, 23 Jan 2017 18:00:02 +0100
Message-ID: <96eabd96-64a6-7fbc-bb4b-223244358a42@i2se.com>
References: <1485123764-14754-1-git-send-email-mhei@heimpold.de>
 <1485123764-14754-5-git-send-email-mhei@heimpold.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1485123764-14754-5-git-send-email-mhei-Z/Lg1yOAjpkb1SvskN2V4Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Heimpold <mhei-Z/Lg1yOAjpkb1SvskN2V4Q@public.gmane.org>, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

Am 22.01.2017 um 23:22 schrieb Michael Heimpold:
> While at tweak some more settings for the default product:
> - enable lradc
> - adjust USB dr mode
> - add default triggers for LEDs
> - get rid of regulators simple-bus container
> - adjust phy reset duration

since the subject line suggests something different as the actual
complete patch does, this needs to be changed.

@Shawn, @Fabio: Do we need a single patch for every point or is it
possible to squash some?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
