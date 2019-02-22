From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 5/7] dt-bindings: PCI: qcom: Add QCS404 to the binding
Date: Fri, 22 Feb 2019 14:33:31 -0600
Message-ID: <20190222203331.GA14965@bogus>
References: <20190219060407.15263-1-bjorn.andersson@linaro.org>
 <20190219060407.15263-6-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190219060407.15263-6-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Mark Rutland <mark.rutland@arm.com>, Stanimir Varbanov <svarbanov@mm-sol.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 18 Feb 2019 22:04:05 -0800, Bjorn Andersson wrote:
> The Qualcomm QCS404 platform contains a PCIe controller, add this to the
> Qualcomm PCI binding document. The controller is the same version as the
> one used in IPQ4019, but the PHY part is described separately, hence the
> difference in clocks and resets.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../devicetree/bindings/pci/qcom,pcie.txt     | 25 +++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
