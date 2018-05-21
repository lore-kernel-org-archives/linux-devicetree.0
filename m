Return-Path: <SRS0=BimZ=II=linaro.org=vinod.koul@kernel.org>
Date: Mon, 21 May 2018 14:39:25 +0530
From: Vinod Koul <vinod.koul@linaro.org>
Subject: Re: [v4 2/6] dmaengine: fsl-qdma: Add qDMA controller driver for
 Layerscape SoCs
Message-ID: <20180521090925.GA14654@vkoul-mobl>
References: <20180514120307.15592-1-wen.he_1@nxp.com>
 <20180514120307.15592-2-wen.he_1@nxp.com>
 <20180517060430.GU13271@vkoul-mobl>
 <DB6PR0401MB2503E7EEB3C97028AD131C7CE2910@DB6PR0401MB2503.eurprd04.prod.outlook.com>
 <20180518042125.GE2932@vkoul-mobl>
 <DB6PR0401MB250380A95367C42C1BC79595E2900@DB6PR0401MB2503.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB6PR0401MB250380A95367C42C1BC79595E2900@DB6PR0401MB2503.eurprd04.prod.outlook.com>
To: Wen He <wen.he_1@nxp.com>
Cc: "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Leo Li <leoyang.li@nxp.com>, Jiafei Pan <jiafei.pan@nxp.com>, Jiaheng Fan <jiaheng.fan@nxp.com>
List-ID: <devicetree@vger.kernel.org>

On 18-05-18, 10:04, Wen He wrote:

> > > > > +u64 pre_addr, pre_queue;
> > > >
> > > > why do we have a global?
> > >
> > > Let's us see qDMA that how is works?
> > >
> > > First, the status notification for DMA jobs are reported back to the status
> > queue.
> > > Status information is carried within the command descriptor
> > > status/command field, bits 120-127. The command descriptor dequeue
> > > pointer advances only after the transaction has completed and the status
> > information field has been updated.
> > >
> > > Then, the command descriptor address field wiil pointer to the command
> > > descriptor in its original format. It is the responsibity of the
> > > address of the status queue consumer to deallocate buffers as needed when
> > the command descriptor address pointer is non-zero.
> > >
> > > More details of the Status Queue can be found in QorIQ Layerscape Soc
> > datasheet.
> > >
> > > So, these variable is used to record latest value that command
> > > descriptor queue and status field.
> > >
> > > Every time variables value is zero when set these variable to local, that's not
> > what I want.
> > 
> > Why not store them in driver context?
> > 
> 
> okay, maybe I should remove these variable to private struct?

Yes that would be better

> > > > > +			memset(sg_block->virt_addr, 0,
> > > > > +					FSL_QDMA_EXPECT_SG_ENTRY_NUM * 16);
> > > >
> > > > why FSL_QDMA_EXPECT_SG_ENTRY_NUM * 16? and not what you
> > allocated?
> > > >
> > >
> > > see line 497.
> > > The sg_pool buffer size created is FSL_QDMA_EXPECT_SG_ENTRY_NUM *
> > 16.
> > 
> > Please document this
> > 
> Add comment to this?

yup, explaining where 16 is coming from
-- 
~Vinod
