From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 2/8] dt-bindings: pci: Add DT docs for Brcmstb PCIe
 device
Date: Fri, 19 Jan 2018 13:20:26 -0600
Message-ID: <20180119192026.b3bhiercl45u2mga@rob-hp-laptop>
References: <1516058925-46522-1-git-send-email-jim2101024@gmail.com>
 <1516058925-46522-3-git-send-email-jim2101024@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1516058925-46522-3-git-send-email-jim2101024@gmail.com>
Sender: linux-pci-owner@vger.kernel.org
To: Jim Quinlan <jim2101024@gmail.com>
Cc: linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Brian Norris <computersforpeace@gmail.com>, Russell King <rmk+kernel@armlinux.org.uk>, Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>, Florian Fainelli <f.fainelli@gmail.com>, Jonas Gorski <jonas.gorski@gmail.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-mips@linux-mips.org, linux-pci@vger.kernel.org, Kevin Cernekee <cernekee@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, bcm-kernel-feedback-list@broadcom.com, Gregory Fong <gregory.0xf0@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 15, 2018 at 06:28:39PM -0500, Jim Quinlan wrote:
> The DT bindings description of the Brcmstb PCIe device is described.  This
> node can be used by almost all Broadcom settop box chips, using
> ARM, ARM64, or MIPS CPU architectures.
> 
> Signed-off-by: Jim Quinlan <jim2101024@gmail.com>
> ---
>  .../devicetree/bindings/pci/brcmstb-pcie.txt       | 59 ++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/brcmstb-pcie.txt

I acked v3. Please add acks when posting new versions.
