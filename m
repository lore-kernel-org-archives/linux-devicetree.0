From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v4 2/2] dt-bindings: net: bluetooth: Add device tree
 bindings for QTI chip WCN3998
Date: Mon, 25 Mar 2019 09:29:35 -0700
Message-ID: <20190325162935.GW112750@google.com>
References: <1553513800-27611-1-git-send-email-c-hbandi@codeaurora.org>
 <1553513800-27611-3-git-send-email-c-hbandi@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1553513800-27611-3-git-send-email-c-hbandi@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Harish Bandi <c-hbandi@codeaurora.org>
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org, linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org, anubhavg@codeaurora.org, devicetree@vger.kernel.org, mark.rutland@arm.com, robh+dt@kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Mar 25, 2019 at 05:06:40PM +0530, Harish Bandi wrote:
> This patch enables regulators for the Qualcomm Bluetooth WCN3998
> controller.
> 
> Signed-off-by: Harish Bandi <c-hbandi@codeaurora.org>
> ---
> Changes in V4:
> - Removed new compatible WCN3998
> - changed wcn3990 to wcn399* to represent wcn399* family
> ---
>  Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt b/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
> index 824c0e2..de9cefa 100644
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
> +Required properties for compatible string qcom,wcn399*-bt:

I think in Linux drivers the use of 'x' is more common as a wildcard
for a single letter than an asterisk. It is also in line with the
function name in the driver, so I would suggest to keep thinkgs
consistent and call it wcn399x everywhere.

>  
>   - vddio-supply: VDD_IO supply regulator handle.
>   - vddxo-supply: VDD_XO supply regulator handle.
>   - vddrf-supply: VDD_RF supply regulator handle.
>   - vddch0-supply: VDD_CH0 supply regulator handle.
>  
> -Optional properties for compatible string qcom,wcn3990-bt:
> +Optional properties for compatible string qcom,wcn399*-bt:
>  
>   - max-speed: see Documentation/devicetree/bindings/serial/slave-device.txt
>  
> @@ -44,7 +45,7 @@ serial@7570000 {
>  
>  serial@898000 {
>  	bluetooth {
> -		compatible = "qcom,wcn3990-bt";
> +		compatible = "qcom,wcn399*-bt";

Typically wildcards aren't used in DT examples as Marcel already
mentioned on v3. IMO the wildcard degrades the value of the example,
rather than enhancing it. I think just listing the compatible string
is enough, no need for an wcn3998/x specific example since it's
essentialy the same as wcn3990.

Thanks

Matthias
