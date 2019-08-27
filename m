From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] PCI: Fix misspelled words.
Date: Tue, 27 Aug 2019 11:53:57 -0500
Message-ID: <20190827165357.GA31146@bogus>
References: <20190819115306.27338-1-kw@linux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190819115306.27338-1-kw@linux.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Wilczynski <kw@linux.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 19 Aug 2019 13:53:06 +0200, Krzysztof Wilczynski wrote:
> Fix misspelled words in include/linux/pci.h, drivers/pci/Kconfig,
> and in the documentation for Freescale i.MX6 and Marvell Armada 7K/8K
> PCIe interfaces.  No functional change intended.
> 
> Related commit 96291d565550 ("PCI: Fix typos and whitespace errors").
> 
> Signed-off-by: Krzysztof Wilczynski <kw@linux.com>
> ---
>  Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt | 2 +-
>  Documentation/devicetree/bindings/pci/pci-armada8k.txt   | 2 +-
>  drivers/pci/Kconfig                                      | 2 +-
>  include/linux/pci.h                                      | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
