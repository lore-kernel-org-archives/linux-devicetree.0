From: Stanimir Varbanov <svarbanov@mm-sol.com>
Subject: Re: [PATCH v3 3/3] PCI: qcom: Add QCS404 PCIe controller support
Date: Thu, 16 May 2019 12:39:45 +0300
Message-ID: <d54c6002-496e-c8fb-b67f-e441453c29c6@mm-sol.com>
References: <20190502001955.10575-1-bjorn.andersson@linaro.org>
 <20190502001955.10575-4-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190502001955.10575-4-bjorn.andersson@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Bjorn,

On 5/2/19 3:19 AM, Bjorn Andersson wrote:
> The QCS404 platform contains a PCIe controller of version 2.4.0 and a
> Qualcomm PCIe2 PHY. The driver already supports version 2.4.0, for the
> IPQ4019, but this support touches clocks and resets related to the PHY
> as well, and there's no upstream driver for the PHY.
> 
> On QCS404 we must initialize the PHY, so a separate PHY driver is
> implemented to take care of this and the controller driver is updated to
> not require the PHY related resources. This is done by relying on the
> fact that operations in both the clock and reset framework are nops when
> passed NULL, so we can isolate this change to only the get_resource
> function.
> 
> For QCS404 we also need to enable the AHB (iface) clock, in order to
> access the register space of the controller, but as this is not part of
> the IPQ4019 DT binding this is only added for new users of the 2.4.0
> controller.
> 
> Reviewed-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v2:
> - None
> 
>  drivers/pci/controller/dwc/pcie-qcom.c | 64 +++++++++++++++-----------
>  1 file changed, 38 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index d740cbe0e56d..d101bc5c0def 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -112,7 +112,7 @@ struct qcom_pcie_resources_2_3_2 {
>  	struct regulator_bulk_data supplies[QCOM_PCIE_2_3_2_MAX_SUPPLY];
>  };
>  
> -#define QCOM_PCIE_2_4_0_MAX_CLOCKS	3
> +#define QCOM_PCIE_2_4_0_MAX_CLOCKS	4
>  struct qcom_pcie_resources_2_4_0 {
>  	struct clk_bulk_data clks[QCOM_PCIE_2_4_0_MAX_CLOCKS];
>  	int num_clks;
> @@ -638,13 +638,16 @@ static int qcom_pcie_get_resources_2_4_0(struct qcom_pcie *pcie)
>  	struct qcom_pcie_resources_2_4_0 *res = &pcie->res.v2_4_0;
>  	struct dw_pcie *pci = pcie->pci;
>  	struct device *dev = pci->dev;
> +	bool is_ipq = of_device_is_compatible(dev->of_node, "qcom,pcie-ipq4019");
>  	int ret;
>  
>  	res->clks[0].id = "aux";
>  	res->clks[1].id = "master_bus";
>  	res->clks[2].id = "slave_bus";
> +	res->clks[3].id = "iface";
>  
> -	res->num_clks = 3;
> +	/* qcom,pcie-ipq4019 is defined without "iface" */
> +	res->num_clks = is_ipq ? 3 : 4;

This is ugly but I don't have better idea except having static const
resource structures where we can describe num_clks and select the right
resource from compatible string, but lets leave that for the future.

Otherwise:

Acked-by: Stanimir Varbanov <svarbanov@mm-sol.com>

-- 
regards,
Stan
