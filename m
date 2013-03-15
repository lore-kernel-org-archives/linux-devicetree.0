From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH v2] usb: Document clocks in samsung,exynos4210-ehci/ohci
 bindings
Date: Fri, 15 Mar 2013 12:06:00 +0900
Message-ID: <007c01ce212a$059e3340$10da99c0$%han@samsung.com>
References: <1363302046-31684-1-git-send-email-dianders@chromium.org>
 <1363316303-12736-1-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-reply-to: <1363316303-12736-1-git-send-email-dianders@chromium.org>
Content-language: ko
Sender: linux-doc-owner@vger.kernel.org
To: 'Doug Anderson' <dianders@chromium.org>, 'Kukjin Kim' <kgene.kim@samsung.com>
Cc: 'Olof Johansson' <olof@lixom.net>, 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Vivek Gautam' <gautam.vivek@samsung.com>, 'Grant Likely' <grant.likely@secretlab.ca>, 'Rob Herring' <rob.herring@calxeda.com>, 'Rob Landley' <rob@landley.net>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 'Jingoo Han' <jg1.han@samsung.com>
List-Id: devicetree@vger.kernel.org

On Friday, March 15, 2013 8:01 AM, Doug Anderson wrote:
> 
> The exynox4210-ehci and exynos4210-ohci nodes need a clock specified
> using the common clock framework.  Document it.
> 
> Signed-off-by: Doug Anderson <dianders@chromium.org>

It looks good.
Acked-by: Jingoo Han <jg1.han@samsung.com>


Best regards,
Jingoo Han

> ---
> Changes in v2:
> - Fixed embarrassing typo adc=>usb.  Thanks Jingoo!
> 
>  Documentation/devicetree/bindings/usb/exynos-usb.txt | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/exynos-usb.txt
> b/Documentation/devicetree/bindings/usb/exynos-usb.txt
> index f66fcdd..b3abde7 100644
> --- a/Documentation/devicetree/bindings/usb/exynos-usb.txt
> +++ b/Documentation/devicetree/bindings/usb/exynos-usb.txt
> @@ -10,6 +10,8 @@ Required properties:
>   - reg: physical base address of the controller and length of memory mapped
>     region.
>   - interrupts: interrupt number to the cpu.
> + - clocks: from common clock binding: handle to usb clock.
> + - clock-names: from common clock binding: Shall be "usbhost".
> 
>  Optional properties:
>   - samsung,vbus-gpio:  if present, specifies the GPIO that
> @@ -22,6 +24,9 @@ Example:
>  		reg = <0x12110000 0x100>;
>  		interrupts = <0 71 0>;
>  		samsung,vbus-gpio = <&gpx2 6 1 3 3>;
> +
> +		clocks = <&clock 285>;
> +		clock-names = "usbhost";
>  	};
> 
>  OHCI
> @@ -31,10 +36,15 @@ Required properties:
>   - reg: physical base address of the controller and length of memory mapped
>     region.
>   - interrupts: interrupt number to the cpu.
> + - clocks: from common clock binding: handle to usb clock.
> + - clock-names: from common clock binding: Shall be "usbhost".
> 
>  Example:
>  	usb@12120000 {
>  		compatible = "samsung,exynos4210-ohci";
>  		reg = <0x12120000 0x100>;
>  		interrupts = <0 71 0>;
> +
> +		clocks = <&clock 285>;
> +		clock-names = "usbhost";
>  	};
> --
> 1.8.1.3

