From: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v4 0/3] Support for the LCDK
Date: Tue, 9 Aug 2016 17:29:05 +0530
Message-ID: <57A9C589.3010600@ti.com>
References: <20160804144332.4841-1-kbeldan@baylibre.com>
 <20160805202951.2848-1-kbeldan@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160805202951.2848-1-kbeldan-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Karl Beldan <kbeldan-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, karl.beldan+oss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Saturday 06 August 2016 01:59 AM, Karl Beldan wrote:
> This depends on "ARM: dts: da850: Add missing pin muxing for the UARTs".
> 
> Changes from v1:
>  - s/omapl138/da850/
>  - Remove earlycon from bootargs
>  - Remove console=ttyS2,115200n8 from bootargs (workaround for preferred console)
>  - Add patches for CONFIG_SMSC_PHY=y and CONFIG_RTC_DRV_OMAP=m
> 
> Changes from v2:
>  - [1] Remove references to C6748: replace 'L138/C6748 Dev Kit (LCDK)' with 'LCDK'
>  - Change license from 'GPLv2 or later' to 'GPLv2'
> 
> Changes from v3:
>  - revert v2 [1]

Series applied and boot tested on my LCDK.

For future, when posting a new version, please send as an independent
series and not reply to the very first posting.

Thanks,
Sekhar
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
