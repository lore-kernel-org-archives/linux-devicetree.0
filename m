From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH next 1/2] PCI: keystone: add pci error irq handler
Date: Wed, 23 Mar 2016 10:10:27 -0500
Message-ID: <20160323151027.GA17771@rob-hp-laptop>
References: <1458676378-24377-1-git-send-email-m-karicheri2@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1458676378-24377-1-git-send-email-m-karicheri2@ti.com>
Sender: linux-pci-owner@vger.kernel.org
To: Murali Karicheri <m-karicheri2@ti.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, bhelgaas@google.com
List-Id: devicetree@vger.kernel.org

On Tue, Mar 22, 2016 at 03:52:57PM -0400, Murali Karicheri wrote:
> Keystone PCI hardware generates error interrupts at RC using platform
> irq instead of standard msi/legacy irq. Add a simple error handler that
> logs the fatal interrupt status to the console.
> 
> Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Pawel Moll <pawel.moll@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
> Cc: Kumar Gala <galak@codeaurora.org>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> ---
>  .../devicetree/bindings/pci/pci-keystone.txt       |  1 +

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/pci/host/pci-keystone-dw.c                 | 46 ++++++++++++++++++++++
>  drivers/pci/host/pci-keystone.c                    | 32 +++++++++++++++
>  drivers/pci/host/pci-keystone.h                    |  6 +++
>  4 files changed, 85 insertions(+)
