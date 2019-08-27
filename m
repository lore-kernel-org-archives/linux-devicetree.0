From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 09/11] clk: mediatek: Add dt-bindings for MT6779 clocks
Date: Tue, 27 Aug 2019 11:53:07 -0500
Message-ID: <20190827165307.GA29782@bogus>
References: <1566206502-4347-1-git-send-email-mars.cheng@mediatek.com>
 <1566206502-4347-10-git-send-email-mars.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1566206502-4347-10-git-send-email-mars.cheng@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mars Cheng <mars.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, CC Hwang <cc.hwang@mediatek.com>, Loda Chou <loda.chou@mediatek.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, wsd_upstream@mediatek.com, mtk01761 <wendell.lin@mediatek.com>, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 19 Aug 2019 17:21:40 +0800, Mars Cheng wrote:
> From: mtk01761 <wendell.lin@mediatek.com>
> 
> Add MT6779 clock dt-bindings, include topckgen, apmixedsys,
> infracfg, and subsystem clocks.
> 
> Signed-off-by: mtk01761 <wendell.lin@mediatek.com>
> ---
>  include/dt-bindings/clock/mt6779-clk.h |  436 ++++++++++++++++++++++++++++++++
>  1 file changed, 436 insertions(+)
>  create mode 100644 include/dt-bindings/clock/mt6779-clk.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
