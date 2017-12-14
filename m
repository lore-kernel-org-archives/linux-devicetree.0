From: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH v7 6/6] arm64: dts: meson-axg: switch uart_ao clock to
 CLK81
Date: Thu, 14 Dec 2017 17:47:31 +0100
Message-ID: <1513270051.2261.11.camel@baylibre.com>
References: <20171211141348.22048-1-yixun.lan@amlogic.com>
         <20171211141348.22048-7-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171211141348.22048-7-yixun.lan@amlogic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yixun Lan <yixun.lan@amlogic.com>, Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Carlo Caione <carlo@caione.org>, Qiufang Dai <qiufang.dai@amlogic.com>, Jian Hu <jian.hu@amlogic.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 2017-12-11 at 22:13 +0800, Yixun Lan wrote:
> Switch the uart_ao pclk to CLK81 since the clock driver is ready.
> Also move the clock info to the board.dts instead in the soc.dtsi.

Same comment as for ethmac, is it really wise ?
Isn't the clock setup the same for the axg family ?

> 
> Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
