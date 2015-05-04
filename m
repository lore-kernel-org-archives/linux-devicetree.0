From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v6 4/4] clk: dt: Introduce binding for always-on clock
 support
Date: Mon, 4 May 2015 15:31:24 +0200
Message-ID: <20150504133124.GD3274@lukather>
References: <20150408081450.GB5162@x1>
 <20150408094349.GC26727@lukather>
 <20150408103832.GG5162@x1>
 <20150408155705.GF26727@lukather>
 <20150408172344.GH5162@x1>
 <20150422093446.GA28007@lukather>
 <20150429141751.GR9169@x1>
 <20150429145114.GW6325@pengutronix.de>
 <20150429160713.GY9169@x1>
 <20150429230549.16410.82625@quantum>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BRE3mIcgqKzpedwo"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150429230549.16410.82625@quantum>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@linaro.org>
Cc: Lee Jones <lee.jones@linaro.org>, Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, sboyd@codeaurora.org, devicetree@vger.kernel.org, geert@linux-m68k.org
List-Id: devicetree@vger.kernel.org


--BRE3mIcgqKzpedwo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 29, 2015 at 04:05:49PM -0700, Michael Turquette wrote:
> > > Could you elaborate why you still want to have the clk-always-on in t=
he
> > > device tree instead of in the kernel where it can be removed when
> > > necessary? What's your problem with enabling the critical clocks using
> > > clk_prepare_enable like other SoCs already do?
> >=20
> > I've explained what my issues are already.  I'm not a fan of
> > hand-rolling and duplicating code which can be consolidated and make
> > generic.  Call me old fashioned. :)
>=20
> I agree with Lee that the open code stuff isn't great, but I'm less and
> less convinced that the DT method is the way to go. Maxime has done a
> good job of reminding me why I always pushed back on this type of
> approach in the past.
>=20
> Having a clock provider driver call clk_get, clk_prepare_enable on a clk
> is just fine. I think what needs to be done is to look at the platforms
> that open code this and find out how to replace this with some common
> code that any clock provider driver can call. Perhaps we can:
>=20
> 1) use the struct clk_ops.init callback (which is used very little) and
> pass in a generic function to handle this case, or

I'm not sure that would work with clocks that provide several outputs,
and need only one (or at least not all of them) to be enabled.

Or we would need to pass some arguments to this function when we
register our clock.

> 2) we can create a new per-clk flag which is used by __clk_init to call
> clk_prepare_enable, or

That would work. It's what people usually expect from
CLK_IGNORE_UNUSED, and it's the first thing they try, so it would be
the easiest I guess.

> 3) we can add a new generic function like clk_register which sets any
> specified defaults (clk_set_defaults), but using C code and not DT

What kind of defaults are we talking about here? Just the clock state
or do you include boundaries, rate, etc. in it?

> I would need to look at the drivers that open code their
> clk_prepare_enable calls for non-Linux devices and see what similarities
> exist.

What really worked for us is to call clk_prepare_enable straight after
the call to clk_register.

Having a single place where we enable all the clocks causes a few
issues, mostly because we're not even sure the clock has been
registered at this time, and we do have to consider the clock name as
an ABI, which caused some issues for us in the past.

> But clearly the DT element of Lee's approach is causing some push
> back, so we should consider if there is a less controversial way to do
> this (and a way that benefits non-DT platforms as well).
>=20
> I do think Lee's idea of consolidating around a single solution to a
> common problem is a great idea, but maybe not by using Devicetree.

Agreed.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--BRE3mIcgqKzpedwo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVR3SsAAoJEBx+YmzsjxAg8TQQAIB6WdE3cPfNunI+ejr+OqcC
GsXyVDZShTY8DuZJeG1XmQBcRw0EVC+jF0371suqI0CUAqGE8KaCQLR8UJVCz23Q
ZDYJnhAOzVvX2cqxttS/mWd6OzOnnakucnwAr+E6phx0YDNoW2R9CBimWib1se5X
7OL2tcKcR6S0HlhgeKC95Il1Ay8gKkpm208hFF14FUV+mwyKs1E2ENYHvhCIjx1Y
aaEm3K0N8CTKBnjPKr6ffXtucvWPMs7C0hzRE64eiMkYPvpUmS7hnY8i5ZLVMc1V
os1buPnPXbVP4y76KXRF9PjZdc2+cGzrMA3iOUhAT8OeIsBKdGc7ojkGKfHXpuUN
OSIeHbYmfAk1bN+X2Foty7taP3v2BkSvqy02PZVrip4QX3DIFp73JPWea+PCVXWM
7RTldNyjkrYpQijcqQI30Rl4f4toW40j0Gq+vc08MvL+l1IJ97juk20uyY2FMB25
UBgl7Sh2q1n+c2tQdESqeTUcQV6Gn9E/p+sUSlQTBYoiFLOS+8W20jJLpDLJ6NM4
rlPc3Z1rW3tKk0v/D+iYrdfmS0rdmOwvXp7tyaEz/VfN3hCDmVyg8nfD2TNKm2dP
zKJyvUX/507nXZ1V9wOb3lisiMLj6ik2EN6NCCMoeWEwb1ix7IfuOofsaOWklv/M
eoXECe8uZ1w35ApAJV3i
=z/jp
-----END PGP SIGNATURE-----

--BRE3mIcgqKzpedwo--
