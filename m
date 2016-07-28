From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: Changed: sunxi-ng clock code - NKMP clock
 implementation is wrong
Date: Thu, 28 Jul 2016 23:00:11 +0200
Message-ID: <20160728210011.GJ6682@lukather>
References: <20160625034511.7966-1-megous@megous.com>
 <20160625034511.7966-7-megous@megous.com>
 <20160630204001.GC5485@lukather>
 <0b71ed7e-98c9-109e-85e6-ceb95131d88a@megous.com>
 <20160715085356.GR4761@lukather>
 <085e185a-ac76-dd3f-9b0e-a7dc9c0c09f3@megous.com>
 <20160721094852.GI5993@lukather>
 <c46d1af5-9410-402a-7144-48b396ef6da7@megous.com>
 <20160726063253.GW7419@lukather>
 <e1b8127f-c422-46ab-384b-aeee85aa940b@megous.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2fjX3cMESU3XgGmZ"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBZXE5G6AKGQETKS2GRI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <e1b8127f-c422-46ab-384b-aeee85aa940b-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
Cc: dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Emilio =?iso-8859-1?Q?L=F3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, "open list:COMMON CLK FRAMEWORK" <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--2fjX3cMESU3XgGmZ
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ondrej,

On Thu, Jul 28, 2016 at 01:27:05PM +0200, Ond=C5=99ej Jirman wrote:
> Hi Maxime,
>=20
> I don't have your sunxi-ng clock patches in my mailbox, so I'm replying
> to this.

You can find it in the clock maintainers tree:
https://git.kernel.org/cgit/linux/kernel/git/clk/linux.git/log/?h=3Dclk-sun=
xi-ng

> On 26.7.2016 08:32, Maxime Ripard wrote:
> > On Thu, Jul 21, 2016 at 11:52:15AM +0200, Ond=C5=99ej Jirman wrote:
> >>>>> If so, then yes, trying to switch to the 24MHz oscillator before
> >>>>> applying the factors, and then switching back when the PLL is stabl=
e
> >>>>> would be a nice solution.
> >>>>>
> >>>>> I just checked, and all the SoCs we've had so far have that
> >>>>> possibility, so if it works, for now, I'd like to stick to that.
> >>>>
> >>>> It would need to be tested. U-boot does the change only once, while =
the
> >>>> kernel would be doing it all the time and between various frequencie=
s
> >>>> and PLL settings. So the issues may show up with this solution too.
> >>>
> >>> That would have the benefit of being quite easy to document, not be a
> >>> huge amount of code and it would work on all the CPUs PLLs we have so
> >>> far, so still, a pretty big win. If it doesn't, of course, we don't
> >>> really have the choice.
> >>
> >> It's probably more code though. It has to access different register fr=
om
> >> the one that is already defined in dts, which would add a lot of code
> >> and require dts changes. The original patch I sent is simpler than tha=
t.
> >=20
> > Why?
> >=20
> > You can use container_of to retrieve the parent structure of the clock
> > notifier, and then you get a ccu_common structure pointer, with the
> > CCU base address, the clock register, its lock, etc.
> >=20
> > Look at what is done in drivers/clk/meson/clk-cpu.c. It's like 20 LoC.
> >=20
> > I don't really get why anything should be changed in the DT, or why it
> > would add a lot of code. Or maybe we're not talking about the same
> > thing?
>=20
> I've looked at the new CCU code, particularly ccu_nkmp.c, and found that
> it very liberally uses divider parameters, even in situations that are
> out of spec compared to the current code in the kernel.
>=20
> In the current code and especially in the original vendor code, divider
> parameters are used as last resort only. Presumably because, of the
> inherent trouble in changing them, as I described to you in other email.
>=20
> The new ccu code uses dividers often and even at very high frequencies,
> which goes against the spec.
>=20
> In the vendor code M is never anything else but 0, and P is used only
> for frequencies below 288MHz, which matches the H3 datasheet, which says:

In the vendor code, P is never used either. All the boards we had so
far don't go that low, so we cannot make any of these assumptions,
especially since the vendor code has had the bad habit of doing
something wrong and / or useless in the past.

However, this implementation is a new thing, and it was using the H3
precisely because of its early stage of support to use it as a testbed
for the more established.

