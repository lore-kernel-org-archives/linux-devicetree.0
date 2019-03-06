From: Abel Vesa <abel.vesa@nxp.com>
Subject: Re: [PATCH] dt-bindings: clock: imx8mq: Fix numbering overlaps and
 gaps
Date: Wed, 6 Mar 2019 13:09:42 +0000
Message-ID: <20190306130941.dqf3swx66bchm5k2@fsr-ub1664-175>
References: <1551779342-2640-1-git-send-email-abel.vesa@nxp.com>
 <155181110921.20095.1641360339603928947@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <155181110921.20095.1641360339603928947@swboyd.mtv.corp.google.com>
Content-Language: en-US
Content-ID: <ACE3C48577F71A4580F6C4435A037E26@eurprd04.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, Patrick Wildt <patrick@blueri.se>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On 19-03-05 10:38:29, Stephen Boyd wrote:
> Quoting Abel Vesa (2019-03-05 01:49:16)
> > IMX8MQ_CLK_USB_PHY_REF changes from 163 to 153, this way removing the gap.
> > All the following clock ids are now decreased by 10 to keep the numbering
> > right. Doing this, the IMX8MQ_CLK_CSI2_CORE is not overlapped with
> > IMX8MQ_CLK_GPT1 anymore. IMX8MQ_CLK_GPT1_ROOT changes from 193 to 183 and
> > all the following ids are updated accordingly.
> 
> Why do the numbers need to be consecutive? This looks difficult to merge
> given that the commit that's being "fixed" is in v5.0 and thus the
> integer value of these defines is pretty much an ABI. So if there are
> holes in the space, I suggest we leave them there unless something is
> really wrong or unworkable with that solution.
> 

I would've ignored it but there are a few overlaps.

#define IMX8MQ_CLK_GPT1                        170
overlaps with:
#define IMX8MQ_CLK_CSI2_CORE           170

#define IMX8MQ_CLK_CSI2_PHY_REF                181
overlaps with:
#define IMX8MQ_CLK_ECSPI3_ROOT                 181

#define IMX8MQ_CLK_CSI2_ESC            182
overlaps with:
#define IMX8MQ_CLK_ENET1_ROOT                  182

By removing the gaps, some of the overlaps are also removed.

I can just get rid of the overlaps and keep the gaps if that makes it more ok
for the stability of the ABI.

> BTW, it would be great if the binding header was generated once and then
> never changed again so that we don't have to spend time on these sorts
> of patches in the future. Please try to fully describe each possible clk
> that might be used with a particular binding instead of adding new clk
> ids over time, especially if you have access to the silicon manufacturer
> documentation and can easily figure out all the clks that are there
> beforehand.
> 

Here is an example of why this is not really doable: clk-sccg-pll.c.
The original design was adding the intermediary clocks like:

IMX8MQ_SYS1_PLL1_OUT        
IMX8MQ_SYS1_PLL1_OUT_DIV    
IMX8MQ_SYS1_PLL1_REF_DIV    
IMX8MQ_SYS1_PLL2
IMX8MQ_SYS1_PLL2_DIV  
IMX8MQ_SYS1_PLL2_OUT  

And these were just for SYS1_PLL. There are 2 more SYSx_PLL.
Plus the DRAM_PLL, the VIDEO2_PLL and the AUDIO_PLL.

Since the refactoring of clk-sccg-pll.c, these are not used anymore (or should
not be used). So I would have to remove them, but as you said, it would break
the ABI. And this example goes even further with the fact that the PHY_27M
and the mux between the PHY_27M and the OSC_27 are to be controlled by the
display controller driver itself (at this point the PHY_27M is not yet upstream
and I can't say for sure it will ever be). Basically, what this means is that 
the PHY_27M will have to be exposed as a standalone clock even if it is hidden
behind a mux which has another clock that can provide the same rate. That
is only because there is some difference in phase (AFAIU) between the OSC_27M
and the PHY_27M, at the same rate. And this is just one example.

Point being, there is no way of knowing beforehand what intermediary clocks
are needed, even with the silicon manufacturer documentation, until the
driver that makes use of a specific clock actually works.
