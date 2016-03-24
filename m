From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [linux-sunxi] Re: [PATCH] ARM: dts: sun8i: Base Orange Pi Plus
 dts on the Orange Pi 2 dts
Date: Thu, 24 Mar 2016 12:26:25 +0100
Message-ID: <20160324112625.GX30977@lukather>
References: <1458771256-4069-1-git-send-email-hdegoede@redhat.com>
 <20160324075904.GU30977@lukather>
 <56F3CC68.4010705@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GaddHwoxNckpDK3I"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56F3CC68.4010705-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--GaddHwoxNckpDK3I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Mar 24, 2016 at 12:15:52PM +0100, Hans de Goede wrote:
> Hi Maxime,
>=20
> On 24-03-16 08:59, Maxime Ripard wrote:
> >Hi,
> >
> >On Wed, Mar 23, 2016 at 11:14:16PM +0100, Hans de Goede wrote:
> >>The Orange Pi Plus really is an Orange Pi 2 extended with:
> >>1) A sata <-> usb bridge connected to ehci3
> >>2) An eMMC on mmc2
> >>3) An external gigabit ethernet phy instead of the integrated 100Mbit p=
hy
> >>
> >>This commit changes the dts to reflect this by making it include
> >>the Orange Pi 2 dts and then adding the extra bits.
> >>
> >>Note that the difference in ethernet phy is not taken into account
> >>because we do not have an ethernet driver for the H3 yet.
> >>
> >>Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> >
> >Unfortunately, the patch doesn't apply anymore, and the merge doesn't
> >seem trivial.
> >
> >I pushed my branch on my kernel.org repo, can you rebase your patch on
> >top and resend it?
>=20
> The problem is that you forgot to apply:
> "ARM: dts: sun8i: Orangepi plus gpio keys fixes and improvements"
>=20
> With that applied this one should apply unchanged too.

Damn, you're right... Sorry for the noise. I applied both.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--GaddHwoxNckpDK3I
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJW887hAAoJEBx+YmzsjxAgnfMP/3zFLfzL52aprF1mq6luk8a6
koRFCIMSa41b5fRVV1OEiyc1GQZe/ZHmUtY9jUyeORUG0VDOwvlA4wNRNk8E9IrJ
SGln3PruEv+rQwSt9yqK+7FFi6cEkeDUnWsRlIQQA4h+TJqQTZOiXs/FWqxECM6V
VH4yXdy85PYlPtvXLIkqJHN2nePCSSdQFPETSaaP78WJQ2jg7+gFoLbRqpe/Jx+F
mTUStbvKdHJEi5nvxURHL0r5JDYSMZEtLazEfPw7jthioGRkRTymr+UmGz64P6je
slhJIOsNbxmZ3TvLtcaMzlbB8lz5JLiBBfNa2HgO/G6AkTRPeKozKXTdaaRKuxgB
webebFRqCgaZ9V0bpXwY7almlZ55iG2P7N4mv8E3/ggUYOeAySM6CRBrwELv+XgG
R0+30Y+Cgm/yirLumMUKSAtFt7OAE/Apz2s9r0vRddZgji6X73ukTmmYJ3QvADqt
8YXX08Dj5Hpxpgc/v01ro3xH6AxKafFIg8LS6Paa1inpIim47IDDmGZPsm5V/Iaf
3CZAvsrW3sBJgk6mbeawpBQ/heUXDKRvAkPmXL/pJUX1o+9Plf1bbRZkUuLqKVh8
N1ya2rco1UypBGfvlfse/W86RU0XHe9zC5YDvjdLZyvNznQso8nlegCJ2vyUr+fl
102b6zDMi/9kPmu86EiL
=hG4R
-----END PGP SIGNATURE-----

--GaddHwoxNckpDK3I--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
