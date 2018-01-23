From: Stanimir Varbanov <svarbanov@mm-sol.com>
Subject: Re: [PATCH] PCI: qcom: add missing supplies required for msm8996
Date: Tue, 23 Jan 2018 11:23:45 +0200
Message-ID: <65e01829-198e-f549-174d-c8368c5ee193@mm-sol.com>
References: <20171208092053.4417-1-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20171208092053.4417-1-srinivas.kandagatla@linaro.org>
Content-Language: en-US
Sender: linux-pci-owner@vger.kernel.org
To: srinivas.kandagatla@linaro.org, stanimir.varbanov@linaro.org, linux-pci@vger.kernel.org, bhelgaas@google.com
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hey Srini,

As there are no comments I'd propose to change the endpoint supplies to
more generic names.

On 12/08/2017 11:20 AM, srinivas.kandagatla@linaro.org wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> This patch adds supplies that are required for msm8996. Two of them vdda
> and vdda-1p8 are analog supplies that go in to controller, and the rest
> of the two vddpe's are supplies to PCIe endpoints.
> 
> Without these supplies PCIe endpoints which require power supplies are
> not enumerated at all, as there is no one to power it up.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../devicetree/bindings/pci/qcom,pcie.txt          | 16 +++++++++++++
>  drivers/pci/dwc/pcie-qcom.c                        | 28 ++++++++++++++++++++--
>  2 files changed, 42 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.txt b/Documentation/devicetree/bindings/pci/qcom,pcie.txt
> index 3c9d321b3d3b..045102cb3e12 100644
> --- a/Documentation/devicetree/bindings/pci/qcom,pcie.txt
> +++ b/Documentation/devicetree/bindings/pci/qcom,pcie.txt
> @@ -179,6 +179,11 @@
>  	Value type: <phandle>
>  	Definition: A phandle to the core analog power supply
>  
> +- vdda-1p8-supply:
> +	Usage: required for msm8996
> +	Value type: <phandle>
> +	Definition: A phandle to the 1.8v analog power supply
> +

This should be dropped, because it is part of the phy.

>  - vdda_phy-supply:
>  	Usage: required for ipq/apq8064
>  	Value type: <phandle>
> @@ -189,6 +194,15 @@
>  	Value type: <phandle>
>  	Definition: A phandle to the analog power supply for IC which generates
>  		    reference clock
> +- vddpe-supply:
> +	Usage: optional
> +	Value type: <phandle>
> +	Definition: A phandle to the PCIe endpoint power supply

vddpe_3v3-supply

> +
> +- vddpe1-supply:
> +	Usage: optional
> +	Value type: <phandle>
> +	Definition: A phandle to the PCIe endpoint power supply 1

vddpe_1v5-supply

>  
>  - phys:
>  	Usage: required for apq8084
> @@ -205,6 +219,8 @@
>  	Value type: <prop-encoded-array>
>  	Definition: List of phandle and GPIO specifier pairs. Should contain
>  			- "perst-gpios"	PCIe endpoint reset signal line
> +			- "pe_en-gpios"	PCIe endpoint enable signal line
> +			- "pe_en1-gpios" PCIe endpoint enable1 signal line

We don't need those gpios, the regulator driver will manipulate these
gpios when we call regulator_enable/disable.


-- 
regards,
Stan
