From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 1/7] ARM: sunxi: Introduce Allwinner A80 support
Date: Tue, 7 Oct 2014 22:11:38 +0200
Message-ID: <20141007201138.GF17925@lukather>
References: <1411570141-29960-1-git-send-email-wens@csie.org>
 <1411570141-29960-2-git-send-email-wens@csie.org>
 <20140925132527.GF15315@lukather>
 <CAGb2v64LwgEZkiuej2KKi+CUU3OkUZaBKJ3ZZn_Y64tDD+LRwg@mail.gmail.com>
 <20141001093314.GI6884@lukather>
 <CAGb2v66wMm-wZLmwzf==XSDUy9Z0EbjC_NN9EZvf9DFV8PbwrA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Pql/uPZNXIm1JCle"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v66wMm-wZLmwzf==XSDUy9Z0EbjC_NN9EZvf9DFV8PbwrA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Shuge <shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>, Meng Zhang <kevin-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>, ctl <ctl-HcjymKqD97rQT0dZR+AlfA@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--Pql/uPZNXIm1JCle
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 03, 2014 at 02:23:03PM +0800, Chen-Yu Tsai wrote:
> On Wed, Oct 1, 2014 at 5:33 PM, Maxime Ripard
> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > On Sat, Sep 27, 2014 at 09:16:02PM +0800, Chen-Yu Tsai wrote:
> >> On Thu, Sep 25, 2014 at 9:25 PM, Maxime Ripard
> >> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> >> > On Wed, Sep 24, 2014 at 10:48:55PM +0800, Chen-Yu Tsai wrote:
> >> >> The Allwinner A80 is a new Cortex octo-core A7/A15 big.LITTLE SoC.
> >> >> While it's processor cores and interconnecting bus are new, it
> >> >> re-uses many peripherals found in earlier Allwinner SoCs.
> >> >>
> >> >> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> >> >> ---
> >> >>  arch/arm/mach-sunxi/Kconfig | 5 +++++
> >> >>  arch/arm/mach-sunxi/sunxi.c | 9 +++++++++
> >> >>  2 files changed, 14 insertions(+)
> >> >>
> >> >> diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kcon=
fig
> >> >> index 1aaa1e1..72f222b 100644
> >> >> --- a/arch/arm/mach-sunxi/Kconfig
> >> >> +++ b/arch/arm/mach-sunxi/Kconfig
> >> >> @@ -42,4 +42,9 @@ config MACH_SUN8I
> >> >>       select MFD_SUN6I_PRCM
> >> >>       select RESET_CONTROLLER
> >> >>
> >> >> +config MACH_SUN9I
> >> >> +     bool "Allwinner A80 (sun9i) SoCs support"
> >> >
> >> > With the new naming scheme, I wonder wether it makes sense to have t=
he
> >> > A80 displayed here and in the machine definition.
> >>
> >> I expect anything that falls under sun9i to be compatible, or a trimmed
> >> down version. But that's just me.
> >
> > Well, compatible is a rather vague notion. They will be different for
> > sure. Maybe not that different, but still.
>=20
> So what you're saying is we have a MACH_* Kconfig symbol for each SoC.
> As we add or test drivers, we mark them as compatible by adding that
> symbol to the DEPENDS part?
>=20
> I can live with that.

No, what I'm saying is drop the A80 mention from the bool label, and
only leave the family there.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--Pql/uPZNXIm1JCle
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUNEj6AAoJEBx+YmzsjxAgWfwP/0NwdUh/RhxzLre88/7iBlrJ
iEztgsnyBe+PZHeEq3TjhdDDHbliA0LNBVgQ0i7zwUuAUkGBgZFGfHC8NY115zkq
a5lNa9X9ow2R8L/5e2WQ8nSvRY+UgAVicSLBbl60rUsqbnvYv1IeNiUBV0HY71na
nPonQIQU9zb7kNIDWf/Ezek0VqPx5zASxIVEJGS/SRdTqhwxsj1Ccfch+SSCkRyF
WztYkGGNtAnmli+98RmTivouSwWZkz2TPAYJRA+EFWI8K5x/HxMf7XlTzJsOQM8i
TMUEYnnpFJYGH9ezdbvd/Ka2ziWbpO6ipBo5Wgqjt5tAJewQXkLsP+PC1Og1zYVV
4hTMOdU0QF6msIPLcwOI2r4IT0k8Y6dWFlhgfg/nUbqFw2wnfHv+OSaBN+16dEV5
04ttHZyXcbiSP6cKRnczGLVgZIAIVlO9TDLDS9zRGopX7cs6FHYv0ZCNAdymJKpR
jtyX7VdB5pEGos1VUGI40FtgFc0y+CW0mJyFpFkt80Cd4nsPkxnXIphs34I/9mzF
2aSBBL/EIuAf3mCQjtoV5KoZwmdZeqwLW7wpuWKRIdek6um+upzJ9ihPEEvcNBKE
BJ2NcODVU2dDYBiXGW9CukjbVXrsfUcCd4t20QTZtG5CtTVV3YbLHpt/zZYy1i4e
3VxPBMzK/W/BpoTvjZSx
=8TSU
-----END PGP SIGNATURE-----

--Pql/uPZNXIm1JCle--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
