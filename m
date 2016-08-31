From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: Changed: sunxi-ng clock code - NKMP clock
 implementation is wrong
Date: Wed, 31 Aug 2016 22:25:22 +0200
Message-ID: <20160831202522.GB20462@lukather>
References: <20160715085356.GR4761@lukather>
 <085e185a-ac76-dd3f-9b0e-a7dc9c0c09f3@megous.com>
 <20160721094852.GI5993@lukather>
 <c46d1af5-9410-402a-7144-48b396ef6da7@megous.com>
 <20160726063253.GW7419@lukather>
 <e1b8127f-c422-46ab-384b-aeee85aa940b@megous.com>
 <20160728210011.GJ6682@lukather>
 <7c5f2835-f044-7c18-def9-52af5ce4afc3@megous.com>
 <20160731103114.GY6215@lukather>
 <9175af7e-e1b1-df88-de2b-16f0e8d719c1@megous.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FkmkrVfFsRoUs1wW"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBNH2TS7AKGQEF3FZJEY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <9175af7e-e1b1-df88-de2b-16f0e8d719c1-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
Cc: dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Emilio =?iso-8859-1?Q?L=F3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, "open list:COMMON CLK FRAMEWORK" <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--FkmkrVfFsRoUs1wW
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ondrej,

Sorry for the (very) belated reply.

On Mon, Aug 01, 2016 at 12:01:39AM +0200, Ond=C5=99ej Jirman wrote:
> >>>> In the vendor code M is never anything else but 0, and P is used onl=
y
> >>>> for frequencies below 288MHz, which matches the H3 datasheet, which =
says:
> >>>
> >>> In the vendor code, P is never used either. All the boards we had so
> >>> far don't go that low, so we cannot make any of these assumptions,
> >>> especially since the vendor code has had the bad habit of doing
> >>> something wrong and / or useless in the past.
> >>
> >> P is used in the arisc firmware according to the spec for the lower
> >> frequencies.
> >=20
> > Yes, but has anyone actually tested those frequencies? Judging from
> > the FEX files I could gather, cpufreq never actually goes lower than
> > 480 MHz.
> >=20
>=20
> I tested it. It works well down to 60MHz. You can even run on 24MHz if
> you run directly from 24mhz osc. It's terribly slow, but it works ok.

Ok, it's good to know (and yeah, I wouldn't expect a CPU at 24MHz to
be very fast :))

> I've rebased my working branch over the mainline kernel, which now
> contains the sunxi-ng, and tested it. Cpufreq seems to work on orange pi
> pc without any changes discussed in this thread. I didn't do any
> extensive testing though. But it doesn't hang on boot or cpufreq config
> changes.
>=20
> You can see it here:
>=20
> https://github.com/megous/linux/commits/orange-pi-4.8

Thanks a lot. That's good to know as well.

> >>>> "The P factor only use in the condition that PLL output less than 28=
8
> >>>> MHz."
> >>>
> >>> And the datasheet also had some issues, either misleading or wrong
> >>> comments in the past. Don't get me wrong, I'm not saying that this is
> >>> wrong, just that we should not follow it religiously, and that we
> >>> should trust more the experiments than the datasheet.
> >>
> >> I can believe that. :) Regardless, I think the reasons given for
> >> avoiding dividers are quite reasonable. It's based on how PLL block
> >> works, not what manual says.
> >=20
> > Yes, indeed.
> >=20
> > Would replacing the current factors computation function by something
> > like:
> >=20
> > for (m =3D 1; m < max_m; m++)
> >     for (p =3D 1; p < max_p; p++)
> >         for (n =3D 1; n < max_n; n++)
> > 	     for (k =3D 1; k < max_k; k++)
> > 	         if rate =3D=3D computed rate
> > 		     break;
> >=20
> > work for you?
>=20
> This would be better.

Ok, I'll try to cook something up when I get the time. If you feel
like it's not done fast enough, feel free to do it.

Note that we also ended up merging for the A31 some code that reparent
CPUx temporarily while setting the PLL-CPUX rate, and it should be
somewhat generic. But of course, it's not exclusive.

Thanks again for all your tests, it's very appreciated.

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

--FkmkrVfFsRoUs1wW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXxz0yAAoJEBx+YmzsjxAghv4P/1atWvA2BYC6XIG2HdccL3rg
ApTBzeA7n9LZbt/+4WsWjeOxoOL6dkGmhV37xK6Jt5MoRBpIK2vk+SRqea1hmuYg
xlcsO9LG3HRI0whHfe0PpOXjWJSYx3vybBxShWvObDeiVidVxinBA+AvK/8V/hVd
pT0t9AWKOfyro4HgFMYLD7x1wB+Cl5+0pAXMKylJxu9EQFPDD8+s5hQIOZqmpGaU
2ZtCq42D6nh+jJ+itaCYTBB5gY7m/qiBra90AEzq1mLZwebCGl9jCe4ZGqpP7CqN
4RVQr/Xl0wRk7WgIqgaJRtkdRkOsTC1FupEgEF63xw0Pbv9rXAaHe2TXellQbjZy
3xdZw9I/RtQfRB0bb+57VwpjGT5rWgCHMwI8lfteKEOYSEL/OJ40md6cOgT7BtBM
toFTsNmgqu5akDDfWUSO6y/VxcO3sWWZ8xJLYzBWeB9Sdv/k0R1/G17a3ok+BYUP
s/tNQxQo0olFFMtbo2hLwyfLj+Clk25lQaZDED1CkVp/EhULIrealgSSXTtG7N2n
P/iU64RLtO5zFkCMAwLzZda9BgoLsyn7O5xSZz/QVhiFi/T7GfCm5+68D6f57nmO
hyMWpB8goqaWNav/TiO4ZNLMimlyYLjrTEH7WBLa7sALUbZuFLRVOsx3hcOmRIJm
bI0lFF/jgGcSrY2z9H73
=MCv2
-----END PGP SIGNATURE-----

--FkmkrVfFsRoUs1wW--
