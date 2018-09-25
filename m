From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 2/2] dt-bindings: pinctrl: qcom: Add SDM660 pinctrl
 binding
Date: Tue, 25 Sep 2018 14:48:46 -0700
Message-ID: <20180925214846.GK2523@minitux>
References: <20180812142413.20856-1-ctatlor97@gmail.com>
 <20180925173801.3835-1-ctatlor97@gmail.com>
 <20180925173801.3835-2-ctatlor97@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180925173801.3835-2-ctatlor97@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Craig Tatlor <ctatlor97@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue 25 Sep 10:38 PDT 2018, Craig Tatlor wrote:
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdm660-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,sdm660-pinctrl.txt
[..]
> +- reg:
> +	Usage: required
> +	Value type: <prop-encoded-array>
> +	Definition: the base address and size of the TLMM register space.

This should mention that we're expecting address and size of the three
tiles. And the proposed patches depends on reg-names for the lookup.

> +
[..]
> +Example:
> +
> +	tlmm: pinctrl@1010000 {
> +		compatible = "qcom,sdm660-pinctrl";
> +		reg = <0x1010000 0x300000>;

reg (and the node address) needs to be updated.

> +		interrupts = <0 208 0>;

		interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;

> +		gpio-controller;
> +		gpio-ranges = <&tlmm 0 0 114>;
> +		#gpio-cells = <2>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};

Regards,
Bjorn
