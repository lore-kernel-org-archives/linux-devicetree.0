From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/2] arm: dts: sun8i: reuse the uart1 node
 of iNet D978 rev2 board
Date: Fri, 9 Dec 2016 09:11:03 +0100
Message-ID: <20161209081103.4h3irlbq6t4pz2ac@lukather>
References: <20161205184745.lfW8ji5w@smtp1m.mail.yandex.net>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="x4fzxwfob2cv6yuh"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBGGOVHBAKGQEFQGHWNA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20161205184745.lfW8ji5w-3YhIAYTWRJA0PDqKvflMoHmW9unr2Ajn@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Cc: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--x4fzxwfob2cv6yuh
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 05, 2016 at 05:03:35PM +0800, Icenowy Zheng wrote:
>=20
> 2016=E5=B9=B412=E6=9C=885=E6=97=A5 16:50=E4=BA=8E Maxime Ripard <maxime.r=
ipard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Fri, Dec 02, 2016 at 11:19:13PM +0800, Icenowy Zheng wrote:=20
> > > As a uart1 node is added into sun8i-reference-design-tablet.dtsi, sim=
ply=20
> > > use it in iNet D978 rev2 device tree.=20
> > >=20
> > > Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>=20
> >
> > I'd like to see more consolidation before that change is needed. If we=
=20
> > find more boards using that, it will make sense, but for a single=20
> > board it's not worth it.=20
>=20
> At least 2~3 Q8 A33 tablets in #linux-sunxi are found to have
> rtl8703as, which contains UART bluetooth. (including mine)

Still, I'm not fond of creating a default on such a low count sample
of (out-of-tree) DTs. Support and enable the bluetooth on more boards,
and then consolidate.

> In fact, what I want to do is to get the node ready-to-be-okay in Q8
> dts, so it can be enabled by either u-boot command or (theortically)
> Hans de Goede's q8-hardwaremgr, just like what is done at
> touchscreen node.

If your plan is to enable all the combinations possible accross the Q8
tablets and let the bootloader/user figure it all out, then it's not
going to happen, sorry.

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

--x4fzxwfob2cv6yuh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYSmcXAAoJEBx+YmzsjxAgk0MP/2OQxDp9fpG8lgzYOguNGZtw
rtudAsLACf6rVEZ6mUEk31AcWAhybQHwtBJLpifnsv0oDONmGPF6+VSq+atm1Q3S
KWFv18aV27wo8tGyOoM3pBn6EpHvVicbKn9EnpDSW5epy3lmG3uOkoLjPGARx7as
7vg5IT9PGdC3LB2fYgWho9mpLQfC6Z+47GlpThUDxqUlIw7Bm7iXeLJKM9PuDk8d
EJStq5kanjpya3II4/mnUg0CY8MbPxccAtpaE8rkErZn+G+ry3QMHnRpalCjq18b
StFxeEjnsrlNqs8IP0479SR0l17m1zkaxhONozUNGuh7Uelb9kOueTePsRR0RgbN
nfbKXIF245VrczqZx/5j/w4XgekaBsXp9w015WrwARbMmX4Y7lihsfixwBv5I6J2
JfZ4PbbI7AEospM+Mc1q9H6QlxfxWumZjKybhOW485y7Ap/+Q0eqxpzsP6zH22wF
G16Vm0TBnjSVeVQ3CtNrBktvZKroLz6uBMWlf7wNyzef9yf8rSpEq1lKr0j6Ce5Q
z4Mml85Lq2yEbm1Je6RTtR+y9sWBpwlUTBFNeFnret3BivoMpKKOpQ1qZ6SjJsE4
VQ8i5hGOWt8uI2GpNZ4Uu2a0t6KX6SeN2X4VdYby7F8NTZCFP6JnzBL7xW9/ckt4
zqA5JnK0SoAfXgW+GA4C
=qpP8
-----END PGP SIGNATURE-----

--x4fzxwfob2cv6yuh--
