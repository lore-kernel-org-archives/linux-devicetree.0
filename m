From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 7/7] dt-bindings: fsl-qdma: Add NXP Layerscpae qDMA
 controller bindings
Date: Fri, 12 Oct 2018 06:31:46 -0500
Message-ID: <20181012113146.GA11432@bogus>
References: <20181011094655.45707-1-peng.ma@nxp.com>
 <20181011094655.45707-7-peng.ma@nxp.com>
 <20181011220845.GA20860@bogus>
 <VI1PR04MB44310889ACCA73AFB29CAEEFEDE20@VI1PR04MB4431.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <VI1PR04MB44310889ACCA73AFB29CAEEFEDE20@VI1PR04MB4431.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peng Ma <peng.ma@nxp.com>
Cc: "vkoul@kernel.org" <vkoul@kernel.org>, Leo Li <leoyang.li@nxp.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "zw@zh-kernel.org" <zw@zh-kernel.org>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Jiafei Pan <jiafei.pan@nxp.com>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 12, 2018 at 02:25:25AM +0000, Peng Ma wrote:
> Hi Rob,
> 
> > -----Original Message-----
> > From: Rob Herring [mailto:robh@kernel.org]
> > Sent: 2018年10月12日 6:09
> > To: Peng Ma <peng.ma@nxp.com>
> > Cc: vkoul@kernel.org; Leo Li <leoyang.li@nxp.com>; mark.rutland@arm.com;
> > shawnguo@kernel.org; dan.j.williams@intel.com; zw@zh-kernel.org;
> > dmaengine@vger.kernel.org; devicetree@vger.kernel.org;
> > linux-kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> > linuxppc-dev@lists.ozlabs.org
> > Subject: Re: [PATCH 7/7] dt-bindings: fsl-qdma: Add NXP Layerscpae qDMA
> > controller bindings
> > 
> > On Thu, Oct 11, 2018 at 05:46:55PM +0800, Peng Ma wrote:
> > > Document the devicetree bindings for NXP Layerscape qDMA controller
> > > which could be found on NXP QorIQ Layerscape SoCs.
> > >
> > > Signed-off-by: Peng Ma <peng.ma@nxp.com>
> > 
> > What happened to the version from Wen He that was on v7 and that I already
> > gave my Reviewed-by on?
> 
> [Peng Ma] the dma owner is changed and qdma driver made some changes, so I need send those patch again to review!

That's no reason to make changes or drop the original author. You should 
also indicate this is v9 and provide revision history.

Rob
