From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: da850-lcdk: Add NAND to DT
Date: Wed, 31 Aug 2016 16:44:38 -0700
Message-ID: <7h37lk5wrd.fsf@baylibre.com>
References: <20160829153242.18615-1-kbeldan@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160829153242.18615-1-kbeldan-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> (Karl Beldan's
        message of "Mon, 29 Aug 2016 15:32:42 +0000")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Karl Beldan <kbeldan-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Karl Beldan <karl.beldan+oss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Karl Beldan <kbeldan-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> writes:

> This adds DT support for the NAND connected to the SoC AEMIF.
> Passed torture hashing a 40MB file on top of UBIFS using subpages.
>
> Signed-off-by: Karl Beldan <kbeldan-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> ---
> v2:
>
> - Removed comments pertaining to the BSP the LCDK ships with (Sekhar)
> - s/"ok"/"okay"/
> - Removed partitions since it relates to the BSP the LCDK ships with

IMO, some default partitions are nice to have, at least for u-boot and
u-boot env so factory-shipped u-boot is not accidentally overridden.
The left over space can be labeled "free space".

Anyways, after adding some partitions back, I tested with ubifs on my
LCDK:

Tested-by: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>

Kevin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
