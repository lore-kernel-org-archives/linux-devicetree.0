From: James Liao <jamesjj.liao@mediatek.com>
Subject: Re: [PATCH v7 7/9] clk: mediatek: Enable critical clocks for MT2701
Date: Mon, 9 May 2016 13:40:26 +0800
Message-ID: <1462772426.5344.7.camel@mtksdaap41>
References: <1460621514-65191-1-git-send-email-jamesjj.liao@mediatek.com>
	 <1460621514-65191-8-git-send-email-jamesjj.liao@mediatek.com>
	 <20160506231229.GJ3492@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20160506231229.GJ3492@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Mike Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, John Crispin <blogic@openwrt.org>, Arnd Bergmann <arnd@arndb.de>, Sascha Hauer <kernel@pengutronix.de>, Daniel Kurtz <djkurtz@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, srv_heupstream@mediatek.com
List-Id: devicetree@vger.kernel.org

Hi Stephen,

On Fri, 2016-05-06 at 16:12 -0700, Stephen Boyd wrote:
> On 04/14, James Liao wrote:
> > Some system clocks should be turned on by default on MT2701.
> > This patch enable these clocks when related clocks have
> > been registered.
> > 
> > Signed-off-by: James Liao <jamesjj.liao@mediatek.com>
> > ---
> 
> critical clks got merged now (sorry I'm slowly getting back to
> looking at patches). Please use that flag.

I don't see critical clock support in v4.6-rc7. Is there a repo/branch
that has critical clocks merged?


Best regards,

James

