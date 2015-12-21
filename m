From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH v2 4/8] ARM: bcm2835: Split the DT for peripherals from the DT for the CPU
Date: Mon, 21 Dec 2015 15:09:39 -0800
Message-ID: <871tafflfw.fsf@eliezer.anholt.net>
References: <1450310115-22163-1-git-send-email-eric@anholt.net> <1450310115-22163-5-git-send-email-eric@anholt.net> <20151218100041.GA1145@omega>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151218100041.GA1145@omega>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Aring <alex.aring-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Alexander Aring <alex.aring-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> Hi Eric,
>
> On Wed, Dec 16, 2015 at 03:55:11PM -0800, Eric Anholt wrote:
>> The set of peripherals remained constant across bcm2835 (Raspberry Pi
>> 1) and bcm2836 (Raspberry Pi 2), but the CPU was swapped out.  Split
>> the files so that we can include just peripheral setup in 2836.
>>=20
>> Signed-off-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
>> ---
>> -
>>  		arm-pmu {
>>  			compatible =3D "arm,arm1176-pmu";
>>  		};
>>  	};
>
> This is bcm2835 related only? It's still inside bcm283x.dtsi, see [0].
> The rename here makes it a little hard to review.

Good catch.  Thanks!

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJWeIa0AAoJELXWKTbR/J7oBVMQALrl5zOXqE3YGr19/R7SVma/
XvwZZICjWHGz9T8eJ4yFNldKP4kUDI3Je/Re1z1/tfOKyaz2994NgmxHxZISh9P5
/H7LL2mItWh/Zn9yXFSXiz9OTyiJ2AUVKWYG9hhjNVL2smLFYQ0iKg5f52Nmf43B
cnyvpabRM7RdZ1HN++mssdIAjM8Y+8B6YayWLOw4eikPJ3DCnMDh03WS+CDKFNso
07HyAnxBweqCTsMDlnlsvMOqXJ+xxDiCzJ3xY1Bh0kle97hZHCjL7I4a0fhAdrbV
miUj6/iio8t6mmsWhUdizk+mEz2S/00pSmDrO0/3/bwcVtQZbQT/EGD+Nq9A1UOI
jO10BjLZAa72DHbssHkIMLKwakez1Lyj7ewVUUlGu1NL+pmt7c5+QqTkvWhUiVKi
0vgHWs1tk2XTaHG5p2JvgR6tr5HdkLX2PNhucjciE+t6G7l8syB3U0RiqiKBNRiG
5PFtzjz1EUhpOFG37HvU01Ctd7Sf90UU+VkK7ivrWfBpod4kfx7Xof46FvBKdmGN
DdrZ9vp9XB+g27lAbYeuj4ppppEqg69HBGBRPk1NK7NSqRc4tpR+fHkAjANNW3uk
E/GMTc5SaW845297AswelGhZFFgQjkWSpeH0kXgD7DcRpDjUvuY7Ix5RIQeUdHf/
RVLHx6D1ZmfL97Lx/HMG
=MkqA
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
