From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/2] phy: zynqmp: Add phy driver for xilinx zynqmp phy
 core
Date: Mon, 10 Sep 2018 15:15:23 -0500
Message-ID: <20180910201523.GA4024@bogus>
References: <1536165747-6405-1-git-send-email-anurag.kumar.vulisha@xilinx.com>
 <1536165747-6405-2-git-send-email-anurag.kumar.vulisha@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1536165747-6405-2-git-send-email-anurag.kumar.vulisha@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>
Cc: kishon@ti.com, michal.simek@xilinx.com, mark.rutland@arm.com, vivek.gautam@codeaurora.org, v.anuragkumar@gmail.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 05, 2018 at 10:12:26PM +0530, Anurag Kumar Vulisha wrote:
> ZynqMP SoC has a Gigabit Transceiver with four lanes. All the high speed
> peripherals such as USB, SATA, PCIE, Display Port and Ethernet SGMII can
> rely on any of the four GT lanes for PHY layer. This patch adds driver
> for that ZynqMP GT core.
> 
> Signed-off-by: Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>
> ---
> Changes in v3:
> 	1. Corrected the Documentation as suggested by Vivek Gautam
> 
> Changes in v2:
> 	1. Fixed the compilation error when compiled phy-zynqmp.c as a module
> 	2. Added CONFIG_PM macro in phy-zynqmp.c driver
> ---
>  drivers/phy/Kconfig            |    8 +
>  drivers/phy/Makefile           |    1 +
>  drivers/phy/phy-zynqmp.c       | 1581 ++++++++++++++++++++++++++++++++++++++++
>  include/dt-bindings/phy/phy.h  |    2 +

This goes in patch 2. And patch 2 should come first.

>  include/linux/phy/phy-zynqmp.h |   52 ++
>  5 files changed, 1644 insertions(+)
>  create mode 100644 drivers/phy/phy-zynqmp.c
>  create mode 100644 include/linux/phy/phy-zynqmp.h
