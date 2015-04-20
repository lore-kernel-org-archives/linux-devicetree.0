From: =?utf-8?Q?Javier_Gonz=C3=A1lez?= <javier-5MUHepqpBA1BDgjK7y7TUQ@public.gmane.org>
Subject: Re: [RFC PATCH 2/2] tee: add OP-TEE driver
Date: Mon, 20 Apr 2015 09:05:56 +0200
Message-ID: <C29F84BF-7972-4F9B-BEF1-6857BCEA26A0@javigon.com>
References: <1429257057-7935-1-git-send-email-jens.wiklander@linaro.org> <4984990.7rV4p0zMYU@wuerfel> <3960750D-EAE4-4FA0-9E15-89F9CE39257E@javigon.com> <7401865.1Pb83TJP0q@wuerfel>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
Content-Type: multipart/signed; boundary="Apple-Mail=_CDAE8099-8B34-433E-BD50-2F6E816538E3"; protocol="application/pgp-signature"; micalg=pgp-sha512
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7401865.1Pb83TJP0q@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Valentin Manea <valentin.manea-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, emmanuel.michel-qxv4g6HH51o@public.gmane.org, Herbert Xu <herbert-lOAM2aK0SrRLBo1qDEOMRrpzq4S04n8Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, jean-michel.delorme-qxv4g6HH51o@public.gmane.org, tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, Jens Wiklander <jens.wiklander-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--Apple-Mail=_CDAE8099-8B34-433E-BD50-2F6E816538E3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1

> On 19 Apr 2015, at 21:47, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
>=20
> On Sunday 19 April 2015 13:17:20 Javier Gonz=E1lez wrote:
>>=20
>> Only providing user space support would defeat one of the main =
purposes
>> of the driver. We could better organize the patches and divide them =
into user
>> space support and in-kernel support if that is what you mean. In the =
end
>> the interfaces are orthogonal, even though the functionality should =
be very
>> similar.
>=20
> Splitting up the patches to separate the user interface from the =
in-kernel
> interface is certainly a good idea, but aside from that, I also agree =
with
> Greg on this point: if you want to establish an in-kernel interface, =
don't
> add any dead code at the beginning, but add it together with the users
> of that interface.
>=20
> 	Arnd

Thanks for the feedback. We will do so.

Javier.

--Apple-Mail=_CDAE8099-8B34-433E-BD50-2F6E816538E3
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJVNKVUAAoJEDxGAX0tJXjglssP/RyQto2BJbwX7C4aM+LJ9mch
YjCNyS0MRnotlyIimOYOLNuHxLabTk+OiKwYln6yQpYoetR5BAoHNke97ZvQ3NmS
SqOqt66A9YPP7vB9BEkPgeEFTmKj53gm2XUiCCskw89XN/7AcCBH/9xEcN2EJmEV
GNlTqwZRXNU6fHypofCwDufyBM0nmCOx5yrQCTVdBq3F9qR7DcWUpYAj8I/wGHvb
4ATdKSS88JuuvjOHpf7cgr+pToh3IcL3apepIYGvp6ePMRE9XCDhlH09cVWZn9SN
imnCuYehDh6CzMyop7eemADpYl2+LullEVwg92GIDzoXL0oP/9ANn+XeJx2kGvVZ
UMVkQxOBekecj4PSBgkzm65qXkf7hYCbvcvj/EopEIONHNHDS8xogNGty1Q2Pw53
0FTU9CJPSLe6nyJFqqaCSgszjZrZ1tACu6GkvWNW6anABSGtCIW4G3C+Uv/uUkU7
b24MHRzMAY060StBAO5xVu63gVcG9nUdpQ+BC53WjfjbAqAn2ygPnf+Jba0zHgJu
GqlGMqt70kStO+0JJyMTvSUU3xkocU5SDbxq9bLkbt5WsNZWISPIxX1zRfPy4vYa
ZNx4hwth0eKnygWY+9ERSlVUZflVmV4w4puFQQjmZ9w6c1jzVL8tBwVCui6VyQBH
RjJCS+WCRgEC68wFXuj7
=jhzc
-----END PGP SIGNATURE-----

--Apple-Mail=_CDAE8099-8B34-433E-BD50-2F6E816538E3--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
