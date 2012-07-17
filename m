From: Sergei Shtylyov <sshtylyov@mvista.com>
Subject: Re: [PATCH v2 06/11] arm/dts: am33xx: Add dt data for usbss
Date: Tue, 17 Jul 2012 16:38:49 +0400
Message-ID: <50055CD9.3060300@mvista.com>
References: <1342516407-16515-1-git-send-email-ajay.gupta@ti.com> <1342516407-16515-7-git-send-email-ajay.gupta@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1342516407-16515-7-git-send-email-ajay.gupta@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: Ajay Kumar Gupta <ajay.gupta@ti.com>
Cc: linux-usb@vger.kernel.org, linux-omap@vger.kernel.org, balbi@ti.com, grant.likely@secretlab.ca, devicetree-discuss@lists.ozlabs.org, tony@atomide.com
List-Id: devicetree@vger.kernel.org

Hello.

On 17-07-2012 13:13, Ajay Kumar Gupta wrote:

> Added device tree data for usbss on am33xx. There are two musb controllers
> on am33xx platform so have port0_mode and port1_mode additional data.

> Signed-off-by: Ajay Kumar Gupta <ajay.gupta@ti.com>
> ---
>   arch/arm/boot/dts/am33xx.dtsi |   11 +++++++++++
>   1 files changed, 11 insertions(+), 0 deletions(-)

> diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
> index 59509c4..b572803 100644
> --- a/arch/arm/boot/dts/am33xx.dtsi
> +++ b/arch/arm/boot/dts/am33xx.dtsi
> @@ -154,5 +154,16 @@
>   			#size-cells = <0>;
>   			ti,hwmods = "i2c3";
>   		};
> +
> +		usb_otg_hs: usb_otg_hs@47400000 {

    The "reg" property is absent, so why did you give the node name the 
address postfix?

> +			compatible = "ti,musb-am33xx";
> +			ti,hwmods = "usb_otg_hs";
> +			multipoint = <1>;
> +			num_eps = <16>;
> +			ram_bits = <12>;
> +			port0_mode = <3>;
> +			port1_mode = <1>;
> +			power = <250>;
> +		};

WBR, Sergei

