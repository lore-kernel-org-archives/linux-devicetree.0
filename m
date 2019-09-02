From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V3 08/10] dt-bindings: interconnect: add MT8183
 interconnect dt-bindings
Date: Mon, 02 Sep 2019 14:38:46 +0100
Message-ID: <20190902033045.GA10734@bogus>
References: <1566995328-15158-1-git-send-email-henryc.chen@mediatek.com>
 <1566995328-15158-9-git-send-email-henryc.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1566995328-15158-9-git-send-email-henryc.chen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Henry Chen <henryc.chen@mediatek.com>
Cc: Georgi Djakov <georgi.djakov@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <swboyd@chromium.org>, Ryan Case <ryandcase@chromium.org>, Nicolas Boichat <drinkcat@google.com>, Fan Chen <fan.chen@mediatek.com>, James Liao <jamesjj.liao@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 28, 2019 at 08:28:46PM +0800, Henry Chen wrote:
> Add interconnect provider dt-bindings for MT8183.
> 
> Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
> ---
>  .../devicetree/bindings/soc/mediatek/dvfsrc.txt        |  9 +++++++++
>  include/dt-bindings/interconnect/mtk,mt8183-emi.h      | 18 ++++++++++++++++++
>  2 files changed, 27 insertions(+)
>  create mode 100644 include/dt-bindings/interconnect/mtk,mt8183-emi.h
> 
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/dvfsrc.txt b/Documentation/devicetree/bindings/soc/mediatek/dvfsrc.txt
> index 7f43499..da98ec9 100644
> --- a/Documentation/devicetree/bindings/soc/mediatek/dvfsrc.txt
> +++ b/Documentation/devicetree/bindings/soc/mediatek/dvfsrc.txt
> @@ -12,6 +12,11 @@ Required Properties:
>  - clock-names: Must include the following entries:
>  	"dvfsrc": DVFSRC module clock
>  - clocks: Must contain an entry for each entry in clock-names.
> +- #interconnect-cells : should contain 1
> +- interconnect : interconnect providers support dram bandwidth requirements.
> +	The provider is able to communicate with the DVFSRC and send the dram
> +	bandwidth to it. shall contain only one of the following:
> +	"mediatek,mt8183-emi"
>  
>  Example:
>  
> @@ -20,4 +25,8 @@ Example:
>  		reg = <0 0x10012000 0 0x1000>;
>  		clocks = <&infracfg CLK_INFRA_DVFSRC>;
>  		clock-names = "dvfsrc";
> +		ddr_emi: interconnect {

The EMI is a sub-module in the DVFSRC? This is the DDR controller or 
something else?


> +			compatible = "mediatek,mt8183-emi";
> +			#interconnect-cells = <1>;
> +		};
>  	};
