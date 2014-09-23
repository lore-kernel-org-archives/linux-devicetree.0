From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: [PATCH v6 8/9] rtc: at91sam9: add DT bindings documentation
Date: Tue, 23 Sep 2014 10:24:39 +0200
Message-ID: <54212E47.9070300@atmel.com>
References: <1411400563-570-1-git-send-email-boris.brezillon@free-electrons.com> <1411400563-570-9-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1411400563-570-9-git-send-email-boris.brezillon@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris BREZILLON <boris.brezillon@free-electrons.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Andrew Victor <linux@maxim.org.za>, Alessandro Zummo <a.zummo@towertech.it>, rtc-linux@googlegroups.com, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Johan Hovold <jhovold@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 22/09/2014 17:42, Boris BREZILLON :
> Signed-off-by: Boris BREZILLON <boris.brezillon@free-electrons.com>

Yes, it's good for me:
Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>

Thanks, bye,

> ---
>  .../devicetree/bindings/rtc/atmel,at91sam9-rtc.txt | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/atmel,at91sam9-rtc.txt
> 
> diff --git a/Documentation/devicetree/bindings/rtc/atmel,at91sam9-rtc.txt b/Documentation/devicetree/bindings/rtc/atmel,at91sam9-rtc.txt
> new file mode 100644
> index 0000000..e94e2ee
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/atmel,at91sam9-rtc.txt
> @@ -0,0 +1,23 @@
> +Atmel AT91SAM9260 Real Time Timer
> +
> +Required properties:
> +- compatible: should be: "atmel,at91sam9260-rtt"
> +- reg: should encode the memory region of the RTT controller
> +- interrupts: rtt alarm/event interrupt
> +- clocks: should contain one clock pointing the the slow clk
> +- atmel,rtt-rtc-time-reg: should encode the GPBR register used to store
> +	the time base when the RTT is used as an RTC.
> +	The first cell should point to the GPBR node and the second one
> +	encode the offset within the GPBR block (or in other words, the
> +	GPBR register used to store the current time value).
> +
> +
> +Example:
> +
> +rtt@fffffe00 {
> +	compatible = "atmel,at91sam9260-rtt";
> +	reg = <0xfffffd20 0x10>;
> +	interrupts = <1 4 7>;
> +	clocks = <&clk32k>;
> +	atmel,rtt-rtc-time-reg = <&gpbr 0x0>;
> +};
> 


-- 
Nicolas Ferre
