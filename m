From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 6/7] dt-bindings: phy-qcom-usb2: Add support to
 override tuning values
Date: Mon, 7 May 2018 10:53:14 -0500
Message-ID: <20180507155313.GA9696@rob-hp-laptop>
References: <1525295174-15995-1-git-send-email-mgautam@codeaurora.org>
 <1525295174-15995-7-git-send-email-mgautam@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1525295174-15995-7-git-send-email-mgautam@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Manu Gautam <mgautam@codeaurora.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, sboyd@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dianders@chromium.org, evgreen@chromium.org, Vivek Gautam <vivek.gautam@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, May 03, 2018 at 02:36:13AM +0530, Manu Gautam wrote:
> To improve eye diagram for PHYs on different boards of same SOC,
> some parameters may need to be changed. Provide device tree
> properties to override these from board specific device tree
> files. While at it, replace "qcom,qusb2-v2-phy" with compatible
> string for USB2 PHY on sdm845 which was earlier added for
> sdm845 only.
> 
> Signed-off-by: Manu Gautam <mgautam@codeaurora.org>
> ---
>  .../devicetree/bindings/phy/qcom-qusb2-phy.txt     | 23 +++++++++++++-
>  include/dt-bindings/phy/phy-qcom-qusb2.h           | 37 ++++++++++++++++++++++
>  2 files changed, 59 insertions(+), 1 deletion(-)
>  create mode 100644 include/dt-bindings/phy/phy-qcom-qusb2.h
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt b/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
> index 42c9742..03025d9 100644
> --- a/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
> +++ b/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
> @@ -6,7 +6,7 @@ QUSB2 controller supports LS/FS/HS usb connectivity on Qualcomm chipsets.
>  Required properties:
>   - compatible: compatible list, contains
>  	       "qcom,msm8996-qusb2-phy" for 14nm PHY on msm8996,
> -	       "qcom,qusb2-v2-phy" for QUSB2 V2 PHY.
> +	       "qcom,sdm845-qusb2-phy" for 10nm PHY on sdm845.
>  
>   - reg: offset and length of the PHY register set.
>   - #phy-cells: must be 0.
> @@ -27,6 +27,27 @@ Optional properties:
>  		tuning parameter value for qusb2 phy.
>  
>   - qcom,tcsr-syscon: Phandle to TCSR syscon register region.
> + - qcom,imp-res-offset-value: It is a 6 bit value that specifies offset to be
> +		added to PHY refgen RESCODE via IMP_CTRL1 register. It is a PHY
> +		tuning parameter that may vary for different boards of same SOC.
> +		This property is applicable to only QUSB2 v2 PHY (sdm845).
> + - qcom,hstx-trim-value: It is a 4 bit value that specifies tuning for HSTX
> +		output current.
> +		Possible range is - 15mA to 24mA (stepsize of 600 uA).
> +		See dt-bindings/phy/phy-qcom-qusb2.h for applicable values.
> +		This property is applicable to only QUSB2 v2 PHY (sdm845).
> +		Default value is 22.2mA for sdm845.
> + - qcom,preemphasis-level: It is a 2 bit value that specifies pre-emphasis level.
> +		Possible range is 0 to 15% (stepsize of 5%).
> +		See dt-bindings/phy/phy-qcom-qusb2.h for applicable values.
> +		This property is applicable to only QUSB2 v2 PHY (sdm845).
> +		Default value is 10% for sdm845.
> +- qcom,preemphasis-width: It is a 1 bit value that specifies how long the HSTX
> +		pre-emphasis (specified using qcom,preemphasis-level) must be in
> +		effect. Duration could be half-bit of full-bit.

s/of/or/

But I'd just make this a boolean instead: qcom,preemphasis-half-bit

> +		See dt-bindings/phy/phy-qcom-qusb2.h for applicable values.
> +		This property is applicable to only QUSB2 v2 PHY (sdm845).
> +		Default value is full-bit width for sdm845.
