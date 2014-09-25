From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 6/7] ARM: dts: sun6i: Add required ahb1
 clock parent and rates for dma controller
Date: Thu, 25 Sep 2014 15:41:01 +0200
Message-ID: <20140925134101.GL15315@lukather>
References: <1410000448-9999-1-git-send-email-wens@csie.org>
 <1410000448-9999-7-git-send-email-wens@csie.org>
 <20140911211531.GN31276@lukather>
 <CAGb2v64+RxJ52DzawhAtYCn=sw+28e4Q11jzG02KQE=8hxa0tQ@mail.gmail.com>
 <20140916154849.GE2166@lukather>
 <CAGb2v64BLvB3v8Wnep5Fqh1COTXYJ5_uyeuevejqD-KpYiptQg@mail.gmail.com>
 <20140920095927.GQ2166@lukather>
 <CAGb2v67cf+UQW2Sp=vS1jSu1jCAgG-wXz8cvh7K4RM4zhJgjkA@mail.gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GviraxgP0A7vmYdC"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRB5FYSCQQKGQEVXMM72A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v67cf+UQW2Sp=vS1jSu1jCAgG-wXz8cvh7K4RM4zhJgjkA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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


--GviraxgP0A7vmYdC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 21, 2014 at 04:31:06PM +0800, Chen-Yu Tsai wrote:
> On Sat, Sep 20, 2014 at 5:59 PM, Maxime Ripard
> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > On Wed, Sep 17, 2014 at 12:01:46AM +0800, Chen-Yu Tsai wrote:
> >> On Tue, Sep 16, 2014 at 11:48 PM, Maxime Ripard
> >> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> >> > On Fri, Sep 12, 2014 at 10:10:25AM +0800, Chen-Yu Tsai wrote:
> >> >> On Fri, Sep 12, 2014 at 5:15 AM, Maxime Ripard
> >> >> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> >> >> > On Sat, Sep 06, 2014 at 06:47:27PM +0800, Chen-Yu Tsai wrote:
> >> >> >> The DMA controller requires AHB1 bus clock to be clocked from PL=
L6.
> >> >> >>
> >> >> >> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> >> >> >> ---
> >> >> >>  arch/arm/boot/dts/sun6i-a31.dtsi | 5 +++++
> >> >> >>  1 file changed, 5 insertions(+)
> >> >> >>
> >> >> >> diff --git a/arch/arm/boot/dts/sun6i-a31.dtsi b/arch/arm/boot/dt=
s/sun6i-a31.dtsi
> >> >> >> index 8eb2c6d..1117989 100644
> >> >> >> --- a/arch/arm/boot/dts/sun6i-a31.dtsi
> >> >> >> +++ b/arch/arm/boot/dts/sun6i-a31.dtsi
> >> >> >> @@ -317,6 +317,11 @@
> >> >> >>                       clocks =3D <&ahb1_gates 6>;
> >> >> >>                       resets =3D <&ahb1_rst 6>;
> >> >> >>                       #dma-cells =3D <1>;
> >> >> >> +
> >> >> >> +                     /* DMA controller requires AHB1 clocked fr=
om PLL6 */
> >> >> >> +                     assigned-clocks =3D <&ahb1>;
> >> >> >> +                     assigned-clock-parents =3D <&pll6>;
> >> >> >> +                     assigned-clock-rates =3D <200000000>;
> >> >> >
> >> >> > Where did you get that from?
> >> >> >
> >> >> > The user manual says that it should be clocked at 600MHz, and I'm=
 not
