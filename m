From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v6 4/4] clk: dt: Introduce binding for always-on clock
 support
Date: Thu, 7 May 2015 23:20:52 +0200
Message-ID: <20150507212052.GM11057@lukather>
References: <20150408094349.GC26727@lukather>
 <20150408103832.GG5162@x1>
 <20150408155705.GF26727@lukather>
 <20150408172344.GH5162@x1>
 <20150422093446.GA28007@lukather>
 <20150429141751.GR9169@x1>
 <20150429202332.GG6062@lukather>
 <20150430095722.GB1815@x1>
 <20150501053406.GI4946@pengutronix.de>
 <20150501064405.GB4047@x1>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6Mt39TZj+HFMr11E"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150501064405.GB4047@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org
List-Id: devicetree@vger.kernel.org


--6Mt39TZj+HFMr11E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 01, 2015 at 07:44:05AM +0100, Lee Jones wrote:
> > > Does Sascha's antidote patch change your opinion?  We can use DT to
> > > declare critical clocks, and in the rare case of the introduction of a
> > > new DDRFreq-like feature, which doesn't adapt the DT will still be
> > > able to unlock the criticalness of the clock and use it as expected?
> >=20
> > Honestly I'm not very fond of declaring these in the device tree, but
>=20
> I know why you guys are saying that, but I'd like you to understand
> the reasons for me pushing for this.  Rather than be being deliberately
> obtuse, I'm thinking of the mess that not having this stuff in DT will
> cause for clock implementations like ours, which describe more of a
> framework than a description.

The DT should dictate our implementation, not the other way around. I
know that we are pretty bad at doing this, and that there's some clear
abstraction violations already widely used, but really, using this
kind of argument is pretty bad.

The DT can (and is) shared between several OS and bootloaders, what if
the *BSDs or barebox, or whatever, guys come up with the exact same
argument to make a completely different binding?

We'd end up either in a deadlock, or forcing our solution down the
throat to some other system. I'm not sure any of these outcomes is
something we want.

> The providers in drivers/clock/st are blissfully ignorant of platform
> specifics.  Per-platform configuration is described in DT.

Maybe they just need a small amount of education then.

> So we'd have 2 options to use a C-only based API; 1) duplicate
> platform information in drivers/clk/st, or 2) supply a vendor
> specific st,critical-clocks binding, pull out those references then
> run them though the aforementioned framework.  It is my opinion that
> neither of those methods are desirable.

3) have a generic solution for this in the clock framework, like Mike
suggested.

> As an aside, we also have 9 add_provider() and 9 clock_register()
> calls, where we would need to consider calling the new
> critical_clock() API from/after.
>=20
> Please tell me that you understand and agree, or please provide me
> with a suggestion to combat the issues I currently face.

I do understand that it is convenient for you, and agree that
duplicating the clock protection code across platforms is not the best
solution.

> > naming them 'critical-clocks' rather than 'always-on' seems more
> > acceptable for me. It leaves a way out for the user to turn the clock
> > off later as it only means "you may turn them off when you know what you
> > are doing".
>=20
> With the introduction of your latest patch we are no longer in the
> peril previously described, thus if a platform does separate their
> DT from its associated kernel, it won't be the end of the world (or
> cost a couple mWh) if a clock becomes controllable in a subsequent
> kernel version.

If that critical clock definition comes with a special meaning and a
matching API in the CCF as well (ie, would not be disabled by a
clk_disable_unprepare, but would be by a clk_critical_disable or
something alike), I think we should be fine.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--6Mt39TZj+HFMr11E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVS9c0AAoJEBx+YmzsjxAgUF4P/01lauhHXOjP7qBwxdz9/X6T
Ym+0bzS4ObKy1wq/rjAVUrSczVUHZ2XCG84DgTWZyiuZJoqed61KiU1LeGQ3QcTX
p1c41kbx3IAjBI3OL0FKIIfHZgOAKP/zkj4SGVCE1YDQ8TyZWeTNDLVecC/7yVXW
KloGte7Etal9e4sln731GiN8tNx3KbpEk1nXK+Xy/HsA7EKLvfCxy6+ppbp1FjkN
rOOc2BbwGG4JqSEXGY3Zwk2/iE2jo6O4cFswku/qKXsniHd82csOhYOP/MYuUyA+
Bp96YgQ6BZtS8IPzQ5zWgagyEs0VlqDqQlQybTA5VpKM27soMWCHjii/0I95bU2R
512UgkjxF/89zyDscgCXfVWSjDmQRNOils/KiKw42d+kvHG/yMeEVYny+A0UJFCE
Y308QtI6uejtTEyWO/6jsv5uSKYjjD0l1oIFenyaIGS22pBTv6LZI3YWOcWjbXzX
P6jidf6RtnhYniQuO4K6+BRonvppMfHLTGSlXgS8cA1VKj9EAQG30s0ZAHr5rOWS
W0wQtlzzn3+e+5NmluMcm1iVw+CnF4vMwV+izmEBxohP5dvrMplVV8eyRhs+WtnU
Oyz6AJSadeBM25tCUnnLtf0yQjRhanSgdoUHWU46018S1NdTKhzmAvli0SUtOjRP
6FUG1lP+yOM5Bw9e3CK0
=tee1
-----END PGP SIGNATURE-----

--6Mt39TZj+HFMr11E--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
