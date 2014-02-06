From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH 2/4] DT: Vendor prefixes: Add ricoh, ssi and synology
Date: Thu, 6 Feb 2014 10:19:34 -0500
Message-ID: <20140206151934.GB8533@titan.lakedaemon.net>
References: <1391634309-3123-1-git-send-email-andrew@lunn.ch>
 <1391634309-3123-3-git-send-email-andrew@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1391634309-3123-3-git-send-email-andrew-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, pawel.moll-5wv7dgnIgG8@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


+ devicetree ML, DT maintainers.

On Wed, Feb 05, 2014 at 10:05:07PM +0100, Andrew Lunn wrote:
> The following patches make use of vendor names ricoh, ssi and
> synology.  Add them to the vendor prefix list.
> 
> Signed-off-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt |    3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 3f900cd51bf0..1629e8f33578 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -69,6 +69,7 @@ ralink	Mediatek/Ralink Technology Corp.
>  ramtron	Ramtron International
>  realtek Realtek Semiconductor Corp.
>  renesas	Renesas Electronics Corporation
> +ricoh	Richoh Co. Ltd.

s/Richoh/Ricoh/

other than that,

Acked-by: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>

thx,

Jason.

>  rockchip	Fuzhou Rockchip Electronics Co., Ltd
>  samsung	Samsung Semiconductor
>  sbs	Smart Battery System
> @@ -76,11 +77,13 @@ schindler	Schindler
>  sil	Silicon Image
>  silabs	Silicon Laboratories
>  simtek
> +sii	Seiko Instruments, Inc.
>  sirf	SiRF Technology, Inc.
>  snps 	Synopsys, Inc.
>  st	STMicroelectronics
>  ste	ST-Ericsson
>  stericsson	ST-Ericsson
> +synology	Synology, Inc.
>  ti	Texas Instruments
>  tlm	Trusted Logic Mobility
>  toshiba	Toshiba Corporation
> -- 
> 1.7.10.4
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
