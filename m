From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v8 0/4] Add support for Orange Pi 3
Date: Mon, 12 Aug 2019 10:14:45 +0200
Message-ID: <20190812081445.kfsbikfrt3pmsh6d@flea>
References: <20190806155744.10263-1-megous@megous.com>
 <2218280.0sI6yjypBf@jernej-laptop>
 <CAGb2v67JVG2rhOdUwBmfsO0+RYb4DNOPmUo=Q_UhL3N+niLiEg@mail.gmail.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wnuh5gs25vfqywb6"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB6F7YTVAKGQEIF6HBYY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <CAGb2v67JVG2rhOdUwBmfsO0+RYb4DNOPmUo=Q_UhL3N+niLiEg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Jernej Skrabec <jernej.skrabec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, =?utf-8?Q?Ond=C5=99ej?= Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--wnuh5gs25vfqywb6
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 12, 2019 at 03:54:03PM +0800, Chen-Yu Tsai wrote:
> On Mon, Aug 12, 2019 at 3:45 PM Jernej =C5=A0krabec <jernej.skrabec@gmail=
.com> wrote:
> >
> > Dne torek, 06. avgust 2019 ob 17:57:39 CEST je megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org napisa=
l(a):
> > > From: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
> > >
> > > This series implements support for Xunlong Orange Pi 3 board. There
> > > are only a few patches remaining.
> > >
> > > - ethernet support - just a DT change (patch 1)
> > > - HDMI support (patches 2-4)
> > >
> > > For some people, ethernet doesn't work after reboot because u-boot do=
esn't
> > > support AXP805 PMIC, and will not turn off the etherent PHY regulator=
s.
> > > So the regulator controlled by gpio will be shut down, but the other =
one
> > > controlled by the AXP PMIC will not.
> > >
> > > This is a problem only when running with a builtin driver. This needs
> > > to be fixed in u-boot.
> > >
> > >
> > > Please take a look.
> >
> > Is there anything missing? It would be nice to get this in 5.4. There i=
s a lot
> > of H6 boards which needs DDC bus enable mechanism (part of H6 reference
> > design), including Beelink GS1 which already has HDMI node in mainline =
kernel
> > DT, but due to disabled DDC lines works only with 1024x768 (fallback
> > resolution in DRM core).
>
> I have a few minor comments about patch 1.
>
> I think the HDMI bits are good, but I don't have maintainership / commit
> permissions for drm-misc, so I'll have to wait until someone applies patc=
hes
> 2 and 3 before I apply patch 4.

I've applied 2,3 and 4

Thanks!
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
To view this discussion on the web, visit https://groups.google.com/d/msgid=
/linux-sunxi/20190812081445.kfsbikfrt3pmsh6d%40flea.

--wnuh5gs25vfqywb6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXVEf9QAKCRDj7w1vZxhR
xXlgAP9MFKL3iPUwZUiy1/l5hoQrktuJFTIedDN9ko3r/H6TDAD/RZg3u4WBh6O3
tteR/L/slzyHzMHsyD72abKseY8/IQE=
=i2m2
-----END PGP SIGNATURE-----

--wnuh5gs25vfqywb6--
