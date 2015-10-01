From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: "clk: sunxi: Add a simple gates driver" breaks kernel with older
 DTB
Date: Thu, 1 Oct 2015 22:45:06 +0200
Message-ID: <20151001204506.GR7104@lukather>
References: <1443689231.16718.225.camel@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7z668gRi33XfcD/+"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1443689231.16718.225.camel-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Emilio =?iso-8859-1?Q?L=F3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, KumarGala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--7z668gRi33XfcD/+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ian,

On Thu, Oct 01, 2015 at 09:47:11AM +0100, Ian Campbell wrote:
> Booting a recent kernel with the DTB supplied with Debian Jessie (3.16
> based) breaks on Cubietruck because that DTB lacks the clock-indices nodes
> which the new driver from the commit below adds (replacing the hardcoding
> which used to be in clk-sunxi.c).
>=20
> It is panicing in drivers/clocksource/timer-sun5i.c with:
>=20
> [    0.015413] clocksource: timer: mask: 0xffffffff max_cycles: 0xfffffff=
f, max_idle_ns: 79635851949 ns
> [    0.025049] Kernel panic - not syncing: Can't get timer clock
> [    0.030794] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 4.3.0-rc2-arm-na=
tive+ #6
> [    0.038002] Hardware name: Allwinner sun7i (A20) Family
> [    0.043253] [<c0219794>] (unwind_backtrace) from [<c0214e44>] (show_st=
ack+0x10/0x14)
> [    0.050992] [<c0214e44>] (show_stack) from [<c048159c>] (dump_stack+0x=
88/0x98)
> [    0.058213] [<c048159c>] (dump_stack) from [<c02caa98>] (panic+0xa4/0x=
22c)
> [    0.065090] [<c02caa98>] (panic) from [<c0d7c518>] (sun5i_timer_init+0=
x80/0x384)
> [    0.072482] [<c0d7c518>] (sun5i_timer_init) from [<c0d7aad0>] (clockso=
urce_of_init+0x4c/0x8c)
> [    0.081001] [<c0d7aad0>] (clocksource_of_init) from [<c0d39b48>] (star=
t_kernel+0x28c/0x3c4)
> [    0.089343] [<c0d39b48>] (start_kernel) from [<4020807c>] (0x4020807c)
> [    0.095866] ---[ end Kernel panic - not syncing: Can't get timer clock
>=20
> Reverting ee38b2698ae2 fixes this specific issue for me (it boots further,
> but there seems to be other problems later when earlycon hands over to
> proper console, which I've not yet looked into).
>=20
> Is this considered acceptable linkage between the kernel and the dtbs?
>=20
> I suspect that even if anyone does care this is going to be an uphill
> struggle for that minority so I'm going to adjust our test infrastructure
> to pickup the dtbs from the kernel it is trying to test rather then reusi=
ng
> the one from the OS install.

It's never been something we supported (or even claim to support), so
it's actually surprising that it's the only commit that need to be
reverted, but yeah, you should keep your DTB in sync.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--7z668gRi33XfcD/+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWDZtSAAoJEBx+YmzsjxAgfa4QALctSUUiKLxfm6v3zPMsIaq7
yDSuinhZqEcvt5GkKNrNlTIMZ7RkALId1qupC4RkUdWdfOLBakL97rEnDZUaQJye
8Z+mZSQ8h0i4kjKspL+FMH+ypSWFz12smkFF4XINv2v1ylR1Fu8H38OM+nyP8KBw
Sr/SwmPPkrjzsT1vMYIwgkzuwgvaeMqgreuH2aBRlC6s/J99a/CFqVpKKibn+R55
Bb9iZa9vKWea6VUQIaAxmj/Ql/9BiVj1piXb5E+MHKzZ3hJIdMhYQKviAuU9MERL
ulbHgdy6QkUwDW/LH1IXY203QPob/2oUiNM1M1K4hNwib+i/OxYnd2G0hjV2mCWl
12yzHal7JzFjWWSdLsMvUvc9Mku23QOwUA7Qfo8gyzI3FcWp7AlEVR6lbe3XFu2r
hwQ7Ut22P7rd3QlNJvS52c3YFZju/4LD9qpCmIyYXYPk59LKEwxWCYpqOOP/2YtU
6m5q2WVwbtAl7t3BFmmfCL0hXJ08bPThcGcpmMG52/2/3BI1RYI74t8DpU1e9r5X
2C8XvNQ9zpNPeLPuEe++Od5WJKzxqldc2W0jHDl0auZBmQEtsBNfz0h91DWBd2Wm
Irt1u6ESqpQm1xmYw4cyMwNRQCakfXClH8aZa16YxnwD6qi24yyOTLWJxp33oTdn
PiKTq4MiZoUYyaY5Phgi
=x7UF
-----END PGP SIGNATURE-----

--7z668gRi33XfcD/+--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
