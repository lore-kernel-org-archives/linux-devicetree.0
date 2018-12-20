From: Rob Herring <robh@kernel.org>
Subject: Re: [resend PATCH v1 1/2] dt-bindings: clock: add clock for MT2712
Date: Thu, 20 Dec 2018 14:43:59 -0600
Message-ID: <20181220204359.GA30122@bogus>
References: <20181214020417.2871-1-weiyi.lu@mediatek.com>
 <20181214020417.2871-3-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181214020417.2871-3-weiyi.lu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@codeaurora.org>, James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, srv_heupstream@mediatek.com, Weiyi Lu <weiyi.lu@mediatek.com>
List-Id: devicetree@vger.kernel.org

On Fri, 14 Dec 2018 10:04:16 +0800, Weiyi Lu wrote:
> Add new clock according to 3rd ECO design change.
> It's the parent clock of audio clock mux.
> 
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> ---
>  include/dt-bindings/clock/mt2712-clk.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
