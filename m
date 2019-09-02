From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/6] dt-bindings: pci: Update iProc PCI binding for INTx support
Date: Mon, 02 Sep 2019 14:38:43 +0100
Message-ID: <5d6d1b64.1c69fb81.a5aa4.0864@mx.google.com>
References: <1566982488-9673-1-git-send-email-srinath.mannam@broadcom.com> <1566982488-9673-2-git-send-email-srinath.mannam@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1566982488-9673-2-git-send-email-srinath.mannam@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinath Mannam <srinath.mannam@broadcom.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, Mark Rutland <mark.rutland@arm.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Arnd Bergmann <arnd@arndb.de>, bcm-kernel-feedback-list@broadcom.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Ray Jui <ray.jui@broadcom.com>
List-Id: devicetree@vger.kernel.org

On Wed, 28 Aug 2019 14:24:43 +0530, Srinath Mannam wrote:
> From: Ray Jui <ray.jui@broadcom.com>
> 
> Update the iProc PCIe binding document for better modeling of the legacy
> interrupt (INTx) support
> 
> Signed-off-by: Ray Jui <ray.jui@broadcom.com>
> Signed-off-by: Srinath Mannam <srinath.mannam@broadcom.com>
> ---
>  .../devicetree/bindings/pci/brcm,iproc-pcie.txt    | 48 ++++++++++++++++++----
>  1 file changed, 41 insertions(+), 7 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
