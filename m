From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH V1 0/9] add clock driver for Spreadtrum platforms
Date: Mon, 19 Jun 2017 18:25:30 -0700
Message-ID: <20170620012530.GG4493@codeaurora.org>
References: <20170618015855.27738-1-chunyan.zhang@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170618015855.27738-1-chunyan.zhang@spreadtrum.com>
Sender: linux-clk-owner@vger.kernel.org
To: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Xiaolong Zhang <xiaolong.zhang@spreadtrum.com>, Orson Zhai <orson.zhai@spreadtrum.com>, Geng Ren <geng.ren@spreadtrum.com>, Chunyan Zhang <zhang.lyra@gmail.com>
List-Id: devicetree@vger.kernel.org

On 06/18, Chunyan Zhang wrote:
> In the last cycle, the patches support Whale2 sc9860 mobile chip have been
> merged. This patchset adds clock driver which is used on almost all
> Spreadtrum SoCs.
> 
> This is a rewrite of Spreadtrum's original clock driver[1] according to the
> comments[2] from Stephen Boyd.
> 
> This series also adds Spreadtrum clock binding documentation and devicetree
> data.
> 
> Any comments would be greatly appreciated.

Overall it seems to copy quite a bit of code from sunxi-ng, which
is OK, but if that's just copy/paste + replace some names then
perhaps we should consolidate the two implementations into one
that both SoCs can use.

Also, is there any reason why we can't use a platform device
driver for this instead of the DT probing mechanism? That is more
preferred method of probing clk controllers.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
