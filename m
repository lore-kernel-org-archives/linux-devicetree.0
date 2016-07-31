From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: Changed: sunxi-ng clock code - NKMP clock
 implementation is wrong
Date: Sun, 31 Jul 2016 12:31:14 +0200
Message-ID: <20160731103114.GY6215@lukather>
References: <20160630204001.GC5485@lukather>
 <0b71ed7e-98c9-109e-85e6-ceb95131d88a@megous.com>
 <20160715085356.GR4761@lukather>
 <085e185a-ac76-dd3f-9b0e-a7dc9c0c09f3@megous.com>
 <20160721094852.GI5993@lukather>
 <c46d1af5-9410-402a-7144-48b396ef6da7@megous.com>
 <20160726063253.GW7419@lukather>
 <e1b8127f-c422-46ab-384b-aeee85aa940b@megous.com>
 <20160728210011.GJ6682@lukather>
 <7c5f2835-f044-7c18-def9-52af5ce4afc3@megous.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eUqGrSc0O7wKBRnC"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBWN57G6AKGQEE65GDXA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <7c5f2835-f044-7c18-def9-52af5ce4afc3-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
Cc: dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Emilio =?iso-8859-1?Q?L=F3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, "open list:COMMON CLK FRAMEWORK" <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--eUqGrSc0O7wKBRnC
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jul 29, 2016 at 12:01:09AM +0200, Ond=C5=99ej Jirman wrote:
> On 28.7.2016 23:00, Maxime Ripard wrote:
> > Hi Ondrej,
> >=20
> > On Thu, Jul 28, 2016 at 01:27:05PM +0200, Ond=C5=99ej Jirman wrote:
> >> Hi Maxime,
> >>
> >> I don't have your sunxi-ng clock patches in my mailbox, so I'm replyin=
g
> >> to this.
> >=20
> > You can find it in the clock maintainers tree:
> > https://git.kernel.org/cgit/linux/kernel/git/clk/linux.git/log/?h=3Dclk=
-sunxi-ng
> >=20
> >> On 26.7.2016 08:32, Maxime Ripard wrote:
> >>> On Thu, Jul 21, 2016 at 11:52:15AM +0200, Ond=C5=99ej Jirman wrote:
> >>>>>>> If so, then yes, trying to switch to the 24MHz oscillator before
> >>>>>>> applying the factors, and then switching back when the PLL is sta=
ble
> >>>>>>> would be a nice solution.
> >>>>>>>
> >>>>>>> I just checked, and all the SoCs we've had so far have that
> >>>>>>> possibility, so if it works, for now, I'd like to stick to that.
> >>>>>>
> >>>>>> It would need to be tested. U-boot does the change only once, whil=
e the
> >>>>>> kernel would be doing it all the time and between various frequenc=
ies
> >>>>>> and PLL settings. So the issues may show up with this solution too=
.
> >>>>>
> >>>>> That would have the benefit of being quite easy to document, not be=
 a
> >>>>> huge amount of code and it would work on all the CPUs PLLs we have =
so
> >>>>> far, so still, a pretty big win. If it doesn't, of course, we don't
> >>>>> really have the choice.
> >>>>
> >>>> It's probably more code though. It has to access different register =
from
> >>>> the one that is already defined in dts, which would add a lot of cod=
e
> >>>> and require dts changes. The original patch I sent is simpler than t=
hat.
> >>>
> >>> Why?
> >>>
> >>> You can use container_of to retrieve the parent structure of the cloc=
k
> >>> notifier, and then you get a ccu_common structure pointer, with the
> >>> CCU base address, the clock register, its lock, etc.
> >>>
> >>> Look at what is done in drivers/clk/meson/clk-cpu.c. It's like 20 LoC=
.
> >>>
> >>> I don't really get why anything should be changed in the DT, or why i=
t
> >>> would add a lot of code. Or maybe we're not talking about the same
> >>> thing?
> >>
> >> I've looked at the new CCU code, particularly ccu_nkmp.c, and found th=
at
> >> it very liberally uses divider parameters, even in situations that are
> >> out of spec compared to the current code in the kernel.
> >>
> >> In the current code and especially in the original vendor code, divide=
r
> >> parameters are used as last resort only. Presumably because, of the
> >> inherent trouble in changing them, as I described to you in other emai=
l.
> >>
> >> The new ccu code uses dividers often and even at very high frequencies=
,
> >> which goes against the spec.
> >>
> >> In the vendor code M is never anything else but 0, and P is used only
> >> for frequencies below 288MHz, which matches the H3 datasheet, which sa=
ys:
> >=20
> > In the vendor code, P is never used either. All the boards we had so
> > far don't go that low, so we cannot make any of these assumptions,
> > especially since the vendor code has had the bad habit of doing
> > something wrong and / or useless in the past.
>=20
> P is used in the arisc firmware according to the spec for the lower
> frequencies.

