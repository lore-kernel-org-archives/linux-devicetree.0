Return-Path: <robherring2@gmail.com>
Date: Mon, 7 May 2018 12:01:24 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/3] dt: bindings: i2c-mux-pca954x: add mux-locked
 property
Message-ID: <20180507170124.GA11249@rob-hp-laptop>
References: <20180504130449.13730-1-bst@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180504130449.13730-1-bst@pengutronix.de>
To: Bastian Stender <bst@pengutronix.de>
Cc: Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, Michael Lawnick <ml.lawnick@gmx.de>, kernel@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

On Fri, May 04, 2018 at 03:04:47PM +0200, Bastian Stender wrote:
> Signed-off-by: Bastian Stender <bst@pengutronix.de>

Commit message needed.

> ---
>  .../devicetree/bindings/i2c/i2c-mux-pca954x.txt  | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt
> index 34d91501342e..864ac91f8c1c 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt
> @@ -36,6 +36,22 @@ Optional Properties:
>      - first cell is the pin number
>      - second cell is used to specify flags.
>      See also Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
> +  - mux-locked: If present, explicitly allow unrelated I2C transactions on the
> +    parent I2C adapter at these times:
> +    + during setup of the multiplexer
> +    + between setup of the multiplexer and the child bus I2C transaction
> +    + between the child bus I2C transaction and releasing of the multiplexer
> +    + during releasing of the multiplexer
> +
> +    However, I2C transactions to devices behind all I2C multiplexers connected
> +    to the same parent adapter that this multiplexer is connected to are blocked
> +    for the full duration of the complete multiplexed I2C transaction (i.e.
> +    including the times covered by the above list).
> +    If mux-locked is not present, the multiplexer is assumed to be parent-locked.
> +    This means that no unrelated I2C transactions are allowed on the parent I2C
> +    adapter for the complete multiplexed I2C transaction.
> +    The properties of mux-locked and parent-locked multiplexers are discussed
> +    in more detail in Documentation/i2c/i2c-topology.

Why are you copy-n-pasting paragraphs for an already defined property? 
Just refer to the definition.

Rob
