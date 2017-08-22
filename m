From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: sun8i: a33: add dts for Q8 tablets
 with different resolution
Date: Tue, 22 Aug 2017 22:33:54 +0200
Message-ID: <20170822203354.la2w2fb3ljxwmjo4@flea.home>
References: <20170817074926.3410-1-icenowy@aosc.io>
 <20170821084053.s4qmhlvgsmckmqgh@flea.lan>
 <4a0a72b4679db296a8e48512c41a2ce5@aosc.io>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rjyi3vbtv2q6yu56"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBPNK6LGAKGQELIJ7M7Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <4a0a72b4679db296a8e48512c41a2ce5-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: icenowy-h8G6r0blFSE@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--rjyi3vbtv2q6yu56
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 21, 2017 at 04:44:30PM +0800, icenowy-h8G6r0blFSE@public.gmane.org wrote:
> =E5=9C=A8 2017-08-21 16:40=EF=BC=8CMaxime Ripard =E5=86=99=E9=81=93=EF=BC=
=9A
> > On Thu, Aug 17, 2017 at 03:49:26PM +0800, Icenowy Zheng wrote:
> > > Q8 tablets with Allwinner A33 SoC now come with two kind of LCD,
> > > either
> > > 800x480 or 1024x600.
> > >=20
> > > In order for sun4i-drm to be able to choose correct LCD configuration=
,
> > > two different device trees should be present, one for a resolution.
> > >=20
> > > Add stub device trees for two resolutions.
> > >=20
> > > As the sun4i-drm driver still has some problems to support the LCDs,
> > > the
> > > real LCD device nodes are not added to the device tree files.
> > >=20
> > > Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> >=20
> > This should be an overlay, ideally applied by the bootloader.
>=20
> I think this is not suitable for overlay.
>=20
> The two kind of Q8 tablets are not compatible at all, and they
> should both have a suitable device tree.

How are they not compatible?

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

--rjyi3vbtv2q6yu56
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZnJUyAAoJEBx+YmzsjxAgw/oP/1HozhQKc4Cc7AtJd7LQAk8c
g4hkZh6HfVHgMqPV9CEsZsNMo9dvof97doaFOc6UBq4e1bVCh3bx32Vd5fNl5OXp
dXEBfLzotuQikXnS1tbNzUrUa0yKDjn+y2NBebLxuN0/Ql1EBwin3/LXgm3HCqD3
WIySN7yuAicNCy9Q/rHueV+rZCYN2hTCkT1C7ajq4FqlmwQSvICq2S2FOJuujTBA
/9rQLGUi4XSpQnaVsnFP7X2RPrpK059RUpTdcOvYTB+YkwZ8/q6me3yh9pmmhrq8
4sfijsDG4801icPFdneCWCgRRRtshC/OaTb4B64JyraHANs24C+CIzguFyOnG31h
il5tAvy5HY02hoF5hLN3H0kjrFcSg0WlkFO5pamZrd73F1DxbTJ+aByXeRdnjNZr
bM2QpjW/10Xr/+3JJ1/RmLflZrsN6C3yQlgrDi2igB2r1y3oFBDK1AosxeRt/4ox
bITWWQbnNQB5eipo6y/2xlqecPQpQWoFY1Wyt4IUaigkvj2fV8aNghPhcPR/jm8n
rzo6nJDf9dX8eM3FbTsij+vB5/ppqnSHbRYQbZ80polyzi/2hqhxb/oKk5JEeBS2
AG+QJKvDmtXytIB4O9OuZAQFbFL5th0jWwp4Zeu/G8vW59Ygvq5ERP8ADVrsU/pz
t+xbO5xAzsPj/y0AD2BS
=xSox
-----END PGP SIGNATURE-----

--rjyi3vbtv2q6yu56--
