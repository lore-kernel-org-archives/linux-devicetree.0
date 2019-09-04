From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v2 0/6] PAXB INTx support with proper model
Date: Wed, 4 Sep 2019 10:16:27 -0700
Message-ID: <107116f2-a5ff-c545-1864-eb5885c4c60e@gmail.com>
References: <1566982488-9673-1-git-send-email-srinath.mannam@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1566982488-9673-1-git-send-email-srinath.mannam@broadcom.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Srinath Mannam <srinath.mannam@broadcom.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Cc: bcm-kernel-feedback-list@broadcom.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 8/28/19 1:54 AM, Srinath Mannam wrote:
> This patch series adds PCIe legacy interrupt (INTx) support to the iProc
> PCIe driver by modeling it with its own IRQ domain. All 4 interrupts INTA,
> INTB, INTC, INTD share the same interrupt line connected to the GIC
> in the system. This is now modeled by using its own IRQ domain.
> 
> Also update all relevant devicetree files to adapt to the new model.
> 
> This patch set is based on Linux-5.2-rc4.
> 
> Changes from v1:
>   - Addressed Rob, Lorenzo, Arnd's comments
>     - Used child node for interrupt controller.
>   - Addressed Andy Shevchenko's comments
>     - Replaced while loop with do-while.

Lorenzo, Bjorn, if you are good with the binding and PCI host driver
changes, you can take patches 1-2 through your tree, and I will queue up
the others through the Broadcom ARM SoC pull requests. If not, please
feel free to add a:

Acked-by: Florian Fainelli <f.fainelli@gmail.com>

> 
> Ray Jui (6):
>   dt-bindings: pci: Update iProc PCI binding for INTx support
>   PCI: iproc: Add INTx support with better modeling
>   arm: dts: Change PCIe INTx mapping for Cygnus
>   arm: dts: Change PCIe INTx mapping for NSP
>   arm: dts: Change PCIe INTx mapping for HR2
>   arm64: dts: Change PCIe INTx mapping for NS2
> 
>  .../devicetree/bindings/pci/brcm,iproc-pcie.txt    |  48 ++++++++--
>  arch/arm/boot/dts/bcm-cygnus.dtsi                  |  30 ++++++-
>  arch/arm/boot/dts/bcm-hr2.dtsi                     |  30 ++++++-
>  arch/arm/boot/dts/bcm-nsp.dtsi                     |  45 ++++++++--
>  arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi   |  28 +++++-
>  drivers/pci/controller/pcie-iproc.c                | 100 ++++++++++++++++++++-
>  drivers/pci/controller/pcie-iproc.h                |   6 ++
>  7 files changed, 260 insertions(+), 27 deletions(-)
> 


-- 
Florian
