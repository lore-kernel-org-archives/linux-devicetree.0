From: Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH v7 2/2] PCI: Rockchip: Add Rockchip PCIe controller
 support
Date: Fri, 22 Jul 2016 15:29:03 -0700
Message-ID: <20160722222902.GB58807@google.com>
References: <1468802533-17699-1-git-send-email-shawn.lin@rock-chips.com>
 <1468802533-17699-2-git-send-email-shawn.lin@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1468802533-17699-2-git-send-email-shawn.lin@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Marc Zyngier <marc.zyngier@arm.com>, linux-pci@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Heiko Stuebner <heiko@sntech.de>, Doug Anderson <dianders@chromium.org>, Wenrui Li <wenrui.li@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Shawn,

On Mon, Jul 18, 2016 at 08:42:13AM +0800, Shawn Lin wrote:
> This patch adds Rockchip PCIe controller support found
> on RK3399 Soc platform.
> 
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
> 
> ---
> 
> Changes in v7:
> - make it as a build-in driver
> - improve gen1/2 training timeout checking
> - only clear known interrupt
> - fix INTx for 0-base index

Also:
  - Fix infinite loop in legacy interrupt handler

(not that the changelog is that critical to get exactly right)

> 
> Changes in v6:
> - use "depends on PCI_MSI_IRQ_DOMAIN" suggested by Arnd
> 
> Changes in v5:
> - handle multiple pending INTx at the same time
>   suggested by Marc
> 
> Changes in v4:
> - address the comments from Brain
> 
> Changes in v3:
> - remove header file
> - remove struct msi_controller and move most of variables
>   of rockchip_pcie_port to become the local ones.
> - allow legacy int even if enabling MSI
> - drop regulator set voltage operation suggested by Doug
> 
> Changes in v2:
> - remove phy related stuff and call phy API
> - add new head file and define lots of macro to make
>   the code more readable
> - remove lots msi related code suggested by Marc
> - add IO window address translation
> - init_port and parse_dt reconstruction suggested by Bharat
> - improve wr_own_conf suggested by Arnd
> - make pcie as an interrupt controller and fix wrong int handler
>   suggested by Marc
> - remove PCI_PROBE_ONLY suggested by Lorenzo
> 
>  drivers/pci/host/Kconfig         |   11 +
>  drivers/pci/host/Makefile        |    1 +
>  drivers/pci/host/pcie-rockchip.c | 1233 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 1245 insertions(+)
>  create mode 100644 drivers/pci/host/pcie-rockchip.c
> 
[...]

Looks better to me:

Reviewed-by: Brian Norris <briannorris@chromium.org>
