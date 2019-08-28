From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
Subject: Re: [PATCH 2/2] dt-bindings: imx6q-pcie: add
 "fsl,pcie-phy-refclk-internal" for i.MX7D
Date: Wed, 28 Aug 2019 09:17:07 +0100
Message-ID: <bc6247cdd51d7a7b28c52a186d4975ecbeaa602d.camel@andred.net>
References: <20190813103759.38358-1-git@andred.net>
         <20190813103759.38358-2-git@andred.net> <20190827155626.GA29948@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190827155626.GA29948@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, Bjorn Helgaas <bhelgaas@google.com>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Tue, 2019-08-27 at 10:56 -0500, Rob Herring wrote:
> On Tue, Aug 13, 2019 at 11:37:59AM +0100, André Draszik wrote:
> > The i.MX7D variant of the IP can use either an external
> > crystal oscillator input or an internal clock input as
> > a reference clock input for the PCIe PHY.
> > 
> > Document the optional property 'fsl,pcie-phy-refclk-internal'
> > 
> > Signed-off-by: André Draszik <git@andred.net>
> > Cc: Richard Zhu <hongxing.zhu@nxp.com>
> > Cc: Lucas Stach <l.stach@pengutronix.de>
> > Cc: Bjorn Helgaas <bhelgaas@google.com>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: Shawn Guo <shawnguo@kernel.org>
> > Cc: Sascha Hauer <s.hauer@pengutronix.de>
> > Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> > Cc: Fabio Estevam <festevam@gmail.com>
> > Cc: NXP Linux Team <linux-imx@nxp.com>
> > Cc: linux-pci@vger.kernel.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > ---
> >  Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt
> > b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt
> > index a7f5f5afa0e6..985d7083df9f 100644
> > --- a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt
> > +++ b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt
> > @@ -56,6 +56,11 @@ Additional required properties for imx7d-pcie and imx8mq-pcie:
> >  	       - "turnoff"
> >  - fsl,imx7d-pcie-phy: A phandle to an fsl,imx7d-pcie-phy node.
> 
> Not sure how this got in, but why is the phy binding not used here?
> 
> >  
> > +Additional optional properties for imx7d-pcie:
> > +- fsl,pcie-phy-refclk-internal: If present then an internal PLL input is used
> > +  as PCIe PHY reference clock source. By default an external ocsillator input
> > +  is used.
> 
> Can't the clock binding and maybe 'assigned-clocks' be used here? 
> 
> Also, this is a property of the PHY, so it belongs in the PHY's node.

Thanks for pointing this out. I'll have a look.

Andre'
