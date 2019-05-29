From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 0/2] Qualcomm PCIe2 PHY
Date: Tue, 28 May 2019 18:00:38 -0700
Message-ID: <20190529010038.GB3923@builder>
References: <20190502001406.10431-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190502001406.10431-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed 01 May 17:14 PDT 2019, Bjorn Andersson wrote:

> The Qualcomm PCIe2 PHY is based on design from Synopsys and found in
> several different platforms where the QMP PHY isn't used.
> 

Kishon, any feedback on this or would you be willing to pick it up?

Regards,
Bjorn

> Bjorn Andersson (2):
>   dt-bindings: phy: Add binding for Qualcomm PCIe2 PHY
>   phy: qcom: Add Qualcomm PCIe2 PHY driver
> 
>  .../bindings/phy/qcom-pcie2-phy.txt           |  42 +++
>  drivers/phy/qualcomm/Kconfig                  |   8 +
>  drivers/phy/qualcomm/Makefile                 |   1 +
>  drivers/phy/qualcomm/phy-qcom-pcie2.c         | 331 ++++++++++++++++++
>  4 files changed, 382 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom-pcie2-phy.txt
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-pcie2.c
> 
> -- 
> 2.18.0
> 
