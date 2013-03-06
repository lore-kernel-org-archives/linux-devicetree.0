From: Hector Palacios <hector.palacios-i7dp0qKlBMg@public.gmane.org>
Subject: doubt about where to put pin-mux in MX28 based platform DT
Date: Wed, 6 Mar 2013 18:02:23 +0100
Message-ID: <5137769F.1000308@digi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: "fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

I'm creating the DT for a custom platform based on Freescale MX28 CPU and I=
 have some =

doubts about where to add some pin mux configurations: whether in imx28.dts=
i or in my =

platform dts.

A pair of examples folow:

Example #1. My platform is using a valid IOMUX for DUART TX/RX lines which =
is not =

covered in imx28.dtsi, namely the I2C0 pins. Since this is a valid IOMUX th=
at can be =

used by other platforms, I'd say I should included it in imx28.dtsi:

diff --git a/arch/arm/boot/dts/imx28.dtsi b/arch/arm/boot/dts/imx28.dtsi
index 3fa6d19..8928b7b 100644
--- a/arch/arm/boot/dts/imx28.dtsi
+++ b/arch/arm/boot/dts/imx28.dtsi
@@ -186,6 +186,17 @@
                                         fsl,pull-up =3D <0>;
                                 };

+                               duart_pins_c: duart@2 {
+                                       reg =3D <2>;
+                                       fsl,pinmux-ids =3D <
+                                               0x3182 /* MX28_PAD_I2C0_SCL=
__DUART_RX */
+                                               0x3192 /* MX28_PAD_I2C0_SDA=
__DUART_TX */
+                                       >;
+                                       fsl,drive-strength =3D <0>;
+                                       fsl,voltage =3D <1>;
+                                       fsl,pull-up =3D <0>;
+                               };
+
                                 duart_4pins_a: duart-4pins@0 {
                                         reg =3D <0>;
                                         fsl,pinmux-ids =3D <

Example #2. My platform assembles a NAND chip which is powered at 1.8V. The=
 imx28.dtsi =

has a configuration 'gpmi_pins_a: gpmi-nand@0' that configures the pins at =
3.3V.
Should I create another entry here 'gpmi_pins_b: gpmi-nand@1' with fsl,volt=
age =3D <0>; =

or should I create a specific entry in my platform's DT instead?
What is the convention?
-- =

H=E9ctor Palacios
