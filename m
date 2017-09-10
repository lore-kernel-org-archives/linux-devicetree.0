From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 1/3] dt-bindings: watchdog: Add Realtek RTD1295
Date: Sun, 10 Sep 2017 08:17:30 -0700
Message-ID: <2e66bbc5-3907-d39d-8f2b-eda28269373e@roeck-us.net>
References: <20170904231602.29787-1-afaerber@suse.de>
 <20170904231602.29787-2-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170904231602.29787-2-afaerber@suse.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>, Wim Van Sebroeck <wim@iguana.be>, linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Roc He <hepeng@zidoo.tv>, =?UTF-8?B?6JKL5Li955C0?= <jiang.liqin@geniatech.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 09/04/2017 04:16 PM, Andreas Färber wrote:
> Add a binding for the Realtek RTD1295 watchdog.
> 
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Andreas Färber <afaerber@suse.de>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   v1 -> v2: Unchanged
>   
>   .../devicetree/bindings/watchdog/realtek,rtd119x.txt    | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/watchdog/realtek,rtd119x.txt
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/realtek,rtd119x.txt b/Documentation/devicetree/bindings/watchdog/realtek,rtd119x.txt
> new file mode 100644
> index 000000000000..05653054bd5b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/realtek,rtd119x.txt
> @@ -0,0 +1,17 @@
> +Realtek RTD1295 Watchdog
> +========================
> +
> +Required properties:
> +
> +- compatible :  Should be "realtek,rtd1295-watchdog"
> +- reg        :  Specifies the physical base address and size of registers
> +- clocks     :  Specifies one clock input
> +
> +
> +Example:
> +
> +	watchdog@98007680 {
> +		compatible = "realtek,rtd1295-watchdog";
> +		reg = <0x98007680 0x100>;
> +		clocks = <&osc27M>;
> +	};
> 
