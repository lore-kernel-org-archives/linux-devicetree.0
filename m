From: Stanimir Varbanov <svarbanov@mm-sol.com>
Subject: Re: [PATCH v2 4/7] PCI: qcom: Use clk_bulk API for 2.4.0 controllers
Date: Tue, 26 Feb 2019 11:05:35 +0200
Message-ID: <fcf8bd84-649f-b5ff-cb5e-b7c9d058f02c@mm-sol.com>
References: <20190219060407.15263-1-bjorn.andersson@linaro.org>
 <20190219060407.15263-5-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190219060407.15263-5-bjorn.andersson@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kishon Vijay Abraham I <kishon@ti.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Bjorn,

Thanks for the patch!

On 2/19/19 8:04 AM, Bjorn Andersson wrote:
> Before introducing the QCS404 platform, which uses the same PCIe
> controller as IPQ4019, migrate this to use the bulk clock API, in order
> to make the error paths slighly cleaner.
> 
> Reviewed-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 48 +++++++-------------------
>  1 file changed, 13 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index d185ea5fe996..b4d8bcf6eb77 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -113,9 +113,8 @@ struct qcom_pcie_resources_2_3_2 {
>  };
>  
>  struct qcom_pcie_resources_2_4_0 {
> -	struct clk *aux_clk;
> -	struct clk *master_clk;
> -	struct clk *slave_clk;
> +	struct clk_bulk_data clks[3];

Could you make 3 as a define?

Otherwise:

Acked-by: Stanimir Varbanov <svarbanov@mm-sol.com>

-- 
regards,
Stan
