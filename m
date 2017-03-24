From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 1/2] extcon: usb-gpio: Add level trigger support
Date: Fri, 24 Mar 2017 20:08:13 +0900
Message-ID: <58D4FE1D.9040404@samsung.com>
References: <CGME20170320080127epcas1p120786738dd2e3cd371bf6410d5f2b3a6@epcas1p1.samsung.com>
 <0db99bd509c94ea8a80f633022d15235a99391a9.1489995966.git.baolin.wang@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <0db99bd509c94ea8a80f633022d15235a99391a9.1489995966.git.baolin.wang@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@linaro.org>, myungjoo.ham@samsung.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: broonie@kernel.org, linaro-kernel@lists.linaro.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

On 2017년 03월 20일 16:59, Baolin Wang wrote:
> Now extcon-usb-gpio only supports for GPIO egdge trigger, but VBUS/ID
> gpios' detection can be triggered by the level trigger on some platforms.
> Thus intoduce one property 'extcon-gpio,level-trigger' to identify this
> situation.
> 
> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
> ---
>  .../devicetree/bindings/extcon/extcon-usb-gpio.txt |    3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt b/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt
> index dfc14f7..191504b 100644
> --- a/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt
> +++ b/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt
> @@ -9,6 +9,9 @@ Required properties:
>  Either one of id-gpio or vbus-gpio must be present. Both can be present as well.
>  - id-gpio: gpio for USB ID pin. See gpio binding.
>  - vbus-gpio: gpio for USB VBUS pin.
> +- extcon-gpio,level-trigger: Boolean, set this gpio's interrupt flag to

It is 'extcon-usb-gpio' instead of 'extcon-gpio'.

> +level trigger. If not specified defaults to false, gpio's interrupt flag
> +defaults to edge trigger.

I understand why you need the new flag.
But, I'm not sure it is right way to add the new flag for interrupt flag.

IMHO, I think that we need to find the more proper way to get the interrupt flag
or maybe, we may need to implement the new helper api to get the interrupt
flag for gpio pin when we use the gpio as the interrupt source, 

>  
>  Example: Examples of extcon-usb-gpio node in dra7-evm.dts as listed below:
>  	extcon_usb1 {
> 


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
