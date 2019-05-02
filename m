From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v3 2/3] dt-bindings: PCI: qcom: Add QCS404 to the binding
Date: Thu, 2 May 2019 17:24:57 +0530
Message-ID: <20190502115457.GN3845@vkoul-mobl.Dlink>
References: <20190502001955.10575-1-bjorn.andersson@linaro.org>
 <20190502001955.10575-3-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190502001955.10575-3-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Stanimir Varbanov <svarbanov@mm-sol.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 01-05-19, 17:19, Bjorn Andersson wrote:
> The Qualcomm QCS404 platform contains a PCIe controller, add this to the
> Qualcomm PCI binding document. The controller is the same version as the
> one used in IPQ4019, but the PHY part is described separately, hence the
> difference in clocks and resets.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
