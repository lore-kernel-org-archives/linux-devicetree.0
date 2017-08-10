From: Rob Herring <robh@kernel.org>
Subject: Re: [RESEND PATCH 2/4] dt-bindings: add "reduced-width" property for
 Armada XP SDRAM controller
Date: Thu, 10 Aug 2017 15:38:01 -0500
Message-ID: <20170810203801.jz5hl5onqci275ef@rob-hp-laptop>
References: <20170807014641.4003-1-chris.packham@alliedtelesis.co.nz>
 <20170807014641.4003-3-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170807014641.4003-3-chris.packham@alliedtelesis.co.nz>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: gregory.clement@free-electrons.com, bp@alien8.de, jlu@pengutronix.de, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Aug 07, 2017 at 01:46:39PM +1200, Chris Packham wrote:
> Some SoC implementations that use this controller have a reduced pin
> count so the meaning of "full" and "half" with change.

s/with/width/ ?

> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
>  .../bindings/memory-controllers/mvebu-sdram-controller.txt          | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/mvebu-sdram-controller.txt b/Documentation/devicetree/bindings/memory-controllers/mvebu-sdram-controller.txt
> index 89657d1d4cd4..3041868321c8 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/mvebu-sdram-controller.txt
> +++ b/Documentation/devicetree/bindings/memory-controllers/mvebu-sdram-controller.txt
> @@ -13,6 +13,12 @@ Required properties:
>   - reg: a resource specifier for the register space, which should
>     include all SDRAM controller registers as per the datasheet.
>  
> +Optional properties:
> + - marvell,reduced-width: some SoCs that use this SDRAM controller have
> +   a reduced pin count. On such systems "full" width is 32-bits and
> +   "half" width is 16-bits. Set this property to indicate that the SoC
> +   used is such a system.

Maybe you should just state what the width is.

Or your compatible string should just be specific enough to know the 
width.

Rob
