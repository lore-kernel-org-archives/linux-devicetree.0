From: Shaohui Xie <shaohui.xie@nxp.com>
Subject: RE: [PATCH] ARM64: dts: add LS1043a-QDS board support
Date: Thu, 24 Dec 2015 07:27:22 +0000
Message-ID: <VI1PR04MB1664F592304E4539A1D6DEA5E8E70@VI1PR04MB1664.eurprd04.prod.outlook.com>
References: <1450935037-42930-1-git-send-email-Zhiqiang.Hou@freescale.com>
 <1450935615.18314.125.camel@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1450935615.18314.125.camel@freescale.com>
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
To: Scott Wood <scottwood@freescale.com>, Zhiqiang Hou <Zhiqiang.Hou@freescale.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>
Cc: "Mingkai.Hu@freescale.com" <Mingkai.Hu@freescale.com>, "Shaohui.Xie@freescale.com" <Shaohui.Xie@freescale.com>
List-Id: devicetree@vger.kernel.org

> -----Original Message-----
> From: Scott Wood [mailto:scottwood@freescale.com]
> Sent: Thursday, December 24, 2015 1:40 PM
> To: Zhiqiang Hou; devicetree@vger.kernel.org; robh+dt@kernel.org;
> mark.rutland@arm.com; pawel.moll@arm.com; ijc+devicetree@hellion.org.uk;
> galak@codeaurora.org; linux-arm-kernel@lists.infradead.org;
> catalin.marinas@arm.com; will.deacon@arm.com
> Cc: Mingkai.Hu@freescale.com; Shaohui.Xie@freescale.com
> Subject: Re: [PATCH] ARM64: dts: add LS1043a-QDS board support
> 
> On Thu, 2015-12-24 at 13:30 +0800, Zhiqiang Hou wrote:
> > +/dts-v1/;
> > +/include/ "fsl-ls1043a.dtsi"
> > +
> > +/ {
> > +	model = "LS1043A QDS Board";
> > +
> 
> compatible?
Hello Scott,

There is Serdes module on some ARM64 SoCs, e.g. LS2080A and LS1043A,
Seems serdes node has not been added in DTS of the two SoCs.

There are serdes nodes on some powerpc SoCs, e.g. t4240si-post.dtsi:

        serdes: serdes@ea000 {
                compatible = "fsl,t4240-serdes";
                reg        = <0xea000 0x4000>;
        };

Could the similar serdes node be added for ARM64 SoCs, like below?

        serdes: serdes@1ea0000 {
                compatible = "fsl,ls1043a-serdes";
                reg        = <0x1ea0000 0x2000>;
        };

Thanks,
Shaohui
