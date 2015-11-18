From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] devicetree: watchdog: add binding for Sigma
 Designs SMP8642 watchdog
Date: Wed, 18 Nov 2015 15:16:48 -0600
Message-ID: <20151118211648.GA28553@rob-hp-laptop>
References: <1447869343-25168-1-git-send-email-mans@mansr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1447869343-25168-1-git-send-email-mans@mansr.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mans Rullgard <mans@mansr.com>
Cc: Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 18, 2015 at 05:55:42PM +0000, Mans Rullgard wrote:
> This adds a binding for the watchdog in Sigma Designs SMP8642 and
> similar devices.
> 
> Signed-off-by: Mans Rullgard <mans@mansr.com>

Acked-by: Rob Herring <robh@kernel.org>

> ---
> Changes:
> - add timeout-sec property
> ---
>  .../devicetree/bindings/watchdog/sigma,smp8642-wdt.txt | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/sigma,smp8642-wdt.txt
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/sigma,smp8642-wdt.txt b/Documentation/devicetree/bindings/watchdog/sigma,smp8642-wdt.txt
> new file mode 100644
> index 0000000..5b7ec2c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/sigma,smp8642-wdt.txt
> @@ -0,0 +1,18 @@
> +Sigma Designs SMP86xx/SMP87xx watchdog
> +
> +Required properties:
> +- compatible: Should be "sigma,smp8642-wdt"
> +- reg: Specifies the physical address region
> +- clocks: Should be a phandle to the clock
> +
> +Optional properties:
> +- timeout-sec: watchdog timeout in seconds
> +
> +Example:
> +
> +watchdog@1fd00 {
> +	compatible = "sigma,smp8642-wdt";
> +	reg = <0x1fd00 8>;
> +	clocks = <&xtal_in_clk>;
> +	timeout-sec = <30>;
> +};
> -- 
> 2.6.3
> 
