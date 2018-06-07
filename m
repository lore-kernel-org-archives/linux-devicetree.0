Return-Path: <SRS0=13PW=IZ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:41552 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932526AbeFGIa2 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 7 Jun 2018 04:30:28 -0400
Subject: Re: [PATCH v2] arm64: dts: msm8996: Use dwc3-qcom glue driver for USB
References: <20180531104710.23965-1-mgautam@codeaurora.org>
From: Vivek Gautam <vivek.gautam@codeaurora.org>
Message-ID: <d98cd884-f25d-ee2e-58cf-400993e0d213@codeaurora.org>
Date: Thu, 7 Jun 2018 14:00:21 +0530
MIME-Version: 1.0
In-Reply-To: <20180531104710.23965-1-mgautam@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: devicetree-owner@vger.kernel.org
To: Manu Gautam <mgautam@codeaurora.org>, andy.gross@linaro.org
Cc: linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, dianders@chromium.org, linux-usb@vger.kernel.org, felipe.balbi@linux.intel.com, gregkh@linuxfoundation.org, bjorn.andersson@linaro.org
List-ID: <devicetree@vger.kernel.org>



On 5/31/2018 4:17 PM, Manu Gautam wrote:
> Move from dwc3-of-simple to dwc3-qcom glue driver to
> support peripheral mode which requires qscratch wrapper
> programming on VBUS event.
>
> Fixes: a4333c3a6ba9 ("usb: dwc3: Add Qualcomm DWC3 glue driver")
> Signed-off-by: Manu Gautam <mgautam@codeaurora.org>
> ---
>
> Changes since v1:
>   - Update unit address of DT node as per Doug's comment
>
>   arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi |  6 ++++--
>   arch/arm64/boot/dts/qcom/msm8996.dtsi        | 10 ++++++----
>   2 files changed, 10 insertions(+), 6 deletions(-)

Tested on DB820c. Works fine.
Tested-by: Vivek Gautam <vivek.gautam@codeaurora.org>

BRs
Vivek
>
> diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
> index f45a0ab30d30..00be0d53891a 100644
> --- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
> +++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
> @@ -106,8 +106,9 @@
>   			status = "okay";
>   		};
>   
> -		usb@6a00000 {
> +		usb@6af8800 {
>   			status = "okay";
> +			extcon = <&usb3_id>;
>   
>   			dwc3@6a00000 {
>   				extcon = <&usb3_id>;
> @@ -122,8 +123,9 @@
>   			pinctrl-0 = <&usb3_vbus_det_gpio>;
>   		};
>   
> -		usb@7600000 {
> +		usb@76f8800 {
>   			status = "okay";
> +			extcon = <&usb2_id>;
>   
>   			dwc3@7600000 {
>   				extcon = <&usb2_id>;
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 26292027ba9b..8b6dd5443524 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -776,8 +776,9 @@
>   			status = "disabled";
>   		};
>   
> -		usb2: usb@7600000 {
> -			compatible = "qcom,dwc3";
> +		usb2: usb@76f8800 {
> +			compatible = "qcom,msm8996-dwc3", "qcom,dwc3";
> +			reg = <0x76f8800 0x400>;
>   			#address-cells = <1>;
>   			#size-cells = <1>;
>   			ranges;
> @@ -804,8 +805,9 @@
>   			};
>   		};
>   
> -		usb3: usb@6a00000 {
> -			compatible = "qcom,dwc3";
> +		usb3: usb@6af8800 {
> +			compatible = "qcom,msm8996-dwc3", "qcom,dwc3";
> +			reg = <0x6af8800 0x400>;
>   			#address-cells = <1>;
>   			#size-cells = <1>;
>   			ranges;

