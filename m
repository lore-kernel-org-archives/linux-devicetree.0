From: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH v2 1/2] clk: meson-axg: add pcie and mipi clock bindings
Date: Tue, 03 Jul 2018 11:20:40 +0200
Message-ID: <1530609640.2900.184.camel@baylibre.com>
References: <20180702213118.19222-1-yixun.lan@amlogic.com>
         <20180702213118.19222-2-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180702213118.19222-2-yixun.lan@amlogic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yixun Lan <yixun.lan@amlogic.com>, Neil Armstrong <narmstrong@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Qiufang Dai <qiufang.dai@amlogic.com>, Jian Hu <jian.hu@amlogic.com>, Jianxin Qin <jianxin.qin@amlogic.com>, linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 2018-07-02 at 21:31 +0000, Yixun Lan wrote:
> Add the pcie and mipi clock dt-bindings for the pcie driver.
> 
> Since the mipi clock isalso used by the pcie driver,
> we add it together in this patch.
> 
> Tested-by: Jianxin Qin <jianxin.qin@amlogic.com>
> Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
> ---
>  include/dt-bindings/clock/axg-clkc.h | 3 +++
>  1 file changed, 3 insertions(+)

Applied. Thx
