From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] Doc: bindings: Add binding doc for nxp system
 counter timer
Date: Tue, 18 Dec 2018 11:03:37 -0600
Message-ID: <20181218170337.GA3394@bogus>
References: <1544592770-19996-1-git-send-email-ping.bai@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1544592770-19996-1-git-send-email-ping.bai@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacky Bai <ping.bai@nxp.com>
Cc: "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, Aisheng Dong <aisheng.dong@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 12, 2018 at 05:28:23AM +0000, Jacky Bai wrote:
> Add the binding doc for nxp system counter timer module.
> 
> Signed-off-by: Bai Ping <ping.bai@nxp.com>
> ---
> change v1->v2
>  - remove the blank line at EOF
> ---
>  .../devicetree/bindings/timer/nxp,sysctr_timer.txt | 26 ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/nxp,sysctr_timer.txt
> 
> diff --git a/Documentation/devicetree/bindings/timer/nxp,sysctr_timer.txt b/Documentation/devicetree/bindings/timer/nxp,sysctr_timer.txt
> new file mode 100644
> index 0000000..21f1527
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/nxp,sysctr_timer.txt
> @@ -0,0 +1,26 @@
> +NXP System Counter Module(sys_ctr)
> +
> +The system counter(sys_ctr) is a programmable system counter which provides
> +a shared time base to Cortex A15, A7, A53, A73, etc. it is intended for use in
> +applications where the counter is always powered and support multiple,
> +unrelated clocks.
> +
> +Required properties:
> +
> +- compatible :      should be "nxp,sysctr-timer"

Only 1 version? Should be SoC specific.

> +- reg :             Specifies the base physical address and size of the comapre

s/comapre/compare/

> +                    frame and the counter control, read & compare.
> +- interrupts :      should be the compare frames' interrupt
> +- clock-frequency : Specifies the counter clock frequency.
> +
> +Example:
> +
> +	system_counter: timer@306a0000 {
> +		compatible = "nxp,sysctr-timer";
> +		reg = <0x0 0x306a0000 0x0 0x10000>, /* system-counter-rd base */
> +		      <0x0 0x306b0000 0x0 0x10000>, /* system-counter-cmp base */
> +		      <0x0 0x306c0000 0x0 0x10000>; /* system-counter-ctrl base */

Are these really 64K in length? That wastes virtual space which can be 
important on 32-bit systems.

> +		clock-frequency = <8000000>;
> +		interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> -- 
> 1.9.1
> 
