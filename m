From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/2] dt-bindings: add binding for A64 DE2
 CCU with SRAM section
Date: Mon, 16 Oct 2017 14:09:12 +0200
Message-ID: <20171016120912.lxu7rikhffxsu5o4@flea.lan>
References: <20171014122925.13220-1-icenowy@aosc.io>
 <20171016091136.b4rnckh2tfi26shx@flea.lan>
 <d62ac8b8ff9073b886ceaa9ce54e6903@aosc.io>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mgc7dxp5vfh2imd6"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB5GCSLHQKGQEFDOVKBQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <d62ac8b8ff9073b886ceaa9ce54e6903-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: icenowy-h8G6r0blFSE@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--mgc7dxp5vfh2imd6
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 16, 2017 at 05:41:10PM +0800, icenowy-h8G6r0blFSE@public.gmane.org wrote:
> =E5=9C=A8 2017-10-16 17:11=EF=BC=8CMaxime Ripard =E5=86=99=E9=81=93=EF=BC=
=9A
> > On Sat, Oct 14, 2017 at 08:29:24PM +0800, Icenowy Zheng wrote:
> > > A64's Display Engine 2.0 needs a section of SRAM (SRAM C) to be
> > > claimed.
> >=20
> > Why?
>=20
> Allwinner didn't document this, but if the SRAM is not claimed, the
> DE2 MMIO zone is totally not accessible.

Not accessible how? It generates an abort when you access it? It
returns 0?

> It seems that Allwinner uses the SRAM C in the DE2 internally.

Then shouldn't it be tied to all the DE2 devices then? So mixers
too. Either way, this should be mentionned in your commit logs. How
you're fixing things is much less interesting than why you're doing
them. You can tell how you're doing them from your code already.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--mgc7dxp5vfh2imd6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZ5KFoAAoJEBx+YmzsjxAg1gMQAK5kHgVRFYhI0fS6sTf/Pofr
gPXeNt3wOMyvVxJTAkSyTigpKK6b7iaOARbquuvw8Is5ditA1Fi6T6mOJOKGMm8G
qxW+FlvrcB1qMAQXXN1AaLbKZz64P9XVM8dEG+rnTHAthVMFNhV/1xnjNCTH11Or
7rMA4Ml060/Vc/fRixjK10MYFkFZaCtzHR4Mrbl2y0wp8mYSsj4wx5PY6QaaikDY
9dSN5Ry8ALuH0eYk8UqCYwQYP/zc1+mU3WsxV+ky6OWJU6hR+Ufl2dlxFyWl/7HC
C7f/+cMmXqnM6VF7tSRN81PV4IgQEHdhII6VVcNGs+bebr7/g8g8kO9VB8QjOUY4
bOxRCKKamPUzHQX2mHi5z+mf0FLJS9yAc7xvRam/VS+bjL3yejiG/OWiPl3lq7Ff
cK/yGyVOKgXlHk8rzjvja9cGsqMCqg6+kl4IognEngw/WoWL9YMoxq1r/IiygWJ4
RdP9idFIIDXdIKQJxLyyJGoTm4Z7HzzQR//ULtzcTVu1Xgaw/gxqUe2KZYE7w314
64mBhY82/6DiBEczoGaK+6J4vyOtZ76YyGoQ0qyq0yp7GfppOFuec6y4dw86IR13
4sl4HiWah8pwp/n2S9fHm9oezLPp9uUzwuVLN6ZHbzEydOqGbaZhiM7fsqo+kxGE
DBT3olbM9sOHhWiDUiwv
=X0rk
-----END PGP SIGNATURE-----

--mgc7dxp5vfh2imd6--