If you feel like we should use a different formula to favour the
multipliers over the dividers (or want to change the class of the CPU
PLL to an NKM or something else, this is totally doable.

> "The P factor only use in the condition that PLL output less than 288
> MHz."

And the datasheet also had some issues, either misleading or wrong
comments in the past. Don't get me wrong, I'm not saying that this is
wrong, just that we should not follow it religiously, and that we
should trust more the experiments than the datasheet.

> Also other datasheets of similar socs from Allwinner state that M should
> not be used in production code.

Which ones specifically?

> So it may be that they either forgot to state it in the H3
> datasheet, or it can be used. In any case, they never use M in their
> code, so it may be wise to keep to that.
>=20
> When I boot with the new CCU code I get this:
>=20
> PLL_CPUX =3D 0x00001B21 : M =3D 2, K =3D 3, N =3D 28, P =3D 1, EN =3D 0
> PLL_CPUX : freq =3D 1008MHz
>=20
> Mathematically it works, but it is against the spec.
>=20
> Also, this:
>=20
> analyzing CPU 0:
>   driver: cpufreq-dt
>   CPUs which run at the same hardware frequency: 0 1 2 3
>   CPUs which need to have their frequency coordinated by software: 0 1 2 =
3
>   maximum transition latency: 1.74 ms
>   hardware limits: 120 MHz - 1.37 GHz
>   available frequency steps:  120 MHz, 240 MHz, 480 MHz, 648 MHz, 816
> MHz, 960 MHz, 1.01 GHz, 1.06 GHz, 1.10 GHz, 1.15 GHz, 1.20 GHz, 1.22
> GHz, 1.25 GHz, 1.30 GHz, 1.34 GHz, 1.37 GHz
>   available cpufreq governors: conservative ondemand userspace powersave
> performance
>   current policy: frequency should be within 240 MHz and 240 MHz.
>                   The governor "performance" may decide which speed to us=
e
>                   within this range.
>   current CPU frequency: 24.0 MHz (asserted by call to hardware)
>=20
>=20
> Somehow, the new CCU code sets the CPUX to 24MHz no matter what.
>=20
> I'm using your pen/clk-rework branch without any other patches that were
> later sent to the mailing list.

It's probably because of CLK_SET_RATE_PARENT on the CPU clock missing,
as Chen-Yu suggested.

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

--2fjX3cMESU3XgGmZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXmnJbAAoJEBx+YmzsjxAgWWAP/A7BsJE8WGm/7/xzEgDV2Q7F
rwy2yWrzyhpRkCYrB91/99Ov/0Yvuh0+X5JEeQq9Y3xy5v+2qIAiaIR1x0IoGDrz
uzEepj5p1CcyhwGlbE654qssN8P6Xg9HnDycALdrI11i04CUvsw1nzfzGwwM2/wA
v4R9z0AnSTUqupsy1yd5VdcjXk6PWVnDlM5wj1jqzsV9VOi87aEpzUkvsK6M8GCo
kZiUp3mt1+hDrAe7O8W7jjb1dpH80YuTUwtQRQeJACZclnJB/pRoJ+ac/0kDRBeY
yfDGppBvtVLeJXOrnMy7BkHJCb5LHhHPqPnutIU9Xi6x6dcZIcvT65a+G4ANRvmn
j16Wqanf3/MTjE3m/NYjP5P0Y85s9XD2RFSIpCdTFbqxQOy+0XfNDdXdptu6VAfh
z1R3BArPJDxL2NfUoVm4nXq2lnMEIoayMybOlboIJRdpysB/YIi4LzZ9z3iiyWqV
J1SQR5K3DaDKFS9fNhmeFjETbEEJkO3Wg+iTZH/nNDtG7edMHe80m1G2hGmvCXGw
RyvizakJaM+Tyyz49PkuwF7jk0GRoCTmnCJdY77E/MU1xaCEBCWEezZ0++jxiebV
vNav4tq12aY/b+gjYiCL46h/nEOFxR6NM1JN5kmZaRhYHZ1DmODES9VD5kimV5rm
1L06scykho6yr8OWCkOx
=eDC8
-----END PGP SIGNATURE-----

--2fjX3cMESU3XgGmZ--
