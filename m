From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2 4/4] clk: mediatek: add clocks dt-bindings required
 header for MT7622 SoC
Date: Thu, 2 Nov 2017 01:11:59 -0700
Message-ID: <20171102081159.GE11011@codeaurora.org>
References: <cover.1507174799.git.sean.wang@mediatek.com>
 <7e2a5ac16547f911b00017ba3fad4076dad4d7d8.1507174799.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7e2a5ac16547f911b00017ba3fad4076dad4d7d8.1507174799.git.sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sean.wang@mediatek.com
Cc: mturquette@baylibre.com, robh+dt@kernel.org, matthias.bgg@gmail.com, mark.rutland@arm.com, p.zabel@pengutronix.de, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Chen Zhong <chen.zhong@mediatek.com>
List-Id: devicetree@vger.kernel.org

On 10/05, sean.wang@mediatek.com wrote:
> From: Chen Zhong <chen.zhong@mediatek.com>
> 
> Add the required header for the entire clocks dt-bindings exported
> from topckgen, apmixedsys, infracfg, pericfg, ethsys, pciesys, ssusbsys
> and audsys which could be found on MT7622 SoC.
> 
> Signed-off-by: Chen Zhong <chen.zhong@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---

This should be patch 3 instead of 4 so that patch 3 compiles...

Applied to clk-next.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
