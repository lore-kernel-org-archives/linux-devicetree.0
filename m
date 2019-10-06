From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH v2 2/3] ARM: dts: add Netronix E60K02 board common file
Date: Mon, 7 Oct 2019 00:38:48 +0200
Message-ID: <20191006223848.GE19803@latitude>
References: <20190930194332.12246-1-andreas@kemnade.info>
 <20190930194332.12246-3-andreas@kemnade.info>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2603098935364844973=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190930194332.12246-3-andreas@kemnade.info>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andreas Kemnade <andreas@kemnade.info>
Cc: mark.rutland@arm.com, marex@denx.de, Marco Felsch <m.felsch@pengutronix.de>, devicetree@vger.kernel.org, andrew.smirnov@gmail.com, shawnguo@kernel.org, s.hauer@pengutronix.de, angus@akkea.ca, linux-kernel@vger.kernel.org, j.neuschaefer@gmx.net, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, manivannan.sadhasivam@linaro.org, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>, festevam@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============2603098935364844973==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BZaMRJmqxGScZ8Mx"
Content-Disposition: inline


--BZaMRJmqxGScZ8Mx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Thanks for CCing me on this patchset. Nice to see more e-book reader
related work!

A few comments and questions below.

On Mon, Sep 30, 2019 at 09:43:31PM +0200, Andreas Kemnade wrote:
> The Netronix board E60K02 can be found some several Ebook-Readers,
> at least the Kobo Clara HD and the Tolino Shine 3. The board
> is equipped with different SoCs requiring different pinmuxes.

Do I understand it correctly that i.MX6SL and i.MX6SLL are pin-
compatible so we can use the same pin numbers and GPIO handles in the
DT?

> +	leds {
> +		compatible =3D "gpio-leds";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_led>;
> +
> +		GLED {

What does "GLED" mean? It's not obvious to me.
What user-visible purpose does this LED have, or where is it on the
board?

> +			gpios =3D <&gpio5 7 GPIO_ACTIVE_LOW>;
> +			linux,default-trigger =3D "timer";
> +		};
> +	};
> +
> +	memory {
> +		reg =3D <0x80000000 0x80000000>;

2 GiB of memory?

> +			/* Core3_3V3 */

What are these labels (Core3_3V3, Core4_1V2, etc.)?

> +			dcdc2_reg: DCDC2 {
> +				regulator-name =3D "DCDC2";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +					regulator-suspend-max-microvolt =3D <3300000>;
> +					regulator-suspend-min-microvolt =3D <3300000>;
> +				};
> +			};


Thanks,
Jonathan Neusch=C3=A4fer

--BZaMRJmqxGScZ8Mx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAl2abPEACgkQCDBEmo7z
X9uKtxAAzzgCu+n9jH9hNCttJ3lG5alFog0lO+dd69DN/EG3wH4NCQNnkfL0eTUQ
ePZWqAlCuXMrFgJUrL0RDEw926fYD558I9RBtJGI1yPlKq4Qhs0ENpkNI9bOSZyG
s4UI1iLsalte+sGFZwPcTfWv5mgD5FSoLPIQleDaaHvCoRh9+PP7Nn3svxyToGcY
OE7WtpBAwA+gawwKGWZJUxXLMGQKwyg3f8TcFkugLh5VefyiNgTpRcWnilUbZ3mI
uU1hZc4cC/dcoCs0blZZwO24MAIDN/686fwViySRjzKE411dp1XZDz9LqQdr9OLW
NKMyFCSsjhn5TFMPoo6rux88KLBujHPRiu7e+EXSVgYZH4nRsxUqPTxnGzimotrx
1IoN+Dkg+hx5hxVntHrKktH5kvwuN7mKcgGqHNtkQgyhS4dWa+83R0C0E+uEi/ZM
mH+ht5CK/J6BbCXyUans1T+tIs1xL5xYHsw/ZKZtiYIwGrVVMiIbLf/OW+9llrc4
wt0KQkqUudaQj8i6PCihRudCi371QWQbcGholaDqkn4HFEGYRC8pzsCHr7sU6Gdf
J/5fw3n4lQv5H2RBLgzQBqNWB9CkRdJOTTR3Zj95Gaz1HizSWwyk22aoVKdD/f9R
jQ8CI9hIEMXx1iGEmBAltMHzwtfAzlwp9esITOahR7Sd3ZK0Hyc=
=YsCq
-----END PGP SIGNATURE-----

--BZaMRJmqxGScZ8Mx--


--===============2603098935364844973==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============2603098935364844973==--
