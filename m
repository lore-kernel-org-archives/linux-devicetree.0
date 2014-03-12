From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 4/6] ARM: mvebu: Add support for NAND controller in
 Armada 38x SoC
Date: Wed, 12 Mar 2014 18:29:36 -0300
Message-ID: <20140312212936.GA2384@arch.cereza>
References: <1394637404-7651-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1394637404-7651-5-git-send-email-ezequiel.garcia@free-electrons.com>
 <5320CEE7.6020506@cogentembedded.com>
 <20140312203007.GA7396@arch.cereza>
 <5320D3FD.8010704@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5320D3FD.8010704-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Seif Mazareeb <seif-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mar 13, Sergei Shtylyov wrote:
> On 03/12/2014 11:30 PM, Ezequiel Garcia wrote:
>=20
> >>>The Armada 38x SoC family has a NAND controller, compatible
> >>>with the controller in Armada 370/375/XP SoCs. Add support for
> >>>it in the devicetree file.
>=20
> >>>Signed-off-by: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org=
>
> >>>---
> >>>  arch/arm/boot/dts/armada-38x.dtsi | 10 ++++++++++
> >>>  1 file changed, 10 insertions(+)
>=20
> >>>diff --git a/arch/arm/boot/dts/armada-38x.dtsi b/arch/arm/boot/dts=
/armada-38x.dtsi
> >>>index 76cc27e..18d8f80 100644
> >>>--- a/arch/arm/boot/dts/armada-38x.dtsi
> >>>+++ b/arch/arm/boot/dts/armada-38x.dtsi
> >>>@@ -345,6 +345,16 @@
> >>>  				clocks =3D <&mainpll>;
> >>>  				clock-output-names =3D "nand";
> >>>  			};
> >>>+
> >>>+			nand@d0000 {
>=20
> >>    ePAPR standard [1] tells us:
>=20
> >>The name of a node should be somewhat generic, reflecting the funct=
ion of
> >>the device and not its precise programming model. If appropriate, t=
he name
> >>should be one of the following choices:
>=20
> >>[...]
> >>=E2=80=A2 flash
>=20
> >I think 'nand' is generic enough, isn't it?
>=20
>    It is but not more generic than "flash". :-)
>=20

Right.

> >FWIW, quite a few other SoCs have chosen 'nand' for the node name, i=
ncluding
> >the other Armada variants. Was this a wrong choice?
>=20
>    I guess. There's a lot of wrong choices now all over the
> arch/arm/boot/dts/ because people are probably not aware of the neces=
sary
> documentation such as http://devicetree.org/Device_Tree_Usage (pointi=
ng to
> ePAPR and having a passage on the generic device names too).
>=20

OK, I guess it's fine. Let's try to do things from now on, at least. I'=
ll fix
this and send a new series.
--=20
Ezequiel Garc=C3=ADa, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
