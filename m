From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 2/8] dt-bindings: pci: Add DT docs for Brcmstb PCIe
 device
Date: Wed, 15 Nov 2017 23:07:17 -0600
Message-ID: <20171116050717.35lklxvhfvtuly5i@rob-hp-laptop>
References: <1510697532-32828-1-git-send-email-jim2101024@gmail.com>
 <1510697532-32828-3-git-send-email-jim2101024@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1510697532-32828-3-git-send-email-jim2101024@gmail.com>
Sender: linux-pci-owner@vger.kernel.org
To: Jim Quinlan <jim2101024@gmail.com>
Cc: linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Brian Norris <computersforpeace@gmail.com>, Russell King <rmk+kernel@armlinux.org.uk>, Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>, Florian Fainelli <f.fainelli@gmail.com>, Jonas Gorski <jonas.gorski@gmail.com>, linux-pci@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Gregory Fong <gregory.0xf0@gmail.com>, Kevin Cernekee <cernekee@gmail.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 14, 2017 at 05:12:06PM -0500, Jim Quinlan wrote:
> The DT bindings description of the Brcmstb PCIe device is described.  This
> node can be used by almost all Broadcom settop box chips, using
> ARM, ARM64, or MIPS CPU architectures.
> 
> Signed-off-by: Jim Quinlan <jim2101024@gmail.com>
> ---
>  .../devicetree/bindings/pci/brcmstb-pcie.txt       | 59 ++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/brcmstb-pcie.txt

Acked-by: Rob Herring <robh@kernel.org>
