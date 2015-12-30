From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt: bindings: add bindings for ipq4019 wifi block
Date: Wed, 30 Dec 2015 10:35:24 -0600
Message-ID: <20151230163524.GA26810@rob-hp-laptop>
References: <1450848915-9772-1-git-send-email-rmani@qti.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1450848915-9772-1-git-send-email-rmani@qti.qualcomm.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Raja Mani <rmani@qti.qualcomm.com>
Cc: agross@codeaurora.org, devicetree@vger.kernel.org, ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, mmcclint@qca.qualcomm.com
List-Id: devicetree@vger.kernel.org

On Wed, Dec 23, 2015 at 11:05:15AM +0530, Raja Mani wrote:
> Add device tree binding documentation details for wifi block present
> in Qualcomm IPQ4019 SoC into qcom,ath10k.txt.
> 
> Signed-off-by: Raja Mani <rmani@qti.qualcomm.com>
> ---
>  .../bindings/net/wireless/qcom,ath10k.txt          | 87 ++++++++++++++++++++--
>  1 file changed, 82 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> index edefc26..ffd0742 100644
> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> @@ -1,17 +1,42 @@
>  * Qualcomm Atheros ath10k wireless devices
>  
> -For ath10k devices the calibration data can be provided through Device
> -Tree. The node is a child node of the PCI controller.

So it is now not a PCI device?

> -
>  Required properties:
> --compatible : Should be "qcom,ath10k"
> +- compatible: Should be one of the following:
> +	* "qcom,ath10k"
> +	* "qcom,ipq4019-wifi"

One is a standalone PCI device and one is embedded block in an SOC? 
These should be more separated as all these new properties would only 
apply in the latter case.

>  
>  Optional properties:
> +- reg: Address and length of the register set for the device.
> +- core-id: Core number associated to the device.

This needs a better explanation.

> +- resets: Must contain an entry for each entry in reset-names.
> +          See ../reset/reseti.txt for details.
> +- reset-names: Must include the list of following reset names,
> +	       "wifi_cpu_init"
> +	       "wifi_radio_srif"
> +	       "wifi_radio_warm"
> +	       "wifi_radio_cold"
> +	       "wifi_core_warm"
> +	       "wifi_core_cold"
> +- clocks: List of clock specifiers, must contain an entry for each required
> +          entry in clock-names.
> +- clock-names: Should contain the clock names "wifi_wcss_cmd", "wifi_wcss_ref",
> +               "wifi_wcss_rtc".
> +- interrupts: List of interrupt lines. Must contain an entry
> +	      for each entry in the interrupt-names property.
> +- interrupt-names: Must include the entries for MSI interrupt
> +		   names ("msi0" to "msi15") and legacy interrupt
> +		   name ("legacy"),
> +- qca,msi_addr: MSI interrupt address.
> +- qca,msi_base: Base value to add before writing MSI data into
> +		MSI address register.

Why don't the standard MSI properties work?

>  - qcom,ath10k-calibration-data : calibration data as an array, the
>  				 length can vary between hw versions
> +- status: Either "disabled" or "ok".
> +

No need to document status here.

Rob
