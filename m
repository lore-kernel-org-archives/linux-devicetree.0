From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: PCI: rockchip: Add vpcie12v-supply for
 Rockchip PCIe controller
Date: Thu, 6 Jul 2017 09:39:36 -0500
Message-ID: <20170706143936.bl5yrrvseiq6fbu5@rob-hp-laptop>
References: <1498699288-63944-1-git-send-email-shawn.lin@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1498699288-63944-1-git-send-email-shawn.lin@rock-chips.com>
Sender: linux-pci-owner@vger.kernel.org
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 29, 2017 at 09:21:28AM +0800, Shawn Lin wrote:
> PCIe connector provide a optional 12V power supply for high
> power downstream components, so we add this as a optional
> one if we need to control it.
> 
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
> ---
> 
>  Documentation/devicetree/bindings/pci/rockchip-pcie.txt | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Rob Herring <robh@kernel.org>
