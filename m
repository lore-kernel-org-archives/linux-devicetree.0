From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 1/2] Documentation: dt: extcon: add optional
 debounce-timeout-ms attribute
Date: Tue, 17 Oct 2017 08:07:32 +0900
Message-ID: <59E53BB4.3000601@samsung.com>
References: <CGME20171016073506epcas2p41d359236602b4d601283504d152f4bbd@epcas2p4.samsung.com>
        <1508139288-11114-1-git-send-email-raveendra.padasalagi@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1508139288-11114-1-git-send-email-raveendra.padasalagi-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Raveendra Padasalagi <raveendra.padasalagi-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 2017년 10월 16일 16:34, Raveendra Padasalagi wrote:
> Add documentation on optional dt attribute "debounce-timeout-ms"
> in extcon node to capture user specified timeout value for id
> and vbus gpio detection.
> 
> Signed-off-by: Raveendra Padasalagi <raveendra.padasalagi-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Reviewed-by: Ray Jui <ray.jui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Reviewed-by: Srinath Mannam <srinath.mannam-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt b/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt
> index dfc14f7..6df6d69 100644
> --- a/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt
> +++ b/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt
> @@ -10,6 +10,10 @@ Either one of id-gpio or vbus-gpio must be present. Both can be present as well.
>  - id-gpio: gpio for USB ID pin. See gpio binding.
>  - vbus-gpio: gpio for USB VBUS pin.
>  
> +Optional properties:
> +- debounce-timeout-ms: debounce timeout value for id and vbus gpio in
> +  milliseconds.

I recommend that you use the 'input-debounce' propery name
instead of 'debounce-timeout-ms'.

When I check the pinctrl-bindings.txt[1] in order to check
the property name for debounce. The documentation[1] specify
the generic pinconfig property name.
[1] Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt

> +
>  Example: Examples of extcon-usb-gpio node in dra7-evm.dts as listed below:
>  	extcon_usb1 {
>  		compatible = "linux,extcon-usb-gpio";
> 
-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
