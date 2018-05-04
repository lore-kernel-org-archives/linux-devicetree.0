Return-Path: <SRS0=Xnq8=HX=vger.kernel.org=devicetree-owner@kernel.org>
Received: from metis.ext.pengutronix.de ([85.220.165.71]:41205 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751205AbeEDNKY (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 4 May 2018 09:10:24 -0400
Subject: Re: [PATCH v2 1/3] dt: bindings: i2c-mux-pca954x: add mux-locked
 property
References: <20180504130449.13730-1-bst@pengutronix.de>
From: Bastian Stender <bst@pengutronix.de>
Message-ID: <43e5cb0f-c76b-186d-6174-73dee92aef8e@pengutronix.de>
Date: Fri, 4 May 2018 15:10:22 +0200
MIME-Version: 1.0
In-Reply-To: <20180504130449.13730-1-bst@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@the-dreams.de>
Cc: kernel@pengutronix.de, devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, Michael Lawnick <ml.lawnick@gmx.de>
List-ID: <devicetree@vger.kernel.org>

On 05/04/2018 03:04 PM, Bastian Stender wrote:
> Signed-off-by: Bastian Stender <bst@pengutronix.de>
> ---
>   .../devicetree/bindings/i2c/i2c-mux-pca954x.txt  | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt
> index 34d91501342e..864ac91f8c1c 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt
> @@ -36,6 +36,22 @@ Optional Properties:
>       - first cell is the pin number
>       - second cell is used to specify flags.
>       See also Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
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

I am not sure about this. I think it will act like the gpmux driver here
so I copied it from
Documentation/devicetree/bindings/i2c/i2c-mux-gpmux.txt. Is this correct?

Regards,
Bastian

-- 
Pengutronix e.K.
Industrial Linux Solutions
http://www.pengutronix.de/
Peiner Str. 6-8, 31137 Hildesheim, Germany
Amtsgericht Hildesheim, HRA 2686
