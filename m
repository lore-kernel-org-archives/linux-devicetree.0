From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 6/6] ARM: dts: pxa: add the usb host controller
Date: Fri, 19 Jun 2015 21:44:31 +0300
Message-ID: <5584630F.2070402@cogentembedded.com>
References: <1434739102-26217-1-git-send-email-robert.jarzmik@free.fr> <1434739102-26217-6-git-send-email-robert.jarzmik@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1434739102-26217-6-git-send-email-robert.jarzmik-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello.

On 06/19/2015 09:38 PM, Robert Jarzmik wrote:

> Add the usb host controller to pxa27x and pxa3xx.

> Signed-off-by: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
> ---
>   arch/arm/boot/dts/pxa27x.dtsi | 8 ++++++++
>   arch/arm/boot/dts/pxa3xx.dtsi | 8 ++++++++
>   2 files changed, 16 insertions(+)

> diff --git a/arch/arm/boot/dts/pxa27x.dtsi b/arch/arm/boot/dts/pxa27x.dtsi
> index fc79df9..97220ac 100644
> --- a/arch/arm/boot/dts/pxa27x.dtsi
> +++ b/arch/arm/boot/dts/pxa27x.dtsi
> @@ -26,6 +26,14 @@
>   			clocks = <&clks CLK_NONE>;
>   		};
>
> +		pxa27x_ohci: ohci@4c000000 {

    Sigh. ePAPR standardizes the "usb" name for such nodes.
[...]
> diff --git a/arch/arm/boot/dts/pxa3xx.dtsi b/arch/arm/boot/dts/pxa3xx.dtsi
> index 29aeac5..67bd4fe 100644
> --- a/arch/arm/boot/dts/pxa3xx.dtsi
> +++ b/arch/arm/boot/dts/pxa3xx.dtsi
> @@ -86,6 +86,14 @@
>   			dma-names = "rx", "tx";
>   			status = "disabled";
>   		};
> +
> +		pxa3xx_ohci: ohci@4c000000 {

    Ditto.

[...]

WBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
