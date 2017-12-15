From: Yixun Lan <yixun.lan@amlogic.com>
Subject: Re: [PATCH v7 6/6] arm64: dts: meson-axg: switch uart_ao clock to
 CLK81
Date: Fri, 15 Dec 2017 09:49:11 +0800
Message-ID: <b4e29e22-c0e9-1085-fbb7-eabc5c361445@amlogic.com>
References: <20171211141348.22048-1-yixun.lan@amlogic.com>
 <20171211141348.22048-7-yixun.lan@amlogic.com>
 <1513270051.2261.11.camel@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1513270051.2261.11.camel@baylibre.com>
Sender: linux-clk-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: yixun.lan@amlogic.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Carlo Caione <carlo@caione.org>, Qiufang Dai <qiufang.dai@amlogic.com>, Jian Hu <jian.hu@amlogic.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 12/15/17 00:47, Jerome Brunet wrote:
> On Mon, 2017-12-11 at 22:13 +0800, Yixun Lan wrote:
>> Switch the uart_ao pclk to CLK81 since the clock driver is ready.
>> Also move the clock info to the board.dts instead in the soc.dtsi.
> 
> Same comment as for ethmac, is it really wise ?
> Isn't the clock setup the same for the axg family ?
> 
HI Jerome:
yes, should be same for AXG family


HI Kevin:
could you take the patch [5/6]? then I just need to resend for this one


Yixun
