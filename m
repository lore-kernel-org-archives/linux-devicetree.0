From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 4/8] dts: sun8i-h3: move uart1 pinmux/peripheral
 assocation to DSTI
Date: Thu, 8 Sep 2016 08:23:17 +0200
Message-ID: <20160908062317.GD8913@lukather>
References: <1473235141-12768-1-git-send-email-jorik@kippendief.biz>
 <1473235141-12768-5-git-send-email-jorik@kippendief.biz>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="OROCMA9jn6tkzFBc"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1473235141-12768-5-git-send-email-jorik-U9/BOH3cVv3CLqq/8VZgpA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jorik-U9/BOH3cVv3CLqq/8VZgpA@public.gmane.org
Cc: wens-jdAy2FN1RRM@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--OROCMA9jn6tkzFBc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 07, 2016 at 09:58:57AM +0200, jorik-U9/BOH3cVv3CLqq/8VZgpA@public.gmane.org wrote:
> From: Jorik Jonker <jorik-U9/BOH3cVv3CLqq/8VZgpA@public.gmane.org>
>=20
> Users using this UART without RTS/CTS should override the association in
> their board specific DTS. All (1) board using this UART uses RTS/CTS, so
> this breaks nothing.

Using RTS / CTS is very rare among the boards. Forcing it down the
throat of every user doesn't seem like the right thing to do.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--OROCMA9jn6tkzFBc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJX0QPVAAoJEBx+YmzsjxAgJhkQALKgiy9VnvR5EwICTl0cekQM
3mWbaLs7WsVHAHAOmVJun5x0ra7yBdBSdNmQRXjQiPCJjr8WvV/6dxsEAlGYTi3b
RnyWT1Gl2CCI3fSJPpUzOoDDHAKNrMF111SngaguC8ZzfJL+c6i7fKHFouEHapAy
FWcSxTifBsz7yQv3dfqE2ypaBjSaCibi7QpVmyZT6+el1XoNddEyDpxk9KKHbNLO
+53SO8+GxZtX7G1Hj6ddEypYWpEXMzG9NuxjsBjh+E7Jtmb296LihPChiHwZ3bnk
1PGKaIM6eC9CiFjZ+qQTTaPyI+v1xd/bGbp7EchK9A7qNIqsXFFAnXzJBWZTj25S
AVN0k9AmcK55BxlkSC3O4fcIqK1BuM/l99HsnuLFAMXkhWOc9Yi5ttDhYooF/3OX
7GRp9P6p3iyFPpzUhiLc38YxTrXPngHcrlzzqDWnPPPUCJP/Gvae1o6QxBcARjqB
yd/gxUlOK3xVqBVvjycmhHWoaoz6l/VVyIhRmnIqY4AFFutptLkJR29D3DQtFUEI
FTCKRQRdVi3dzy7/eKQ9af7x4zx4r4aRr2y68fKEUbZO2AqqV+tBgpb4CEmKw70g
TwhhQODMj3nBsHZJkRVVQ2YHmGbrCAQJ9n82dk3Gvdf6G3/Qrdsrch1kCIFp92VI
X6KAuPQ/TOp6sQEGiHol
=k4Rh
-----END PGP SIGNATURE-----

--OROCMA9jn6tkzFBc--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
