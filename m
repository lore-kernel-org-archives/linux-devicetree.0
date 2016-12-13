From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v6 4/5] ARM: dts: da850-lcdk: add the vga-bridge node
Date: Tue, 13 Dec 2016 10:46:44 +0200
Message-ID: <9d5fa409-bb4f-f62b-2548-0a3b82228e08@ti.com>
References: <1481547942-24775-1-git-send-email-bgolaszewski@baylibre.com>
 <1481547942-24775-5-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0354520129=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1481547942-24775-5-git-send-email-bgolaszewski@baylibre.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-devicetree <devicetree@vger.kernel.org>, linux-drm <dri-devel@lists.freedesktop.org>, Kevin Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>, Russell King <linux@armlinux.org.uk>, Jyri Sarha <jsarha@ti.com>, LKML <linux-kernel@vger.kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Rob Herring <robh+dt@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Frank Rowand <frowand.list@gmail.com>, arm-soc <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

--===============0354520129==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="2xMBPNrwB41GkK2hgX9fwGc1ESl9rhVn5"

--2xMBPNrwB41GkK2hgX9fwGc1ESl9rhVn5
Content-Type: multipart/mixed; boundary="muXGduK0IrB2IRpfmL1B5TsELpNW97HIN";
 protected-headers="v1"
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Jyri Sarha <jsarha@ti.com>, David Airlie <airlied@linux.ie>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Russell King
 <linux@armlinux.org.uk>, LKML <linux-kernel@vger.kernel.org>,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 linux-drm <dri-devel@lists.freedesktop.org>,
 linux-devicetree <devicetree@vger.kernel.org>
Message-ID: <9d5fa409-bb4f-f62b-2548-0a3b82228e08@ti.com>
Subject: Re: [PATCH v6 4/5] ARM: dts: da850-lcdk: add the vga-bridge node
References: <1481547942-24775-1-git-send-email-bgolaszewski@baylibre.com>
 <1481547942-24775-5-git-send-email-bgolaszewski@baylibre.com>
In-Reply-To: <1481547942-24775-5-git-send-email-bgolaszewski@baylibre.com>

--muXGduK0IrB2IRpfmL1B5TsELpNW97HIN
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

On 12/12/16 15:05, Bartosz Golaszewski wrote:

> +&lcdc {
> +	status =3D "okay";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&lcd_pins>;
> +
> +	ports {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		lcdc_out: port@1 {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			reg =3D <1>;
> +
> +			lcdc_out_vga: endpoint {
> +				reg =3D <0>;
> +				remote-endpoint =3D <&vga_bridge_in>;
> +			};
> +		};
> +	};
> +};
>=20

This is not correct. LCDC has just one output, so port@1 doesn't make
sense. It's port@0. But with just one port, you can leave "ports" away.
And you don't need the port's label for anything, if I'm not mistaken. So=
:

&lcdc {
	status =3D "okay";
	pinctrl-names =3D "default";
	pinctrl-0 =3D <&lcd_pins>;

	port {
		lcdc_out_vga: endpoint {
			remote-endpoint =3D <&vga_bridge_in>;
		};
	};
};

 Tomi


--muXGduK0IrB2IRpfmL1B5TsELpNW97HIN--

--2xMBPNrwB41GkK2hgX9fwGc1ESl9rhVn5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYT7V0AAoJEPo9qoy8lh71jbwQALG4a8TrujmZr/7Meq0jgjWa
7/kUmbM3Iq5Ru9w9rN0jP8jkZVJrcOnnrk+3WgiskmiIfZTGnI+fWtP7CjLGLwuX
EQsWZEyrVEF0SMXxE4yjCGeE5fTM85yltlZkhbO3iFbOmCKDfVqB6BqpBVsp2Uzq
ZU5XNsvQl6DSEnIRKVjNcEYpjDO4gdefjNzevjtBlrRImB1L/t2vCiuz9NKST5cl
q/vQlprtj+SUVgHbp5PzoEITxaeaMKGrkw2u0AHK3WM6d3qfM5Nv4lvgL/avUNhm
+TaA/xq5NJhSB2Wn0d02YAhYC886M7VxUSAoNqvrlLhNBJKSLE30GbKZ37KH3t9J
ljUAswxBCFXnppdRt2lUtgP65SIq4VKbj0QpuNiFGxEhFR1ZG6fKH8dHqpx4GhRc
IFdxd3dx+YjGObBAW5vXf4tBC9+pHMAgrI9vhM4eqz8/mqE/ub/kfYc0MVf0PdOs
CWszIztmFmDUIVkm8/mANFTbX4wHS6TSefYvMWGbW6tpSSbJ7S8jvG9y2BPZybX8
ewZv47rvgEgyxTd946JTqgbcf/ajgA91PQX9WvxU8C0RsR3+wOWXSRr9/nGmkEuC
x3FFRDhy97zaLmbRTBBNAFOD5RrG6dT6TcJonpIFc9c01DiegopboAllaGvih26a
pKFjzXcRXMyCVvVB7e0X
=bvSo
-----END PGP SIGNATURE-----

--2xMBPNrwB41GkK2hgX9fwGc1ESl9rhVn5--

--===============0354520129==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0354520129==--
