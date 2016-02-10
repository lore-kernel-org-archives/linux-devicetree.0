From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/6] dt-bindings: watchdog: Add ARM SP805 DT bindings
Date: Wed, 10 Feb 2016 14:08:07 -0800
Message-ID: <56BBB4C7.9040209@gmail.com>
References: <1455084651-29325-1-git-send-email-anup.patel@broadcom.com>
 <1455084651-29325-5-git-send-email-anup.patel@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1455084651-29325-5-git-send-email-anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Device Tree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM Kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Yendapally Reddy Dhananjaya Reddy <yrdreddy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Vikram Prakash <vikramp-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 09/02/16 22:10, Anup Patel wrote:
> The ARM SP805 DT node is already present in various DTS files.
> This patch adds missing DT bindings documentation for ARM SP805.
> 
> Signed-off-by: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Reviewed-by: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Reviewed-by: Vikram Prakash <vikramp-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Reviewed-by: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>

Rob, we would probably want an Ack from you on this one, but should we
route this through an arm-soc pull request for Broadcom SoCs, or do you
want to pick it in your tree directly?

Thanks!

> ---
>  .../devicetree/bindings/watchdog/arm,sp805.txt          | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/arm,sp805.txt
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/arm,sp805.txt b/Documentation/devicetree/bindings/watchdog/arm,sp805.txt
> new file mode 100644
> index 0000000..6ebb77d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/arm,sp805.txt
> @@ -0,0 +1,17 @@
> +ARM AMBA Primecell SP805 Watchdog
> +
> +Required properties:
> +- compatible: Should be "arm,sp805" & "arm,primecell"
> +- reg: Should contain location and length for watchdog timer register.
> +- interrupts: Should contain the list of watchdog timer interrupts.
> +- clocks: clocks driving the watchdog timer hardware. This list should be 2
> +	clocks. With 2 clocks, the order is wdogclk clock, apb_pclk.
> +
> +Example:
> +	wdt@66090000 {
> +		compatible = "arm,sp805", "arm,primecell";
> +		reg = <0x66090000 0x1000>;
> +		interrupts = <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&apb_pclk>,<&apb_pclk>;
> +		clock-names = "wdogclk", "apb_pclk";
> +	};
> 


-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
