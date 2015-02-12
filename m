From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: zynq: Fix stdout-path and bootargs
Date: Thu, 12 Feb 2015 10:17:07 +0000
Message-ID: <20150212101707.GA1245@leverpostej>
References: <a9a55b576d88ef1f2ab6a1d1f6707d56104db32b.1423734193.git.michal.simek@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <a9a55b576d88ef1f2ab6a1d1f6707d56104db32b.1423734193.git.michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org" <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Peter Crosthwaite <peter.crosthwaite-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Josh Cartwright <josh.cartwright-acOepvfBmUk@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 12, 2015 at 09:43:16AM +0000, Michal Simek wrote:
> parallella - Remove linux,stdout-path.
> Use stdout-path to identify kernel console
> 
> Signed-off-by: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>

It's nice to see this in use!

Acked-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>

Mark.

> ---
> 
> Changes in v2:
> - Remove linux,stdout-path reported by Mark Rutland
> - Use stdout-path new console description with setting
> - Change patch subject from "ARM: dts: zynq: Add linux,stdout-path and
>   stdout-path"
> - Do not add 1/2 patch which added aliases node to zybo and parallella
> 
>  arch/arm/boot/dts/zynq-parallella.dts | 4 ++--
>  arch/arm/boot/dts/zynq-zc702.dts      | 3 ++-
>  arch/arm/boot/dts/zynq-zc706.dts      | 3 ++-
>  arch/arm/boot/dts/zynq-zed.dts        | 3 ++-
>  arch/arm/boot/dts/zynq-zybo.dts       | 3 ++-
>  5 files changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/zynq-parallella.dts b/arch/arm/boot/dts/zynq-parallella.dts
> index 6a5f51daa708..e1e5b2423d26 100644
> --- a/arch/arm/boot/dts/zynq-parallella.dts
> +++ b/arch/arm/boot/dts/zynq-parallella.dts
> @@ -34,8 +34,8 @@
>  	};
>  
>  	chosen {
> -		bootargs = "console=ttyPS0,115200 earlyprintk root=/dev/mmcblk0p2 rootfstype=ext4 rw rootwait";
> -		linux,stdout-path = "/amba/serial@e0001000";
> +		bootargs = "earlyprintk root=/dev/mmcblk0p2 rootfstype=ext4 rw rootwait";
> +		stdout-path = "serial0:115200n8";
>  	};
>  };
>  
> diff --git a/arch/arm/boot/dts/zynq-zc702.dts b/arch/arm/boot/dts/zynq-zc702.dts
> index 1fc1d3911e9b..fb59d34e8ee6 100644
> --- a/arch/arm/boot/dts/zynq-zc702.dts
> +++ b/arch/arm/boot/dts/zynq-zc702.dts
> @@ -30,7 +30,8 @@
>  	};
>  
>  	chosen {
> -		bootargs = "console=ttyPS0,115200 earlyprintk";
> +		bootargs = "earlyprintk";
> +		stdout-path = "serial0:115200n8";
>  	};
>  
>  	leds {
> diff --git a/arch/arm/boot/dts/zynq-zc706.dts b/arch/arm/boot/dts/zynq-zc706.dts
> index 850518d9b8ac..abf5d238ae04 100644
> --- a/arch/arm/boot/dts/zynq-zc706.dts
> +++ b/arch/arm/boot/dts/zynq-zc706.dts
> @@ -30,7 +30,8 @@
>  	};
>  
>  	chosen {
> -		bootargs = "console=ttyPS0,115200 earlyprintk";
> +		bootargs = "earlyprintk";
> +		stdout-path = "serial0:115200n8";
>  	};
>  
>  	usb_phy0: phy0 {
> diff --git a/arch/arm/boot/dts/zynq-zed.dts b/arch/arm/boot/dts/zynq-zed.dts
> index 5658bc8434de..b9f2522012e8 100644
> --- a/arch/arm/boot/dts/zynq-zed.dts
> +++ b/arch/arm/boot/dts/zynq-zed.dts
> @@ -29,7 +29,8 @@
>  	};
>  
>  	chosen {
> -		bootargs = "console=ttyPS0,115200 earlyprintk";
> +		bootargs = "earlyprintk";
> +		stdout-path = "serial0:115200n8";
>  	};
>  
>  	usb_phy0: phy0 {
> diff --git a/arch/arm/boot/dts/zynq-zybo.dts b/arch/arm/boot/dts/zynq-zybo.dts
> index 935a561f6aa6..16c9cacd668d 100644
> --- a/arch/arm/boot/dts/zynq-zybo.dts
> +++ b/arch/arm/boot/dts/zynq-zybo.dts
> @@ -29,7 +29,8 @@
>  	};
>  
>  	chosen {
> -		bootargs = "console=ttyPS0,115200 earlyprintk";
> +		bootargs = "earlyprintk";
> +		stdout-path = "serial0:115200n8";
>  	};
>  
>  };
> -- 
> 1.8.2.3
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
