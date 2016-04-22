From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] mfd: add Cypress FM33256B Processor Companion driver
Date: Fri, 22 Apr 2016 14:32:32 -0500
Message-ID: <20160422193232.GA9737@rob-hp-laptop>
References: <1461150471-23163-1-git-send-email-jlp@gomspace.com>
 <1461150471-23163-2-git-send-email-jlp@gomspace.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1461150471-23163-2-git-send-email-jlp-jTq9jD7AHYRWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeppe Ledet-Pedersen <jlp-jTq9jD7AHYRWk0Htik3J/w@public.gmane.org>
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Apr 20, 2016 at 01:07:49PM +0200, Jeppe Ledet-Pedersen wrote:
> This patch adds support for the Cypress Semiconductor FM33256B processor
> companion. The device contains a 256 kbit FRAM, an RTC, a supply voltage
> monitor, and a watchdog timer.
> 
> Signed-off-by: Jeppe Ledet-Pedersen <jlp-jTq9jD7AHYRWk0Htik3J/w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/mfd/fm33256b.txt |  30 ++
>  MAINTAINERS                                        |   6 +
>  drivers/mfd/Kconfig                                |  16 +
>  drivers/mfd/Makefile                               |   1 +
>  drivers/mfd/fm33256b.c                             | 488 +++++++++++++++++++++
>  include/linux/mfd/fm33256b.h                       |  76 ++++
>  6 files changed, 617 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/fm33256b.txt
>  create mode 100644 drivers/mfd/fm33256b.c
>  create mode 100644 include/linux/mfd/fm33256b.h
> 
> diff --git a/Documentation/devicetree/bindings/mfd/fm33256b.txt b/Documentation/devicetree/bindings/mfd/fm33256b.txt
> new file mode 100644
> index 0000000..6591c94
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/fm33256b.txt
> @@ -0,0 +1,30 @@
> +Device-tree bindings for Cypress Semiconductor FM33256B Processor Companion
> +---------------------------------------------------------------------------
> +
> +Required properties:
> +- compatible: must be "cypress,fm33256b".
> +- reg: SPI chip select
> +- spi-max-frequency: Max SPI frequency to use (< 16000000)
> +
> +Optional properties:
> +- cypress,charge-enabled: enable trickle charger

What does the driver do if charging is disabled? Would using 'status = 
"disabled"' be any different?
 
> +- cypress,charge-fast: enable fast (1 mA) charging

What does fast mean?

I think it is time for a common binding here. There's all sorts of 
variations on setting the charge current in bindings. Add something like 
"charge-current-microamp" in power_supply.txt and use it here. Then 
1000uA implies "fast charge".

> +
> +The MFD exposes two subdevices:
> +- The FRAM: "cypress,fm33256b-fram"
> +- The RTC: "cypress,fm33256b-rtc"
> +
> +Example:
> +
> +spi1: spi@f800800 {
> +	status = "okay";
> +	cs-gpios = <&pioC 25 0>;
> +
> +	fm33256b@0 {
> +		compatible = "cypress,fm33256b";
> +		spi-max-frequency = <10000000>;
> +		cypress,charge-enabled;
> +		cypress,charge-fast;
> +		reg = <0>;
> +	};

Where's the 2nd sub device?

> +};
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
