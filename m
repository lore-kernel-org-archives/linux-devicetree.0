From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v3 5/7] arm: dts: sun8i: a83t: Add CCI-400 node
Date: Mon, 19 Feb 2018 09:49:44 +0100
Message-ID: <20180219084944.iqrdzhpl63gdf6wy@flea.lan>
References: <20180219081837.15482-1-mylene.josserand@bootlin.com>
 <20180219081837.15482-6-mylene.josserand@bootlin.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5570921564877982168=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180219081837.15482-6-mylene.josserand@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: =?iso-8859-1?Q?Myl=E8ne?= Josserand <mylene.josserand@bootlin.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, quentin.schulz@bootlin.com, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, wens@csie.org, robh+dt@kernel.org, clabbe.montjoie@gmail.com, thomas.petazzoni@bootlin.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============5570921564877982168==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3wtrrwihokkagakw"
Content-Disposition: inline


--3wtrrwihokkagakw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Feb 19, 2018 at 09:18:35AM +0100, Myl=E8ne Josserand wrote:
> +				interrupts =3D <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
> +				<GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
> +				<GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
> +				<GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
> +				<GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>,
> +				<GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>,
> +				<GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>,
> +				<GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;

You should align these blocks on the first one in the array.

Thanks!
Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com

--3wtrrwihokkagakw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlqKj6cACgkQ0rTAlCFN
r3S60w//c/kfpgsnq89Es2YlR9bEb/fuju59qDYxfA2CDHmr9hi/SnyFDq9aU2wo
0SvMOf8oF9xuoEosEHEjDS255JOYkDeBO0umWDqDfCwnwT0bCshNRClZNtcDs4ge
uFDV730/dHWjTqvYgoSO0jAjz8nRhvaKPf9VEZuGBxlS0i/RSfLzx4Ss+86b6APp
yUJpQRVgCDwmb9+MHHIA6Rv3mYKjR82v64y2nfO8r3E0a6aHMfobKiK84G0zEFL1
T3byG3Zg1Oiyox2r7hsdZ6UgJMni74WPqTMzu+RbOpgVcfH90xIt5HuMmHVEgYfc
/THLtT92c0cuR+4JMGcSWddkFjCTaKmY2KLmM+Uvg5XRDcT+5mKhrOGsjqirw9kc
/FdS6+GIMSumOJmZ966OhFcTbOhZqPxiKKJ9umz6VXPj15A5mtL0vgSRawjkUn0Q
ahbbA5hD6dfYzUIPYi9YM92jbS0PepbHrMkrhvagHsz+ymVDAg3qbssupiVED+o2
a1A7QoByjZgRlgHaehKLy3KnJdUbbzkiZAnf2nekP+tU+7cUHokeMdmeFN0mzKeX
tGnufSIQEerMcC03nzqYd7EINBCEW6hOTOCWsua+0T7M+NcGHtS3FspMSReveL0C
Gli2z3FB6NT87BdYy5l+pnJMq7e3yK4xFxDsrP2/I3tD0zV5omg=
=kjdy
-----END PGP SIGNATURE-----

--3wtrrwihokkagakw--


--===============5570921564877982168==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5570921564877982168==--
