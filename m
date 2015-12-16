From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v4 3/5] PCI: qcom: Add Qualcomm PCIe controller driver
Date: Wed, 16 Dec 2015 15:17:25 -0600
Message-ID: <20151216211725.GA27791@localhost>
References: <1449149725-27607-1-git-send-email-stanimir.varbanov@linaro.org>
 <1449149725-27607-4-git-send-email-stanimir.varbanov@linaro.org>
 <566FCE27.2050705@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <566FCE27.2050705@mm-sol.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stanimir Varbanov <svarbanov@mm-sol.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Arnd Bergmann <arnd@arndb.de>, Jingoo Han <jingoohan1@gmail.com>, Pratyush Anand <pratyush.anand@gmail.com>, Bjorn Andersson <bjorn.andersson@sonymobile.com>
List-Id: devicetree@vger.kernel.org

Hi Stan,

On Tue, Dec 15, 2015 at 10:24:07AM +0200, Stanimir Varbanov wrote:
> On 12/03/2015 03:35 PM, Stanimir Varbanov wrote:
> > From: Stanimir Varbanov <svarbanov@mm-sol.com>
> > 
> > The PCIe driver reuse the Designware common code for host
> > and MSI initialization, and also program the Qualcomm
> > application specific registers.
> > 
> > Signed-off-by: Stanimir Varbanov <svarbanov@mm-sol.com>
> > Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> > ---
> >  MAINTAINERS                  |    7 +
> >  drivers/pci/host/Kconfig     |   10 +
> >  drivers/pci/host/Makefile    |    1 +
> >  drivers/pci/host/pcie-qcom.c |  624 ++++++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 642 insertions(+)
> >  create mode 100644 drivers/pci/host/pcie-qcom.c
> 
> Hi Bjorn, any chance to get this merged in 4.5 ?

The driver looks good overall, so I think 4.5 is very possible.  It
doesn't look like there's really a consensus on the memory barrier
thing yet, and I assume the testing reports include that first patch,
so it'd be good to get that resolved first.

Bjorn
