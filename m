From: Kumar Gala <galak@codeaurora.org>
Subject: Re: [PATCHv2 1/2] ARM: msm: Add support for MSM8974 Dragonboard
Date: Fri, 6 Sep 2013 09:28:14 -0500
Message-ID: <97899226-465A-4B78-9FFD-B6B14136420B@codeaurora.org>
References: <1378425890-4225-1-git-send-email-rvaswani@codeaurora.org>
Mime-Version: 1.0 (Apple Message framework v1283)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1378425890-4225-1-git-send-email-rvaswani@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Rohit Vaswani <rvaswani@codeaurora.org>
Cc: David Brown <davidb@codeaurora.org>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, Russell King <linux@arm.linux.org.uk>, Daniel Walker <dwalker@fifo99.com>, Bryan Huntsman <bryanh@codeaurora.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On Sep 5, 2013, at 7:04 PM, Rohit Vaswani wrote:

> diff --git a/arch/arm/boot/dts/msm8974-db.dts b/arch/arm/boot/dts/msm8974-db.dts
> new file mode 100644
> index 0000000..74106a8
> --- /dev/null
> +++ b/arch/arm/boot/dts/msm8974-db.dts
> @@ -0,0 +1,7 @@
> +/include/ "msm8974.dtsi"
> +
> +/ {
> +	model = "Qualcomm MSM8974 Dragonboard";
> +	compatible = "qcom,msm8974-db", "qcom,msm8974";
> +};
> +
> diff --git a/arch/arm/boot/dts/msm8974.dtsi b/arch/arm/boot/dts/msm8974.dtsi
> new file mode 100644
> index 0000000..aa3bb2f
> --- /dev/null
> +++ b/arch/arm/boot/dts/msm8974.dtsi
> @@ -0,0 +1,30 @@
> +/dts-v1/;
> +
> +/include/ "skeleton.dtsi"
> +
> +/ {
> +	model = "Qualcomm MSM8974";
> +	compatible = "qcom,msm8974";
> +	interrupt-parent = <&intc>;
> +
> +	soc: soc { };
> +};
> +
> +&soc {

We should probably have:

        #address-cells = <1>;
        #size-cells = <1>;
        ranges;
        compatible = "simple-bus"; 

> +	intc: interrupt-controller@f9000000 {
> +		compatible = "qcom,msm-qgic2";
> +		interrupt-controller;
> +		#interrupt-cells = <3>;
> +		reg = < 0xf9000000 0x1000 >,
> +		      < 0xf9002000 0x1000 >;
> +	};
> +

Let's be consistent on white space around < >

> +	timer {
> +		compatible = "arm,armv7-timer";
> +		interrupts = <1 2 0xf08>,
> +			     <1 3 0xf08>,
> +			     <1 4 0xf08>,
> +			     <1 1 0xf08>;
> +		clock-frequency = <19200000>;
> +	};



> +};

-- 
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
