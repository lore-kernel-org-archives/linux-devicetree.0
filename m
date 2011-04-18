From: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v3] uio/pdrv_genirq: Add OF support
Date: Mon, 18 Apr 2011 18:06:58 +0200
Message-ID: <20110418160658.GD23814@pengutronix.de>
References: <1303116654-5042-1-git-send-email-monstr@monstr.eu>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3687955735554454965=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1303116654-5042-1-git-send-email-monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, hjk-vqZO0P4V72/QD6PfKP4TzA@public.gmane.org, john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============3687955735554454965==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OaZoDhBhXzo6bW1J"
Content-Disposition: inline


--OaZoDhBhXzo6bW1J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

> For example with "uio" compatible string:
> static const struct of_device_id __devinitconst uio_of_genirq_match[] =3D=
 {
> 	{ .compatible =3D "uio", },
> 	{ /* empty for now */ },
> };

Please use a proper example with "vendor,device".
(And after that it won't be empty anymore)

> +		/* Multiple IRQs are not supported */
> +		irq =3D platform_get_irq(pdev, 0);
> +		if (irq < 0) {
> +			uioinfo->irq =3D UIO_IRQ_NONE;
> +			dev_info(&pdev->dev, "no IRQ found\n");
> +		} else {
> +			uioinfo->irq =3D irq;
> +			dev_info(&pdev->dev, "irq %d\n", (u32)uioinfo->irq);
> +		}

Come to think of it, the driver so far does not print any dev_info messages,
only err and warn. So, I'd think these messages should go, too, but this is=
 up
to Hans.

Regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--OaZoDhBhXzo6bW1J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk2sYaIACgkQD27XaX1/VRtjtQCfeaOx0SOga+UL3/wrlPRIoGFx
uqcAoKaLCRFaDUMJL0p0BIO2aAbtFaO3
=OjG4
-----END PGP SIGNATURE-----

--OaZoDhBhXzo6bW1J--

--===============3687955735554454965==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============3687955735554454965==--
