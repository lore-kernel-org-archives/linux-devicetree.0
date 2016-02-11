From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v4] clk: sunxi: Refactor A31 PLL6 so that it can be reused
Date: Thu, 11 Feb 2016 10:41:03 +0100
Message-ID: <20160211094103.GI31506@lukather>
References: <1454358000-13594-1-git-send-email-maxime.ripard@free-electrons.com>
 <56B4E2FB.3050703@arm.com>
 <20160210125936.GD31506@lukather>
 <CABGGisxORFOxLVQiTZ=gEr6j2JnVcjQxTLJFPa7uG93g46CKwg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="N+TWAKLONZJHYDBn"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CABGGisxORFOxLVQiTZ=gEr6j2JnVcjQxTLJFPa7uG93g46CKwg@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Rob Herring <rob.herring@linaro.org>
Cc: Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@csie.org>, Jean-Francois Moine <moinejf@free.fr>, Vishnu Patekar <vishnupatekar0510@gmail.com>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Hans de Goede <hdegoede@redhat.com>, Jens Kuske <jenskuske@gmail.com>, linux-clk@vger.kernel.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--N+TWAKLONZJHYDBn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 10, 2016 at 08:02:45AM -0600, Rob Herring wrote:
> On Wed, Feb 10, 2016 at 6:59 AM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > Hi,
> >
> > On Fri, Feb 05, 2016 at 05:59:23PM +0000, Andre Przywara wrote:
> >> Hi Maxime,
> >>
> >> just found this while looking at your current git branch, so sorry for
> >> the late reply.
> >>
> >> CC:ing DT people, since you touch both existing DTs(!) and the binding=
 doc.
>=20
> [...]
>=20
> >> So are you really breaking all those systems by changing the DT and the
> >> driver in an incompatible way?
> >
> > Yes.
> >
> >> Please correct me if this assessment is wrong, but to me it looks like
> >> any user out there is either stuck with 4.5 at best _or_ will only be
> >> able to run 4.6 and later (depending on which version of the DT she is
> >> using)? And no, switching DTs along with the kernel is _not_ an option.
> >
> > It is. And it is one that every other ARM platform chose. And so did
> > every distribution.
>=20
> I do leave it to platform maintainers judgement (perhaps that should
> be reconsidered), but it should still be case by case basis not an all
> out disregard for the ABI. If you decide to ignore the ABI, then there
> is no decision for the distros or other users.
>=20
> >> That is not how I understand DT.
> >
> > I'm sorry for that. This has never been something we said was
> > happening.
> >
> >> Also this totally ignores any other DT user (U-Boot, FreeBSD, you
> >> name it).
> >
> > Which all have their own DT copies, with their own bindings, that we
> > (ie Linux) never agreed on.
>=20
> That is not really true. There are some differences ATM, but they are
> largely derivatives of the kernel copy and the goal is to align them.
> If we don't maintain an ABI, that will never happen.

At least for us, this is definitely true. The SoCs impacted by this
change are not supported by FreeBSD at all, and the one that are
supported have bindings that do not match the one we have in the
kernel:
https://github.com/freebsd/freebsd/blob/master/sys/boot/fdt/dts/arm/sun4i-a=
10.dtsi

Over the 10 compatibles used there, 3 are totally different (watchdog,
the SRAM controller and the clock hardware block) and two deviates in
incompatible ways (timer and pinctrl) and one has property that we'd
probably deny (UART, and its current-speed). 6 out of 10 overall.

And U-boot never had any issue in the past with that policy. Tom said
it on several occasions, and it worked for us too, with some minor
compromises we needed, such as keeping some node pathes that U-Boot
was using, even though it turned out to be wrong.

https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/arch/a=
rm/boot/dts/sun7i-a20.dtsi#n615

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--N+TWAKLONZJHYDBn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWvFcvAAoJEBx+YmzsjxAgpfEQALB/6eJ9kARSAwzTMlM8VV7F
mbeqtYE34g2WAcbrBps43To0L9dMAnnCpM3eUmJhzVDc9rMmbfMpgAP+4tdRNLb4
sRMkHdrK6qk2q8hktk8hD7wwCVo2YmqOWG3RTbI18p33aZhjoAGBpGJuuu9k28lf
sg5W8V+uchSBYgrV0jdqDEaYC30TZjI1MVGaHCp+jwlVTFBQW2/0McTPqmYsTHjV
Zdyq0teZXHpXy2r+ebQqGQzlYXDvqv6tZvEf+SOyWAYaEqB5D6b/228OXDysWy/U
lz4KM1XT4FWwqY1S5xZJAxNZJtOtyr3k3ZeAbYZNwNv3ZbIe0V2Jd/+E+xZ0Ye3h
4/7B8eqaOPC+TJlbl5S5IYjB2Uh2rra9wdBWYSXfOMZU/0qzotAKfxD3zw4Rltd6
pLDPk+El4/n4UX6NnnBN2WDzufdUdwcAmDgSxq7vE64or3lDpecRSWdNSA/ufAOF
+NwVVYoPM6n0G4JPrzo6PYe6d13IJmYyviUYGmew01JD6hczNX/zFoSpUxyoQZtt
+wAlGt9AmHM22UfhpkLOfc2Eq0ABkFRP1wmDQLPhdutowA49GxaW1RLNhnleKnW9
iTyxwvWo6SX92Jnm8XlAG/2SBgrIZHFsWPzijNUTKoU3I1fA2wN2xpgDPTl8GtyM
i9daVZszLySGpmz8Addj
=urZ+
-----END PGP SIGNATURE-----

--N+TWAKLONZJHYDBn--
