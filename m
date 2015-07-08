From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v2 1/2] clk: mediatek: Fix PLL registers setting flow
Date: Wed, 08 Jul 2015 10:58:55 +0200
Message-ID: <79801022.IfOq8aeLEc@diego>
References: <1436344666-25645-1-git-send-email-jamesjj.liao@mediatek.com> <1436344666-25645-2-git-send-email-jamesjj.liao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1436344666-25645-2-git-send-email-jamesjj.liao@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: James Liao <jamesjj.liao@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, srv_heupstream@mediatek.com, Daniel Kurtz <djkurtz@chromium.org>, Ricky Liang <jcliang@chromium.org>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 8. Juli 2015, 16:37:45 schrieb James Liao:
> Write postdiv and pcw settings at the same time for PLLs if postdiv
> and pcw settings are on the same register.
> 
> This is need by PLLs such as MT8173 MMPLL and ARM*PLL.
> 
> Signed-off-by: James Liao <jamesjj.liao@mediatek.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
