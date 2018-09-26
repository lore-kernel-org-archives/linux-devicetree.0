From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/2] phy: zynqmp: Add dt bindings for ZynqMP phy
Date: Wed, 26 Sep 2018 15:59:02 -0500
Message-ID: <20180926205902.GA28877@bogus>
References: <1536769366-31398-1-git-send-email-anurag.kumar.vulisha@xilinx.com>
 <1536769366-31398-2-git-send-email-anurag.kumar.vulisha@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1536769366-31398-2-git-send-email-anurag.kumar.vulisha@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, michal.simek@xilinx.com, vivek.gautam@codeaurora.org, kishon@ti.com, v.anuragkumar@gmail.com, APANDEY@xilinx.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>
List-Id: devicetree@vger.kernel.org

On Wed, 12 Sep 2018 21:52:45 +0530, Anurag Kumar Vulisha wrote:
> This patch adds the document describing dt bindings for ZynqMP
> phy. ZynqMP SOC has a High Speed Processing System Gigabit
> Transceiver which provides PHY capabilties to USB, SATA,
> PCIE, Display Port and Ehernet SGMII controllers.
> 
> Signed-off-by: Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>
> ---
>  Changes in v4:
> 	1. Fixed the changes in phy-zynqmp.txt as suggested by "Rob Herring"
> 	2. Moved changes from include/dt-bindings/phy/phy.h into Patch 2 to 1
> 
>  Changes in v3:
> 	1. Corrected the Documentation as suggested by "Vivek Gautam"
> 
>  Changes in v2:
> 	1. None
> ---
>  .../devicetree/bindings/phy/phy-zynqmp.txt         | 109 +++++++++++++++++++++
>  include/dt-bindings/phy/phy.h                      |   2 +
>  2 files changed, 111 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/phy-zynqmp.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
