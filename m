From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 8/8] drm/tilcdc: panel: Add support for enable GPIO
Date: Fri, 11 Jul 2014 14:38:59 -0300
Message-ID: <20140711173859.GA869@arch.cereza>
References: <1405088334-11215-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1405088334-11215-9-git-send-email-ezequiel@vanguardiasur.com.ar>
 <CAOMZO5CawR9qMbm3HLf4+S3-pcf4m=VCUqm0W9LXXYzNzv2aOQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOMZO5CawR9qMbm3HLf4+S3-pcf4m=VCUqm0W9LXXYzNzv2aOQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, DRI mailing list <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Fabio,

On 11 Jul 12:08 PM, Fabio Estevam wrote:
> On Fri, Jul 11, 2014 at 11:18 AM, Ezequiel Garcia
> <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org> wrote:
> > In order to support the "enable GPIO" available in many panel devic=
es,
> > this commit adds a proper devicetree binding.
> >
> > By providing an enable GPIO in the devicetree, the driver can now t=
urn
> > off and on the panel device, and/or the backlight device. Both the
> > backlight and the GPIO are optional properties.
> > +       panel_mod->enable_gpio =3D devm_gpiod_get(&pdev->dev, "enab=
le");
> > +       if (IS_ERR(panel_mod->enable_gpio)) {
> > +               ret =3D PTR_ERR(panel_mod->enable_gpio);
> > +               if (ret !=3D -ENOENT) {
>=20
> Shouldn't this be controlled by a regulator instead? What if the pane=
l
> is powered from a PMIC output?

I'm not sure I understand how is that related. I have a New Heaven LCD =
panel
(NHD-4.3-480272EF-ATXL#-T) and it has a signal called "Display On/Off" =
that
I'm using to enable and disable the panel from a GPIO.

This is useful when switching the output from the panel to the HDMI for
instance, and turn off the display panel when the output goes to the HD=
MI.

Probably I'm missing something, I can't really see how regulators fit h=
ere.

Thanks!
--=20
Ezequiel Garc=EDa, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
