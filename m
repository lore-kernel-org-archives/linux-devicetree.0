From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 10/17] tegra: usb: fdt: Add USB definitions for Tegra2
 Seaboard
Date: Mon, 05 Dec 2011 16:26:49 -0700
Message-ID: <4EDD5339.4080202@nvidia.com>
References: <1322878300-5551-1-git-send-email-sjg@chromium.org>
 <1322878300-5551-11-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1322878300-5551-11-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Remy Bohmer <linux-SYUVB/VFmdasTnJN9+BGXg@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Albert ARIBAUD <albert.u.boot-LhW3hqR2+23R7s880joybQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12/02/2011 07:11 PM, Simon Glass wrote:
> We set up two USB ports, one of which can be host or device.
> For some reason the kernel version does enable both ports.

> +++ b/board/nvidia/dts/tegra2-seaboard.dts

> @@ -11,6 +11,12 @@
>  		bootargs = "vmalloc=192M video=tegrafb console=ttyS0,115200n8 root=/dev/mmcblk1p3 rw rootwait";
>  	};
>  
> +        aliases {
> +		/* This defines the order of our USB ports */
> +                usb0 = "/usb@c5008000";
> +                usb1 = "/usb@c5000000";
> +        };
> +

That's indented with spaces instead of TABs.

>  	memory {
>  		device_type = "memory";
>  		reg = < 0x00000000 0x40000000 >;
> @@ -31,6 +37,12 @@
>  	};
>  
>  	usb@c5000000 {
> -		nvidia,vbus-gpio = <&gpio 24 0>; /* PD0 */
> +		nvidia,vbus-gpio = <&gpio 24 1>; /* PD0 high to enable vbus */
> +		support-host-mode;
> +		status = "okay";

That's the default, and tegra20.dtsi doesn't specify status =
"disabled", so the status properties are redundant. You may want to
specify a disabled status in tegra-seaboard.dts for the other USB port
if it isn't used though.

> +	};
> +
> +	usb@c5008000 {
> +		status = "okay";
>  	};
>  };

-- 
nvpublic
