From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v3 3/3] clk: mediatek: Add MT8173 MMPLL change rate
 support
Date: Fri, 17 Jul 2015 17:47:58 -0700
Message-ID: <20150718004758.GX30412@codeaurora.org>
References: <1436517574-17895-1-git-send-email-jamesjj.liao@mediatek.com>
 <1436517574-17895-4-git-send-email-jamesjj.liao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1436517574-17895-4-git-send-email-jamesjj.liao@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: James Liao <jamesjj.liao@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Mike Turquette <mturquette@baylibre.com>, Heiko Stubner <heiko@sntech.de>, srv_heupstream@mediatek.com, Daniel Kurtz <djkurtz@chromium.org>, Ricky Liang <jcliang@chromium.org>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 07/10, James Liao wrote:
> MT8173 MMPLL frequency settings are different from common PLLs.
> It needs different post divider settings for some ranges of frequency.
> This patch add support for MT8173 MMPLL frequency setting by adding
> div-rate table to lookup suitable post divider setting under a
> specified frequency.
> 
> Signed-off-by: James Liao <jamesjj.liao@mediatek.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
