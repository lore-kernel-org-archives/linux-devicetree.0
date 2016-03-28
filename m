From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v6 0/3] Add more clock compatible features and support the RK3399 clock
Date: Mon, 28 Mar 2016 14:59:59 +0200
Message-ID: <4649399.g7v7zsVJik@diego>
References: <1459158697-8218-1-git-send-email-zhengxing@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1459158697-8218-1-git-send-email-zhengxing@rock-chips.com>
Sender: linux-clk-owner@vger.kernel.org
To: Xing Zheng <zhengxing@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org, huangtao@rock-chips.com, jay.xu@rock-chips.com, elaine.zhang@rock-chips.com, dianders@chromium.org, devicetree@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Michael Turquette <mturquette@baylibre.com>, Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am Montag, 28. M=E4rz 2016, 17:51:34 schrieb Xing Zheng:
>   The patch series add support more mux parameters and multiple
> clock providers for the rockchip features of the clock framework,
> and support the clock controller for the RK3399.

applied all 3 for 4.7 with one change:

I've dropped the grf paragraph from the binding doc (as it is not used=20
anymore) and also dropped the gmac_phy_rx_clk input clock.

We can add these back once they are getting used in the future.


Heiko
