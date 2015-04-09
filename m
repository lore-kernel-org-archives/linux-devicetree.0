From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: Re: [PATCH 08/10] ARM: dts: qcom: Add DT alias for serial port
Date: Thu, 9 Apr 2015 13:25:01 -0700
Message-ID: <20150409202501.GK19186@sonymobile.com>
References: <1428567674-10672-1-git-send-email-srinivas.kandagatla@linaro.org>
 <1428567823-11062-1-git-send-email-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1428567823-11062-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: "galak@codeaurora.org" <galak@codeaurora.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "inux-kernel@vger.kernel.org" <inux-kernel@vger.kernel.org>, Pramod Gurav <pramod.gurav@smartplayin.com>
List-Id: devicetree@vger.kernel.org

On Thu 09 Apr 01:23 PDT 2015, Srinivas Kandagatla wrote:

> From: Pramod Gurav <pramod.gurav@smartplayin.com>
> 
> Define an alias for serial port present on ifc6410 which is used as
> console.
> 
> Signed-off-by: Pramod Gurav <pramod.gurav@smartplayin.com>
> ---
>  arch/arm/boot/dts/qcom-apq8064-ifc6410.dts | 4 ++++
>  arch/arm/boot/dts/qcom-apq8064.dtsi        | 3 +--
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
> index d39a5bb..b76a92b 100644
> --- a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
> +++ b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
> @@ -5,6 +5,10 @@
>  	model = "Qualcomm APQ8064/IFC6410";
>  	compatible = "qcom,apq8064-ifc6410", "qcom,apq8064";
>  
> +	aliases {
> +		serial0 = &serial0;
> +	};
> +
>  	soc {
>  		pinctrl@800000 {
>  			i2c1_pins: i2c1 {
> diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
> index 70e417f..f4b8c3a 100644
> --- a/arch/arm/boot/dts/qcom-apq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
> @@ -252,10 +252,9 @@
>  			#address-cells = <1>;
>  			#size-cells = <1>;
>  			ranges;
> -
>  			syscon-tcsr = <&tcsr>;
>  
> -			serial@16640000 {
> +			serial0: serial@16640000 {

On my 8064 devices gsbi7 uart is used for felica, gsbi5 is the debug
uart. So I don't think it's right to call this serial0 here.

>  				compatible = "qcom,msm-uartdm-v1.3", "qcom,msm-uartdm";
>  				reg = <0x16640000 0x1000>,
>  				      <0x16600000 0x1000>;
> -- 
> 1.9.1
> 

Regards,
Bjorn
