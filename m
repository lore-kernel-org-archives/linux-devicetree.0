From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v7 7/9] clk: mediatek: Enable critical clocks for MT2701
Date: Fri, 6 May 2016 16:12:29 -0700
Message-ID: <20160506231229.GJ3492@codeaurora.org>
References: <1460621514-65191-1-git-send-email-jamesjj.liao@mediatek.com>
 <1460621514-65191-8-git-send-email-jamesjj.liao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1460621514-65191-8-git-send-email-jamesjj.liao@mediatek.com>
Sender: linux-clk-owner@vger.kernel.org
To: James Liao <jamesjj.liao@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Mike Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, John Crispin <blogic@openwrt.org>, Arnd Bergmann <arnd@arndb.de>, Sascha Hauer <kernel@pengutronix.de>, Daniel Kurtz <djkurtz@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, srv_heupstream@mediatek.com
List-Id: devicetree@vger.kernel.org

On 04/14, James Liao wrote:
> Some system clocks should be turned on by default on MT2701.
> This patch enable these clocks when related clocks have
> been registered.
> 
> Signed-off-by: James Liao <jamesjj.liao@mediatek.com>
> ---

critical clks got merged now (sorry I'm slowly getting back to
looking at patches). Please use that flag.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