Yes, but has anyone actually tested those frequencies? Judging from
the FEX files I could gather, cpufreq never actually goes lower than
480 MHz.

> > However, this implementation is a new thing, and it was using the H3
> > precisely because of its early stage of support to use it as a testbed
> > for the more established.
> >=20
> > If you feel like we should use a different formula to favour the
> > multipliers over the dividers (or want to change the class of the CPU
> > PLL to an NKM or something else, this is totally doable.
>=20
> I think the original formula that's currently in the mainline kernel is
> better and avoids fiddling with dividers too much.

Yeah, but the older formula is not generic at all. The whole rework
was precisely to avoid doing the whole one driver per clock that was
just becoming a nightmare to maintain, and a pain to add support for
new SoCs. That code will be used for A10's CPU and VE PLLs too for
example. And they probably have the same constraints, but with
different variations (available values of each factors for example).

> >> "The P factor only use in the condition that PLL output less than 288
> >> MHz."
> >=20
> > And the datasheet also had some issues, either misleading or wrong
> > comments in the past. Don't get me wrong, I'm not saying that this is
> > wrong, just that we should not follow it religiously, and that we
> > should trust more the experiments than the datasheet.
>=20
> I can believe that. :) Regardless, I think the reasons given for
> avoiding dividers are quite reasonable. It's based on how PLL block
> works, not what manual says.

Yes, indeed.

Would replacing the current factors computation function by something
like:

for (m =3D 1; m < max_m; m++)
    for (p =3D 1; p < max_p; p++)
        for (n =3D 1; n < max_n; n++)
	     for (k =3D 1; k < max_k; k++)
	         if rate =3D=3D computed rate
		     break;

work for you?

That way, we will favor the multipliers over the dividers, and we can
always "blacklist" p or m (or both) by setting their maximum to 1
(this would need an extra field in _ccu_div though).

> >> Also other datasheets of similar socs from Allwinner state that M shou=
ld
> >> not be used in production code.
> >=20
> > Which ones specifically?
>=20
> A83T for example. You can search for "only for test" phrase.
>=20
> https://github.com/allwinner-zh/documents/blob/master/A83T/A83T_User_Manu=
al_v1.5.1_20150513.pdf
>=20
> Those PLLs are a bit different though.

Thanks,
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

--eUqGrSc0O7wKBRnC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXndNyAAoJEBx+YmzsjxAgJKUP/2leul3KPFaSFRdyxDYLshIi
2ZDGTbTaMgSDU8aM2JZixFBrVV0/r5oW8QWX4sQvw0xSDqsdbFsg6cjlYH/HIyRP
cAZNFa4OQxpM3lc8oEkUOnOogY4owJXDLc4tUL/Pyq3Xs8OSDbl6ayrAHC1zkaGt
orD4W2c3Q8ijhx+9ZIBIByI7cCKZNxo++qud5ehM4WWfZFRqwmpyl2F9fp5CBx8Z
yej9vAfljFYp77fgczZS1CknCHZAYROdB2qosmy+QEVe8HfczZ2VUF7RlwluKpHP
YLZz4MtJDx6l58SLWHWQy1Hd4OTzUgO65ePu9VMUggWK+/dtWO98Jx+c6ejXCqHG
Tj8aWWef6gKQnIMiXUt0q+LChBr1/EdSnIC8LbFS+QolwXZyZxbN3yms9IE8nWvy
2S+CpgeUNdSbCNcza+fEI0jVxnWq0oJt4+0kOPyEAyldleAtCMPtM0WPQvFH7d/B
8OXczd5wul2lVpPAyD72wiGzYlIg18G7AdeR2BPwCHDpUkCzRxbGpbvdU6rz3GG8
eHjVW7DXH8O1RbPP0vW2hUqHaJC5rO9jYTQ6B40+s9qgw2MmkXUj82aMwVF6brUw
8q8AeQExiW2m3WHxJANYoJ/+bhRZBq7rnF1sL/G/1y05jLisxy6LKT4rKSoQBGj8
5pjA2j8O+pu4F75QIV6g
=p6hR
-----END PGP SIGNATURE-----

--eUqGrSc0O7wKBRnC--
