From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/1] add rgb888 pins to a20 to enable parallel rgb LCD
Date: Tue, 7 Nov 2017 12:01:15 +0100
Message-ID: <20171107110115.dkzzcaiokhocc2qu@flea>
References: <1510050759-6110-1-git-send-email-giulio.benetti@micronovasrl.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="cemvpph5f6qj5t43"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1510050759-6110-1-git-send-email-giulio.benetti-W14uJ/fiAyBY2hyreNRi6g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Giulio Benetti <giulio.benetti-W14uJ/fiAyBY2hyreNRi6g@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--cemvpph5f6qj5t43
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 07, 2017 at 11:32:39AM +0100, Giulio Benetti wrote:
> This patch gives possibility to set parallel lcd pins for RGB888.
> To be used with tcon0 in your <target>.dts
>=20
> Best regards
> Giulio Benetti
> Micronova srl

This isn't a cover letter, but a commit log. You should document why
and how you did that change, nothing else.

On what board is this supposed to be used?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--cemvpph5f6qj5t43
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJaAZJ7AAoJEBx+YmzsjxAg/AwP/ilI/FHqRn1aXrNhBiOJKxYK
hFERYe8xenq89egeRk6b5Eq1IFCcaJ+ueEOEEDJWgFHrwE7An6fkTHhHBykkioCG
tBEnpo3MxiOr+Sax5afEeQyjfWGHuUREHAHgQ/wUgECy5rcapCl2dVnyV1ARQMdn
x33Gai41ZmQVmMrDRYO4j+qj4hd7YgwGdW3Oid9xUWdhvhM+kKcvCzeh1M9K7wpN
XjgZsXpZ2qcxiBsUFORkx8I/ak4JT7fahzQJbhPoVLuo2PXvIPYpFcd8Ayofqhj2
waBHH60j8EDMTSipB26FMGPg37YflGEPMwWSDIJUg17bZTjesqTn+hONaMEMSjkY
smtZhRi6Vr7Lb5GRpb2Q4upv012IWsjNr3/ZKeDHbXfFaBpqccyl8xslIaZ5nMSG
RwUYJ8c1XH8ME+DtzHICRcdWZ4ZDT2cev+VkbPmbIzy2VVF3XHW4O/PsuPH2HY/4
e+8uWqN5zp9gyazj79kt+tt+K0ZPoH0QfdtF+TGYOCycdia2BmZUejXcGF1mxQCc
rMcNv24RBiO3wJxTf13aeAke7ncvz0Zj9Z5K6bPZXkbyeomkI1kp+Vb+Xl4Js4XA
20Ij3Nj/BcpAb8Eb7xUD2T+ZMvuzdDdETi/p30EJ9mEQDXaTHXxNFv77HTC0Mz2L
02epvLRQT2gVCzS/Fj0K
=vfHm
-----END PGP SIGNATURE-----

--cemvpph5f6qj5t43--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
