From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] PCI: Xilinx NWL PCIe: Updating device tree documentation
 with prefetchable memory space
Date: Wed, 10 Aug 2016 17:22:51 -0500
Message-ID: <20160810222251.GA31705@rob-hp-laptop>
References: <1470751209-31203-1-git-send-email-bharatku@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1470751209-31203-1-git-send-email-bharatku@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bharat Kumar Gogada <bharat.kumar.gogada@xilinx.com>
Cc: devicetree@vger.kernel.org, mark.rutland@arm.com, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, marc.zyngier@arm.com, linux-kernel@vger.kernel.org, michal.simek@xilinx.com, Bharat Kumar Gogada <bharatku@xilinx.com>, rgummal@xilinx.com, linux-arm-kernel@lists.infradead.org, galak@codeaurora.org, soren.brinkmann@xilinx.com
List-Id: devicetree@vger.kernel.org

On Tue, Aug 09, 2016 at 07:30:09PM +0530, Bharat Kumar Gogada wrote:
> Updating device tree documentation with prefetchable memory
> sapce.
> Configuration space shifted to 64-bit address space.
> 
> Signed-off-by: Bharat Kumar Gogada <bharatku@xilinx.com>
> ---
>  Documentation/devicetree/bindings/pci/xilinx-nwl-pcie.txt | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
