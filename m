From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: "clk: sunxi: Add a simple gates driver" breaks kernel with older
 DTB
Date: Fri, 2 Oct 2015 12:53:33 +0200
Message-ID: <20151002105333.GA2696@lukather>
References: <1443689231.16718.225.camel@citrix.com>
 <20151001204506.GR7104@lukather>
 <560E5767.2040502@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Dxnq1zWXvFF0Q93v"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <560E5767.2040502@citrix.com>
Sender: linux-clk-owner@vger.kernel.org
To: Julien Grall <julien.grall@citrix.com>
Cc: Ian Campbell <ian.campbell@citrix.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, KumarGala <galak@codeaurora.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Oct 02, 2015 at 11:07:35AM +0100, Julien Grall wrote:
> Hi Maxime,
>=20
> On 01/10/15 21:45, Maxime Ripard wrote:
> > On Thu, Oct 01, 2015 at 09:47:11AM +0100, Ian Campbell wrote:
> >> Booting a recent kernel with the DTB supplied with Debian Jessie (3.16
> >> based) breaks on Cubietruck because that DTB lacks the clock-indices n=
odes
> >> which the new driver from the commit below adds (replacing the hardcod=
ing
> >> which used to be in clk-sunxi.c).
> >>
> >> It is panicing in drivers/clocksource/timer-sun5i.c with:
> >>
> >> [    0.015413] clocksource: timer: mask: 0xffffffff max_cycles: 0xffff=
ffff, max_idle_ns: 79635851949 ns
> >> [    0.025049] Kernel panic - not syncing: Can't get timer clock
> >> [    0.030794] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 4.3.0-rc2-arm=
-native+ #6
> >> [    0.038002] Hardware name: Allwinner sun7i (A20) Family
> >> [    0.043253] [<c0219794>] (unwind_backtrace) from [<c0214e44>] (show=
_stack+0x10/0x14)
> >> [    0.050992] [<c0214e44>] (show_stack) from [<c048159c>] (dump_stack=
+0x88/0x98)
> >> [    0.058213] [<c048159c>] (dump_stack) from [<c02caa98>] (panic+0xa4=
/0x22c)
> >> [    0.065090] [<c02caa98>] (panic) from [<c0d7c518>] (sun5i_timer_ini=
t+0x80/0x384)
> >> [    0.072482] [<c0d7c518>] (sun5i_timer_init) from [<c0d7aad0>] (cloc=
ksource_of_init+0x4c/0x8c)
> >> [    0.081001] [<c0d7aad0>] (clocksource_of_init) from [<c0d39b48>] (s=
tart_kernel+0x28c/0x3c4)
> >> [    0.089343] [<c0d39b48>] (start_kernel) from [<4020807c>] (0x402080=
7c)
> >> [    0.095866] ---[ end Kernel panic - not syncing: Can't get timer cl=
ock
> >>
> >> Reverting ee38b2698ae2 fixes this specific issue for me (it boots furt=
her,
> >> but there seems to be other problems later when earlycon hands over to
> >> proper console, which I've not yet looked into).
> >>
> >> Is this considered acceptable linkage between the kernel and the dtbs?
> >>
> >> I suspect that even if anyone does care this is going to be an uphill
> >> struggle for that minority so I'm going to adjust our test infrastruct=
ure
> >> to pickup the dtbs from the kernel it is trying to test rather then re=
using
> >> the one from the OS install.
> >=20
> > It's never been something we supported (or even claim to support), so
> > it's actually surprising that it's the only commit that need to be
> > reverted, but yeah, you should keep your DTB in sync.
>=20
> I would have though the bindings are stable, i.e the compatibility with
> old DT would have been kept in newer kernel.
>=20
> So is it something specific to cubietruck?

Nope. All the platforms I've been using on a regular basis do not
guarantee this. Allwinner, obviously, but also:

Atmel:
  * https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/arm/Atmel/README#n110

OMAP:
  * https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/=
?id=3D8b9a2810b02e3d9806ba2bf307c8e8dcedaf902d

Berlin:
  * https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/=
?id=3Dfd26031ba6356d2b0f7aa214ebff4b12736b6529

Rockchip:
  * https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/=
?id=3D26ab69cb4c1f77060bece483f2ec210163867782

etc...

> If no, that's very unfortunate because it means that you can't
> re-use the same DT across multiple OS and the DT provided by the
> firmware (if it's built-in).

Is there such OS yet (and by that, I mean one that actually shares our
DT, instead of rewriting its own) ?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--Dxnq1zWXvFF0Q93v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWDmItAAoJEBx+YmzsjxAglf4P/3pi2mYgzfEDHxyUeYtMjnh5
Pnups5bLSkp4ZZ61ahvV7TleTo73P06XRiDSCqVElM1X2i2WTXyvZO+W+kfZt4qm
YgSYjvim5wSuFhiOnpEhmubhmhIqrNZxL6BE5eSf7FAPPtPeUVmreXfXIXq6mfX+
GPJszE0EJ+qE83sXWi3PY7GairSw0FsobLxl2Oj8dLeWZyRsdAnGaBFrI/55MQBA
LGSMypL6hH9grfcEqhDu4nVdXsorQXHxZ7M+v9zlr8gMUWfqmHdbfX+Qzka3AHwO
qtSN9rudCTT6+W/84U1czTszTyvNQeEW4VPjs/iNDtDpR97v/rqkisT/YiK7xfMx
uHz0OIPRTMoClicDzR5cr8bHrBv5heS35b/Un3utbodRP9nPuzWcl40Tf/FzY9tZ
0JKfKW26sEkZQ9Q7PnkaqAbhaT9PzI8A2AVmSsdPM/nIaJuAIT408abVhAO/d5DD
nUM+31xDIOHaluEhfJUXsmWwoj/YXHZ57UNo194CIKAUswWDxs/F6HeGRQOMSSC+
yu+0E6uBtUiDLnC+sD7kv7Ggh7KbhblmRHtvADRewoId0kUDaD5ldRacA6sOl64g
sgYPbKy4hR1aJ+TpX8GGKVtTxN8pWSPACmhrTHMRSsqDjKhsp1IjUmo2ZQe7hZeb
IozC2T3RJfQNFaySNC/P
=pDc0
-----END PGP SIGNATURE-----

--Dxnq1zWXvFF0Q93v--
