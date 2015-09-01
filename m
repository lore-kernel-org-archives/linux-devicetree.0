From: Stanimir Varbanov <svarbanov@mm-sol.com>
Subject: Re: [PATCH 1/4] dt-binding: gpio: Add Qualcomm SMSM device tree documentation
Date: Tue, 01 Sep 2015 11:18:56 +0300
Message-ID: <55E55F70.5050703@mm-sol.com>
References: <1440697078-4106-1-git-send-email-bjorn.andersson@sonymobile.com> <1440697078-4106-2-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1440697078-4106-2-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>, Alexandre Courbot <gnurou@gmail.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 08/27/2015 08:37 PM, Bjorn Andersson wrote:
> This documents a device tree binding for exposing the Qualcomm Shared
> Memory State Machine as a set of gpio- and interrupt-controllers.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> ---
>  .../devicetree/bindings/gpio/qcom,smsm.txt         | 114 +++++++++++++++++++++

<snip>

> += EXAMPLE
> +The following example shows the SMEM setup for controlling properties of the
> +wireless processor, defined from the 8974 apps processor's point-of-view. It
> +encompasses one outbound entry and the outgoing interrupt for the wireless
> +processor.
> +
> +smsm {
> +	compatible = "qcom,smsm";
> +
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	qcom,ipc-3 = <&apcs 8 19>;

Can we use something more descriptive here, for example

qcom,ipc-rpm = <&apcs 8 19>;

and replace these magic numbers with defines?

> +
> +	apps_smsm: apps@0 {
> +		reg = <0>;
> +
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +	};
> +
> +	wcnss_smsm: wcnss@7 {
> +		reg = <7>;
> +		interrupts = <0 144 1>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +};


-- 
regards,
Stan
