From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v3 1/2] ARM: dts: da850-lcdk: add the dumb-vga-dac node
Date: Mon, 5 Dec 2016 14:49:50 +0200
Message-ID: <a2159347-1cd7-18b1-626a-fe6a272ba85c@ti.com>
References: <1480420624-23544-1-git-send-email-bgolaszewski@baylibre.com>
 <1480420624-23544-2-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1801780279=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1480420624-23544-2-git-send-email-bgolaszewski@baylibre.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Russell King <linux@armlinux.org.uk>
Cc: linux-devicetree <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, linux-drm <dri-devel@lists.freedesktop.org>, Jyri Sarha <jsarha@ti.com>, arm-soc <linux-arm-kernel@lists.infradead.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

--===============1801780279==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="FbFgPcE5tlNkpUFh3OIxQRPX4OX3aawLa"

--FbFgPcE5tlNkpUFh3OIxQRPX4OX3aawLa
Content-Type: multipart/mixed; boundary="nEbiqIH3gMStN5MtoUsKlUCqQ6u3VFhcu";
 protected-headers="v1"
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Russell King <linux@armlinux.org.uk>
Cc: LKML <linux-kernel@vger.kernel.org>,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 linux-drm <dri-devel@lists.freedesktop.org>,
 linux-devicetree <devicetree@vger.kernel.org>, Jyri Sarha <jsarha@ti.com>,
 David Airlie <airlied@linux.ie>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Message-ID: <a2159347-1cd7-18b1-626a-fe6a272ba85c@ti.com>
Subject: Re: [PATCH v3 1/2] ARM: dts: da850-lcdk: add the dumb-vga-dac node
References: <1480420624-23544-1-git-send-email-bgolaszewski@baylibre.com>
 <1480420624-23544-2-git-send-email-bgolaszewski@baylibre.com>
In-Reply-To: <1480420624-23544-2-git-send-email-bgolaszewski@baylibre.com>

--nEbiqIH3gMStN5MtoUsKlUCqQ6u3VFhcu
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 29/11/16 13:57, Bartosz Golaszewski wrote:
> Add the dumb-vga-dac node to the board DT together with corresponding
> ports and vga connector. This allows to retrieve the edid info from
> the display automatically.
>=20
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  arch/arm/boot/dts/da850-lcdk.dts | 58 ++++++++++++++++++++++++++++++++=
++++++++
>  arch/arm/boot/dts/da850.dtsi     | 17 ++++++++++++
>  2 files changed, 75 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/da850-lcdk.dts b/arch/arm/boot/dts/da850=
-lcdk.dts
> index 711b9ad..d864f11 100644
> --- a/arch/arm/boot/dts/da850-lcdk.dts
> +++ b/arch/arm/boot/dts/da850-lcdk.dts
> @@ -50,6 +50,53 @@
>  			system-clock-frequency =3D <24576000>;
>  		};
>  	};
> +
> +	vga_bridge {
> +		compatible =3D "dumb-vga-dac";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&lcd_pins>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		ports {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			port@0 {
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +				reg =3D <0>;
> +
> +				vga_bridge_in: endpoint@0 {
> +					reg =3D <0>;
> +					remote-endpoint =3D <&display_out_vga>;
> +				};
> +			};
> +
> +			port@1 {
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +				reg =3D <1>;
> +
> +				vga_bridge_out: endpoint@0 {
> +					reg =3D <0>;
> +					remote-endpoint =3D <&vga_con_in>;
> +				};
> +			};
> +		};
> +	};
> +
> +	vga {
> +		compatible =3D "vga-connector";
> +
> +		ddc-i2c-bus =3D <&i2c0>;
> +
> +		port {
> +			vga_con_in: endpoint {
> +				remote-endpoint =3D <&vga_bridge_out>;
> +			};
> +		};
> +	};
>  };
> =20
>  &pmx_core {
> @@ -235,3 +282,14 @@
>  &memctrl {
>  	status =3D "okay";
>  };
> +
> +&display {
> +	status =3D "okay";
> +};
> +
> +&display_out {
> +	display_out_vga: endpoint@0 {
> +		reg =3D <0>;
> +		remote-endpoint =3D <&vga_bridge_in>;
> +	};
> +};
> diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dts=
i
> index 4070619..5f4ba2e 100644
> --- a/arch/arm/boot/dts/da850.dtsi
> +++ b/arch/arm/boot/dts/da850.dtsi
> @@ -454,6 +454,23 @@
>  			reg =3D <0x213000 0x1000>;
>  			interrupts =3D <52>;
>  			status =3D "disabled";
> +
> +			ports {
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				display_in: port@0 {
> +					#address-cells =3D <1>;
> +					#size-cells =3D <0>;
> +					reg =3D <0>;
> +				};
> +
> +				display_out: port@1 {
> +					#address-cells =3D <1>;
> +					#size-cells =3D <0>;
> +					reg =3D <1>;
> +				};
> +			};
>  		};

It's a bit difficult to follow this as there's been so many patches
going around. But I take the above is the LCDC node in the base da850
dtsi file? In that case, what is the display_in supposed to present?
It's the first node in the "display chain", so it has no input.

Also, don't touch da850.dtsi here, just add the "ports" node in the
da850-lcdk.dts file.

If the da850.dtsi has not been merged yet, I'd change the name of the
lcdc node to something else than "display". It's rather vague. If it's
named "lcdc", reading da850-lcdk.dts becomes much easier, as you'll
refer to "lcdc".

 Tomi


--nEbiqIH3gMStN5MtoUsKlUCqQ6u3VFhcu--

--FbFgPcE5tlNkpUFh3OIxQRPX4OX3aawLa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYRWJuAAoJEPo9qoy8lh71oT0P/0nHE9MDtKL7FQqS/6JnQU2o
h4XL3g2g8enOtRPfCMylDC3XcDKiffmc0EDboAJwqRBj2ixQCPwlOTGyOi7ExMDZ
DRKd0JrCpE7wvIbFFe+kBJM+KlDM5vBMy7hkyBrK1Hi54/xqpLA0EmNH/JLQWoJ+
PaCFbpqsBxbtzfOQEIOoprEZ0mCFXPG2itrhScYYSp94cVJqnZDJkjdWnx0pA3Vp
Xv4DRceuYyTl6y5LOHmUpsTbHEV1l15VadrEKCcdq40mOJH65weFnzpV2iFt4nmF
/Sqt6aorQ96fSAzGii6Yxj5WnxVbn7VDfzPrTHAkjYoMwhY4Y4UTydH/Whf7J9Bo
Kw/1/VB8mnQYLubVazzE8BBDqxvmdzLneDLb3zJotxHtEpJp5cNGZXB2xhB02sQI
dvvzkPQu1RuzQCpczRLYDxG/yYbGp2+xwLqY7FJVXI/0a3dhRak79GrGKEQwl8e2
bf0PInNRM0McyAqPuZApyrhZyM1DZ5TV52AXtFCrPIwhLEOvyo6vpfhTS23ZypH/
NUzsvmbNpkPuZ58Eob/PV50pPE7TSdJeVU8MmqzPBpk4XhYeKIdsqCGireh4u9t8
wgLqxTZBC+k9oZLn+c9sZ/kfxlkydV5KEmLJXQSSCwViRaKPXze2unhEmH/zlCQr
A8N8kt3HJpk8IRzfNXuQ
=sqIF
-----END PGP SIGNATURE-----

--FbFgPcE5tlNkpUFh3OIxQRPX4OX3aawLa--

--===============1801780279==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1801780279==--
