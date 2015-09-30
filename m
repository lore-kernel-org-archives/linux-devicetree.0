From: Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH v2 2/2] iio:light:tsl2563: Add DT support
Date: Wed, 30 Sep 2015 07:44:10 +0200 (CEST)
Message-ID: <alpine.DEB.2.02.1509300740590.5858@pmeerw.net>
References: <1443576270-36548-1-git-send-email-sureshraj@google.com> <1443576270-36548-2-git-send-email-sureshraj@google.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1443576270-36548-2-git-send-email-sureshraj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Suresh Rajashekara <sureshraj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Suresh,

> * Add Device Tree support for the Dyna Image AP3223 ambient light sensor and
> * proximity driver,
> * Document the binding and
> * Add a vendor prefix for Dyna Image

the mail's subject line should read something like
iio: light: Add AP3223 DT support

tsl2563 is a different driver

> v2
> * Seperating the device tree changes from code

Separating

> 
> Signed-off-by: Suresh Rajashekara <sureshraj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/iio/light/ap3223.txt | 18 ++++++++++++++++++
>  Documentation/devicetree/bindings/vendor-prefixes.txt  |  1 +
>  2 files changed, 19 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/light/ap3223.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/light/ap3223.txt b/Documentation/devicetree/bindings/iio/light/ap3223.txt
> new file mode 100644
> index 0000000..b255d27
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/light/ap3223.txt
> @@ -0,0 +1,18 @@
> +* Dyna Image AP3223 ambient light sensor and proximity sensor
> +
> +http://www.dyna-image.com/english/product/optical-sensor-detail.php?cpid=2&dpid=8
> +
> +Required properties:
> +
> +  - compatible : should be "dynaimage,ap3223"
> +  - reg : the I2C address of the sensor
> +
> +Example:
> +
> +ap3223@1c {
> +	compatible = "dynaimage,ap3223";
> +	reg = <0x1c>;
> +
> +	pinctrl-0 = <&ap3223_pins>;
> +	pinctrl-names = "default";
> +};
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 5f20add..704da45 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -46,6 +46,7 @@ digilent	Diglent, Inc.
>  dlg	Dialog Semiconductor
>  dlink	D-Link Corporation
>  dmo	Data Modul AG
> +dynaimage	Dyna-Image
>  ebv	EBV Elektronik
>  edt	Emerging Display Technologies
>  elan	Elan Microelectronic Corp.
> 

-- 

Peter Meerwald
+43-664-2444418 (mobile)
