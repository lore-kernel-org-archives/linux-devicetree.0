From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 2/4] musb: sunxi: add support for the variant in H3/V3s SoC
Date: Fri, 6 Jan 2017 14:57:15 +0100
Message-ID: <20170106135715.y7cwrwqyzybl6t5m@lukather>
References: <20170103152534.20118-1-icenowy@aosc.xyz>
 <20170103152534.20118-3-icenowy@aosc.xyz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2681927268323034006=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170103152534.20118-3-icenowy@aosc.xyz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Icenowy Zheng <icenowy@aosc.xyz>
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>, Chen-Yu Tsai <wens@csie.org>, Bin Liu <b-liu@ti.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============2681927268323034006==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xhhteb42hdiefqo6"
Content-Disposition: inline


--xhhteb42hdiefqo6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 03, 2017 at 11:25:32PM +0800, Icenowy Zheng wrote:
> Allwinner H3/V3s features a variant of MUSB controller, which lacks one
> endpoint.
>=20
> Add support for it.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--xhhteb42hdiefqo6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYb6I7AAoJEBx+YmzsjxAgkMUP/R8jy2moLgws9P8qfFEqsfdx
vFpKq6Ci9j8FVXkWmtV3Yv7+0xajrqx3On3nfCjVY4lwRLY0stjf6rnSAXxh6Z6o
GNJ1SizKPjsspPPpE2MWrB3CVKXsyyJYp0wm6xZNp91S2I9hC5zrLHECRR7NTyec
X9VsxSUiorOJkji1XBApybVayafHuve1NHxZkdb7jFbMd29CrdtZLyLOjZB7+UAL
AktDeToD3AE46TW91lybOGG/jNPQFUqK9Fq/TfN51nYl8TaDDFpBPAeMaJWfr154
TEtZiR6BCCoWx7Z0efGE4Nfapzm8x10BMXuXPUXEqCIFdgryo2OPRZxjdSbsE08O
AOhq3MklkI+6KYFlgM9qvX4oV2iZazIm3fhrctrbPPH2gPM+terg4ZpaemwS8W6y
UTWj98Zw3JbV/PZGwajvnu2CHX9vNK6RYbtE18a88MWPTM5aIrlTCPHxIrfqc9Qp
202aWGsoxmAw583DOylj6l6ShaC1r/vG5DQWnrOEEXXRMfFgGphiJeBL7PN7Vhwr
RPLmjzlQHauWCAlFDSD4hOYV6HY+bidGb48wyC+3luNtWaErtYMECGcCJ8BifC1q
ZiyryaFfkBtIlNtsCP8jBdfVMmW3DBiE2dp9V57vfbzH4W2FBoi48rUkMmRDE4tc
Los5guF06fp9ofBZXXyf
=N+vN
-----END PGP SIGNATURE-----

--xhhteb42hdiefqo6--


--===============2681927268323034006==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============2681927268323034006==--
