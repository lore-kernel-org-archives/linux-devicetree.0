From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 2/2] clk: mediatek: fix PWM clock source by adding a fixed-factor
 clock
Date: Mon, 19 Mar 2018 13:25:39 -0700
Message-ID: <152149113900.242365.801086554904089563@swboyd.mtv.corp.google.com>
References: <cd26a3bdc9f29e237089395fbba93e28549ddf25.1519874655.git.sean.wang@mediatek.com>
 <b6eafb38f8d697bd8d00c8d86a0b22be809f8062.1519874655.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <b6eafb38f8d697bd8d00c8d86a0b22be809f8062.1519874655.git.sean.wang@mediatek.com>
Sender: stable-owner@vger.kernel.org
To: mark.rutland@arm.com, matthias.bgg@gmail.com, mturquette@baylibre.com, p.zabel@pengutronix.de, robh+dt@kernel.org, sboyd@codeaurora.org
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting sean.wang@mediatek.com (2018-02-28 19:27:51)
> From: Sean Wang <sean.wang@mediatek.com>
> 
> The clock for which all PWM devices on MT7623 or MT2701 actually depending
> on has to be divided by four from its parent clock axi_sel in the clock
> path prior to PWM devices.
> 
> Consequently, adding a fixed-factor clock axisel_d4 as one-fourth of
> clock axi_sel allows that PWM devices can have the correct resolution
> calculation.
> 
> Cc: stable@vger.kernel.org
> Fixes: e9862118272a ("clk: mediatek: Add MT2701 clock support")
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---

Applied to clk-next
