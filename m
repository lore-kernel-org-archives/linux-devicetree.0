From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 2/4] clk: meson-axg: add clocks dt-bindings required
 header
Date: Thu, 7 Dec 2017 16:10:14 -0600
Message-ID: <20171207221014.6qwcb43w5hms4ma5@rob-hp-laptop>
References: <20171207095300.15384-1-yixun.lan@amlogic.com>
 <20171207095300.15384-3-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171207095300.15384-3-yixun.lan@amlogic.com>
Sender: linux-clk-owner@vger.kernel.org
To: Yixun Lan <yixun.lan@amlogic.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Carlo Caione <carlo@caione.org>, Qiufang Dai <qiufang.dai@amlogic.com>, Jian Hu <jian.hu@amlogic.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Dec 07, 2017 at 05:52:58PM +0800, Yixun Lan wrote:
> From: Qiufang Dai <qiufang.dai@amlogic.com>
> 
> Add the required header for the clocks ID dt-bindings
> exported from various subsystem in the Meson-AXG SoC.
> 
> Signed-off-by: Qiufang Dai <qiufang.dai@amlogic.com>
> Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
> ---
>  include/dt-bindings/clock/axg-clkc.h | 71 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 include/dt-bindings/clock/axg-clkc.h

Please add acks when posting new versions.

Rob
