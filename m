From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH v3 1/5] usb: phy: samsung: Introducing usb phy driver for
 hsotg
Date: Thu, 9 Aug 2012 12:28:54 +0300
Message-ID: <20120809092853.GJ12174@arwen.pp.htv.fi>
References: <1344411661-17821-1-git-send-email-p.paneri@samsung.com>
 <1344411661-17821-2-git-send-email-p.paneri@samsung.com>
Reply-To: balbi@ti.com
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iRjOs3ViPWHdlw/I"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1344411661-17821-2-git-send-email-p.paneri@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Praveen Paneri <p.paneri@samsung.com>
Cc: linux-usb@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, balbi@ti.com, gregkh@linuxfoundation.org, thomas.abraham@linaro.org, ben-linux@fluff.org, broonie@opensource.wolfsonmicro.com, l.majewski@samsung.com, kyungmin.park@samsung.com, grant.likely@secretlab.ca, heiko@sntech.de
List-Id: devicetree@vger.kernel.org


--iRjOs3ViPWHdlw/I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 08, 2012 at 01:10:57PM +0530, Praveen Paneri wrote:
> +static int __init samsung_usbphy_driver_init(void)
> +{
> +	return platform_driver_register(&samsung_usbphy_driver);
> +}
> +subsys_initcall(samsung_usbphy_driver_init);

let's make use of the module_platform_driver() and have dependent
drivers return -EPROBE_DEFER until this has registered.

--=20
balbi

--iRjOs3ViPWHdlw/I
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQI4LVAAoJEIaOsuA1yqREtgcP/1q9iokEmZwA7cc0Q6yTqcfo
zl2HCUJDJkQ4qlEU671GrkV2R23bMUi5DxItR3hmKw1y+t9jWDMl8UvE3zfPbG/n
3a805wmy6m+FrrSgFp0j6EmlJAbn98YV2RGgMrtLXE8FHNoUsYBNfE5Ko0Q8eW/M
RwTepOS0eyQvBIiVVSD8LeQ0RB+0euC/ZoDuRdMo1YKaBoEHJllgDEkrANO9UPkz
SqPtjDRqxATqCIDZRY3cyLlxO2/ioWzrGDYRs+thRPHs5NN+k2869AX/6l7Uy/p7
wPVwJQnwBn16UD4kgMPvg4laRY2gByfVo24uXOSnRX4fUl2VbiIq+hdvWw9je4ob
Ixo/pJZ+xbtfM8lRR8kNWrIoPj0L9Ci3oPHOzq9z4hfbtv/nVLcVTDMJXWgnW/bd
Wi/B+cxh/f0BOcJ3Rjgu+egsUPvNHV/wXAX0dyyK1jgDkUNFRse9i7Sk2XQjnNhu
CKFB+FBqg30G/WOhO86Rw9WCZOpxxUHZjXPg3y8anaWVocRLJyiBqJhPWv33Y9fb
RHeHGWE3l0chhkBIAXRuQMD5XVTCvqH6CiX3zGnhk3NKgDTJ62H/iWOsAwPb4jtp
f+o0QpChSaAT9tX8fvaLdV7UOqt6AMI3ZWdKfb3IvphR53vjub0CojZykeYMbfrZ
Mb92LN6V3oz0owFUK5tZ
=3oPz
-----END PGP SIGNATURE-----

--iRjOs3ViPWHdlw/I--
