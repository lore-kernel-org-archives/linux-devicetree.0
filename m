From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v11 2/9] clk: mediatek: Refine the makefile to support
 multiple clock drivers
Date: Fri, 19 Aug 2016 12:46:26 -0700
Message-ID: <20160819194626.GD6502@codeaurora.org>
References: <1471584896-9986-1-git-send-email-erin.lo@mediatek.com>
 <1471584896-9986-3-git-send-email-erin.lo@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1471584896-9986-3-git-send-email-erin.lo@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Erin Lo <erin.lo@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Mike Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Sascha Hauer <kernel@pengutronix.de>, Daniel Kurtz <djkurtz@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, srv_heupstream@mediatek.com, James Liao <jamesjj.liao@mediatek.com>, Shunli Wang <shunli.wang@mediatek.com>
List-Id: devicetree@vger.kernel.org

On 08/19, Erin Lo wrote:
> From: James Liao <jamesjj.liao@mediatek.com>
> 
> Add a Kconfig to define clock configuration for each SoC, and
> modify the Makefile to build drivers that only selected in config.
> 
> Signed-off-by: Shunli Wang <shunli.wang@mediatek.com>
> Signed-off-by: James Liao <jamesjj.liao@mediatek.com>
> Signed-off-by: Erin Lo <erin.lo@mediatek.com>
> Tested-by: John Crispin <blogic@openwrt.org>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
