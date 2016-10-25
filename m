From: Troy Jia <hongtao.jia@nxp.com>
Subject: RE: [PATCH V2 1/5] powerpc/mpc85xx: Update TMU device tree node for
 T1040/T1042
Date: Tue, 25 Oct 2016 02:29:46 +0000
Message-ID: <AM4PR0401MB18431A1DD9E2061FC71414D3EBA80@AM4PR0401MB1843.eurprd04.prod.outlook.com>
References: <1475995626-14049-1-git-send-email-hongtao.jia@nxp.com>
 <20161024083654.GB30578@tiger>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161024083654.GB30578@tiger>
Content-Language: zh-CN
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: "rui.zhang@intel.com" <rui.zhang@intel.com>, "edubezval@gmail.com" <edubezval@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Scott Wood <scott.wood@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


> -----Original Message-----
> From: Shawn Guo [mailto:shawnguo@kernel.org]
> Sent: Monday, October 24, 2016 4:37 PM
> To: Troy Jia <hongtao.jia@nxp.com>
> Cc: rui.zhang@intel.com; edubezval@gmail.com; robh+dt@kernel.org; Scott W=
ood
> <scott.wood@nxp.com>; devicetree@vger.kernel.org; linuxppc-
> dev@lists.ozlabs.org; linux-kernel@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org
> Subject: Re: [PATCH V2 1/5] powerpc/mpc85xx: Update TMU device tree node =
for
> T1040/T1042
>=20
> On Sun, Oct 09, 2016 at 02:47:02PM +0800, Jia Hongtao wrote:
> > From: Hongtao Jia <hongtao.jia@nxp.com>
> >
> > SoC compatible string and endianness property are added according to
> > the new bindings.
>=20
> The commit log doesn't seem to match the actual changes.  Same for patch =
2/5.

Right. I just revise the log and sent a new version. Please help to review.
Thanks.

-Hongtao.

>=20
> >
> > Signed-off-by: Jia Hongtao <hongtao.jia@nxp.com>
> > ---
> > Changes for V2:
> > * Rebase on latest linux-next tree (next-20161006).
> >
> >  arch/powerpc/boot/dts/fsl/t1040si-post.dtsi | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/powerpc/boot/dts/fsl/t1040si-post.dtsi
> > b/arch/powerpc/boot/dts/fsl/t1040si-post.dtsi
> > index 44e399b..145c7f4 100644
> > --- a/arch/powerpc/boot/dts/fsl/t1040si-post.dtsi
> > +++ b/arch/powerpc/boot/dts/fsl/t1040si-post.dtsi
> > @@ -526,7 +526,7 @@
> >
> >  				       0x00030000 0x00000012
> >  				       0x00030001 0x0000001d>;
> > -		#thermal-sensor-cells =3D <0>;
> > +		#thermal-sensor-cells =3D <1>;
> >  	};
> >
> >  	thermal-zones {
> > @@ -534,7 +534,7 @@
> >  			polling-delay-passive =3D <1000>;
> >  			polling-delay =3D <5000>;
> >
> > -			thermal-sensors =3D <&tmu>;
> > +			thermal-sensors =3D <&tmu 2>;
> >
> >  			trips {
> >  				cpu_alert: cpu-alert {
> > --
> > 2.1.0.27.g96db324
> >
> >
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
