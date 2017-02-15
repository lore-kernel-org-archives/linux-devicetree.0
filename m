From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/3] usb: add DT bindings for farady fotg2 host controller
Date: Wed, 15 Feb 2017 17:00:42 -0600
Message-ID: <20170215230042.4m3niqf5wizbrgb4@rob-hp-laptop>
References: <20170208200010.21522-1-ulli.kroll@googlemail.com>
 <20170208200010.21522-3-ulli.kroll@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170208200010.21522-3-ulli.kroll@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans Ulli Kroll <ulli.kroll@googlemail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 08, 2017 at 09:00:09PM +0100, Hans Ulli Kroll wrote:
> This adds DT bindings for the Faraday FOTG2 host controller.
> 
> Signed-off-by: Hans Ulli Kroll <ulli.kroll@googlemail.com>
> ---
>  Documentation/devicetree/bindings/usb/fotg2-host.txt | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/fotg2-host.txt
> 
> diff --git a/Documentation/devicetree/bindings/usb/fotg2-host.txt b/Documentation/devicetree/bindings/usb/fotg2-host.txt
> new file mode 100644
> index 000000000000..4c07566a4bf5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/fotg2-host.txt
> @@ -0,0 +1,15 @@
> +Faraday FOTG Host controller
> +
> +Required properties:
> +
> +- compatible: should be "faraday,fotg210-hcd"

hcd as in "host controller driver"? Bindings describe h/w not drivers.

It's an OTG controller or host controller?

> +- reg: should contain one register range i.e. start and length
> +- interrupts: description of the interrupt line
> +
> +Example for Gemini:
> +
> +usb@68000000 {
> +	compatible = "faraday,fotg210-hcd";
> +	reg = <0x68000000 0x1000>;
> +	interrupts = <10 IRQ_TYPE_LEVEL_HIGH>;
> +};
> -- 
> 2.11.0
> 
