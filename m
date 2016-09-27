From: Vagrant Cascadian <vagrantc@aikidev.net>
Subject: [PATCH v2] ARM: dts: rockchip: temporarily remove emmc hs200 speed
 from rk3288-veyron-speedy.
Date: Tue, 27 Sep 2016 13:53:46 -0700
Message-ID: <87twd1vzc5.fsf@aikidev.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5758411567483402832=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============5758411567483402832==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

This essentially mimics what was done with rk3288-veyron-minnie in
commit 984926781122f034d5bc9962815d135b6c4a8e1d.

The eMMC of the speedy Chromebook also appears to need the same tuning
workaround, as it frequently fails to recognize the eMMC without it.

Signed-off-by: Vagrant Cascadian <vagrantc@aikidev.net>
=2D--
Changes in v2:
 - Added Signed-off-by.

 arch/arm/boot/dts/rk3288-veyron-speedy.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288-veyron-speedy.dts b/arch/arm/boot/dts=
/rk3288-veyron-speedy.dts
index a0d033f..500fd18 100644
=2D-- a/arch/arm/boot/dts/rk3288-veyron-speedy.dts
+++ b/arch/arm/boot/dts/rk3288-veyron-speedy.dts
@@ -124,6 +124,11 @@
            &sdmmc_bus4>;
 };

+
+&emmc {
+       /delete-property/mmc-hs200-1_8v;
+};
+
 &vcc_5v {
    enable-active-high;
    gpio =3D <&gpio7 21 GPIO_ACTIVE_HIGH>;
=2D-=20
2.9.3

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJX6txcAAoJELeLgtSBS5G2zGUQAIGYsCKyw0JDovY+ViWDdD9H
hxB3oZTC+r+GfSlKA3D+vPMBLvv3oZKBF+JdR+vPEcrQ1kn2FZfAyACc5OCeMmqE
xo4qXfW88bW8ZPn1+1Ao/Qui8kW54N6KcL1yTpDfGkEdLPLfKEZGPRO5CTQbb3ez
1qk6RI7NUqELUIjP/EZk3RZLeIRqmkVNPH+otPQknCHI+ok4EYVNqGGt/BWEVDxh
9ECtLuap4ym/Nv+/kQfFk+wLsiUCR57MtqgIIDqscxOmrf5iqlqTXRO0pHYMJFxG
CWM2ydAQYBjSni+Bk3WoYI4mCUzChz2uIXGF1w4dy0ONNJ0JPACTRpPaRbKpe/90
RNhhyhqd1Sdw8CejWLrt79qDdABPtmrardLAP5o9oHTB1l8U+9Wua7zmmsIUFGH3
xFj8Ypa+Fwwi5KNRuylZCBH4/mTI3ghnjQRcbkUYb3AQ0PaaNlwiyzoapIgzRogX
IDAQ+b00jrcxxWJXFgv/JV2oSc5snVuRlxoL+0Yia7l+aVxHfrc/2MF1dzvzlWqZ
ABifKIpGutjGJd/y0vELfNWxdpQp14RgKzpqiH0NJWXyeYK8IMBAKRw7EO8nLkS/
XzoUIii2/nCLWmFNWPunAQbXtOob2k21YGI9byPuNMMGJH0ZFu7Pdah4CUWwqKh3
LvGCJ/oYdz6GKZ464D8x
=+NNd
-----END PGP SIGNATURE-----
--=-=-=--


--===============5758411567483402832==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5758411567483402832==--
