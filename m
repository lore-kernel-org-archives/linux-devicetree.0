From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 2/2] PCI: Add tango PCIe host bridge support
Date: Mon, 3 Apr 2017 09:51:15 -0500
Message-ID: <20170403145115.kjy46bbjt67jxa3k@rob-hp-laptop>
References: <5309e718-5813-5b79-db57-9d702b50d0f9@sigmadesigns.com>
 <65114e62-7458-b6f7-327c-f07a5096a452@sigmadesigns.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <65114e62-7458-b6f7-327c-f07a5096a452@sigmadesigns.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, DT <devicetree@vger.kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Mason <slash.tmp@free.fr>, linux-pci <linux-pci@vger.kernel.org>, Thibaud Cornic <thibaud_cornic@sigmadesigns.com>, Liviu Dudau <liviu.dudau@arm.com>, LKML <linux-kernel@vger.kernel.org>, David Laight <david.laight@aculab.com>, Phuong Nguyen <phuong_nguyen@sigmadesigns.com>, Robin Murphy <robin.murphy@arm.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 29, 2017 at 01:34:45PM +0200, Marc Gonzalez wrote:
> This driver is used to work around HW bugs in the controller.
> 
> Note: the controller does NOT support the following features.
> 
>   Legacy PCI interrupts
>   IO space
> 
> Signed-off-by: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
> ---
>  Documentation/devicetree/bindings/pci/tango-pcie.txt |  33 +++++++++

Acked-by: Rob Herring <robh@kernel.org> 

>  drivers/pci/host/Kconfig                             |   7 ++
>  drivers/pci/host/Makefile                            |   1 +
>  drivers/pci/host/pcie-tango.c                        | 150 +++++++++++++++++++++++++++++++++++++++
>  4 files changed, 191 insertions(+)
