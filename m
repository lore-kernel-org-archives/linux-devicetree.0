From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 3/6] ARM: mvebu: Add the Core Divider clock to Armada
 38x SoCs
Date: Thu, 13 Mar 2014 17:05:46 -0300
Message-ID: <20140313200546.GB30590@arch.cereza>
References: <1394739542-30017-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1394739542-30017-4-git-send-email-ezequiel@vanguardiasur.com.ar>
 <53221B41.2030001@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53221B41.2030001-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Seif Mazareeb <seif-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mar 13, Sergei Shtylyov wrote:
> Hello.
>=20
> On 03/13/2014 10:38 PM, Ezequiel Garcia wrote:
>=20
> >From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>=20
> >The Armada 38x SoC family has a clock provider called "Core Divider"=
,
> >derived from the fixed 2 GHz main PLL clock. This is similar to the
> >one on A370, A375 and AXP.
>=20
> >Signed-off-by: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> >---
> >  arch/arm/boot/dts/armada-38x.dtsi | 8 ++++++++
> >  1 file changed, 8 insertions(+)
>=20
> >diff --git a/arch/arm/boot/dts/armada-38x.dtsi b/arch/arm/boot/dts/a=
rmada-38x.dtsi
> >index 38fc3a0..76cc27e 100644
> >--- a/arch/arm/boot/dts/armada-38x.dtsi
> >+++ b/arch/arm/boot/dts/armada-38x.dtsi
> >@@ -337,6 +337,14 @@
> >  				compatible =3D "marvell,orion-mdio";
> >  				reg =3D <0x72004 0x4>;
> >  			};
> >+
> >+			coredivclk: corediv-clock@e4250 {
>=20
>    I would suggest naming the device just "clock@e4250" on the same g=
rounds
> of having the generic device names.
>=20

Right, I overlooked this.

--=20
Ezequiel Garc=EDa, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
