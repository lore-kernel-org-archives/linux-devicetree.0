From: Antoine Tenart <antoine.tenart@free-electrons.com>
Subject: Re: [PATCH v7 11/13] ARM: dts: Berlin: enable USB on the BG2Q DMP
Date: Fri, 14 Nov 2014 22:14:44 +0100
Message-ID: <20141114211444.GB8105@kwain>
References: <1415978763-27345-1-git-send-email-antoine.tenart@free-electrons.com>
 <1415978763-27345-12-git-send-email-antoine.tenart@free-electrons.com>
 <54664E2F.6070701@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <54664E2F.6070701@cogentembedded.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Antoine Tenart <antoine.tenart@free-electrons.com>, sebastian.hesselbarth@gmail.com, Peter.Chen@freescale.com, balbi@ti.com, p.zabel@pengutronix.de, alexandre.belloni@free-electrons.com, thomas.petazzoni@free-electrons.com, zmxu@marvell.com, jszhang@marvell.com, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

On Fri, Nov 14, 2014 at 09:47:11PM +0300, Sergei Shtylyov wrote:
> On 11/14/2014 06:26 PM, Antoine Tenart wrote:
>=20
> >Enable the 2 available USB PHY and USB nodes on the Marvell Berlin B=
G2Q
> >DMP.
>=20
> >Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>
> >---
> >  arch/arm/boot/dts/berlin2q-marvell-dmp.dts | 53 ++++++++++++++++++=
++++++++++++
> >  1 file changed, 53 insertions(+)
>=20
> >diff --git a/arch/arm/boot/dts/berlin2q-marvell-dmp.dts b/arch/arm/b=
oot/dts/berlin2q-marvell-dmp.dts
> >index ea1f99b8eed6..f7c25580e122 100644
> >--- a/arch/arm/boot/dts/berlin2q-marvell-dmp.dts
> >+++ b/arch/arm/boot/dts/berlin2q-marvell-dmp.dts
> [...]
> >@@ -21,6 +23,39 @@
> >  	choosen {
> >  		bootargs =3D "console=3DttyS0,115200 earlyprintk";
> >  	};
> >+
> >+	regulators {
> >+		compatible =3D "simple-bus";
> >+		#address-cells =3D <1>;
> >+		#size-cells =3D <0>;
> >+
> >+		reg_usb0_vbus: regulator@0 {
>=20
>    Erm, I'm not seeing the "reg" prop. The <unit-address> part of the=
 name
> shouldn't be used without the "reg" prop.
>=20
> [...]

Well, I respect the bindings described at:
Documentation/devicetree/bindings/regulator/fixed-regulator.txt

Antoine

--=20
Antoine T=E9nart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
