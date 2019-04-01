From: Harish Bandi <c-hbandi@codeaurora.org>
Subject: Re: [PATCH v6 2/2] dt-bindings: net: bluetooth: Add device tree
 bindings for QTI chip WCN3998
Date: Mon, 01 Apr 2019 18:09:23 +0530
Message-ID: <e671ad7dee39bf5a0237f7d00553bf4c@codeaurora.org>
References: <1553689723-21017-1-git-send-email-c-hbandi@codeaurora.org>
 <1553689723-21017-3-git-send-email-c-hbandi@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1553689723-21017-3-git-send-email-c-hbandi@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: marcel@holtmann.org, johan.hedberg@gmail.com
Cc: mka@chromium.org, linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org, linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org, anubhavg@codeaurora.org, devicetree@vger.kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, linux-bluetooth-owner@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

Could you please help to review DT bindings patch.


On 2019-03-27 17:58, Harish Bandi wrote:
> This patch enables regulators for the Qualcomm Bluetooth WCN3998
> controller.
> 
> Signed-off-by: Harish Bandi <c-hbandi@codeaurora.org>
> ---
> Changes in V6:
> - no changes
> ---
>  Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git
> a/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
> b/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
> index 824c0e2..7ef6118 100644
> --- a/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
> +++ b/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
> @@ -11,20 +11,21 @@ Required properties:
>   - compatible: should contain one of the following:
>     * "qcom,qca6174-bt"
>     * "qcom,wcn3990-bt"
> +   * "qcom,wcn3998-bt"
> 
>  Optional properties for compatible string qcom,qca6174-bt:
> 
>   - enable-gpios: gpio specifier used to enable chip
>   - clocks: clock provided to the controller (SUSCLK_32KHZ)
> 
> -Required properties for compatible string qcom,wcn3990-bt:
> +Required properties for compatible string qcom,wcn399x-bt:
> 
>   - vddio-supply: VDD_IO supply regulator handle.
>   - vddxo-supply: VDD_XO supply regulator handle.
>   - vddrf-supply: VDD_RF supply regulator handle.
>   - vddch0-supply: VDD_CH0 supply regulator handle.
> 
> -Optional properties for compatible string qcom,wcn3990-bt:
> +Optional properties for compatible string qcom,wcn399x-bt:
> 
>   - max-speed: see 
> Documentation/devicetree/bindings/serial/slave-device.txt


Thanks,
Harish
