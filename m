From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH RESEND] bindings: PCI: artpec: correct pci binding example
Date: Wed, 31 Aug 2016 10:02:36 -0500
Message-ID: <20160831150236.GA10586@rob-hp-laptop>
References: <1472162516-8966-1-git-send-email-niklass@axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1472162516-8966-1-git-send-email-niklass@axis.com>
Sender: linux-pci-owner@vger.kernel.org
To: Niklas Cassel <niklas.cassel@axis.com>
Cc: bhelgaas@google.com, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, Niklas Cassel <niklass@axis.com>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 26, 2016 at 12:01:56AM +0200, Niklas Cassel wrote:
> From: Niklas Cassel <niklas.cassel@axis.com>
> 
>  - Increase config size. When using a PCIe switch,
>    the previous config size only had room for one device.
>  - Add bus range. Inherited optional property.
>  - Map downstream I/O to PCI address 0. We can map it to any
>    address, but let's be consistent with other drivers.
> 
> Signed-off-by: Niklas Cassel <niklas.cassel@axis.com>
> ---
>  Documentation/devicetree/bindings/pci/axis,artpec6-pcie.txt | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

As this is just a binding change, I've applied it.

Rob
