Return-Path: <SRS0=6DmN=LR=vger.kernel.org=devicetree-owner@kernel.org>
Received: from sauhun.de ([88.99.104.3]:50718 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725990AbeICNrj (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 3 Sep 2018 09:47:39 -0400
Date: Mon, 3 Sep 2018 11:28:19 +0200
From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [RESEND PATCH] spi: sh-msiof: Document R-Car D3 support
Message-ID: <20180903092819.2d2sh6dvusmwwey3@ninjato>
References: <1535101951-11221-1-git-send-email-uli+renesas@fpond.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jmn7syzf5f6nso37"
Content-Disposition: inline
In-Reply-To: <1535101951-11221-1-git-send-email-uli+renesas@fpond.eu>
Sender: devicetree-owner@vger.kernel.org
To: Ulrich Hecht <uli+renesas@fpond.eu>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org, linux-spi@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--jmn7syzf5f6nso37
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 24, 2018 at 11:12:31AM +0200, Ulrich Hecht wrote:
> Document support for the MSIOF module in the Renesas D3 (r8a77995) SoC.
>=20
> No driver update is needed.
>=20
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

> ---
> This patch fell by the wayside, probably because I forgot to cc devicetre=
e.

Yeah, this is good practice. Yet, I'd think this goes upstream via the
SPI tree? Ccing Mark, he prefers to be Cced explicitly.


--jmn7syzf5f6nso37
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAluM/q8ACgkQFA3kzBSg
Kba4rQ/+McZwLif0qPygg1zMfUKg8bvZC2w7hf4jBnWM0pIXUp7rGfV5id2y9CSq
najz/yRDD0t+T0u7Bfs73/gULoD3/0PG+JLygFPfYUplBRUcPbnxyTf9sf/8w4ZH
oRJGNKxW9fb0FzI1ygtiUfTQKmkZV8bkTCL4UwpZOV5ROKXYm6AX2zZBAeg1GrM+
X2xEViMV3zZJvSQu2/FT76gWJkmlHg0i+nZGvHSeKZwT6ALc8wqa6S2LopchGrs+
b2NXIhHOOoMFUeu54f2g1cBvD6lFb1JPhwat7bGpJSfxDms0Dzl3vMPmjZIlnqXL
JJVviWjuo16DCGT3qD92OO9A5xYxfUhRAOLndAdl+z8rIjfy+yI5V6+X0Uah0/kX
bu19x+7MGwFAo4qvrfGknxYHGBN9diokfF+TWnusKDpsx6cJoho68z5A/ktgZIM3
EAbhEanZgPKYT9z9NKy6WdSOeLDFo6JAsJHKRxKOCvvfxSRGUESsr0l06+SKLZRK
j4VTwGJw6SpIoL2WmwnSQEEG3w8GcK4ZYgqtJzzxh0LZ7HOuA8j6qhRHHhNNe7hZ
WWv0vqpm8iwCV0rkKM/Nj3ckCqeuwEY8BinMW3w7qaR4pedEtQ8Tq+XPjjqfhUmK
fZqeKNF2KJEklCMGIhfHUOQyKceLrIy9TLw9ny9gvzfjPO49ENk=
=sn3O
-----END PGP SIGNATURE-----

--jmn7syzf5f6nso37--
