From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 4/7] dt-bindings: clock: reset: Add AXG AO Clock and
 Reset Bindings
Date: Mon, 26 Mar 2018 17:25:06 -0500
Message-ID: <20180326222506.jkn5i7eyto3li3ws@rob-hp-laptop>
References: <20180323143816.200573-1-yixun.lan@amlogic.com>
 <20180323143816.200573-5-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180323143816.200573-5-yixun.lan@amlogic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yixun Lan <yixun.lan@amlogic.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Philipp Zabel <p.zabel@pengutronix.de>, Qiufang Dai <qiufang.dai@amlogic.com>, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 23, 2018 at 10:38:13PM +0800, Yixun Lan wrote:
> Add dt-bindings headers for the Meson-AXG's AO clock and
> reset controller.
> 
> Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
> ---
>  include/dt-bindings/clock/axg-aoclkc.h | 26 ++++++++++++++++++++++++++
>  include/dt-bindings/reset/axg-aoclkc.h | 20 ++++++++++++++++++++
>  2 files changed, 46 insertions(+)
>  create mode 100644 include/dt-bindings/clock/axg-aoclkc.h
>  create mode 100644 include/dt-bindings/reset/axg-aoclkc.h

Reviewed-by: Rob Herring <robh@kernel.org>
