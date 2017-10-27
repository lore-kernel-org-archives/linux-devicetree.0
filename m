From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/3] dt-bindings: timer: Add andestech atcpit100 timer
 binding doc
Date: Fri, 27 Oct 2017 09:37:22 -0500
Message-ID: <20171027143722.ksokppzvhdrumbnk@rob-hp-laptop>
References: <1508908333-1809-1-git-send-email-rickchen36@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1508908333-1809-1-git-send-email-rickchen36@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: rick <rickchen36@gmail.com>
Cc: daniel.lezcano@linaro.org, tglx@linutronix.de, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, rick <rick@andestech.com>, Greentime Hu <green.hu@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 25, 2017 at 01:12:13PM +0800, rick wrote:

Commit msg?

> Signed-off-by: rick <rickchen36@gmail.com>
> Signed-off-by: rick <rick@andestech.com>

Need a full name.

> Signed-off-by: Greentime Hu <green.hu@gmail.com>

S-o-b should be in chronological order of who touched the code. And the 
sender should be last.
 
> ---
>  .../bindings/timer/andestech,atcpit100-timer.txt   |   31 ++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/andestech,atcpit100-timer.txt
> 
> diff --git a/Documentation/devicetree/bindings/timer/andestech,atcpit100-timer.txt b/Documentation/devicetree/bindings/timer/andestech,atcpit100-timer.txt
> new file mode 100644
> index 0000000..a87278a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/andestech,atcpit100-timer.txt
> @@ -0,0 +1,31 @@
> +Andestech ATCPIT100 timer
> +------------------------------------------------------------------
> +ATCPIT100 is a generic IP block from Andes Technology, embedded in
> +Andestech AE3XX platforms and other designs.
> +
> +This timer is a set of compact multi-function timers, which can be
> +used as pulse width modulators (PWM) as well as simple timers.
> +
> +It supports up to 4 PIT channels. Each PIT channel is a
> +multi-function timer and provide the following usage scenarios:
> +One 32-bit timer
> +Two 16-bit timers
> +Four 8-bit timers
> +One 16-bit PWM
> +One 16-bit timer and one 8-bit PWM
> +Two 8-bit timer and one 8-bit PWM
> +
> +Required properties:
> +- compatible	: Should be "andestech,atcpit100"
> +- reg		: Address and length of the register set
> +- interrupts	: Reference to the timer interrupt
> +- clock-frequency : The rate in HZ in input of the Andestech ATCPIT100 timer
> +
> +Examples:
> +
> +timer0: timer@f0400000 {
> +	compatible = "andestech,atcpit100";
> +	reg = <0xf0400000 0x1000>;
> +	interrupts = <2 4>;
> +	clock-frequency = <30000000>;
> +};
> -- 
> 1.7.9.5
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
