From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 2/9] clk: mediatek: Add dt-bindings for MT2712 clocks
Date: Thu, 26 Oct 2017 22:23:11 -0500
Message-ID: <20171027032311.2am3x3fbrdxwr5oj@rob-hp-laptop>
References: <1508731840-4231-1-git-send-email-weiyi.lu@mediatek.com>
 <1508731840-4231-3-git-send-email-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1508731840-4231-3-git-send-email-weiyi.lu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Weiyi Lu <weiyi.lu@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@codeaurora.org>, Mike Turquette <mturquette@baylibre.com>, James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, srv_heupstream@mediatek.com
List-Id: devicetree@vger.kernel.org

On Mon, Oct 23, 2017 at 12:10:33PM +0800, Weiyi Lu wrote:
> Add MT2712 clock dt-bindings, include topckgen, apmixedsys,
> infracfg, pericfg, mcucfg and subsystem clocks.
> 
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> ---
>  include/dt-bindings/clock/mt2712-clk.h | 427 +++++++++++++++++++++++++++++++++
>  1 file changed, 427 insertions(+)
>  create mode 100644 include/dt-bindings/clock/mt2712-clk.h

Acked-by: Rob Herring <robh@kernel.org>
