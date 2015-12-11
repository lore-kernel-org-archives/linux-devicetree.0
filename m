From: Scott Wood <scottwood@freescale.com>
Subject: Re: [PATCH] dts/ls2080a: Update PCIe compatible
Date: Thu, 10 Dec 2015 21:48:26 -0600
Message-ID: <1449805706.15946.283.camel@freescale.com>
References: <1448345075-6801-1-git-send-email-Mingkai.Hu@freescale.com>
 <20151124202203.GA32297@rob-hp-laptop>
 <BN3PR0301MB1249CD4A615CCD7308FB067184050@BN3PR0301MB1249.namprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <BN3PR0301MB1249CD4A615CCD7308FB067184050@BN3PR0301MB1249.namprd03.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Hu Vincent <Mingkai.Hu@freescale.com>, Rob Herring <robh@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "arm@kernel.org" <arm@kernel.org>, Li Leo <LeoLi@freescale.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "Lian M.H." <Minghuan.Lian@freescale.com>
List-Id: devicetree@vger.kernel.org

On Wed, 2015-11-25 at 05:01 +0000, Hu Vincent wrote:
> 
> > -----Original Message-----
> > From: Rob Herring [mailto:robh@kernel.org]
> > Sent: Wednesday, November 25, 2015 4:22 AM
> > To: Hu Mingkai-B21284
> > Cc: arm@kernel.org; linux-arm-kernel@lists.infradead.org;
> > devicetree@vger.kernel.org; Li Yang-Leo-R58472; Lian Minghuan-B31939
> > Subject: Re: [PATCH] dts/ls2080a: Update PCIe compatible
> > 
> > On Tue, Nov 24, 2015 at 02:04:35PM +0800, Mingkai Hu wrote:
> > > From: Minghuan Lian <Minghuan.Lian@freescale.com>
> > > 
> > > The patch adds LS2085a to PCIe compatible to fix the compatibility
> > > issue when using firmware with LS2085a compatible property.
> > > 
> > > Signed-off-by: Minghuan Lian <Minghuan.Lian@freescale.com>
> > > Signed-off-by: Mingkai Hu <Mingkai.Hu@freescale.com>
> > > ---
> > >  Documentation/devicetree/bindings/pci/layerscape-pci.txt |  1 +
> > >  arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi           | 12
> > ++++++++----
> > >  2 files changed, 9 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/pci/layerscape-pci.txt
> > > b/Documentation/devicetree/bindings/pci/layerscape-pci.txt
> > > index e376785..4600007 100644
> > > --- a/Documentation/devicetree/bindings/pci/layerscape-pci.txt
> > > +++ b/Documentation/devicetree/bindings/pci/layerscape-pci.txt
> > > @@ -15,6 +15,7 @@ Required properties:
> > >  - compatible: should contain the platform identifier such as:
> > >          "fsl,ls1021a-pcie", "snps,dw-pcie"
> > >          "fsl,ls2080a-pcie", "snps,dw-pcie"
> > > +        "fsl,ls2085a-pcie", "snps,dw-pcie"
> > >  - reg: base addresses and lengths of the PCIe controller
> > >  - interrupts: A list of interrupt outputs of the controller. Must
> > contain an
> > >    entry for each entry in the interrupt-names property.
> > > diff --git a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
> > > b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
> > > index e81cd48..3821bb1 100644
> > > --- a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
> > > @@ -383,7 +383,8 @@
> > >  		};
> > > 
> > >  		pcie@3400000 {
> > > -			compatible = "fsl,ls2080a-pcie", "snps,dw
> > > -pcie";
> > > +			compatible = "fsl,ls2080a-pcie", "fsl,ls2085a
> > > -pcie",
> > > +				     "snps,dw-pcie";
> > 
> > This doesn't match the doc as to what are valid combinations. The order
> > here seems backwards too. ls2085a is older?
> > 
> 
> Yes, ls2085a was released earlier. You mean the older one comes first? Like:
> 
> compatible = "fsl,ls2085a-pcie", "fsl,ls2080a-pcie",
> 		 "snps,dw-pcie";

No, the more specific one should come first (regardless of when each chip is
older), so the patch is correct as is.

BTW, the changelog doesn't describe the severity of the problem, but without
this change I see a hang in the PCIe controller probe because U-Boot is unable
to mark disabled controllers as disabled.

-Scott
