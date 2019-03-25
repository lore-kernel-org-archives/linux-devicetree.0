From: Marcel Holtmann <marcel@holtmann.org>
Subject: Re: [PATCH v4 2/2] dt-bindings: net: bluetooth: Add device tree
 bindings for QTI chip WCN3998
Date: Mon, 25 Mar 2019 12:48:22 +0100
Message-ID: <3AEE5277-5830-41FC-BC72-F5BE4B34B357@holtmann.org>
References: <1553513491-25763-1-git-send-email-c-hbandi@codeaurora.org>
 <1553513491-25763-3-git-send-email-c-hbandi@codeaurora.org>
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Content-Type: text/plain;
        charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1553513491-25763-3-git-send-email-c-hbandi@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Harish Bandi <c-hbandi@codeaurora.org>
Cc: Johan Hedberg <johan.hedberg@gmail.com>, Matthias Kaehlcke <mka@chromium.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:BLUETOOTH DRIVERS" <linux-bluetooth@vger.kernel.org>, Hemantg <hemantg@codeaurora.org>, linux-arm-msm@vger.kernel.org, Balakrishna Godavarthi <bgodavar@codeaurora.org>, anubhavg@codeaurora.org, devicetree <devicetree@vger.kernel.org>, mark.rutland@arm.com, obh+dt@kernel.org
List-Id: devicetree@vger.kernel.org

Hi Harish,

> This patch enables regulators for the Qualcomm Bluetooth WCN3998
> controller.
> 
> Signed-off-by: Harish Bandi <c-hbandi@codeaurora.org>
> ---
> Changes in V4:
> - Removed new compatible WCN3998
> - changed wcn3990 to wcn399* to represent wcn399* family
> ---
> Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt | 7 ++++---
> 1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt b/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
> index 824c0e2..de9cefa 100644
> --- a/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
> +++ b/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
> @@ -11,20 +11,21 @@ Required properties:
>  - compatible: should contain one of the following:
>    * "qcom,qca6174-bt"
>    * "qcom,wcn3990-bt"
> +   * "qcom,wcn3998-bt"
> 
> Optional properties for compatible string qcom,qca6174-bt:
> 
>  - enable-gpios: gpio specifier used to enable chip
>  - clocks: clock provided to the controller (SUSCLK_32KHZ)
> 
> -Required properties for compatible string qcom,wcn3990-bt:
> +Required properties for compatible string qcom,wcn399*-bt:
> 
>  - vddio-supply: VDD_IO supply regulator handle.
>  - vddxo-supply: VDD_XO supply regulator handle.
>  - vddrf-supply: VDD_RF supply regulator handle.
>  - vddch0-supply: VDD_CH0 supply regulator handle.
> 
> -Optional properties for compatible string qcom,wcn3990-bt:
> +Optional properties for compatible string qcom,wcn399*-bt:
> 
>  - max-speed: see Documentation/devicetree/bindings/serial/slave-device.txt
> 
> @@ -44,7 +45,7 @@ serial@7570000 {
> 
> serial@898000 {
> 	bluetooth {
> -		compatible = "qcom,wcn3990-bt";
> +		compatible = "qcom,wcn399*-bt”;

I am not convinced that examples should have a * in the compatible string. So lets have Rob ack this one.

Regards

Marcel
