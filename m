From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] powerpc/mpc85xx: Add pcsphy nodes to FManV3 device tree
Date: Tue, 22 Dec 2015 08:10:04 -0600
Message-ID: <1450793404.18314.90.camel@freescale.com>
References: <1450655851-6556-1-git-send-email-igal.liberman@freescale.com>
	 <1450708833.18314.35.camel@freescale.com>
	 <DM2PR03MB509CAE5558807F9E327DCBDE6E50@DM2PR03MB509.namprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <DM2PR03MB509CAE5558807F9E327DCBDE6E50-ufbTtyGzTTTFwE0YMf9HFeO6mTEJWrR4XA4E9RH9d+qIuWR1G4zioA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liberman Igal-B31950 <Igal.Liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Cc: Bucur Madalin-Cristian-B32716 <madalin.bucur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Xie Shaohui-B21989 <Shaohui.Xie-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2015-12-22 at 02:51 -0600, Liberman Igal-B31950 wrote:
> 
> Regards,
> Igal Liberman
> 
> > -----Original Message-----
> > From: Wood Scott-B07421
> > Sent: Monday, December 21, 2015 4:41 PM
> > To: Liberman Igal-B31950 <Igal.Liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org>;
> > devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> > Cc: Bucur Madalin-Cristian-B32716 <madalin.bucur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>; Xie
> > Shaohui-B21989 <Shaohui.Xie-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > Subject: Re: [PATCH] powerpc/mpc85xx: Add pcsphy nodes to FManV3
> > device tree
> > 
> > On Mon, 2015-12-21 at 01:57 +0200, igal.liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org wrote:
> > > From: Igal Liberman <igal.liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > > 
> > > Signed-off-by: Igal Liberman <igal.liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > > 
> > > This patch adds pcsphy node to FManV3 device tree.
> > > Based on: https://patchwork.ozlabs.org/patch/503921/
> > > ---
> > >  .../dts/fsl/qoriq-fman3-0-10g-0-best-effort.dtsi   |    5 +++++
> > >  arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-0.dtsi |    5 +++++
> > >  .../dts/fsl/qoriq-fman3-0-10g-1-best-effort.dtsi   |    5 +++++
> > >  arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-1.dtsi |    5 +++++
> > >  arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-0.dtsi  |    5 +++++
> > >  arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-1.dtsi  |    5 +++++
> > >  arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-2.dtsi  |    5 +++++
> > >  arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-3.dtsi  |    5 +++++
> > >  arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-4.dtsi  |    5 +++++
> > >  arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-5.dtsi  |    5 +++++
> > >  arch/powerpc/boot/dts/fsl/qoriq-fman3-1-10g-0.dtsi |    5 +++++
> > >  arch/powerpc/boot/dts/fsl/qoriq-fman3-1-10g-1.dtsi |    5 +++++
> > >  arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-0.dtsi  |    5 +++++
> > >  arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-1.dtsi  |    5 +++++
> > >  arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-2.dtsi  |    5 +++++
> > >  arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-3.dtsi  |    5 +++++
> > >  arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-4.dtsi  |    5 +++++
> > >  arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-5.dtsi  |    5 +++++
> > >  18 files changed, 90 insertions(+)
> > 
> > Binding?
> > 
> 
> Working on that, I'll submit ASAP. 
> 
> Igal

Always submit the binding before the dts patch.

-Scott

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
