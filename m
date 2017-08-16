From: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Subject: Re: [PATCHv2 1/3] dt-bindings: document the CEC GPIO bindings
Date: Wed, 16 Aug 2017 09:20:37 +0200
Message-ID: <c24529d5-fd9e-444a-2bc7-71d54ca950f8@xs4all.nl>
References: <20170810083359.36800-1-hverkuil@xs4all.nl>
 <20170810083359.36800-2-hverkuil@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170810083359.36800-2-hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 08/10/2017 10:33 AM, Hans Verkuil wrote:
> From: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
> 
> Document the bindings for the cec-gpio module for hardware where the
> CEC pin is connected to a GPIO pin.

No need to review this, there will be a v3 that will add a second optional
HPD gpio.

Regards,

	Hans

> 
> Signed-off-by: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/media/cec-gpio.txt | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/cec-gpio.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/cec-gpio.txt b/Documentation/devicetree/bindings/media/cec-gpio.txt
> new file mode 100644
> index 000000000000..e34a175468e2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/cec-gpio.txt
> @@ -0,0 +1,16 @@
> +* HDMI CEC GPIO-based hardware
> +
> +Use these bindings for HDMI CEC hardware where the CEC pin is hooked up
> +to a pull-up GPIO pin.
> +
> +Required properties:
> +  - compatible: value must be "cec-gpio"
> +  - gpio: gpio that the CEC line is connected to
> +
> +Example for the Raspberry Pi 3 where the CEC line is connected to
> +pin 7 aka BCM4 aka GPCLK0 on the GPIO pin header:
> +
> +cec-gpio {
> +       compatible = "cec-gpio";
> +       gpio = <&gpio 4 GPIO_ACTIVE_HIGH>;
> +};
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
