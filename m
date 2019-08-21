From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 02/19] dt-bindings: arm: mrvl: Document MMP3 compatible
 string
Date: Wed, 21 Aug 2019 16:03:49 -0500
Message-ID: <20190821210349.GA29732@bogus>
References: <20190809093158.7969-1-lkundrak@v3.sk>
 <20190809093158.7969-3-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190809093158.7969-3-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Lubomir Rintel <lkundrak@v3.sk>
Cc: Olof Johansson <olof@lixom.net>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Aug 09, 2019 at 11:31:41AM +0200, Lubomir Rintel wrote:
> Marvel MMP3 is a successor to MMP2, containing similar peripherals with two
> PJ4B cores.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> ---
>  Documentation/devicetree/bindings/arm/mrvl/mrvl.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mrvl/mrvl.txt b/Documentation/devicetree/bindings/arm/mrvl/mrvl.txt
> index 951687528efb0..66e1e1414245b 100644
> --- a/Documentation/devicetree/bindings/arm/mrvl/mrvl.txt
> +++ b/Documentation/devicetree/bindings/arm/mrvl/mrvl.txt
> @@ -12,3 +12,7 @@ Required root node properties:
>  MMP2 Brownstone Board
>  Required root node properties:
>  	- compatible = "mrvl,mmp2-brownstone", "mrvl,mmp2";
> +
> +MMP3 SoC
> +Required root node properties:
> +	- compatible = "marvell,mmp3";

Please convert this file to DT schema before adding new SoCs.

Rob
