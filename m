From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH net-next v2 03/15] dt-bindings: net: dwmac-sun8i: Clean
 up clock delay chain descriptions
Date: Tue, 1 May 2018 11:26:15 -0500
Message-ID: <20180501162615.GA11761@rob-hp-laptop>
References: <20180501161227.2110-1-wens@csie.org>
 <20180501161227.2110-4-wens@csie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180501161227.2110-4-wens@csie.org>
Sender: netdev-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Mark Rutland <mark.rutland@arm.com>, Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, netdev@vger.kernel.org, Corentin Labbe <clabbe.montjoie@gmail.com>, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org

On Wed, May 02, 2018 at 12:12:15AM +0800, Chen-Yu Tsai wrote:
> The clock delay chains found in the glue layer for dwmac-sun8i are only
> used with RGMII PHYs. They are not intended for non-RGMII PHYs, such as
> MII external PHYs or the internal PHY. Also, a recent SoC has a smaller
> range of possible values for the delay chain.
> 
> This patch reformats the delay chain section of the device tree binding
> to make it clear that the delay chains only apply to RGMII PHYs, and
> make it easier to add the R40-specific bits later.
> 
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  Documentation/devicetree/bindings/net/dwmac-sun8i.txt | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
