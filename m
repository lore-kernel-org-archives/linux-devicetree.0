From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: Re: [PATCH v5 0/3] Qualcomm QCS404 PCIe support
Date: Tue, 4 Jun 2019 13:33:47 +0200
Message-ID: <20190604113347.GA13029@centauri.ideon.se>
References: <20190529005710.23950-1-bjorn.andersson@linaro.org>
 <20190529163155.GA24655@redmoon>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190529163155.GA24655@redmoon>
Sender: linux-kernel-owner@vger.kernel.org
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Stanimir Varbanov <svarbanov@mm-sol.com>, linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, May 29, 2019 at 05:31:55PM +0100, Lorenzo Pieralisi wrote:
> On Tue, May 28, 2019 at 05:57:07PM -0700, Bjorn Andersson wrote:
> > This series adds support for the PCIe controller in the Qualcomm QCS404
> > platform.
> > 
> > Bjorn Andersson (3):
> >   PCI: qcom: Use clk_bulk API for 2.4.0 controllers
> >   dt-bindings: PCI: qcom: Add QCS404 to the binding
> >   PCI: qcom: Add QCS404 PCIe controller support
> > 
> >  .../devicetree/bindings/pci/qcom,pcie.txt     |  25 +++-
> >  drivers/pci/controller/dwc/pcie-qcom.c        | 113 ++++++++----------
> >  2 files changed, 75 insertions(+), 63 deletions(-)
> 
> Applied to pci/qcom for v5.3, thanks.
> 
> Lorenzo

Hello Lorenzo,

I don't see these patches in linux-next.

It appears that only Bjorn Helgaas tree is in linux-next, and not yours.

I think that it makes a lot of sense for patches to cook in linux-next
for as long a possible.

Perhaps you and Bjorn Helgaas could have a shared PCI git tree?
Or perhaps you could add your tree to linux-next?
..or some other solution :)


Kind regards,
Niklas
