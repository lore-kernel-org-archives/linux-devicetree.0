From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [linux-sunxi] [RFC] ARM: dts: sunxi: Add regulators and
 board-specific operating points for LeMaker BananaPi
Date: Tue, 28 Jul 2015 14:49:11 +0200
Message-ID: <20150728124911.GA2564@lukather>
References: <1437960486-2809-1-git-send-email-public_timo.s@silentcreek.de>
 <55B5E6DB.8020009@redhat.com>
 <20150727120918.191F76C82FB4@dd34104.kasserver.com>
 <55B62768.6040403@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yywL3DpgDyP4yZ2G"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <55B62768.6040403-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: public_timo.s-fWgRPtSzPNU3WX+qO2AYSQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org
List-Id: devicetree@vger.kernel.org


--yywL3DpgDyP4yZ2G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jul 27, 2015 at 02:43:20PM +0200, Hans de Goede wrote:
> Hi,
>=20
> On 27-07-15 14:09, public_timo.s-fWgRPtSzPNU3WX+qO2AYSQ@public.gmane.org wrote:
> >Hi,
> >
> >Hans de Goede schrieb am 27.07.2015 10:07:
> >
> >>I've a simular patch here:
> >>
> >>https://github.com/jwrdegoede/linux-sunxi/commit/6a30b7d5be6012b81e5e14=
39a444e41c0ac1afc1
> >>
> >>I did not submit this upstream yet as it is part of a series to enable =
the otg
> >>controller on the bananapi which needs axp-usb-power-supply support for=
 which
> >>the actual powersupply driver changes are still pending.
> >
> >Oops, I see. Are you planning to submit this for 4.3 or later?
>=20
> I plan to submit this for 4.3.

I don't feel like holding patches that were posted before you did
because you did them some time ago and never submitted them is
reasonnable and / or encouraging for new submitters of patches.

I'd really like to get more sunxi-people contributing, and that starts
with that kind of trivial stuff. Holding them back because one of the
usual (and experienced) developpers is a bit counter-productive (and
I'm sure you still have a lot of patches to submit anyway ;)).

> >>As you can see other then you adding the cpu operating points are patch=
es are
> >>identical, which is good :)
> >Yep, that and you chose a slightly higher maximum voltage for the CPU.
> >
> >>IMHO we should just stick with the standard operating points unless we =
know
> >>that there are stability issues with them (such as e.g. on the A10 Olin=
uxIno
> >>Lime).
> >I'd be fine with that as I don't have any stability issues with the lower
> >voltages. What about the 1008MHz operating point that I "reintroduced"? =
It was
> >dropped here [1]  because there was no regulator support.
>=20
> That is in essence an overclocked setting, the max CPU voltage officially=
 is
> 1.4V, I do not think that we should provide any overclocked settings in t=
he
> official dts files. If people really want to overclock they will have to
> modify there dts themselves IMHO.

I fully agree.

> > Can this be reenabled on board level (which means overriding the
> >defaults inherited from sun7i-a20.dtsi) or should this be done at
> >SOC level for all boards (which means we have to add regulator
> >nodes for all boards in the first place)?
>=20
> Technically this is possible, but I do not think that it is a good idea.

And here as well.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--yywL3DpgDyP4yZ2G
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVt3pHAAoJEBx+YmzsjxAgqXcQAKyzl+p9VsnLN/2qu8ksnIQT
3hlUW3QFIVD/1i4odr3b+qbGYUfDsI6n2IR2WJVDdqXNG9hWsWXitQV/arRhiVOg
wJCTBlMoeUdL27DwOyASx1V3JLekFfRLKErkZvA/PT2HXrTkYLLb2ba4PQOpHECV
vyyp+nkCd2MhTx61f6GLk2xF3nyjrCM+c2erqA/KKb9HTDYgTP+j2irENDtQzMa5
sfJnxLRL0PlEJ8jpYneMULat0efMOXWUX6SYRsKkyEAERCen0CwVu+N89K1XXDlz
TWf4zVU1nMcz+vrj12+cRtu7GM8zxPUFueZjvZBORPYCnLvNx2AdeSn1/haQ+czz
bX9mS4u81oPxIxMauJRkp+QBeOqZs3IG0vg8ae82Zu0Gyyk5LKk+2LXhpBsRGO4p
ubR/H2fUOVGXmaKJIy1dcd/hwNXnWByPLn3FtKOlkjzo/gGcUugRpuIr1V9bWcmT
R86u85c4LhcnzwIAmMPj6f4I2gZxS4xhbyJmllicaGpGrSB2uBsRstlLdSuOLPxu
qx/jQjNVy2uc2Y64ylg+dZKRfXXzCnR8TBp85/VSb1Ug6psy/DYR3HLLZs+v7i22
LXFc8eKOxULroqKUEQ1oz5jZD9d14nvcUjlwi3z2+rXzXZsmsRU95uIsy/4SeAvh
88JqUuOwtIosWDUTzjtP
=ol0j
-----END PGP SIGNATURE-----

--yywL3DpgDyP4yZ2G--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
