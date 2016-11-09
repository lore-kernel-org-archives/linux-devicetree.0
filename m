From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v15 2/4] reset: mediatek: Add MT2701 reset driver
Date: Tue, 8 Nov 2016 16:01:20 -0800
Message-ID: <20161109000120.GQ16026@codeaurora.org>
References: <1478245388-1412-1-git-send-email-erin.lo@mediatek.com>
 <1478245388-1412-3-git-send-email-erin.lo@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1478245388-1412-3-git-send-email-erin.lo@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Erin Lo <erin.lo@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Mike Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Sascha Hauer <kernel@pengutronix.de>, Daniel Kurtz <djkurtz@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, srv_heupstream@mediatek.com, ms.chen@mediatek.com, robert.chou@mediatek.com, Shunli Wang <shunli.wang@mediatek.com>, James Liao <jamesjj.liao@mediatek.com>
List-Id: devicetree@vger.kernel.org

On 11/04, Erin Lo wrote:
> From: Shunli Wang <shunli.wang@mediatek.com>
> 
> In infrasys and perifsys, there are many reset
> control bits for kinds of modules. These bits are
> used as actual reset controllers to be registered
> into kernel's generic reset controller framework.
> 
> Signed-off-by: Shunli Wang <shunli.wang@mediatek.com>
> Signed-off-by: James Liao <jamesjj.liao@mediatek.com>
> Signed-off-by: Erin Lo <erin.lo@mediatek.com>
> Tested-by: John Crispin <blogic@openwrt.org>
> Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
