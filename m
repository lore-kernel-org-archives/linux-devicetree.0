From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: net: meson-dwmac: new compatible
 name for AXG SoC
Date: Tue, 1 May 2018 07:55:19 -0500
Message-ID: <20180501125519.GA14984@rob-hp-laptop>
References: <20180428102111.18384-1-yixun.lan@amlogic.com>
 <20180428102111.18384-2-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180428102111.18384-2-yixun.lan@amlogic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yixun Lan <yixun.lan@amlogic.com>
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, Apr 28, 2018 at 10:21:10AM +0000, Yixun Lan wrote:
> We need to introduce a new compatible name for the Meson-AXG SoC
> in order to support the RMII 100M ethernet PHY, since the PRG_ETH0
> register of the dwmac glue layer is changed from previous old SoC.
> 
> Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
> ---
>  Documentation/devicetree/bindings/net/meson-dwmac.txt | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Rob Herring <robh@kernel.org>
