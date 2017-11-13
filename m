From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/2] arm64: dts: orange-pi-zero-plus2: enable AP6212a
 WiFi/BT combo
Date: Mon, 13 Nov 2017 10:25:29 +0100
Message-ID: <20171113092529.bpvzrrjdyxylx3nx@flea.lan>
References: <20171103195855.15283-1-geomatsi@gmail.com>
 <20171103195855.15283-3-geomatsi@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ptzjfen5rjawe45l"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171103195855.15283-3-geomatsi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergey Matyukevich <geomatsi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--ptzjfen5rjawe45l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 03, 2017 at 10:58:55PM +0300, Sergey Matyukevich wrote:
> Enable AP6212a WiFi/BT combo chip on orange-pi-zero-plus2 board:
> - WiFi SDIO interface is connected to MMC1
> - WiFi REG_ON pin connected to gpio PA9: attach to mmc-pwrseq
> - WiFi HOST_WAKE pin connected to gpio PL7
> - BT is connected to UART1
>=20
> Signed-off-by: Sergey Matyukevich <geomatsi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Queued for 4.16, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--ptzjfen5rjawe45l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJaCWUJAAoJEBx+YmzsjxAgOW4P/R+YP92pH8+bSaA/8MrkgOeO
QkrofuccK5NnrZCCBtJ9b7RukjCptfiwvx0ryNNjLAjN2qjj5bANO1LHNDGXprtw
7xo/S5gLRqx8yAAbsuB7+gOvowkSC/rItBK+KQlEbTKbdPvr6PABoDbcvMwxZD63
b/QGsmzu5mvXUn9ZRD0sTQj9yRAs6K8HU0AqCfcSqdRSj4b1DWlz0U6QkvaRTwis
HSx2z8MevV5lOPBxmTqKVYxhg12LN7soxG8TIGrIMSnMgfbIWyKc6HjvsybokVVT
a5rsml26E+gaCztyyJjzoD+cZkyww7xxBx/tahTFYUriHUiFj8ipIJXVWW1Oezua
lLmw0cm2oTqBukjfoZOAEC01BHCzJA3uhrjHVLq0Au1/6hROPcOiOAUlTiELLtSf
XDtQm3tzl4QNF1USd/alEpz2FTnl8lJMd0jq03uUlY6ROtiVSWslAmv8j+XWrK7w
DobzDjfhRQX9whxorbYrKy/mKZ/nQVSmhsQkJEOFjs7zt1sqND+OPKztpaQWNhsE
hSv9lYdmd/RtId76t78vhFXb0LiZZmiSEmFEm+D+oMso43LKQlpMKRFh92pD0FR7
X6rOamsRJJ9R1By46a53Bxq6bYyxgiPnMgTGh1VIgaoa6BGLDphzBTDnYEmt3fAC
WrKVu10E7cX6AJVeelRs
=haoD
-----END PGP SIGNATURE-----

--ptzjfen5rjawe45l--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
