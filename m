From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCH v5 0/3] Qualcomm QCS404 PCIe support
Date: Wed, 29 May 2019 17:31:55 +0100
Message-ID: <20190529163155.GA24655@redmoon>
References: <20190529005710.23950-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190529005710.23950-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Stanimir Varbanov <svarbanov@mm-sol.com>, linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, May 28, 2019 at 05:57:07PM -0700, Bjorn Andersson wrote:
> This series adds support for the PCIe controller in the Qualcomm QCS404
> platform.
> 
> Bjorn Andersson (3):
>   PCI: qcom: Use clk_bulk API for 2.4.0 controllers
>   dt-bindings: PCI: qcom: Add QCS404 to the binding
>   PCI: qcom: Add QCS404 PCIe controller support
> 
>  .../devicetree/bindings/pci/qcom,pcie.txt     |  25 +++-
>  drivers/pci/controller/dwc/pcie-qcom.c        | 113 ++++++++----------
>  2 files changed, 75 insertions(+), 63 deletions(-)

Applied to pci/qcom for v5.3, thanks.

Lorenzo
