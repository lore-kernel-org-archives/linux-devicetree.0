From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 1/5] clk: mediatek: Fix apmixedsys clock registration
Date: Thu, 4 Jun 2015 14:07:22 -0700
Message-ID: <20150604210722.GN676@codeaurora.org>
References: <1432192376-6712-1-git-send-email-jamesjj.liao@mediatek.com>
 <1432192376-6712-2-git-send-email-jamesjj.liao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1432192376-6712-2-git-send-email-jamesjj.liao@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: James Liao <jamesjj.liao@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Mike Turquette <mturquette@linaro.org>, srv_heupstream@mediatek.com, Eddie Huang <eddie.huang@mediatek.com>, Henry Chen <henryc.chen@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Daniel Kurtz <djkurtz@chromium.org>, Ricky Liang <jcliang@chromium.org>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 05/21, James Liao wrote:
> The size of clk_data should be the same as CLK_APMIXED_NR_CLK
> instead of ARRAY_SIZE(plls). CLK_APMIXED_* is numbered from 1, so
> CLK_APMIXED_NR_CLK will be greater than ARRAY_SIZE(plls).
> 
> Signed-off-by: James Liao <jamesjj.liao@mediatek.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
