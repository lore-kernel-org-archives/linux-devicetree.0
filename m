From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/5] dt-binding: dwmac-sun8i: add H6 compatible string
 (w/ A64 fallback)
Date: Tue, 31 Jul 2018 14:56:14 -0600
Message-ID: <20180731205614.GA25776@rob-hp-laptop>
References: <20180722053955.25266-1-icenowy@aosc.io>
 <20180722053955.25266-2-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180722053955.25266-2-icenowy@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, "David S. Miller" <davem@davemloft.net>, Corentin Labbe <clabbe@baylibre.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org

On Sun, Jul 22, 2018 at 01:39:51PM +0800, Icenowy Zheng wrote:
> The Allwinner H6 SoC features a Ethernet MAC that is similar to the one
> in A64.
> 
> Add a compatible string for it with A64 fallback compatible string, in
> this case the A64 driver can be used.
> 
> The "internal" PHY is not internal from the perspective of the H6 main
> die, instead it's on the co-packaged AC200 chip, and connected to the
> main die with RMII at the in-package Port A PIO bank. So from the SoC
> driver side it needs no special treatment.
> 
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
>  Documentation/devicetree/bindings/net/dwmac-sun8i.txt | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Rob Herring <robh@kernel.org>
