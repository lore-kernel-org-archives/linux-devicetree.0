From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v5 0/5] Add OV5640 parallel interface and RGB565/YUYV
 support
Date: Fri, 12 Jan 2018 10:04:42 +0100
Message-ID: <20180112090442.o3uxxavtpev5ckhs@flea.lan>
References: <1514973452-10464-1-git-send-email-hugues.fruchet@st.com>
 <20180108153811.5xrvbaekm6nxtoa6@flea>
 <3010811e-ed37-4489-6a9f-6cc835f41575@st.com>
 <20180110153724.l77zpdgxfbzkznuf@flea>
 <20180111091508.a0c9f630c6b4ef80178694fb@magewell.com>
 <20180111124018.azdzjeitjsyenmra@flea.lan>
 <20180112101839.cc13571a099d64eea2ac6e3a@magewell.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bpckhexrypbisyfg"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180112101839.cc13571a099d64eea2ac6e3a-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yong <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>
Cc: Hugues FRUCHET <hugues.fruchet-qxv4g6HH51o@public.gmane.org>, Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--bpckhexrypbisyfg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jan 12, 2018 at 10:18:39AM +0800, Yong wrote:
> > On Thu, Jan 11, 2018 at 09:15:08AM +0800, Yong wrote:
> > > > On Mon, Jan 08, 2018 at 05:13:39PM +0000, Hugues FRUCHET wrote:
> > > > > I'm using a ST board with OV5640 wired in parallel bus output in =
order=20
> > > > > to interface to my STM32 DCMI parallel interface.
> > > > > Perhaps could you describe your setup so I could help on understa=
nding=20
> > > > > the problem on your side. From my past experience with this senso=
r=20
> > > > > module, you can first check hsync/vsync polarities, the datasheet=
 is=20
> > > > > buggy on VSYNC polarity as documented in patch 4/5.
> > > >=20
> > > > It turns out that it was indeed a polarity issue.
> > > >=20
> > > > It looks like that in order to operate properly, I need to setup the
> > > > opposite polarity on HSYNC and VSYNC on the interface. I looked at =
the
> > > > signals under a scope, and VSYNC is obviously inversed as you
> > > > described. HSYNC, I'm not so sure since the HBLANK period seems very
> > > > long, almost a line.
> > > >=20
> > > > Since VSYNC at least looks correct, I'd be inclined to think that t=
he
> > > > polarity is inversed on at least the SoC I'm using it on.
> > > >=20
> > > > Yong, did you test the V3S CSI driver with a parallel interface? Wi=
th
> > > > what sensor driver? Have you found some polarities issues like this?
> > >=20
> > > Did you try it with Allwinner SoCs?
> >=20
> > Yes, on an H3. Looking at all the Allwinner datasheet I could get my
> > hands on, they are all documented in the same way. However, I really
> > start to wonder whether the polarity shouldn't be reversed.
> >=20
> > At least the fact that VSYNC is clearly active low on the
> > oscilloscope, while I have to set it active high in the controller
> > seems like a strong hint :)
>=20
> The BSP code of Allwinner also treat V4L2_MBUS_VSYNC_ACTIVE_HIGH as
> they documented 'positive'.
> Maybe there need some more tests to confirm if the datasheet and BSP
> code are both wrong.

Indeed, and at the same time they do the same on the ov5640 driver
they have.

I really think they are in a situation where they report that both the
interface and the sensor are active high, while they are actually
active low, but since both sides still use the same polarity it works.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--bpckhexrypbisyfg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlpYeikACgkQ0rTAlCFN
r3TkTQ/+K8ZkxLBJlbJpmDe/IllM5ONMX1d2fP2gk7UzgrlYFxS2/ScbBnHp4MqC
Vb+/5ty+0yp/UwO0GhJjD8v5REYDId5e4bdBG3X/LFwuqqJgw459z+dURJxu/i81
HVDA8rEg+rxL8W222X4Z3Vj5jiaEcJIH9nhyLNizoZ00N1JnxXZEIlE+BEEvFYIO
OQiki5awx0SioWr9DuSuF37FTr+JX8Zt/QtOFRWMnxPI4cYjmiwCJCmEVSODJmxh
d5RoykQaJEYMHJ3jowad/Ho619VP7rgwU1o4FltBF7ngev7w5f+XXOYlHxwYqNIM
4S8A8Pv3gBW6YmEgw9ddufvUZwf6Ssias8SN/Va489qjIG1Ix+/tCuTEeIuBQcRW
zxVlfT4BNuu+Bwvg45I+KXdPtuw6K6bhRPNPUoMPRRguYCa4/SqmxYw0qXxeWd79
4vk7VNN3HmOWugLqw6dnynim7quEJmXHmVCy+RLimZjcFlb9xpiAT310WwF+A6zI
sFEvgmXDe9EO+HAnHEtKqmYr8Lz5Y9qoClmThZwuu5dtfQ3XHATWb7LAyEy4BjIg
YP51x1nc6EqzuRWlBlhB7CAJybCOc8x9ivIX8u0j+GIYGsyvhFQFG80+AfBUKSz5
8G8ebIXJJcWvtA0M7aVgf2rZsvakJo3kTOXAnkaWdAYerZ8t70A=
=N6Ne
-----END PGP SIGNATURE-----

--bpckhexrypbisyfg--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
