Return-Path: <vkoul@kernel.org>
Date: Tue, 29 May 2018 15:51:21 +0530
From: Vinod <vkoul@kernel.org>
Subject: Re: [v5 1/6] dmaengine: fsldma: Replace DMA_IN/OUT by FSL_DMA_IN/OUT
Message-ID: <20180529102121.GK5666@vkoul-mobl>
References: <20180525111920.24498-1-wen.he_1@nxp.com>
 <20180529044925.GD5666@vkoul-mobl>
 <AM6PR0402MB3382F1DC777AD2AB106C57EEE26D0@AM6PR0402MB3382.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM6PR0402MB3382F1DC777AD2AB106C57EEE26D0@AM6PR0402MB3382.eurprd04.prod.outlook.com>
To: Wen He <wen.he_1@nxp.com>
Cc: "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Leo Li <leoyang.li@nxp.com>, Jiafei Pan <jiafei.pan@nxp.com>, Jiaheng Fan <jiaheng.fan@nxp.com>
List-ID: <devicetree@vger.kernel.org>

On 29-05-18, 10:14, Wen He wrote:
> > 
> > Well that patch seems to do a bit more than replace DMA_IN/OUT by
> > FSL_DMA_IN/OUT care to explain those. best would be to do a patch which
> > does replace and then add new things in separate patch, easier to review
> > 
> 
> What does means?
> This also a patch.

You cna do only replace DMA_IN/OUT by FSL_DMA_IN/OUT in this patch. Second patch
can add additional macros you have added and explain what they do and why they
are needed

-- 
~Vinod
