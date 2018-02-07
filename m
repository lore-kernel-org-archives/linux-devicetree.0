From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v4 2/2] dt-bindings/interrupt-controller: pdc: descibe
 PDC device binding
Date: Wed, 7 Feb 2018 08:43:24 -0800
Message-ID: <20180207164324.GP9465@builder>
References: <20180207154958.13421-1-ilina@codeaurora.org>
 <20180207154958.13421-3-ilina@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180207154958.13421-3-ilina@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Lina Iyer <ilina@codeaurora.org>
Cc: tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, rnayak@codeaurora.org, asathyak@codeaurora.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed 07 Feb 07:49 PST 2018, Lina Iyer wrote:
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
[..]
> +Example:
[..]
> +	wake-device {
> +		[...]
> +		interrupt-controller = <&pdc>;

Sorry for not seeing this earlier, but this should be:

		interrupt-parent = <&pdc>;

Or as it's not unlikely that clients might use a mix of pdc and non-pdc
interrupts the example could use the form:

		interrupts-extended = <&pdc 2 IRQ_TYPE_LEVEL_HIGH>;

> +		interrupt = <2 IRQ_TYPE_LEVEL_HIGH>;
> +	};

Regards,
Bjorn
