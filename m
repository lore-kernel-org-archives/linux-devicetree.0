From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH RESEND v1 1/5] dt-bindings: pinctrl: add wakeup capable
 GPIOs for SDM845
Date: Mon, 20 Aug 2018 16:19:01 -0700
Message-ID: <20180820231901.GA5603@tuxbook-pro>
References: <20180817191026.32245-1-ilina@codeaurora.org>
 <20180817191026.32245-2-ilina@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180817191026.32245-2-ilina@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lina Iyer <ilina@codeaurora.org>
Cc: marc.zyngier@arm.com, sboyd@kernel.org, evgreen@chromium.org, linus.walleij@linaro.org, rplsssn@codeaurora.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, rnayak@codeaurora.org, devicetree@vger.kernel.org, andy.gross@linaro.org, dianders@chromium.org
List-Id: devicetree@vger.kernel.org

On Fri 17 Aug 12:10 PDT 2018, Lina Iyer wrote:
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.txt
[..]
> @@ -155,11 +166,52 @@ Example:
>  	tlmm: pinctrl@3400000 {
>  		compatible = "qcom,sdm845-pinctrl";
>  		reg = <0x03400000 0xc00000>;
> -		interrupts = <GIC_SPI 208 0>;
>  		gpio-controller;
>  		#gpio-cells = <2>;
>  		interrupt-controller;
>  		#interrupt-cells = <2>;
> +		interrupts-extended = <&intc GIC_SPI 208 0>,
> +			<&pdc 510 0>, <&pdc 511 0>, <&pdc 512 0>, <&pdc 513 0>,
> +			<&pdc 514 0>, <&pdc 515 0>, <&pdc 516 0>, <&pdc 517 0>,
> +			<&pdc 518 0>, <&pdc 519 0>, <&pdc 632 0>, <&pdc 639 0>,
> +			<&pdc 521 0>, <&pdc 522 0>, <&pdc 523 0>, <&pdc 524 0>,
> +			<&pdc 525 0>, <&pdc 526 0>, <&pdc 527 0>, <&pdc 630 0>,
> +			<&pdc 637 0>, <&pdc 529 0>, <&pdc 530 0>, <&pdc 531 0>,
> +			<&pdc 532 0>, <&pdc 633 0>, <&pdc 640 0>, <&pdc 534 0>,
> +			<&pdc 535 0>, <&pdc 536 0>, <&pdc 537 0>, <&pdc 538 0>,
> +			<&pdc 539 0>, <&pdc 540 0>, <&pdc 541 0>, <&pdc 542 0>,
> +			<&pdc 543 0>, <&pdc 544 0>, <&pdc 545 0>, <&pdc 546 0>,
> +			<&pdc 547 0>, <&pdc 548 0>, <&pdc 549 0>, <&pdc 550 0>,
> +			<&pdc 551 0>, <&pdc 552 0>, <&pdc 553 0>, <&pdc 554 0>,
> +			<&pdc 555 0>, <&pdc 556 0>, <&pdc 557 0>, <&pdc 631 0>,
> +			<&pdc 638 0>, <&pdc 559 0>, <&pdc 560 0>, <&pdc 561 0>,
> +			<&pdc 562 0>, <&pdc 563 0>, <&pdc 564 0>, <&pdc 565 0>,
> +			<&pdc 566 0>, <&pdc 570 0>, <&pdc 571 0>, <&pdc 572 0>,
> +			<&pdc 573 0>, <&pdc 609 0>, <&pdc 610 0>, <&pdc 611 0>,
> +			<&pdc 612 0>, <&pdc 613 0>, <&pdc 614 0>, <&pdc 615 0>,
> +			<&pdc 617 0>, <&pdc 618 0>, <&pdc 619 0>, <&pdc 620 0>,
> +			<&pdc 621 0>, <&pdc 622 0>, <&pdc 623 0>;

I would expect that there are about 80 WARN_ON() hit in the irq code
when you boot mainline with this. Have you tried that?


Looks reasonable otherwise.

Regards,
Bjorn
