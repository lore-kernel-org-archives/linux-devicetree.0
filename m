From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v3 07/12] clk: mediatek: add clk support for MT6797
Date: Fri, 7 Apr 2017 12:41:07 -0700
Message-ID: <20170407194107.GE7065@codeaurora.org>
References: <1489937193-2953-1-git-send-email-mars.cheng@mediatek.com>
 <1489937193-2953-8-git-send-email-mars.cheng@mediatek.com>
 <20170406200852.GQ7065@codeaurora.org>
 <1491521747.17643.6.camel@mtkswgap22>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1491521747.17643.6.camel@mtkswgap22>
Sender: linux-kernel-owner@vger.kernel.org
To: Mars Cheng <mars.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, Michael Turquette <mturquette@baylibre.com>, CC Hwang <cc.hwang@mediatek.com>, Loda Chou <loda.chou@mediatek.com>, Miles Chen <miles.chen@mediatek.com>, Jades Shih <jades.shih@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, My Chuang <my.chuang@mediatek.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, wsd_upstream@mediatek.com, linux-clk@vger.kernel.org, Kevin-CW Chen <kevin-cw.chen@mediatek.com>
List-Id: devicetree@vger.kernel.org

On 04/07, Mars Cheng wrote:
> Hi Stephen
> 
> On Thu, 2017-04-06 at 13:08 -0700, Stephen Boyd wrote:
> > On 03/19, Mars Cheng wrote:
> > > From: Kevin-CW Chen <kevin-cw.chen@mediatek.com>
> > > 
> > > Add MT6797 clock support, include topckgen, apmixedsys, infracfg
> > > and subsystem clocks
> > > 
> > > Signed-off-by: Kevin-CW Chen <kevin-cw.chen@mediatek.com>
> > > Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
> > > Tested-by: Matthias Brugger <matthias.bgg@gmail.com>
> > 
> > Acked-by: Stephen Boyd <sboyd@codeaurora.org>
> > 
> > Looks fine to me except for the one comment below. Did you want
> > me to merge it into clk tree?
> 
> To prevent another run, I really like you to merge it.
> However, I also want to make the patch set more cleaner.
> So I will send v4 later. :-)  

Ok I'll merge v4 patch then.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
