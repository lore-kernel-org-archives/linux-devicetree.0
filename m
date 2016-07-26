From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v2 1/4] iio: adc: rockchip_saradc: reset saradc
 controller before programming it
Date: Tue, 26 Jul 2016 10:00:24 -0700
Message-ID: <20160726170023.GA6590@roeck-us.net>
References: <1469535195-5227-1-git-send-email-wxt@rock-chips.com>
 <57976814.3040605@roeck-us.net>
 <579777F4.2090002@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <579777F4.2090002-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, john-HooS5bfzL4hWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 26, 2016 at 10:47:16PM +0800, Caesar Wang wrote:
>=20
> On 2016=E5=B9=B407=E6=9C=8826=E6=97=A5 21:39, Guenter Roeck wrote:
> >
> >>static int rockchip_saradc_probe(struct platform_device *pdev)
> >>{
> >>struct rockchip_saradc *info =3D NULL;
> >>@@ -218,6 +231,21 @@ static int rockchip_saradc_probe(struct
> >>platform_device *pdev)
> >>if (IS_ERR(info->regs))
> >>return PTR_ERR(info->regs);
> >>
> >>+ /*
> >>+ * The reset should be an optional property, as it should work
> >>+ * with old devicetrees as well
> >>+ */
> >>+ info->reset =3D devm_reset_control_get_optional(&pdev->dev,
> >>+ "saradc-apb");
> >
> >Does anyone know what the _optional API is for ? It seems to be exac=
tly
> >the same
> >as devm_reset_control_get().
>=20
> =E2=80=9C
> As far as I see, the difference is WARN_ON(1)
> when CONFIG_RESET_CONTROLLER is not defined.
>=20
>=20
> The _optional functions were introduced by the following commit:
>=20
> ----------------->8-----------------
> commit b424080a9e086e683ad5fdc624a7cf3c024e0c0f
> Author: Philipp Zabel <p.zabel@xxxxxxxxxxxxxx>
> Date: Fri Mar 7 15:18:47 2014 +0100
>=20
> reset: Add optional resets and stubs
>=20
> This patch adds device_reset_optional and (devm_)reset_control_get_op=
tional
> variants that drivers can use to indicate they can function without c=
ontrol
> over the reset line. For those functions, stubs are added so the driv=
ers can
> be compiled with CONFIG_RESET_CONTROLLER disabled.
> Also, device_reset is annotated with __must_check. Drivers
> ignoring the return
> value should use device_reset_optional instead.
>=20

Is that really what we are looking for here ? CONFIG_RESET_CONTROLLER
is required for other functions of rk3399, isn't it ?

Guenter

> Signed-off-by: Philipp Zabel <p.zabel@xxxxxxxxxxxxxx>
> ------------------8<-----------------------------
> =E2=80=9D
>=20
> for more information on http://www.spinics.net/lists/kernel/msg230667=
7.html
> :-)
>=20
> >
> >Guenter
> >
> >>+ if (IS_ERR(info->reset)) {
> >>+ ret =3D PTR_ERR(info->reset);
> >>+ if (ret !=3D -ENOENT)
> >>+ return ret;
> >>+
> >>+ dev_dbg(&pdev->dev, "no reset control found\n");
> >>+ info->reset =3D NULL;
> >>+ }
> >>+
> >>init_completion(&info->completion);
> >>
> >>irq =3D platform_get_irq(pdev, 0);
> >>@@ -252,6 +280,9 @@ static int rockchip_saradc_probe(struct
> >>platform_device *pdev)
> >>return PTR_ERR(info->vref);
> >>}
> >>
> >>+ if (info->reset)
> >>+ rockchip_saradc_reset_controller(info->reset);
> >>+
> >>/*
> >>* Use a default value for the converter clock.
> >>* This may become user-configurable in the future.
> >>
> >
> >
> >_______________________________________________
> >Linux-rockchip mailing list
> >Linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> >http://lists.infradead.org/mailman/listinfo/linux-rockchip
>=20
>=20
> --=20
> caesar wang | software engineer | wxt-TNX95d0MmH73oGB3hsPCZA@public.gmane.org
>=20
>=20
