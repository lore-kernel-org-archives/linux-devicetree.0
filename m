From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH v3 12/13] usb: phy: msm: Properly check core interrupt
 number
Date: Mon, 14 Oct 2013 17:59:33 -0500
Message-ID: <20131014225933.GF7446@radagast>
References: <1381764280-28420-1-git-send-email-iivanov@mm-sol.com>
 <1381764280-28420-13-git-send-email-iivanov@mm-sol.com>
Reply-To: balbi@ti.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5149468581243131732=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1381764280-28420-13-git-send-email-iivanov@mm-sol.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "Ivan T. Ivanov" <iivanov@mm-sol.com>
Cc: mark.rutland@arm.com, linux-doc@vger.kernel.org, dwalker@fifo99.com, linux@arm.linux.org.uk, swarren@wwwdotorg.org, grant.likely@linaro.org, davidb@codeaurora.org, devicetree@vger.kernel.org, jackp@codeaurora.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, linux-arm-msm@vger.kernel.org, rob.herring@calxeda.com, linux-arm-kernel@lists.infradead.org, dsegal@codeaurora.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, balbi@ti.com, mgautam@codeaurora.org, bryanh@codeaurora.org, rob@landley.net
List-Id: devicetree@vger.kernel.org

--===============5149468581243131732==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JSkcQAAxhB1h8DcT"
Content-Disposition: inline

--JSkcQAAxhB1h8DcT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2013 at 06:24:39PM +0300, Ivan T. Ivanov wrote:
> From: "Ivan T. Ivanov" <iivanov@mm-sol.com>
>=20
> IRQ with number 0 is valid case, so check for negative

not entirelly correct... IRQ 0 isn't supposed to be used as a linux IRQ
number IIRC.

> numbers instead.
>=20
> Signed-off-by: Ivan T. Ivanov <iivanov@mm-sol.com>
> ---
>  drivers/usb/phy/phy-msm-usb.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/usb/phy/phy-msm-usb.c b/drivers/usb/phy/phy-msm-usb.c
> index ca2abe6..f34c8a9 100644
> --- a/drivers/usb/phy/phy-msm-usb.c
> +++ b/drivers/usb/phy/phy-msm-usb.c
> @@ -1415,7 +1415,7 @@ static int __init msm_otg_probe(struct platform_dev=
ice *pdev)
>  	dev_info(&pdev->dev, "OTG regs =3D %p\n", motg->regs);
> =20
>  	motg->irq =3D platform_get_irq(pdev, 0);
> -	if (!motg->irq) {
> +	if (motg->irq < 0) {

this check is correct though, since platform_get_irq() will return
-ENXIO if it doesn't find IRQ resource.

--=20
balbi

--JSkcQAAxhB1h8DcT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJSXHdVAAoJEIaOsuA1yqRE3HkQAJ2z44WF0KL5m/u2VGTL1Xgp
7SIrdyETHe+py5kdp5cdxqbupTHhWzLiB65uevqGlBd67qMKxSkEgmDo++RC8guh
FYmAojyIWpRr7e8OMBXl8qIIJQYNOWBzZjNrrMcatYKlsHPMUTzBz1yJRUB4bDCZ
ZVB/txj11VT5zPjI4UyP6y1JAayIkyHDMiCElUk0JxBBdOx1YpdQhKsB/HcfUHkk
bp6NHpWCikaleM9U+I85T5PrTQp0AGJ3KOiq01QMHCwrAXnXz+MvSQPyInvyQ50m
H6yOKEl1kPfq15QWuK0v9R6kSpXMBwcr9nCRPz1GYLPcoTmSrs00f/iv836TgiNA
lmlSMWts2oILHvxZ48T+Tc/fRwTSoGLz5ejVvZEE21UKXEvi8CrBR84HSAxqZ7M0
1y8VIsq+8Juwn9hVVBwnUwZIQIKGh3o5/oIuuHLI6NCEdptoJu+VSOjA6m87MtRW
XeVpaPIUqwqb7XSr9bqaY+c5Q0pOzF3pFsgqhf2e12BR/0TQekMZ8taqzSfwjL9K
r99O4yLaSlUFhDljRmhbPQMt5/0uIbp3zBRcJy2ZDIaPvXlfNhnCz+kPw2Cd9ILX
sGngx7gSEXUVj4voVRndZJ6h3qg1+tEhRTVH9P203Iw7y1dzJQcOHXpOUhgl/NRG
4ubw1i2UA8qb8t5vgdcD
=pbRz
-----END PGP SIGNATURE-----

--JSkcQAAxhB1h8DcT--


--===============5149468581243131732==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5149468581243131732==--
