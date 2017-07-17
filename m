From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 6/7] dt-bindings: pci: qcom: Add support for IPQ8074
Date: Mon, 17 Jul 2017 15:17:31 -0500
Message-ID: <20170717201731.fbltmwsxo5lqesnf@rob-hp-laptop>
References: <1500293043-1887-1-git-send-email-varada@codeaurora.org>
 <1500293043-1887-7-git-send-email-varada@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1500293043-1887-7-git-send-email-varada@codeaurora.org>
Sender: linux-pci-owner@vger.kernel.org
To: Varadarajan Narayanan <varada@codeaurora.org>
Cc: bhelgaas@google.com, mark.rutland@arm.com, svarbanov@mm-sol.com, kishon@ti.com, sboyd@codeaurora.org, vivek.gautam@codeaurora.org, fengguang.wu@intel.com, weiyongjun1@huawei.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 17, 2017 at 05:34:02PM +0530, Varadarajan Narayanan wrote:
> Add support for the IPQ8074 PCIe controller.  IPQ8074 supports Gen 1/2, one
> lane, two PCIe root complex with support for MSI and legacy interrupts, and
> it conforms to PCI Express Base 2.1 specification.
> 
> Signed-off-by: Varadarajan Narayanan <varada@codeaurora.org>
> ---
>  .../devicetree/bindings/pci/qcom,pcie.txt          | 67 ++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.txt b/Documentation/devicetree/bindings/pci/qcom,pcie.txt
> index 9d418b7..643bcc2 100644
> --- a/Documentation/devicetree/bindings/pci/qcom,pcie.txt
> +++ b/Documentation/devicetree/bindings/pci/qcom,pcie.txt
> @@ -9,6 +9,7 @@
>  			- "qcom,pcie-apq8084" for apq8084
>  			- "qcom,pcie-msm8996" for msm8996 or apq8096
>  			- "qcom,pcie-ipq4019" for ipq4019
> +			- "qcom,pcie-ipq8074" for ipq8074
>  
>  - reg:
>  	Usage: required
> @@ -261,3 +262,69 @@
>  		pinctrl-0 = <&pcie0_pins_default>;
>  		pinctrl-names = "default";
>  	};
> +
> +* Example for ipq8074
> +	pcie0: pci@20000000 {

Same here. Just a new compatible doesn't need an example.

Rob
