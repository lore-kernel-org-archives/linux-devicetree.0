From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RESUBMIT PATCH v7 4/9] devicetree: backlight: Add new SKY81452
 backlight binding
Date: Mon, 17 Nov 2014 12:23:33 +0000
Message-ID: <20141117122333.GQ24004@x1>
References: <1416213190-20935-1-git-send-email-jack.yoo@skyworksinc.com>
 <1416213190-20935-5-git-send-email-jack.yoo@skyworksinc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1416213190-20935-5-git-send-email-jack.yoo-tjhQNA90jdKqndwCJWfcng@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gyungoh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jack.yoo-tjhQNA90jdKqndwCJWfcng@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, florian.vaussard-p8DiymsW2f8@public.gmane.org, trivial-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 17 Nov 2014, gyungoh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:

> From: Gyungoh Yoo <jack.yoo-tjhQNA90jdKqndwCJWfcng@public.gmane.org>
>=20
> Signed-off-by: Gyungoh Yoo <jack.yoo-tjhQNA90jdKqndwCJWfcng@public.gmane.org>
> ---
> Changes v7:
> Nothing
>=20
> Changes v6:
> Nothing
>=20
> Changes v5:
> Nothing
>=20
> Changes v4:
> Nothing
>=20
> Changes v3:
> Nothing
>=20
> Changes v2:
> Added reg attribute for I2C slave address
>=20
>  .../video/backlight/sky81452-backlight.txt         | 24 ++++++++++++=
++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/video/backlight=
/sky81452-backlight.txt
>=20
> diff --git a/Documentation/devicetree/bindings/video/backlight/sky814=
52-backlight.txt b/Documentation/devicetree/bindings/video/backlight/sk=
y81452-backlight.txt
> new file mode 100644
> index 0000000..2c2d947
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/video/backlight/sky81452-back=
light.txt
> @@ -0,0 +1,24 @@
> +SKY81452-backlight bindings
> +
> +Required properties:
> +- compatible		: Must be "skyworks,sky81452-backlight"
> +
> +Optional properties:
> +- name			: Name of backlight device. Default is 'lcd-backlight'.
> +- gpio-enable		: GPIO to use to EN pin.
> +- enable		: Enable mask for current sink channel 1 to 6.
> +- ignore-pwm		: Ignore both PWM input
> +- dpwm-mode		: Enable DPWM dimming mode, otherwise Analog dimming mo=
de
> +- phase-shift		: Enable phase shift mode
> +- ovp-level		: Over-voltage protection level. Should be between 14 o=
r 28V.
> +- short-detection-threshold	: It should be one of 4, 5, 6 and 7V.
> +- boost-current-limit	: It should be one of 800, 1100 and 1500mA.

These are going to need some serious reviewing from the DT guys.  Each
property should either have a vendor prefix or be made generic and
placed in the generic DT documentation for the subsystem.  The name
'enable' is far to generic we don't tend to put masks in DT.  There
is already a generic property for GPIO enable pins.

> +Example:
> +
> +	backlight {
> +		compatible =3D "skyworks,sky81452-backlight";
> +		name =3D "pwm-backlight";
> +		enable =3D <0x3F>;

Lower case.

> +		ignore-pwm;

You should probably demonstrate more of your properties here.

> +	};

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
