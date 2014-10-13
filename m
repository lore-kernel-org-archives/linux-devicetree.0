From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 0/7] clk: sun6i: Unify AHB1 clock and fix
 rate calculation
Date: Mon, 13 Oct 2014 12:39:52 +0200
Message-ID: <20141013103952.GW19438@lukather>
References: <1410000448-9999-1-git-send-email-wens@csie.org>
 <20140911203623.GJ31276@lukather>
 <20140926002544.19023.39287@quantum>
 <CAGb2v67QkjfH2U9YGUVcwisNakNs_=zEEWghiGkaGkm-A8aK=w@mail.gmail.com>
 <20140926185334.19023.12876@quantum>
 <CAGb2v65KDOmwHAgFT6Gx8mtKTGEEYfbx6UVhz74V15J1O4odjg@mail.gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="McQJJYUzjTUqtsGv"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBAWY52QQKGQE3DUIXTY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v65KDOmwHAgFT6Gx8mtKTGEEYfbx6UVhz74V15J1O4odjg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--McQJJYUzjTUqtsGv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 09, 2014 at 11:16:50AM +0800, Chen-Yu Tsai wrote:
> On Sat, Sep 27, 2014 at 2:53 AM, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> w=
rote:
> > Quoting Chen-Yu Tsai (2014-09-25 17:55:27)
> >> On Fri, Sep 26, 2014 at 8:25 AM, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org=
> wrote:
> >> > Quoting Maxime Ripard (2014-09-11 13:36:23)
> >> >> Hi Chen-Yu,
> >> >>
> >> >> On Sat, Sep 06, 2014 at 06:47:21PM +0800, Chen-Yu Tsai wrote:
> >> >> > Hi everyone,
> >> >> >
> >> >> > This series unifies the mux and divider parts of the AHB1 clock f=
ound
> >> >> > on sun6i and sun8i, while also adding support for the pre-divider=
 on
> >> >> > the PLL6 input.
> >> >> >
> >> >> > The rate calculation logic must factor in which parent it is usin=
g to
> >> >> > calculate the rate, to decide whether to use the pre-divider or n=
ot.
> >> >> > This is beyond the original factors clk design in sunxi. To avoid
> >> >> > feature bloat, this is implemented as a seperate composite clk.
> >> >> >
> >> >> > The new clock driver is registered with a separate OF_CLK_DECLARE.
> >> >> > This is done so that assigned-clocks* properties on the clk provi=
der
> >> >> > node can actually work. The clock framework arranges the clock se=
tup
> >> >> > order by checking whether all clock parents are available, by che=
cking
> >> >> > the node matching OF_CLK_DECLARE.
> >> >> >
> >> >> > However, the sunxi clk driver is based on the root node compatibl=
e,
> >> >> > has no defined dependencies (parents), and is setup before the fi=
xed-rate
> >> >> > clocks. Thus when the ahb1 clock is added, all parents have rate =
=3D 0.
> >> >> > There is no way to calculate the required clock factors to set a =
default
> >> >> > clock rate under these circumstances. This happens when we set the
> >> >> > defaults in the clock node (provider), rather than a clock consum=
er.
> >> >> >
> >> >> > I can think of 2 ways to solve the dependency issue, but neither =
is
> >> >> > pretty. One would be to move the root fixed-rate clocks into the =
sunxi
> >> >> > clk driver. The other would be separating all the clocks into ind=
ividual
> >> >> > OF_CLK_DECLARE statements, which adds a lot of boilerplate code.
> >> >>
> >> >> I don't know what Mike thinks of this, but I'd prefer the second.
> >> >
> >> > I do not fully understand the problem. Ideally the clock driver shou=
ld
> >> > have some way to fail with EPROBE_DEFER until the fixed-rate clocks =
are
> >> > registered. Those fixed-rate parents are enumerated in your dts, rig=
ht?
> >> > Why isn't this enough?
> >>
> >> This is due to the way the sunxi clock driver is setup. The clock driv=
er's
> >> OF_CLK_DECLARE matches against the "soc" node, not the individual clock
> >> nodes. When the setup function is called, it just registers all the
> >> supported clocks. There are no dependencies listed.
> >>
> >> Unfortunately, the fixed-factor clock is in the middle of the whole cl=
ock
> >> tree. The sunxi clock driver provides its parents _and_ its children.
> >> Naturally the clock framework then probes the fixed-factor clock after
> >> the sunxi ones. Any attempts to change the state of clocks under the
> >> unavailable fixed-factor clock, such as done by of_clk_set_defaults(),
> >> would get an incomplete clock, likely with no parents and parent_rate =
=3D 0.
> >> That is until of_clk_init() finishes and all clocks are properly hooked
> >> up.
> >>
> >> Anyway, this problem only occurred when I added clk-assigned-* defaults
> >> to the clock provider node, which is not the case anymore.
> >
> > Makes sense. I guess you could ignore the problem until you need to use
> > the assigned defaults.
>=20
> An update on this. Improper ordering of clock probing also affects
> sunxi's clock protection code.
>=20
> Currently we have 2 mechanisms for protecting clocks.
>=20
>   a) A list of clock names in sunxi/clk-sunxi.c, fetched and enabled
>      using clkdev.
>   b) Enabling clocks right after they are registered. Used for separated
>      clock drivers like sun5i-a13-mbus and sun8i-a23-mbus.
>=20
> One issue I ran across was when most of the clock tree is registered using
> independent CLK_OF_DECLAREs, as I'm doing for the A80, if the protected
> clocks list is handled before the clock tree is complete, the prepare
> and enable calls are not correctly propagated to the parents that arrive
> later on.
>=20
> This happens to the ahb*_sdram gates.

I guess that eventually, we should be able to remove a). For the time
being, maybe we can just move the clock protection code itself to a
later initcall?

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--McQJJYUzjTUqtsGv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUO6v4AAoJEBx+YmzsjxAgFTIQALGrOOujJ8bKArjNKXb2h5if
vJolJ6BeQMF/UzkyVQeQhU7s1H4gAPos4XRu028RHgVxmiEUdvpbLUoiKlN5Hb4q
LinuFL8lZhzc77RPwLia50wTAlYgFhZzEmAIGd0qvpJ2cjLryNkWydGMTJVJisbl
Ut/Vfcn6XFMQ8zMIroe5cFizeuZdInTMQ45B8wO3mvnpSRQPA+xIPcF5nTr2S1Z7
d2SIoaOz5tvxs0SsEDdHm1wPCBKzhPAqbItDZ1v5ZL/dBHVBaS7CSbJfz7+y0vKd
hLAEILDiw++N0vFTF54c4/CZP5uzFL7Bted/sK1laXU2YqCHrNPe9kUC/HfVrtdl
aVApjFeqhfvL5WXEsjTGf9MEelFhG6DjRG4BanzFqzIPt/hU+kB5LgzPOr4K44f1
JCk4H3yeZzo+vJoaNgEKXjq5OANTT9w5f1epQFPGVeYV9K2VZfU76rn8LextZPrR
YaYVLPY5w0Sk6vbS+vWFgvX+fh/rIM519WhwXu+lHHSgtCXOw3WFtiSuyeCHpCKM
ZoRrEKfCaGf0lwaEY9/v0hpqJpXs4pwvnxSYu2Km6GspPllN0R2j2isHcQ3511vZ
bOQ7XjlClIsj/a/YxUJKrSv++CK2r0JH9LzNlvdVj7esSwhM8OYKpkIPwM1MFyCW
6XS0OWTyKdjBscMt1Db/
=rnHC
-----END PGP SIGNATURE-----

--McQJJYUzjTUqtsGv--
