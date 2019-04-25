From: Marcel Holtmann <marcel@holtmann.org>
Subject: Re: [PATCH v7 2/2] dt-bindings: net: bluetooth: Add device tree
 bindings for QTI chip WCN3998
Date: Thu, 25 Apr 2019 14:43:56 +0200
Message-ID: <B3F78119-055C-41EB-BE3B-C5C94825B93E@holtmann.org>
References: <1556194416-30842-1-git-send-email-c-hbandi@codeaurora.org>
 <1556194416-30842-3-git-send-email-c-hbandi@codeaurora.org>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.8\))
Content-Type: text/plain;
        charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1556194416-30842-3-git-send-email-c-hbandi@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Harish Bandi <c-hbandi@codeaurora.org>
Cc: Johan Hedberg <johan.hedberg@gmail.com>, mka@chromium.org, linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org, linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org, anubhavg@codeaurora.org, devicetree@vger.kernel.org, mark.rutland@arm.com, robh+dt@kernel.org
List-Id: devicetree@vger.kernel.org

Hi Harish,

> Add compatible string for the Qualcomm WCN3998 Bluetooth controller
> 
> Signed-off-by: Harish Bandi <c-hbandi@codeaurora.org>
> ---
> Changes in V6:
> - Changed Commit text
> ---
> Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt | 5 +++--
> 1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt b/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
> index 824c0e2..7ef6118 100644
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
> +Required properties for compatible string qcom,wcn399x-bt:
> 
>  - vddio-supply: VDD_IO supply regulator handle.
>  - vddxo-supply: VDD_XO supply regulator handle.
>  - vddrf-supply: VDD_RF supply regulator handle.
>  - vddch0-supply: VDD_CH0 supply regulator handle.
> 
> -Optional properties for compatible string qcom,wcn3990-bt:
> +Optional properties for compatible string qcom,wcn399x-bt:

wasn’t the conclusion to _not_ use x things in compatible strings? I would personally prefer you list these two compatible strings separately. However I let Rob comment and Ack this if this is fine for him.

Regards

Marcel
