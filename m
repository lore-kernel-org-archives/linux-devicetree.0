From: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Subject: Re: [PATCH v3 2/2] arch: arm: Show the serial number from
 devicetree in cpuinfo
Date: Mon, 27 Apr 2015 16:42:27 +0200
Message-ID: <1430145747.3081.5.camel@collins>
References: <1429351135-11842-1-git-send-email-contact@paulk.fr>
	 <1429351135-11842-2-git-send-email-contact@paulk.fr>
	 <CAL_JsqKkw7n5p1ZH345BeKkyU=GKDrhaLef__0ET7t90Cm0Eog@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-wyaE5ef165NESQ5yZ0Z8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqKkw7n5p1ZH345BeKkyU=GKDrhaLef__0ET7t90Cm0Eog-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Hans De Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--=-wyaE5ef165NESQ5yZ0Z8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 27 avril 2015 =C3=A0 08:48 -0500, Rob Herring a =C3=A9crit :
> On Sat, Apr 18, 2015 at 4:58 AM, Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org> wro=
te:
> > This grabs the serial number shown in cpuinfo from the serial-number de=
vicetree
> > property in priority. When booting with ATAGs (and without device-tree)=
, the
> > provided number is still shown instead.
> >
> > Signed-off-by: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
>=20
> One comment below, otherwise:
>=20
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>=20
> > ---
> >  arch/arm/include/asm/system_info.h |  1 +
> >  arch/arm/kernel/setup.c            | 27 +++++++++++++++++++++++++--
> >  2 files changed, 26 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm/include/asm/system_info.h b/arch/arm/include/asm/=
system_info.h
> > index 720ea03..3860cbd40 100644
> > --- a/arch/arm/include/asm/system_info.h
> > +++ b/arch/arm/include/asm/system_info.h
> > @@ -17,6 +17,7 @@
> >
> >  /* information about the system we're running on */
> >  extern unsigned int system_rev;
> > +extern const char *system_serial;
> >  extern unsigned int system_serial_low;
> >  extern unsigned int system_serial_high;
> >  extern unsigned int mem_fclk_21285;
> > diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/setup.c
> > index 1d60beb..349790f 100644
> > --- a/arch/arm/kernel/setup.c
> > +++ b/arch/arm/kernel/setup.c
> > @@ -93,6 +93,9 @@ unsigned int __atags_pointer __initdata;
> >  unsigned int system_rev;
> >  EXPORT_SYMBOL(system_rev);
> >
> > +const char *system_serial;
> > +EXPORT_SYMBOL(system_serial);
> > +
> >  unsigned int system_serial_low;
> >  EXPORT_SYMBOL(system_serial_low);
> >
> > @@ -821,8 +824,29 @@ arch_initcall(customize_machine);
> >
> >  static int __init init_machine_late(void)
> >  {
> > +#ifdef CONFIG_OF
> > +       struct device_node *root;
> > +       int ret;
> > +#endif
> > +
> >         if (machine_desc->init_late)
> >                 machine_desc->init_late();
> > +
> > +#ifdef CONFIG_OF
>=20
> These ifdefs should not be necessary, but please double check.

Well, of_property_read_string is only defined when CONFIG_OF is set
(base.c is always built in drivers/of but the directory is only included
when CONFIG_OF is set).

Of course, on ARM, we now expect that it is the case, but it seems like
good practice to check for it, since it could theoretically be disabled.

This is also being done a few lines above in customize_machine.

> > +       root =3D of_find_node_by_path("/");
> > +       if (root) {
> > +               ret =3D of_property_read_string(root, "serial-number",
> > +                                             &system_serial);
> > +               if (ret)
> > +                       system_serial =3D NULL;
> > +       }
> > +#endif
> > +
> > +       if (!system_serial)
> > +               system_serial =3D kasprintf(GFP_KERNEL, "%08x%08x",
> > +                                         system_serial_high,
> > +                                         system_serial_low);
> > +
> >         return 0;
> >  }
> >  late_initcall(init_machine_late);
> > @@ -1091,8 +1115,7 @@ static int c_show(struct seq_file *m, void *v)
> >
> >         seq_printf(m, "Hardware\t: %s\n", machine_name);
> >         seq_printf(m, "Revision\t: %04x\n", system_rev);
> > -       seq_printf(m, "Serial\t\t: %08x%08x\n",
> > -                  system_serial_high, system_serial_low);
> > +       seq_printf(m, "Serial\t\t: %s\n", system_serial);
> >
> >         return 0;
> >  }
> > --
> > 1.9.1
> >


--=-wyaE5ef165NESQ5yZ0Z8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABAgAGBQJVPkrTAAoJEIT9weqP7pUMiSAP/R9tnqQEFimFDOWONdh9Anv/
IfQkxQR91sD15g034LcGv8erJ0PFkaPXTGFMJjAohVrJeAoy7yL+OAdQi9TGcQXH
7ETYa4zsc4agZUmlW/E0ozMkm4m+XuYA5jItD+q5+/NJxqj+STmFo0e8TZkjOJ6v
1vA2bBdD+wtWmkZEtGXO/UfE4NAndmP4EEZe6mKYd0KhReE02ByLvQsVh9pEjSJh
5FfhQ9t+O7h6memUFjPAtWTSU9FpsDj4M9AWCfItYXWSDS8S3sO2jccLWtZ1D0Wu
wWt6ROCTBYgB6oHTSr9gGP4z40wZN5qLC3/Uey5z76CSqVZ4Ez9GDrZQaSTj1xgZ
BbrVV/lSemErnO+3FvxiyiD1hDpZcE57rsZh7o0At1N7CeLxWyaNjUpLqIsxE/JY
SEAHVkII1goQ0OkUPKziyYhfcAhUKjbXOsDgCwj3ecNzRN3ezVwkq89dlyzTYJMx
0TG5af559w8EH27biprAZswBomCcCyzNlV+tAAZelqn4d5oSlWoH9Z3D3W8zhVlb
0gP/f5VTbQYCrlKnkNJVkaR3x087JP38cd778vEOM/zBo0G51MSFrjO5bOoX3oc/
mPkE/m4aX8cDJs1HGyKd5QSaLTq7QZmXx5YHF9PsMa296EkzynRPewhJF+jtCk/b
D77Fwo3xBWUpQE59n3Wl
=Dql9
-----END PGP SIGNATURE-----

--=-wyaE5ef165NESQ5yZ0Z8--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
