From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v3 2/3] clk: mediatek: Fix calculation of PLL rate
 settings
Date: Fri, 17 Jul 2015 17:47:53 -0700
Message-ID: <20150718004753.GW30412@codeaurora.org>
References: <1436517574-17895-1-git-send-email-jamesjj.liao@mediatek.com>
 <1436517574-17895-3-git-send-email-jamesjj.liao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1436517574-17895-3-git-send-email-jamesjj.liao@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: James Liao <jamesjj.liao@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Mike Turquette <mturquette@baylibre.com>, Heiko Stubner <heiko@sntech.de>, srv_heupstream@mediatek.com, Daniel Kurtz <djkurtz@chromium.org>, Ricky Liang <jcliang@chromium.org>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 07/10, James Liao wrote:
> Avoid u32 overflow when calculate post divider setting, and
> increase the max post divider setting from 3 (/8) to 4 (/16).
> 
> Signed-off-by: James Liao <jamesjj.liao@mediatek.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
