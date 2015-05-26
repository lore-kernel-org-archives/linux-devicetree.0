From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 1/5] clk: mediatek: Fix apmixedsys clock registration
Date: Tue, 26 May 2015 09:42:55 +0200
Message-ID: <20150526074255.GD6325@pengutronix.de>
References: <1432192376-6712-1-git-send-email-jamesjj.liao@mediatek.com>
 <1432192376-6712-2-git-send-email-jamesjj.liao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1432192376-6712-2-git-send-email-jamesjj.liao@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: James Liao <jamesjj.liao@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, srv_heupstream@mediatek.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Kurtz <djkurtz@chromium.org>, Ricky Liang <jcliang@chromium.org>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Henry Chen <henryc.chen@mediatek.com>, Sascha Hauer <kernel@pengutronix.de>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Eddie Huang <eddie.huang@mediatek.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, May 21, 2015 at 03:12:52PM +0800, James Liao wrote:
> The size of clk_data should be the same as CLK_APMIXED_NR_CLK
> instead of ARRAY_SIZE(plls). CLK_APMIXED_* is numbered from 1, so
> CLK_APMIXED_NR_CLK will be greater than ARRAY_SIZE(plls).
> 
> Signed-off-by: James Liao <jamesjj.liao@mediatek.com>

Acked-by: Sascha Hauer <s.hauer@pengutronix.de>

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