> >> >> > sure it should be enforced there either.
> >> >>
> >> >> The bindings mean that ahb1 should be clocked from pll6 and at 200 =
MHz,
> >> >> not "pll6 should be 200 MHz". I assume you were misled by them.
> >> >>
> >> >> Clocking ahb1 from pll6 and at 200 MHz with the /3 pre-divider is t=
he
> >> >> vendor BSP default:
> >> >>
> >> >> On sun6i, the clock init code calls aw_ccu_switch_ahb_2_pll6(), whi=
ch muxes
> >> >> ahb1 from pll6 with the highest dividers, then sets the rate for ah=
b1 to
> >> >> pll6, which sets pre-divider to /3 and divider to /1.
> >> >>
> >> >> Hope this clears it up. :)
> >> >
> >> > It does, thanks :)
> >> >
> >> > But still, I find it the wrong place to enforce such a limit. This
> >> > should go into the clock driver itself. The DMA controller requires
> >> > such a parenting, but it doesn't require any specific rate, this is
> >> > more something of the global system policy.
> >>
> >> But I am guessing the AHB bus clock cannot be clock at any arbitrary
> >> rate. Just muxing without setting a specific clock rate might result
> >> in a hang. We could address this with per clock limitations, like the
> >> patch you posted earlier. Not sure if there's anything in the kernel
> >> like that at the moment, or how the clock framework handles clock rates
> >> after re-parenting.
> >
> > There's the Tomeu patch series that allows to set clock rate
> > requirements from the user side, I guess that could be easily extended
> > to integrate some clock side boundaries. That's why I stopped working
> > on the sun5i MMC clock issue until that patch is merged.
>=20
> I could take a look, but AFAIK none of our drivers need to propagate
> clock rate changes.

Don't worry about this.

> >> Or we could just specify in the clock driver, or in the DT via clock
> >> supplier defaults, that the AHB bus should be clocked from PLL6 @ 200 =
MHz.
> >>
> >> The latter seems easier to do.
> >
> > IIRC, there was some opposition to having the muxing assignment in the
> > clock driver.
> >
> >> Also, I tested the DMA controller using dmatest on my A31 Hummingbird
> >> without this re-parenting patch. It worked fine. How did your tests fa=
il?
> >
> > It was just timeouting, and actually, it was only working to the SRAM,
> > and not the DRAM.
> >
> > Maybe the bootloader sets up the clock muxing already?
>=20
> I just reran my tests on the A31, and dmatest indeed passes.
> I'm using your A31 sdcard.img, replaced u-boot with one built from
> u-boot-sunxi, so it supports DT.
>=20
> I also checked both the clock framework and the raw registers.
> AHB1 is indeed clocked from AXI on my system.
>=20
> Full log: https://gist.github.com/wens/ae17aed6728b83c0a9c3
>=20
> If you (or someone else with A31) can verify the results,
> maybe we can just drop this patch.

I'm away from the colombus board this week, but if it works on the
hummingbird, we can just move this patch to the colombus DT, and not
put it in the DTSI.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--GviraxgP0A7vmYdC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUJBttAAoJEBx+YmzsjxAgUHoQALiL2gu4iZ/n1qese0LFtOGk
Q3wOsvjxZlHbk0HrbDdxX/whxZAAMgfDMcJROekf23BOYAAWaQYzpQ6aSgcPB2oi
ccYyZbcubDDeDXxR0PamRsfWVGnakh+ktbPMWOfkfw7fqSpfvRNfwRyUlTounXS7
l7pnwySR/T7ifvecMQM+cgoaz3jF24f02raymDsl+Fuh0cFLVFEROBNnoaczd34B
QeRLzrA+BoSxwjKgR+H/LjV2erBqCH1rZKrg7mHujEret1+GhQ6FVwpsomWlAmCC
wKMe29RCFuhZ8LUSQo9ndGDY/dvSbQUg7284hcYC5LQj+QjosxQ78iGbvgXmsq0B
PDuTJI4UHG9N1VShasqsgNrnBIaZwlfE6D4VGAauOxIfZ3AZrDatodFgNp1x9S+w
MjQNLsBGgD7kERoDvxOR3Cy8CtFh1Bt/q0BQXPWgtbrZa+mI7ZA9mKR8Fx+YoRx+
IRQp8ttnGGITyhrY0qWO79SL0ETGHEtBVm6g+IpPVSSRZ8WQUXr8+UDgypPzfCcW
2vTZD7a8enKxNpvWNnY+mUf0w3M0uJGCkPkpVZTfg7poUGQ7JD3JcZFs/3Qs22RH
lIugj1MfCTzLsIh4DfC/agNmEYSNUlQ+7UBZvDAOotmFevmA2HTxijEZ33kkJLmj
X5nskcCBEVu56znAsnCo
=Px0s
-----END PGP SIGNATURE-----

--GviraxgP0A7vmYdC--
