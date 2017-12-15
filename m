From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH net-next v5 1/4] phylib: Add device reset delay support
Date: Fri, 15 Dec 2017 16:17:52 -0600
Message-ID: <20171215221752.42sz53izxeebkfuq@rob-hp-laptop>
References: <20171211121700.10200-1-dev@g0hl1n.net>
 <20171211121700.10200-2-dev@g0hl1n.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171211121700.10200-2-dev@g0hl1n.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Leitner <dev@g0hl1n.net>
Cc: mark.rutland@arm.com, fugang.duan@nxp.com, andrew@lunn.ch, f.fainelli@gmail.com, frowand.list@gmail.com, davem@davemloft.net, geert+renesas@glider.be, sergei.shtylyov@cogentembedded.com, baruch@tkos.co.il, david.wu@rock-chips.com, lukma@denx.de, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, richard.leitner@skidata.com
List-Id: devicetree@vger.kernel.org

On Mon, Dec 11, 2017 at 01:16:57PM +0100, Richard Leitner wrote:
> From: Richard Leitner <richard.leitner@skidata.com>
> 
> Some PHYs need a minimum time after the reset gpio was asserted and/or
> deasserted. To ensure we meet these timing requirements add two new
> optional devicetree parameters for the phy: reset-delay-us and
> reset-post-delay-us.
> 
> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/net/phy.txt | 10 ++++++++++
>  drivers/net/phy/mdio_device.c                 | 13 +++++++++++--
>  drivers/of/of_mdio.c                          |  4 ++++
>  include/linux/mdio.h                          |  2 ++
>  4 files changed, 27 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/phy.txt b/Documentation/devicetree/bindings/net/phy.txt
> index c05479f5ac7c..72860ce7f610 100644
> --- a/Documentation/devicetree/bindings/net/phy.txt
> +++ b/Documentation/devicetree/bindings/net/phy.txt
> @@ -55,6 +55,12 @@ Optional Properties:
>  
>  - reset-gpios: The GPIO phandle and specifier for the PHY reset signal.
>  
> +- reset-delay-us: Delay after the reset was asserted in microseconds.
> +  If this property is missing the delay will be skipped.
> +
> +- reset-post-delay-us: Delay after the reset was deasserted in microseconds.
> +  If this property is missing the delay will be skipped.

I think these names could be clearer as to exactly what they mean. 
Looking at existing properties with "reset-delay" there's a mixture of 
definitions whether it is the assert time or the time after deassert.

So I'd call these "reset-assert-us" and "reset-deassert-us".

Rob
