From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: phy: Add binding for Qualcomm PCIe2
 PHY
Date: Thu, 2 May 2019 16:36:40 -0500
Message-ID: <20190502213640.GA21552@bogus>
References: <20190502001406.10431-1-bjorn.andersson@linaro.org>
 <20190502001406.10431-2-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190502001406.10431-2-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed,  1 May 2019 17:14:05 -0700, Bjorn Andersson wrote:
> The Qualcomm PCIe2 PHY is a Synopsys based PCIe PHY found in a number of
> Qualcomm platforms, add a binding to describe this.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v2:
> - Add #clock-cells
> 
>  .../bindings/phy/qcom-pcie2-phy.txt           | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom-pcie2-phy.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
