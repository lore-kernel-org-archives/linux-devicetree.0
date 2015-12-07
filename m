From: Hu Vincent <Mingkai.Hu@freescale.com>
Subject: RE: [PATCH v2] dts/ls2080a: Update PCIe compatible
Date: Mon, 7 Dec 2015 08:44:19 +0000
Message-ID: <BY2PR03MB3169DD34DF302BCF7A60FF284090@BY2PR03MB316.namprd03.prod.outlook.com>
References: <1449224417-20753-1-git-send-email-Mingkai.Hu@freescale.com>
 <20151204162243.GA12415@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20151204162243.GA12415@rob-hp-laptop>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "arm@kernel.org" <arm@kernel.org>, Li Leo <LeoLi@freescale.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "Lian M.H." <Minghuan.Lian@freescale.com>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Rob Herring [mailto:robh@kernel.org]
> Sent: Saturday, December 05, 2015 12:23 AM
> To: Hu Mingkai-B21284
> Cc: arm@kernel.org; devicetree@vger.kernel.org; Li Yang-Leo-R58472;
> linux-arm-kernel@lists.infradead.org; Lian Minghuan-B31939
> Subject: Re: [PATCH v2] dts/ls2080a: Update PCIe compatible
> 
> On Fri, Dec 04, 2015 at 06:20:17PM +0800, Mingkai Hu wrote:
> > From: Minghuan Lian <Minghuan.Lian@freescale.com>
> >
> > The patch adds LS2085a to PCIe compatible to fix the compatibility
> > issue when using firmware with LS2085a compatible property.
> >
> > Signed-off-by: Minghuan Lian <Minghuan.Lian@freescale.com>
> > Signed-off-by: Mingkai Hu <Mingkai.Hu@freescale.com>
> > ---
> > v2 change:
> >  - Rebased to latest kernel base
> 
> How about implementing my comments on v1, too?
> 

Hi Rob,

Do you mean to change the combinations in layerscape-pci.txt as follows?

> --- a/Documentation/devicetree/bindings/pci/layerscape-pci.txt
> +++ b/Documentation/devicetree/bindings/pci/layerscape-pci.txt
> @@ -15,6 +15,7 @@ Required properties:
>  - compatible: should contain the platform identifier such as:
>          "fsl,ls1021a-pcie", "snps,dw-pcie"
> -        "fsl,ls2080a-pcie", "snps,dw-pcie"
> +        "fsl,ls2080a-pcie", "fsl,ls2085a-pcie", "snps,dw-pcie"


And the ls2085a was released first, but the dts file is for ls2080a (fsl-ls2080a.dtsi),
So I prefer to put the ls2080a as the first compatible string. How about your suggestion?

Thanks,
Mingkai
