From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ASoC: tda998x: Fix lack of required reg in DT documentation
Date: Thu, 20 Mar 2014 13:32:24 +0100
Message-ID: <532ADFD8.80301@gmail.com>
References: <20140320092639.48F68A6279@smtp3-g21.free.fr>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140320092639.48F68A6279-0zphjBnwxSw1Wri2s2gf/1AUjnlXr6A1@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 03/20/2014 09:58 AM, Jean-Francois Moine wrote:
> The I2C address (reg) is required for the TDA998x driver to be loaded
> and initialized.
>
> Signed-off-by: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
> ---
> This patch applies to linux-next.
> ---
>   Documentation/devicetree/bindings/drm/i2c/tda998x.txt | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/drm/i2c/tda998x.txt b/Documentation/devicetree/bindings/drm/i2c/tda998x.txt
> index d7df01c..fc7effa 100644
> --- a/Documentation/devicetree/bindings/drm/i2c/tda998x.txt
> +++ b/Documentation/devicetree/bindings/drm/i2c/tda998x.txt
> @@ -3,6 +3,8 @@ Device-Tree bindings for the NXP TDA998x HDMI transmitter
>   Required properties;
>     - compatible: must be "nxp,tda998x"
>
> +  - reg: I2C address - must be <0x70>

TDA9983b datasheet says:

"Bits A0 and A1 of the I2C-bus device address are externally selected
by pins A0 and A1."

Therefore, 0x70, 0x71, 0x72, and 0x73 are valid i2c addresses.

Sebastian

>   Optional properties:
>     - interrupts: interrupt number and trigger type
>   	default: polling
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
