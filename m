From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/4] arm64: dts: fix PMU IRQ ordering for Juno
Date: Thu, 5 Feb 2015 23:48:33 +1100
Message-ID: <20150205124833.GV25675@voom.fritz.box>
References: <1422294858-28100-1-git-send-email-will.deacon@arm.com>
 <20150205114642.GG11344@leverpostej>
 <20150205115416.GE23241@arm.com>
 <20150205115933.GI11344@leverpostej>
 <20150205120920.GF23241@arm.com>
 <20150205122048.GJ11344@leverpostej>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tYlHSoJ8Aop8eNG2"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150205122048.GJ11344@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org
List-Id: devicetree@vger.kernel.org


--tYlHSoJ8Aop8eNG2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 05, 2015 at 12:20:48PM +0000, Mark Rutland wrote:
> [Adding dtc folk]
>=20
> On Thu, Feb 05, 2015 at 12:09:20PM +0000, Will Deacon wrote:
> > On Thu, Feb 05, 2015 at 11:59:33AM +0000, Mark Rutland wrote:
> > > On Thu, Feb 05, 2015 at 11:54:16AM +0000, Will Deacon wrote:
> > > > On Thu, Feb 05, 2015 at 11:46:42AM +0000, Mark Rutland wrote:
> > > > > On Mon, Jan 26, 2015 at 05:54:15PM +0000, Will Deacon wrote:
> > > > > > diff --git a/arch/arm64/boot/dts/arm/juno.dts b/arch/arm64/boot=
/dts/arm/juno.dts
> > > > > > index cb3073e4e7a8..4ed9287aaef1 100644
> > > > > > --- a/arch/arm64/boot/dts/arm/juno.dts
> > > > > > +++ b/arch/arm64/boot/dts/arm/juno.dts
> > > > > > @@ -107,11 +107,11 @@
> > > > > >  	pmu {
> > > > > >  		compatible =3D "arm,armv8-pmuv3";
> > > > > >  		interrupts =3D <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
> > > > > > +			     <GIC_SPI 02 IRQ_TYPE_LEVEL_HIGH>,
> > > > > > +			     <GIC_SPI 06 IRQ_TYPE_LEVEL_HIGH>,
> > > > > >  			     <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>,
> > > > > >  			     <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
> > > > > > -			     <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>,
> > > > > > -			     <GIC_SPI 02 IRQ_TYPE_LEVEL_HIGH>,
> > > > > > -			     <GIC_SPI 06 IRQ_TYPE_LEVEL_HIGH>;
> > > > > > +			     <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
> > > > > >  	};
> > > > >=20
> > > > > I am very much not keen on this. While this may get things working
> > > > > today, it completely relies on Linux-internal details (the order =
of CPU
> > > > > bringup, which in this case is different from the order of entrie=
s in
> > > > > /cpus).
> > > > >=20
> > > > > In all other dts that I am aware of, the order of entries in /cpus
> > > > > aligns with the order of interrupts in the PMU node, and the firs=
t entry
> > > > > is the boot CPU.
> > > > >=20
> > > > > I think that we should ensure that the ordering of CPU nodes matc=
hes the
> > > > > order of interrupts here. That way we can fall back to that order=
ing (if
> > > > > not explicitly overridden), and even after an arbitrary logical
> > > > > renumbering (e.g. after a kexec) the relationship should stay int=
act.
> > > >=20
> > > > There are a few problems with reordering the CPU nodes:
> > > >=20
> > > >   (1) It breaks any existing users of taskset to pin on big/little
> > > >       clusters.
> > >=20
> > > This is unfortunate, but this is also the case if the boot CPU is
> > > different.
> >=20
> > Right, so don't change the boot CPU. In that vain, we also shouldn't ch=
ange
> > the CPU order in the .dts -- the current .dts is working for taskset and
> > we shouldn't break people's scripts just because they want to use the P=
MU.
>=20
> I think this is an orthogonal discussion. If Linux is booted on a
> different CPU, it's not the fault of Linux that CPU0 is different.
>=20
> > > >   (2) It's not generally possible if, for example, the bootloader d=
ecides
> > > >       to boot Linux on a different CPU then we have no choice but to
> > > >       change the PMU interrupt order.
> > >=20
> > > In that case _this_ patch is broken.
> >=20
> > Why? I'm not denying that changing the boot CPU causes problems, I'm sa=
ying
> > that you *can't* fix that by changing the CPU node order. You still have
> > to change the interrupt order in that case, so why not just localise the
> > changes there in the first place?
>=20
> If we're going to try to maintain support for these DTs long-term (with
> kexec and whatever logical renumbering can occur there), then we need a
> consistent invariant that we can rely on to associate interrupts and
> CPUs correctly.
>=20
> The Linux logical ordering is not invariant, so we know that this _will_
> break.
>=20
> As far as I am aware, every other DT lists the boot CPU first, and the
> order of entries in /cpus mathes the logical order. Using the order of
> entries in /cpus will remain consistent in the face of arbitrary
> renumbering, and is (currently) consistent with logical numbering.
>=20
> So keeping the CPU nodes and interrupt entries in the same order
> provides us with a long-term consistent order, regardless of which CPU
> is the boot CPU.
>=20
> This DT is currently broken. If we're going to make it work we should do
> so in a manner that will continue to work. Anything else is a broken
> bodge that hurts us in the long-term as we'll have to hack around it.
>=20
> > > If we associate the interrupt with a CPU by node order, the relations=
hip
> > > is preserved regardless of which CPU is the boot CPU (whether it was =
the
> > > bootloader's choice, kexec, or whatever).
> >=20
> > Sure, and that requires code changes. If we're going to change the code,
> > then I'd much rather we make the binding explicit, like I did in the
> > follow-up patches to this one. As I mentioned before, this is a .dts fix
> > to get things working with the current code. It's really too late to ar=
gue
> > about the existing binding, even if it sucks.
>=20
> Sure, the binding sucks.
>=20
> This DT has also _never_ worked.
>=20
> If we're going to fix things, let's not introduce a middle step that's
> broken in a different way.
>=20
> > > >   (3) I didn't think that the ordering of CPU nodes was guaranteed =
to be
> > > >       preserved by dtc, whereas the order of the interrupts will be.
> > >=20
> > > The order of nodes is presently preserved.
> >=20
> > It's not about the present behaviour; I need a _guarantee_ that dtc/lib=
fdt
> > will *never* reorder CPU nodes. Today's working .dts file needs to cont=
inue
> > to work with future tools.
>=20
> Jon, David, Grant, thoughts?

As a general rule, neither dtc nor libfdt will re-order any nodes
unless you explicitly ask them to (e.g. dtc's "-s" option).  That
said, you should try not to rely on dt order.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--tYlHSoJ8Aop8eNG2
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJU02ahAAoJEGw4ysog2bOSJY0QAMFgTx38f2WwKJ+zERerqZRU
+Qp3kk9+QHBm2jeilH5L13ZP4HYmVqtkwDPc9Vwnw1SHLdJL7e9+4MY/lopQUakx
yM96e3OjltI2GBzVGvfxZFPawdhI+tm47czxJpxUCWgJuohlEePt/lYXaH1MNi5S
p0vBK5LDgizq89tBk72B6kyHfNiesyFpLks+sBao06T+WoR+V0Vp5eChZFP/90Sn
Qi/X9eiszYWbxkjweXfS9QTjhdabAB3Vx7cmlZ8ZLdKo49llK3gZ3GVyWENLzc81
d79ktrW0Cc8o6AlxlmP+FfXXJKjfB/tbM9cIz/v0Y8HPgI9lF1PcjBP1K2Q/8lhG
QEX6FXNbvg4SNTVaONnz1IKd55O7sAMS8t92laMvqHZ28fM3WENZykz3pTuvfdZr
6PFAFImE1q+oujPBuQ5ZpYUIds1KmKdqlF4uMNU5yxfwNnZQ+g4fcYbeZLRWPrn6
rGiBS4l1q6kj4Ji0sfwJRdZWwlv2GsFqj/lcoxHKY9dZPdVKs/lweRTWNT4hknSk
d+uUePvkPhc7EXkQQkn3AMmLxvL+vwA218rFFb0l1f9fkEgGx2puRSLdi9WcXiEA
fNKOWBWWCJSwJp0PZL9OUP9OpPtIQQzhB8ayFTa+bfc3UVJtzmUFa8iL2uRwbc4m
Fj3IEyygSuIapRUKbIQs
=1D5W
-----END PGP SIGNATURE-----

--tYlHSoJ8Aop8eNG2--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
