From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] dt: bindings: vendor-prefix: Add 3 accelerometer
 vendor prefixes
Date: Sun, 9 Oct 2016 08:37:47 +0100
Message-ID: <2f68311d-5c65-0bc1-aea8-401a843ebfd0@kernel.org>
References: <20161006170650.13518-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161006170650.13518-1-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/10/16 18:06, Hans de Goede wrote:
> Recently the kernel has gotten support in the iio subsystem for a number
> of new accelerometers from mCube, Memsic and MiraMEMS.
> 
> This commit adds the vendor prefixes already used for these vendors
> in Documentation/devicetree/bindings/i2c/trivial-devices.txt to
> vendor-prefixes.txt.
> 
> The "full" company names were taken from the company's websites:
> http://www.mcubemems.com/
> http://www.memsic.com/
> http://www.miramems.com/en/
> 
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Applied to the togreg branch of iio.git - initially pushed out as testing.
Thanks,

Jonathan
> ---
> Changes in v2:
> -Drop domintech, it is already in the iio/next tree
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 5c67e91..abe0129 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -157,13 +157,16 @@ lltc	Linear Technology Corporation
>  marvell	Marvell Technology Group Ltd.
>  maxim	Maxim Integrated Products
>  meas	Measurement Specialties
> +mcube	mCube
>  mediatek	MediaTek Inc.
>  melexis	Melexis N.V.
> +memsic	MEMSIC Inc.
>  merrii	Merrii Technology Co., Ltd.
>  micrel	Micrel Inc.
>  microchip	Microchip Technology Inc.
>  micron	Micron Technology Inc.
>  minix	MINIX Technology Ltd.
> +miramems	MiraMEMS Sensing Technology Co., Ltd.
>  mitsubishi	Mitsubishi Electric Corporation
>  mosaixtech	Mosaix Technologies, Inc.
>  moxa	Moxa
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
