From: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Subject: Re: [PATCH 1/3] dt-bindings: document the CEC GPIO bindings
Date: Thu, 10 Aug 2017 10:03:37 +0200
Message-ID: <64803004-6bea-44db-a651-cc21806250b5@xs4all.nl>
References: <20170802084242.14947-1-hverkuil@xs4all.nl>
 <20170802084242.14947-2-hverkuil@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170802084242.14947-2-hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 02/08/17 10:42, Hans Verkuil wrote:
> From: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
> 
> Document the bindings for the cec-gpio module for hardware where the
> CEC pin is connected to a GPIO pin.

ping?

> 
> Signed-off-by: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/media/cec-gpio.txt | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/cec-gpio.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/cec-gpio.txt b/Documentation/devicetree/bindings/media/cec-gpio.txt
> new file mode 100644
> index 000000000000..58fa56080cda
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/cec-gpio.txt
> @@ -0,0 +1,18 @@
> +* HDMI CEC GPIO driver
> +
> +The HDMI CEC GPIO module supports CEC implementations where the CEC pin
> +is hooked up to a pull-up GPIO pin.
> +
> +The CEC GPIO
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
