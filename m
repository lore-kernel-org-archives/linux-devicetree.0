From: Shawn Lin <shawn.lin@rock-chips.com>
Subject: Re: [PATCH v3 2/2] PCI: Rockchip: Add Rockchip PCIe controller
 support
Date: Thu, 23 Jun 2016 09:09:46 +0800
Message-ID: <dcdc3402-22d9-473a-d9ae-b9bd994c24a6@rock-chips.com>
References: <1466041835-1695-1-git-send-email-shawn.lin@rock-chips.com>
 <20160623002919.GA21157@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160623002919.GA21157@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <briannorris@chromium.org>
Cc: shawn.lin@rock-chips.com, Bjorn Helgaas <bhelgaas@google.com>, devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, Arnd Bergmann <arnd@arndb.de>, Marc Zyngier <marc.zyngier@arm.com>, linux-pci@vger.kernel.org, Wenrui Li <wenrui.li@rock-chips.com>, linux-kernel@vger.kernel.org, Doug Anderson <dianders@chromium.org>, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

=E5=9C=A8 2016/6/23 8:29, Brian Norris =E5=86=99=E9=81=93:
> Hi Shawn,
>
> I'm familiarizing myself a bit with your PCIe core, but I'm certainly=
 no
> expert, so I may have some dumb comments. Also a few other general
> comments.
>
> On Thu, Jun 16, 2016 at 09:50:35AM +0800, Shawn Lin wrote:
>> This patch adds Rockchip PCIe controller support found
>> on RK3399 Soc platform.
>>
>> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
>>
>> ---
>>
>> Changes in v3:
>> - remove header file
>> - remove struct msi_controller and move most of variables
>>   of rockchip_pcie_port to become the local ones.
>> - allow legacy int even if enabling MSI
>> - drop regulator set voltage operation suggested by Doug
>>
>> Changes in v2:
>> - remove phy related stuff and call phy API
>> - add new head file and define lots of macro to make
>>   the code more readable
>> - remove lots msi related code suggested by Marc
>> - add IO window address translation
>> - init_port and parse_dt reconstruction suggested by Bharat
>> - improve wr_own_conf suggested by Arnd
>> - make pcie as an interrupt controller and fix wrong int handler
>>   suggested by Marc
>> - remove PCI_PROBE_ONLY suggested by Lorenzo
>>
>>  drivers/pci/host/Kconfig         |   11 +
>>  drivers/pci/host/Makefile        |    1 +
>>  drivers/pci/host/pcie-rockchip.c | 1183 +++++++++++++++++++++++++++=
+++++++++++
>>  3 files changed, 1195 insertions(+)
>>  create mode 100644 drivers/pci/host/pcie-rockchip.c
>>
>> diff --git a/drivers/pci/host/Kconfig b/drivers/pci/host/Kconfig
>> index 5d2374e..251f4ac 100644
>> --- a/drivers/pci/host/Kconfig
>> +++ b/drivers/pci/host/Kconfig
>> @@ -245,4 +245,15 @@ config PCIE_ARMADA_8K
>>  	  Designware hardware and therefore the driver re-uses the
>>  	  Designware core functions to implement the driver.
>>
>> +config PCIE_ROCKCHIP
>> +	bool "Rockchip PCIe controller"
>
> Any good reason this can't be a module? I realize PCIe is something w=
e'd
> likely want built in most of the time, but is there a code reason?

If you want it to be tristate, I will update it.

>
>> +	depends on ARM64 && ARCH_ROCKCHIP
>> +	depends on OF
>> +	select MFD_SYSCON
>> +	select PCI_MSI_IRQ_DOMAIN if PCI_MSI
>> +	help
>> +	  Say Y here if you want internal PCI support on Rockchip SoC.
>> +	  There are 1 internal PCIe port available to support GEN2 with
>
> s/are/is/

will fix.

>
>> +	  4 slots.
>> +
>>  endmenu
>> diff --git a/drivers/pci/host/Makefile b/drivers/pci/host/Makefile
>> index 9c8698e..c52985c 100644
>> --- a/drivers/pci/host/Makefile
>> +++ b/drivers/pci/host/Makefile
>> @@ -29,3 +29,4 @@ obj-$(CONFIG_PCIE_QCOM) +=3D pcie-qcom.o
>>  obj-$(CONFIG_PCI_HOST_THUNDER_ECAM) +=3D pci-thunder-ecam.o
>>  obj-$(CONFIG_PCI_HOST_THUNDER_PEM) +=3D pci-thunder-pem.o
>>  obj-$(CONFIG_PCIE_ARMADA_8K) +=3D pcie-armada8k.o
>> +obj-$(CONFIG_PCIE_ROCKCHIP) +=3D pcie-rockchip.o
>> diff --git a/drivers/pci/host/pcie-rockchip.c b/drivers/pci/host/pci=
e-rockchip.c
>> new file mode 100644
>> index 0000000..661d6e0
>> --- /dev/null
>> +++ b/drivers/pci/host/pcie-rockchip.c
>> @@ -0,0 +1,1183 @@
>> +/*
>> + * Rockchip AXI PCIe host controller driver
>> + *
>> + * Copyright (c) 2016 Rockchip, Inc.
>> + *
>> + * Author: Shawn Lin <shawn.lin@rock-chips.com>
>> + *         Wenrui Li <wenrui.li@rock-chips.com>
>> + *
>> + * Bits taken from Synopsys Designware Host controller driver and
>> + * ARM PCI Host generic driver.
>> + *
>> + * This program is free software: you can redistribute it and/or mo=
dify
>> + * it under the terms of the GNU General Public License as publishe=
d by
>> + * the Free Software Foundation, either version 2 of the License, o=
r
>> + * (at your option) any later version.
>> + */
>
> Add a blank line here?

will fix it.

>
>> +#include <linux/clk.h>
>> +#include <linux/delay.h>
>> +#include <linux/gpio/consumer.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/irq.h>
>> +#include <linux/irqchip/chained_irq.h>
>> +#include <linux/irqdomain.h>
>> +#include <linux/kernel.h>
>> +#include <linux/mfd/syscon.h>
>> +#include <linux/module.h>
>> +#include <linux/of_address.h>
>> +#include <linux/of_device.h>
>> +#include <linux/of_pci.h>
>> +#include <linux/of_platform.h>
>> +#include <linux/of_irq.h>
>> +#include <linux/pci.h>
>> +#include <linux/pci_ids.h>
>> +#include <linux/phy/phy.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/reset.h>
>> +#include <linux/regmap.h>
>> +
>> +#define PCIE_CLIENT_BASE                0x0
>> +#define PCIE_RC_CONFIG_NORMAL_BASE      0x800000
>> +#define PCIE_RC_CONFIG_BASE             0xa00000
>> +#define PCIE_CORE_LINK_CTRL_STATUS      0x8000d0
>> +#define PCIE_CORE_CTRL_MGMT_BASE        0x900000
>> +#define PCIE_CORE_AXI_CONF_BASE         0xc00000
>> +#define PCIE_CORE_AXI_INBOUND_BASE      0xc00800
>> +#define PCIE_CLIENT_BASIC_STATUS0       0x44
>> +#define PCIE_CLIENT_BASIC_STATUS1       0x48
>> +#define PCIE_CLIENT_INT_MASK            0x4c
>> +#define PCIE_CLIENT_INT_STATUS          0x50
>> +#define PCIE_RC_CONFIG_RID_CCR          0x8
>> +#define PCIR_RC_CONFIG_LCS              0xd0
>
> s/PCIR/PCIE/
>
> ...right?

Ahh... my slippy finger, I will rename it.:)

>
>> +#define PCIE_RC_BAR_CONF                0x300
>> +#define PCIE_CORE_OB_REGION_ADDR1       0x4
>> +#define PCIE_CORE_OB_REGION_DESC0       0x8
>> +#define PCIE_CORE_OB_REGION_DESC1       0xc
>> +#define PCIE_RP_IB_ADDR_TRANS           0x4
>> +#define PCIE_CORE_INT_MASK              0x900210
>> +#define PCIE_CORE_INT_STATUS            0x90020c
>> +
>> +/* Size of one AXI Region (not Region 0) */
>> +#define AXI_REGION_SIZE                 BIT(20)
>> +/* Size of Region 0, equal to sum of sizes of other regions */
>> +#define AXI_REGION_0_SIZE              (32 * (0x1 << 20))
>> +#define OB_REG_SIZE_SHIFT               5
>> +#define IB_ROOT_PORT_REG_SIZE_SHIFT     3
>> +#define AXI_WRAPPER_IO_WRITE            0x6
>> +#define AXI_WRAPPER_MEM_WRITE           0x2
>> +#define MAX_AXI_IB_ROOTPORT_REGION_NUM  3
>> +#define MIN_AXI_ADDR_BITS_PASSED        8
>> +#define ROCKCHIP_VENDOR_ID              0x1d87
>> +#define PCIE_ECAM_BUS(x)		(((x) & 0xFF) << 20)
>> +#define PCIE_ECAM_DEV(x)		(((x) & 0x1F) << 15)
>> +#define PCIE_ECAM_FUNC(x)		(((x) & 0x7) << 12)
>> +#define PCIE_ECAM_REG(x)		(((x) & 0xFFF) << 0)
>> +#define PCIE_ECAM_ADDR(bus, dev, func, reg) \
>> +	  (PCIE_ECAM_BUS(bus) | PCIE_ECAM_DEV(dev) | \
>> +	   PCIE_ECAM_FUNC(func) | PCIE_ECAM_REG(reg))
>> +
>> +/*
>> +  * The higher 16-bit of this register is used for write protection
>> +  * only if BIT(x + 16) set to 1 the BIT(x) can be written.
>> +  */
>> +#define HIWORD_UPDATE(val, mask, shift) \
>> +	((val) << (shift) | (mask) << ((shift) + 16))
>> +
>> +#define RC_REGION_0_ADDR_TRANS_H        0x00000000
>> +#define RC_REGION_0_ADDR_TRANS_L        0x00000000
>> +#define RC_REGION_0_PASS_BITS           (25 - 1)
>> +#define RC_REGION_1_ADDR_TRANS_H        0x00000000
>> +#define RC_REGION_1_ADDR_TRANS_L        0x00400000
>> +#define RC_REGION_1_PASS_BITS           (20 - 1)
>> +#define MAX_AXI_WRAPPER_REGION_NUM      33
>> +#define PCIE_CORE_LCSR_RETAIN_LINK      BIT(5)
>
> s/RETAIN/RETRAIN/

will fix.

>
>> +#define PCIE_CLIENT_CONF_ENABLE         1
>> +#define PCIE_CLIENT_LINK_TRAIN_ENABLE   1
>> +#define PCIE_CLIENT_ARI_ENABLE          1
>> +#define PCIE_CLIENT_CONF_LANE_NUM(x)    (x / 2)
>> +#define PCIE_CLIENT_MODE_RC             1
>> +#define PCIE_CLIENT_GEN_SEL_2           1
>> +#define PCIE_CLIENT_GEN_SEL_1           0
>> +#define PCIE_CLIENT_CONF_ENABLE_SHIFT   0
>> +#define PCIE_CLIENT_CONF_ENABLE_MASK    0x1
>
> It's quite confusing (IMO) having the values (e.g.,
> PCIE_CLIENT_CONF_ENABLE) separated from the bitfield SHIFT/MASK macro=
s.
> Can you reorganize so they're listed next to each other?
>

okay.

>> +#define PCIE_CLIENT_LINK_TRAIN_SHIFT    1
>> +#define PCIE_CLIENT_LINK_TRAIN_MASK     0x1
>> +#define PCIE_CLIENT_ARI_ENABLE_SHIFT    3
>> +#define PCIE_CLIENT_ARI_ENABLE_MASK     0x1
>> +#define PCIE_CLIENT_CONF_LANE_NUM_SHIFT 4
>> +#define PCIE_CLIENT_CONF_LANE_NUM_MASK  0x3
>> +#define PCIE_CLIENT_MODE_SHIFT          6
>> +#define PCIE_CLIENT_MODE_MASK           0x1
>> +#define PCIE_CLIENT_GEN_SEL_SHIFT       7
>> +#define PCIE_CLIENT_GEN_SEL_MASK        0x1
>> +#define PCIE_CLIENT_LINK_STATUS_UP      0x3
>> +#define PCIE_CLIENT_LINK_STATUS_SHIFT   20
>> +#define PCIE_CLIENT_LINK_STATUS_MASK    0x3
>> +#define PCIE_CORE_PL_CONF_SPEED_25G     0x0
>> +#define PCIE_CORE_PL_CONF_SPEED_50G     0x1
>> +#define PCIE_CORE_PL_CONF_SPEED_80G     0x2
>
> These speeds are not actually 25/50/80G, they're 2.5/5.0/8.0G. Maybe =
you
> can either add an underscore (_) where the decimal would be? And
> optionally drop the 0's? Like:

sounds good.

>
> #define PCIE_CORE_PL_CONF_SPEED_2_5G     0x0
> #define PCIE_CORE_PL_CONF_SPEED_5G       0x1
> #define PCIE_CORE_PL_CONF_SPEED_8G       0x2
>
> I'd be ashamed to admit how much time I spent confused as to where yo=
u
> were getting 25, 50, and 80 from...
>
>> +#define PCIE_CORE_PL_CONF_SPEED_SHIFT   3
>> +#define PCIE_CORE_PL_CONF_SPEED_MASK    0x3
>> +#define PCIE_CORE_PL_CONF_LANE_SHIFT    1
>> +#define PCIE_CORE_PL_CONF_LANE_MASK     0x3
>> +#define PCIE_CORE_RC_CONF_SCC_SHIFT     16
>> +
>> +/* PCIE_CLIENT_INT_STATUS */
>> +#define PCIE_CLIENT_INT_LEGACY_DONE     BIT(15)
>> +#define PCIE_CLIENT_INT_MSG             BIT(14)
>> +#define PCIE_CLIENT_INT_HOT_RST         BIT(13)
>> +#define PCIE_CLIENT_INT_DPA             BIT(12)
>> +#define PCIE_CLIENT_INT_FATAL_ERR       BIT(11)
>> +#define PCIE_CLIENT_INT_NFATAL_ERR      BIT(10)
>> +#define PCIE_CLIENT_INT_CORR_ERR        BIT(9)
>> +#define PCIE_CLIENT_INT_INTD            BIT(8)
>> +#define PCIE_CLIENT_INT_INTC            BIT(7)
>> +#define PCIE_CLIENT_INT_INTB            BIT(6)
>> +#define PCIE_CLIENT_INT_INTA            BIT(5)
>> +#define PCIE_CLIENT_INT_LOCAL           BIT(4)
>> +#define PCIE_CLIENT_INT_UDMA            BIT(3)
>> +#define PCIE_CLIENT_INT_PHY             BIT(2)
>> +#define PCIE_CLIENT_INT_HOT_PLUG        BIT(1)
>> +#define PCIE_CLIENT_INT_PWR_STCG        BIT(0)
>> +#define PCIE_CORE_INT_PRFPE             BIT(0)
>> +#define PCIE_CORE_INT_CRFPE             BIT(1)
>> +#define PCIE_CORE_INT_RRPE              BIT(2)
>> +#define PCIE_CORE_INT_PRFO              BIT(3)
>> +#define PCIE_CORE_INT_CRFO              BIT(4)
>> +#define PCIE_CORE_INT_RT                BIT(5)
>> +#define PCIE_CORE_INT_RTR               BIT(6)
>> +#define PCIE_CORE_INT_PE                BIT(7)
>> +#define PCIE_CORE_INT_MTR               BIT(8)
>> +#define PCIE_CORE_INT_UCR               BIT(9)
>> +#define PCIE_CORE_INT_FCE               BIT(10)
>> +#define PCIE_CORE_INT_CT                BIT(11)
>> +#define PCIE_CORE_INT_UTC               BIT(18)
>> +#define PCIE_CORE_INT_MMVC              BIT(19)
>> +
>> +#define ROCKCHIP_PCIE_RPIFR1_INTR_MASK  GENMASK(8, 5)
>> +#define ROCKCHIP_PCIE_RPIFR1_INTR_SHIFT 5
>> +
>> +#define PCIE_CORE_INT \
>> +		(PCIE_CORE_INT_PRFPE | PCIE_CORE_INT_CRFPE | \
>> +		 PCIE_CORE_INT_RRPE | PCIE_CORE_INT_CRFO | \
>> +		 PCIE_CORE_INT_RT | PCIE_CORE_INT_RTR | \
>> +		 PCIE_CORE_INT_PE | PCIE_CORE_INT_MTR | \
>> +		 PCIE_CORE_INT_UCR | PCIE_CORE_INT_FCE | \
>> +		 PCIE_CORE_INT_CT | PCIE_CORE_INT_UTC | \
>> +		 PCIE_CORE_INT_MMVC)
>> +
>> +#define PCIE_CLIENT_INT_SUBSYSTEM \
>> +	(PCIE_CLIENT_INT_PWR_STCG | PCIE_CLIENT_INT_HOT_PLUG | \
>> +	PCIE_CLIENT_INT_PHY | PCIE_CLIENT_INT_UDMA | \
>> +	PCIE_CLIENT_INT_LOCAL)
>> +
>> +#define PCIE_CLIENT_INT_LEGACY \
>> +	(PCIE_CLIENT_INT_INTA | PCIE_CLIENT_INT_INTB | \
>> +	PCIE_CLIENT_INT_INTC | PCIE_CLIENT_INT_INTD)
>> +
>> +#define PCIE_CLIENT_INT_CLI \
>> +	(PCIE_CLIENT_INT_CORR_ERR | PCIE_CLIENT_INT_NFATAL_ERR | \
>> +	PCIE_CLIENT_INT_FATAL_ERR | PCIE_CLIENT_INT_DPA | \
>> +	PCIE_CLIENT_INT_HOT_RST | PCIE_CLIENT_INT_MSG | \
>> +	PCIE_CLIENT_INT_LEGACY_DONE | PCIE_CLIENT_INT_LEGACY)
>> +
>> +struct rockchip_pcie_port {
>> +	void	__iomem *reg_base;
>> +	void	__iomem *apb_base;
>> +	struct	phy *phy;
>> +	struct	reset_control *core_rst;
>> +	struct	reset_control *mgmt_rst;
>> +	struct	reset_control *mgmt_sticky_rst;
>> +	struct	reset_control *pipe_rst;
>> +	struct	clk *aclk_pcie;
>> +	struct	clk *aclk_perf_pcie;
>> +	struct	clk *hclk_pcie;
>> +	struct	clk *clk_pcie_pm;
>> +	struct	regulator *vpcie3v3; /* 3.3V power supply */
>> +	struct	regulator *vpcie1v8; /* 1.8V power supply */
>> +	struct	regulator *vpcie0v9; /* 0.9V power supply */
>> +	struct	gpio_desc *ep_gpio;
>> +	u32	lanes;
>> +	u8	root_bus_nr;
>> +	struct	device *dev;
>> +	struct	irq_domain *irq_domain;
>> +};
>> +
>> +static irqreturn_t rockchip_pcie_subsys_irq_handler(int irq, void *=
arg);
>> +static irqreturn_t rockchip_pcie_client_irq_handler(int irq, void *=
arg);
>> +static void rockchip_pcie_legacy_int_handler(struct irq_desc *desc)=
;
>> +
>> +static inline u32 pcie_read(struct rockchip_pcie_port *port, u32 re=
g)
>> +{
>> +	return readl(port->apb_base + reg);
>> +}
>> +
>> +static inline void pcie_write(struct rockchip_pcie_port *port,
>> +			      u32 val, u32 reg)
>> +{
>> +	writel(val, port->apb_base + reg);
>> +}
>> +
>> +static int rockchip_pcie_valid_config(struct rockchip_pcie_port *pp=
,
>> +				      struct pci_bus *bus, int dev)
>> +{
>> +	/* access only one slot on each root port */
>> +	if (bus->number =3D=3D pp->root_bus_nr && dev > 0)
>> +		return 0;
>> +
>> +	/*
>> +	 * do not read more than one device on the bus directly attached
>> +	 * to RC's (Virtual Bridge's) DS side.
>> +	 */
>> +	if (bus->primary =3D=3D pp->root_bus_nr && dev > 0)
>> +		return 0;
>> +
>> +	return 1;
>> +}
>> +
>> +static int rockchip_pcie_rd_own_conf(struct rockchip_pcie_port *pp,
>> +				     int where, int size,
>> +				     u32 *val)
>> +{
>> +	void __iomem *addr =3D pp->apb_base + PCIE_RC_CONFIG_BASE + where;
>> +
>> +	if (!IS_ALIGNED((uintptr_t)addr, size)) {
>> +		*val =3D 0;
>> +		return PCIBIOS_BAD_REGISTER_NUMBER;
>> +	}
>> +
>> +	if (size =3D=3D 4) {
>> +		*val =3D readl(addr);
>> +	} else if (size =3D=3D 2) {
>> +		*val =3D readw(addr);
>> +	} else if (size =3D=3D 1) {
>> +		*val =3D readb(addr);
>> +	} else {
>> +		*val =3D 0;
>> +		return PCIBIOS_BAD_REGISTER_NUMBER;
>> +	}
>> +	return PCIBIOS_SUCCESSFUL;
>> +}
>> +
>> +static int rockchip_pcie_wr_own_conf(struct rockchip_pcie_port *pp,
>> +				     int where, int size, u32 val)
>> +{
>> +	u32 mask, tmp, offset;
>> +
>> +	offset =3D (where & (~0x3));
>> +
>> +	if (size =3D=3D 4) {
>> +		writel(val, pp->apb_base + PCIE_RC_CONFIG_BASE + offset);
>> +		return PCIBIOS_SUCCESSFUL;
>> +	}
>> +
>> +	mask =3D ~(((1 << (size * 8)) - 1) << ((where & 0x3) * 8));
>> +
>> +	tmp =3D readl(pp->apb_base + PCIE_RC_CONFIG_BASE + offset) & mask;
>> +	tmp |=3D val << ((where & 0x3) * 8);
>> +	writel(tmp, pp->apb_base + PCIE_RC_CONFIG_BASE + offset);
>> +
>> +	return PCIBIOS_SUCCESSFUL;
>> +}
>> +
>> +static int rockchip_pcie_rd_other_conf(struct rockchip_pcie_port *p=
p,
>> +				       struct pci_bus *bus, u32 devfn,
>> +				       int where, int size, u32 *val)
>> +{
>> +	u32 busdev;
>> +
>> +	busdev =3D PCIE_ECAM_ADDR(bus->number, PCI_SLOT(devfn),
>> +				PCI_FUNC(devfn), where);
>> +
>> +	if (!IS_ALIGNED(busdev, size)) {
>> +		*val =3D 0;
>> +		return PCIBIOS_BAD_REGISTER_NUMBER;
>> +	}
>> +
>> +	if (size =3D=3D 4) {
>> +		*val =3D readl(pp->reg_base + busdev);
>> +	} else if (size =3D=3D 2) {
>> +		*val =3D readw(pp->reg_base + busdev);
>> +	} else if (size =3D=3D 1) {
>> +		*val =3D readb(pp->reg_base + busdev);
>> +	} else {
>> +		*val =3D 0;
>> +		return PCIBIOS_BAD_REGISTER_NUMBER;
>> +	}
>> +	return PCIBIOS_SUCCESSFUL;
>> +}
>> +
>> +static int rockchip_pcie_wr_other_conf(struct rockchip_pcie_port *p=
p,
>> +				       struct pci_bus *bus, u32 devfn,
>> +				       int where, int size, u32 val)
>> +{
>> +	u32 busdev;
>> +
>> +	busdev =3D PCIE_ECAM_ADDR(bus->number, PCI_SLOT(devfn),
>> +				PCI_FUNC(devfn), where);
>> +	if (!IS_ALIGNED(busdev, size))
>> +		return PCIBIOS_BAD_REGISTER_NUMBER;
>> +
>> +	if (size =3D=3D 4)
>> +		writel(val, pp->reg_base + busdev);
>> +	else if (size =3D=3D 2)
>> +		writew(val, pp->reg_base + busdev);
>> +	else if (size =3D=3D 1)
>> +		writeb(val, pp->reg_base + busdev);
>> +	else
>> +		return PCIBIOS_BAD_REGISTER_NUMBER;
>> +
>> +	return PCIBIOS_SUCCESSFUL;
>> +}
>> +
>> +static int rockchip_pcie_rd_conf(struct pci_bus *bus, u32 devfn, in=
t where,
>> +				 int size, u32 *val)
>> +{
>> +	struct rockchip_pcie_port *pp =3D bus->sysdata;
>> +	int ret;
>> +
>> +	if (rockchip_pcie_valid_config(pp, bus, PCI_SLOT(devfn)) =3D=3D 0)=
 {
>> +		*val =3D 0xffffffff;
>> +		return PCIBIOS_DEVICE_NOT_FOUND;
>> +	}
>> +
>> +	if (bus->number !=3D pp->root_bus_nr)
>> +		ret =3D rockchip_pcie_rd_other_conf(pp, bus, devfn,
>> +						  where, size, val);
>> +	else
>> +		ret =3D rockchip_pcie_rd_own_conf(pp, where, size, val);
>> +
>> +	return ret;
>> +}
>> +
>> +static int rockchip_pcie_wr_conf(struct pci_bus *bus, u32 devfn,
>> +				 int where, int size, u32 val)
>> +{
>> +	struct rockchip_pcie_port *pp =3D bus->sysdata;
>> +	int ret;
>> +
>> +	if (rockchip_pcie_valid_config(pp, bus, PCI_SLOT(devfn)) =3D=3D 0)
>> +		return PCIBIOS_DEVICE_NOT_FOUND;
>> +
>> +	if (bus->number !=3D pp->root_bus_nr)
>> +		ret =3D rockchip_pcie_wr_other_conf(pp, bus, devfn,
>> +						  where, size, val);
>> +	else
>> +		ret =3D rockchip_pcie_wr_own_conf(pp, where, size, val);
>> +
>> +	return ret;
>> +}
>> +
>> +static struct pci_ops rockchip_pcie_ops =3D {
>> +	.read =3D rockchip_pcie_rd_conf,
>> +	.write =3D rockchip_pcie_wr_conf,
>> +};
>> +
>> +/**
>> + * rockchip_pcie_init_port - Initialize hardware
>> + * @port: PCIe port information
>> + */
>> +static int rockchip_pcie_init_port(struct rockchip_pcie_port *port)
>> +{
>> +	int err;
>> +	u32 status;
>> +	unsigned long timeout;
>> +
>> +	gpiod_set_value(port->ep_gpio, 0);
>> +
>> +	err =3D phy_init(port->phy);
>> +	if (err < 0)
>> +		dev_err(port->dev, "fail to init phy, err %d\n", err);
>
> Are you intentionally continuing, even on error? Seems like you shoul=
d
> 'return ret'.

Good catch, thanks.

>
>> +
>> +	err =3D reset_control_assert(port->core_rst);
>> +	if (err) {
>> +		dev_err(port->dev, "assert core_rst err %d\n", err);
>> +		return err;
>> +	}
>> +
>> +	err =3D reset_control_assert(port->mgmt_rst);
>> +	if (err) {
>> +		dev_err(port->dev, "assert mgmt_rst err %d\n", err);
>> +		return err;
>> +	}
>> +
>> +	err =3D reset_control_assert(port->mgmt_sticky_rst);
>> +	if (err) {
>> +		dev_err(port->dev, "assert mgmt_sticky_rst err %d\n", err);
>> +		return err;
>> +	}
>> +
>> +	err =3D reset_control_assert(port->pipe_rst);
>> +	if (err) {
>> +		dev_err(port->dev, "assert pipe_rst err %d\n", err);
>> +		return err;
>> +	}
>> +
>> +	pcie_write(port,
>> +		   HIWORD_UPDATE(PCIE_CLIENT_CONF_ENABLE,
>> +				 PCIE_CLIENT_CONF_ENABLE_MASK,
>> +				 PCIE_CLIENT_CONF_ENABLE_SHIFT) |
>> +		   HIWORD_UPDATE(PCIE_CLIENT_CONF_LANE_NUM(port->lanes),
>> +				 PCIE_CLIENT_CONF_LANE_NUM_MASK,
>> +				 PCIE_CLIENT_CONF_LANE_NUM_SHIFT) |
>> +		   HIWORD_UPDATE(PCIE_CLIENT_MODE_RC,
>> +				 PCIE_CLIENT_MODE_MASK,
>> +				 PCIE_CLIENT_MODE_SHIFT) |
>> +		   HIWORD_UPDATE(PCIE_CLIENT_ARI_ENABLE,
>> +				 PCIE_CLIENT_ARI_ENABLE_MASK,
>> +				 PCIE_CLIENT_ARI_ENABLE_SHIFT) |
>> +		   HIWORD_UPDATE(PCIE_CLIENT_GEN_SEL_2,
>> +				 PCIE_CLIENT_GEN_SEL_MASK,
>> +				 PCIE_CLIENT_GEN_SEL_SHIFT),
>> +		   PCIE_CLIENT_BASE);
>> +
>> +	err =3D phy_power_on(port->phy);
>> +	if (err)
>> +		dev_err(port->dev, "fail to power on phy, err %d\n", err);
>
> Same here.
>
>> +
>> +	err =3D reset_control_deassert(port->core_rst);
>> +	if (err) {
>> +		dev_err(port->dev, "deassert core_rst err %d\n", err);
>> +		return err;
>> +	}
>> +
>> +	err =3D reset_control_deassert(port->mgmt_rst);
>> +	if (err) {
>> +		dev_err(port->dev, "deassert mgmt_rst err %d\n", err);
>> +		return err;
>> +	}
>> +
>> +	err =3D reset_control_deassert(port->mgmt_sticky_rst);
>> +	if (err) {
>> +		dev_err(port->dev, "deassert mgmt_sticky_rst err %d\n", err);
>> +		return err;
>> +	}
>> +
>> +	err =3D reset_control_deassert(port->pipe_rst);
>> +	if (err) {
>> +		dev_err(port->dev, "deassert pipe_rst err %d\n", err);
>> +		return err;
>> +	}
>> +
>> +	/* Enable Gen1 trainning */
>
> s/nn/n/
>
>> +	pcie_write(port,
>> +		   HIWORD_UPDATE(PCIE_CLIENT_LINK_TRAIN_ENABLE,
>> +				 PCIE_CLIENT_LINK_TRAIN_MASK,
>> +				 PCIE_CLIENT_LINK_TRAIN_SHIFT),
>> +		   PCIE_CLIENT_BASE);
>> +
>> +	gpiod_set_value(port->ep_gpio, 1);
>> +
>> +	/* 500ms timeout value should be enough for gen1/2 taining */
>> +	timeout =3D jiffies + msecs_to_jiffies(500);
>> +
>> +	err =3D -ETIMEDOUT;
>> +	while (time_before(jiffies, timeout)) {
>> +		status =3D pcie_read(port, PCIE_CLIENT_BASIC_STATUS1);
>> +		if (((status >> PCIE_CLIENT_LINK_STATUS_SHIFT) &
>> +		      PCIE_CLIENT_LINK_STATUS_MASK) =3D=3D
>> +		      PCIE_CLIENT_LINK_STATUS_UP) {
>> +			dev_dbg(port->dev, "pcie link training gen1 pass!\n");
>> +			err =3D 0;
>> +			break;
>> +		}
>> +		msleep(20);
>> +	}
>
> Technically, the above timeout loop is not quite correct. Possible er=
ror
> case: we can fail with a timeout after 500 ms if the training complet=
es
> between the 480-500 ms time window. This can happen because you're
> doing:
>
> (1) read register: if complete, then terminate successfully
> (2) delay
> (3) check for timeout: if time is up, return error
>
> You actually need:
>
> (1) read register: if complete, then terminate successfully
> (2) delay
> (3) check for timeout: if time is up, repeat (1), and then report err=
or
>
> You can examine the logic for readx_poll_timeout() in
> include/linux/iopoll.h to see an example of a proper timeout loop. Yo=
u
> could even try to use one of the helpers there, except that your
> pcie_read() takes 2 args.

I see, thanks.

>
>> +	if (err) {
>> +		dev_err(port->dev, "pcie link training gen1 timeout!\n");
>> +		return err;
>> +	}
>> +
>> +	/*
>> +	 * Enable retrain for gen2. This should be configured only after
>> +	 * gen1 finished.
>> +	 */
>> +	status =3D pcie_read(port,
>> +			   PCIR_RC_CONFIG_LCS + PCIE_RC_CONFIG_BASE);
>> +	status |=3D PCIE_CORE_LCSR_RETAIN_LINK;
>> +	pcie_write(port, status,
>> +		   PCIR_RC_CONFIG_LCS + PCIE_RC_CONFIG_BASE);
>
> I'm not really an expert on this, but how are you actually "retrainin=
g
> for gen2"? Is that just the behavior of the core, that it retries at =
the
> higher rate on the 2nd training attempt? I'm just confused, since you
> set PCIE_CLIENT_GEN_SEL_2 above, so you've already allowed either gen=
1
> or gen2 negotiation AFAICT, and so seemingly you might already have
> negotiated at gen2.


Not really. I allow the core to enable gen2, but it needs a extra
setting of retrain after finishing gen1. It's not so strange as it
depends on the vendor's design. So I have to say it fits the
designer's expectation.

>
>> +	err =3D -ETIMEDOUT;
>> +
>> +	while (time_before(jiffies, timeout)) {
>
> You never reset 'timeout' when starting this loop. So you only have a
> cumulative 500 ms to do both the gen1 and gen2 loops. Is that
> intentional? (I feel like this comment was made on an earlier revisio=
n
> of this driver, though I haven't read everything thoroughly.)

yes, I don't have any docs to let me know how long should I wait for
gen1/2 to be finished. Maybe someday it will be augmented to a larger
value if finding a device actually need a longer time. But the only
thing I can say is that it's from my test for many pcie devices
currently.


Do you agree?

>
>> +		status =3D pcie_read(port, PCIE_CORE_CTRL_MGMT_BASE);
>> +		if (((status >> PCIE_CORE_PL_CONF_SPEED_SHIFT) &
>> +		      PCIE_CORE_PL_CONF_SPEED_MASK) =3D=3D
>> +		      PCIE_CORE_PL_CONF_SPEED_50G) {
>> +			dev_dbg(port->dev, "pcie link training gen2 pass!\n");
>> +			err =3D 0;
>> +			break;
>> +		}
>> +		msleep(20);
>> +	}
>
> Similar problem with your timeout loop, as mentioned above. Although =
I
> confused about what you do in the error case here...
>
>> +	if (err)
>> +		dev_dbg(port->dev, "pcie link training gen2 timeout, force to gen=
1!\n");
>
> ... how are you forcing gen1? I don't see any code that indicates thi=
s.
> Should you at least be checking that there aren't some kind of traini=
ng
> errors, and that we settled back on gen1/2.5G?

yes, when failing gen2,  my pcie controller will fallback to gen1
automatically.

if we pass the gen1 then fail to train gen2, a dbg msg here is enough
here to let we know that we should check the HW signal. Of course we
should make sure that this device supports gen2.

>
>> +
>> +	/* Check the final link with from negotiated lane counter from MGM=
T */
>> +	status =3D pcie_read(port, PCIE_CORE_CTRL_MGMT_BASE);
>> +	status =3D  0x1 << ((status >> PCIE_CORE_PL_CONF_LANE_SHIFT) &
>> +			   PCIE_CORE_PL_CONF_LANE_MASK);
>> +	dev_dbg(port->dev, "current link width is x%d\n", status);
>> +
>> +	pcie_write(port, ROCKCHIP_VENDOR_ID, PCIE_RC_CONFIG_BASE);
>> +	pcie_write(port, PCI_CLASS_BRIDGE_PCI << PCIE_CORE_RC_CONF_SCC_SHI=
=46T,
>> +		   PCIE_RC_CONFIG_BASE + PCIE_RC_CONFIG_RID_CCR);
>> +	pcie_write(port, 0x0, PCIE_CORE_CTRL_MGMT_BASE + PCIE_RC_BAR_CONF)=
;
>> +
>> +	pcie_write(port, (RC_REGION_0_ADDR_TRANS_L + RC_REGION_0_PASS_BITS=
),
>> +		   PCIE_CORE_AXI_CONF_BASE);
>> +	pcie_write(port, RC_REGION_0_ADDR_TRANS_H,
>> +		   PCIE_CORE_AXI_CONF_BASE + PCIE_CORE_OB_REGION_ADDR1);
>> +	pcie_write(port, 0x0080000a,
>> +		   PCIE_CORE_AXI_CONF_BASE + PCIE_CORE_OB_REGION_DESC0);
>> +	pcie_write(port, 0x0,
>> +		   PCIE_CORE_AXI_CONF_BASE + PCIE_CORE_OB_REGION_DESC1);
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * rockchip_pcie_parse_dt - Parse Device tree
>> + * @port: PCIe port information
>> + *
>> + * Return: '0' on success and error value on failure
>> + */
>> +static int rockchip_pcie_parse_dt(struct rockchip_pcie_port *port)
>> +{
>> +	struct device *dev =3D port->dev;
>> +	struct platform_device *pdev =3D to_platform_device(dev);
>> +	struct device_node *node =3D dev->of_node;
>> +	struct resource *regs;
>> +	int irq;
>> +	int err =3D -ENODEV;
>> +
>> +	regs =3D platform_get_resource_byname(pdev,
>> +					    IORESOURCE_MEM,
>> +					    "axi-base");
>> +	if (!regs) {
>> +		dev_err(dev, "missing axi-base property\n");
>> +		return err;
>> +	}
>> +
>> +	port->reg_base =3D devm_ioremap_resource(dev, regs);
>> +	if (IS_ERR(port->reg_base))
>> +		return PTR_ERR(port->reg_base);
>> +
>> +	regs =3D platform_get_resource_byname(pdev,
>> +					    IORESOURCE_MEM,
>> +					    "apb-base");
>> +	if (!regs) {
>> +		dev_err(dev, "missing apb-base property\n");
>> +		return err;
>> +	}
>> +
>> +	port->apb_base =3D devm_ioremap_resource(dev, regs);
>> +	if (IS_ERR(port->apb_base))
>> +		return PTR_ERR(port->apb_base);
>> +
>> +	port->phy =3D devm_phy_get(dev, "pcie-phy");
>> +	if (IS_ERR_OR_NULL(port->phy)) {
>> +		if (PTR_ERR_OR_ZERO(port->phy) !=3D -EPROBE_DEFER)
>> +			dev_err(dev, "Missing phy\n");
>> +		return PTR_ERR(port->phy);
>
> You're handling the port->phy =3D=3D NULL case kind of inconsistently=
=2E On
> one hand, I don't think phy_get() can return NULL, so you might not n=
eed
> to handle it (i.e., the IS_ERR_OR_NULL() -> IS_ERR()) -- and the phy =
API
> can just ignore NULL PHY. But on the other hand, if you do want to
> handle NULL here, you probably shouldn't return PTR_ERR(NULL) here
> (i.e., 0, which means success).
>

Brilliant.. I will fix it.

> My recommendation would be:
>
> s/IS_ERR_OR_NULL/IS_ERR/
> s/PTR_ERR_OR_ZERO/PTR_ERR/
>
> for the above 4 lines.
>
>> +	}
>> +
>> +	port->lanes =3D 1;
>> +	err =3D of_property_read_u32(node, "num-lanes", &port->lanes);
>> +	if (!err && ((port->lanes =3D=3D 0) ||
>> +		     (port->lanes =3D=3D 3) ||
>> +		     (port->lanes > 4))) {
>> +		dev_warn(dev, "invalid num-lanes, default use one lane\n");
>> +		port->lanes =3D 1;
>> +	}
>> +
>> +	port->core_rst =3D devm_reset_control_get(dev, "core");
>> +	if (IS_ERR(port->core_rst)) {
>> +		if (PTR_ERR(port->core_rst) !=3D -EPROBE_DEFER)
>> +			dev_err(dev, "missing core rst property in node %s\n",
>> +				node->name);
>> +		return PTR_ERR(port->core_rst);
>> +	}
>> +
>> +	port->mgmt_rst =3D devm_reset_control_get(dev, "mgmt");
>> +	if (IS_ERR(port->mgmt_rst)) {
>> +		if (PTR_ERR(port->mgmt_rst) !=3D -EPROBE_DEFER)
>> +			dev_err(dev, "missing mgmt rst property in node %s\n",
>> +				node->name);
>> +		return PTR_ERR(port->mgmt_rst);
>> +	}
>> +
>> +	port->mgmt_sticky_rst =3D devm_reset_control_get(dev, "mgmt-sticky=
");
>> +	if (IS_ERR(port->mgmt_sticky_rst)) {
>> +		if (PTR_ERR(port->mgmt_sticky_rst) !=3D -EPROBE_DEFER)
>> +			dev_err(dev, "missing mgmt-sticky rst property in node %s\n",
>> +				node->name);
>> +		return PTR_ERR(port->mgmt_sticky_rst);
>> +	}
>> +
>> +	port->pipe_rst =3D devm_reset_control_get(dev, "pipe");
>> +	if (IS_ERR(port->pipe_rst)) {
>> +		if (PTR_ERR(port->pipe_rst) !=3D -EPROBE_DEFER)
>> +			dev_err(dev, "missing pipe rst property in node %s\n",
>> +				node->name);
>> +		return PTR_ERR(port->pipe_rst);
>> +	}
>> +
>> +	port->ep_gpio =3D devm_gpiod_get(dev, "ep", GPIOD_OUT_HIGH);
>> +	if (IS_ERR(port->ep_gpio)) {
>> +		dev_err(dev, "missing ep-gpios property in node %s\n",
>> +			node->name);
>> +		return PTR_ERR(port->ep_gpio);
>> +	}
>> +
>> +	port->aclk_pcie =3D devm_clk_get(dev, "aclk");
>> +	if (IS_ERR(port->aclk_pcie)) {
>> +		dev_err(dev, "aclk clock not found.\n");
>> +		return PTR_ERR(port->aclk_pcie);
>> +	}
>> +
>> +	port->aclk_perf_pcie =3D devm_clk_get(dev, "aclk-perf");
>> +	if (IS_ERR(port->aclk_perf_pcie)) {
>> +		dev_err(dev, "aclk_perf clock not found.\n");
>> +		return PTR_ERR(port->aclk_perf_pcie);
>> +	}
>> +
>> +	port->hclk_pcie =3D devm_clk_get(dev, "hclk");
>> +	if (IS_ERR(port->hclk_pcie)) {
>> +		dev_err(dev, "hclk clock not found.\n");
>> +		return PTR_ERR(port->hclk_pcie);
>> +	}
>> +
>> +	port->clk_pcie_pm =3D devm_clk_get(dev, "pm");
>> +	if (IS_ERR(port->clk_pcie_pm)) {
>> +		dev_err(dev, "pm clock not found.\n");
>> +		return PTR_ERR(port->clk_pcie_pm);
>> +	}
>> +
>> +	irq =3D platform_get_irq_byname(pdev, "sys");
>> +	if (irq < 0) {
>> +		dev_err(dev, "missing pcie_sys IRQ resource\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	err =3D devm_request_irq(dev, irq, rockchip_pcie_subsys_irq_handle=
r,
>> +			       IRQF_SHARED, "pcie-sys", port);
>> +	if (err) {
>> +		dev_err(dev, "failed to request pcie subsystem irq\n");
>> +		return err;
>> +	}
>> +
>> +	irq =3D platform_get_irq_byname(pdev, "legacy");
>> +	if (irq < 0) {
>> +		dev_err(dev, "missing pcie_legacy IRQ resource\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	irq_set_chained_handler_and_data(irq,
>> +					 rockchip_pcie_legacy_int_handler,
>> +					 port);
>> +
>> +	irq =3D platform_get_irq_byname(pdev, "client");
>> +	if (irq < 0) {
>> +		dev_err(dev, "missing pcie-client IRQ resource\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	err =3D devm_request_irq(dev, irq, rockchip_pcie_client_irq_handle=
r,
>> +			       IRQF_SHARED, "pcie-client", port);
>> +	if (err) {
>> +		dev_err(dev, "failed to request pcie client irq\n");
>> +		return err;
>> +	}
>> +
>> +	port->vpcie3v3 =3D devm_regulator_get_optional(dev, "vpcie3v3");
>> +	if (IS_ERR(port->vpcie3v3)) {
>> +		if (PTR_ERR(port->vpcie3v3) =3D=3D -EPROBE_DEFER)
>> +			return -EPROBE_DEFER;
>> +		dev_info(dev, "No vpcie3v3 regulator found.\n");
>> +	}
>> +
>> +	port->vpcie1v8 =3D devm_regulator_get_optional(dev, "vpcie1v8");
>> +	if (IS_ERR(port->vpcie1v8)) {
>> +		if (PTR_ERR(port->vpcie1v8) =3D=3D -EPROBE_DEFER)
>> +			return -EPROBE_DEFER;
>> +		dev_info(dev, "No vpcie1v8 regulator found.\n");
>> +	}
>> +
>> +	port->vpcie0v9 =3D devm_regulator_get_optional(dev, "vpcie0v9");
>> +	if (IS_ERR(port->vpcie0v9)) {
>> +		if (PTR_ERR(port->vpcie0v9) =3D=3D -EPROBE_DEFER)
>> +			return -EPROBE_DEFER;
>> +		dev_info(dev, "No vpcie0v9 regulator found.\n");
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int rockchip_pcie_set_vpcie(struct rockchip_pcie_port *port)
>> +{
>> +	int err;
>> +
>> +	if (!IS_ERR(port->vpcie3v3)) {
>> +		err =3D regulator_enable(port->vpcie3v3);
>> +		if (err) {
>> +			dev_err(port->dev, "Fail to enable vpcie3v3 regulator.\n");
>> +			goto err_out;
>> +		}
>> +	}
>> +
>> +	if (!IS_ERR(port->vpcie1v8)) {
>> +		err =3D regulator_enable(port->vpcie1v8);
>> +		if (err) {
>> +			dev_err(port->dev, "Fail to enable vpcie1v8 regulator.\n");
>> +			goto err_disable_3v3;
>> +		}
>> +	}
>> +
>> +	if (!IS_ERR(port->vpcie0v9)) {
>> +		err =3D regulator_enable(port->vpcie0v9);
>> +		if (err) {
>> +			dev_err(port->dev, "Fail to enable vpcie0v9 regulator.\n");
>> +			goto err_disable_1v8;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +
>> +err_disable_1v8:
>> +	if (!IS_ERR(port->vpcie1v8))
>> +		regulator_disable(port->vpcie1v8);
>> +err_disable_3v3:
>> +	if (!IS_ERR(port->vpcie3v3))
>> +		regulator_disable(port->vpcie3v3);
>> +err_out:
>> +	return err;
>> +}
>> +
>> +static void rockchip_pcie_enable_interrupts(struct rockchip_pcie_po=
rt *port)
>> +{
>> +	pcie_write(port, (PCIE_CLIENT_INT_CLI << 16) &
>> +		   (~PCIE_CLIENT_INT_CLI), PCIE_CLIENT_INT_MASK);
>> +	pcie_write(port, PCIE_CORE_INT, PCIE_CORE_INT_MASK);
>> +}
>> +
>> +static int rockchip_pcie_intx_map(struct irq_domain *domain, unsign=
ed int irq,
>> +				  irq_hw_number_t hwirq)
>> +{
>> +	irq_set_chip_and_handler(irq, &dummy_irq_chip, handle_simple_irq);
>> +	irq_set_chip_data(irq, domain->host_data);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct irq_domain_ops intx_domain_ops =3D {
>> +	.map =3D rockchip_pcie_intx_map,
>> +};
>> +
>> +static int rockchip_pcie_init_irq_domain(struct rockchip_pcie_port =
*pp)
>> +{
>> +	struct device *dev =3D pp->dev;
>> +
>> +	pp->irq_domain =3D irq_domain_add_linear(dev->of_node, 4,
>> +					       &intx_domain_ops, pp);
>> +	if (!pp->irq_domain) {
>> +		dev_err(dev, "Failed to get a INTx IRQ domain\n");
>> +		return PTR_ERR(pp->irq_domain);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static irqreturn_t rockchip_pcie_subsys_irq_handler(int irq, void *=
arg)
>> +{
>> +	struct rockchip_pcie_port *pp =3D arg;
>> +	u32 reg;
>> +	u32 sub_reg;
>> +
>> +	reg =3D pcie_read(pp, PCIE_CLIENT_INT_STATUS);
>> +	if (reg & PCIE_CLIENT_INT_LOCAL) {
>> +		dev_dbg(pp->dev, "local interrupt recived\n");
>> +		sub_reg =3D pcie_read(pp, PCIE_CORE_INT_STATUS);
>> +		if (sub_reg & PCIE_CORE_INT_PRFPE)
>> +			dev_dbg(pp->dev, "Parity error detected while reading from the P=
NP Receive FIFO RAM\n");
>> +
>> +		if (sub_reg & PCIE_CORE_INT_CRFPE)
>> +			dev_dbg(pp->dev, "Parity error detected while reading from the C=
ompletion Receive FIFO RAM\n");
>> +
>> +		if (sub_reg & PCIE_CORE_INT_RRPE)
>> +			dev_dbg(pp->dev, "Parity error detected while reading from Repla=
y Buffer RAM\n");
>> +
>> +		if (sub_reg & PCIE_CORE_INT_PRFO)
>> +			dev_dbg(pp->dev, "Overflow occurred in the PNP Receive FIFO\n");
>> +
>> +		if (sub_reg & PCIE_CORE_INT_CRFO)
>> +			dev_dbg(pp->dev, "Overflow occurred in the Completion Receive FI=
=46O\n");
>> +
>> +		if (sub_reg & PCIE_CORE_INT_RT)
>> +			dev_dbg(pp->dev, "Replay timer timed out\n");
>> +
>> +		if (sub_reg & PCIE_CORE_INT_RTR)
>> +			dev_dbg(pp->dev, "Replay timer rolled over after 4 transmissions=
 of the same TLP\n");
>> +
>> +		if (sub_reg & PCIE_CORE_INT_PE)
>> +			dev_dbg(pp->dev, "Phy error detected on receive side\n");
>> +
>> +		if (sub_reg & PCIE_CORE_INT_MTR)
>> +			dev_dbg(pp->dev, "Malformed TLP received from the link\n");
>> +
>> +		if (sub_reg & PCIE_CORE_INT_UCR)
>> +			dev_dbg(pp->dev, "Malformed TLP received from the link\n");
>> +
>> +		if (sub_reg & PCIE_CORE_INT_FCE)
>> +			dev_dbg(pp->dev, "An error was observed in the flow control adve=
rtisements from the other side\n");
>> +
>> +		if (sub_reg & PCIE_CORE_INT_CT)
>> +			dev_dbg(pp->dev, "A request timed out waiting for completion\n")=
;
>> +
>> +		if (sub_reg & PCIE_CORE_INT_UTC)
>> +			dev_dbg(pp->dev, "Unmapped TC error\n");
>> +
>> +		if (sub_reg & PCIE_CORE_INT_MMVC)
>> +			dev_dbg(pp->dev, "MSI mask register changes\n");
>> +
>> +		pcie_write(pp, sub_reg, PCIE_CORE_INT_STATUS);
>> +	}
>> +
>> +	pcie_write(pp, PCIE_CLIENT_INT_SUBSYSTEM | PCIE_CLIENT_INT_LOCAL,
>> +		   PCIE_CLIENT_INT_STATUS);
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static irqreturn_t rockchip_pcie_client_irq_handler(int irq, void *=
arg)
>> +{
>> +	struct rockchip_pcie_port *pp =3D arg;
>> +	u32 reg;
>> +
>> +	reg =3D pcie_read(pp, PCIE_CLIENT_INT_STATUS);
>> +	if (reg & PCIE_CLIENT_INT_LEGACY_DONE)
>> +		dev_dbg(pp->dev, "legacy done interrupt recived\n");
>> +
>> +	if (reg & PCIE_CLIENT_INT_MSG)
>> +		dev_dbg(pp->dev, "message done interrupt recived\n");
>> +
>> +	if (reg & PCIE_CLIENT_INT_HOT_RST)
>> +		dev_dbg(pp->dev, "hot reset interrupt recived\n");
>> +
>> +	if (reg & PCIE_CLIENT_INT_DPA)
>> +		dev_dbg(pp->dev, "dpa interrupt recived\n");
>> +
>> +	if (reg & PCIE_CLIENT_INT_FATAL_ERR)
>> +		dev_dbg(pp->dev, "fatal error interrupt recived\n");
>> +
>> +	if (reg & PCIE_CLIENT_INT_NFATAL_ERR)
>> +		dev_dbg(pp->dev, "no fatal error interrupt recived\n");
>> +
>> +	if (reg & PCIE_CLIENT_INT_CORR_ERR)
>> +		dev_dbg(pp->dev, "correctable error interrupt recived\n");
>> +
>> +	pcie_write(pp, reg, PCIE_CLIENT_INT_STATUS);
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static void rockchip_pcie_legacy_int_handler(struct irq_desc *desc)
>> +{
>> +	struct irq_chip *chip =3D irq_desc_get_chip(desc);
>> +	struct rockchip_pcie_port *port;
>> +	u32 reg;
>> +
>> +	chained_irq_enter(chip, desc);
>> +	port =3D irq_desc_get_handler_data(desc);
>> +
>> +	reg =3D pcie_read(port, PCIE_CLIENT_INT_STATUS);
>> +	reg =3D (reg & ROCKCHIP_PCIE_RPIFR1_INTR_MASK) >>
>> +	       ROCKCHIP_PCIE_RPIFR1_INTR_SHIFT;
>> +	if (reg)
>> +		generic_handle_irq(irq_find_mapping(port->irq_domain,
>> +						    ffs(reg)));
>> +	chained_irq_exit(chip, desc);
>> +}
>> +
>> +static int rockchip_pcie_prog_ob_atu(struct rockchip_pcie_port *pp,
>> +				     int region_no,
>> +				     int type, u8 num_pass_bits,
>> +				     u32 lower_addr, u32 upper_addr)
>> +{
>> +	u32 ob_addr_0 =3D 0;
>> +	u32 ob_addr_1 =3D 0;
>> +	u32 ob_desc_0 =3D 0;
>> +	u32 ob_desc_1 =3D 0;
>> +	void __iomem *aw_base;
>> +
>> +	if (!pp)
>> +		return -EINVAL;
>> +	if (region_no >=3D MAX_AXI_WRAPPER_REGION_NUM)
>> +		return -EINVAL;
>> +	if ((num_pass_bits + 1) < 8)
>> +		return -EINVAL;
>> +	if (num_pass_bits > 63)
>> +		return -EINVAL;
>> +	if (region_no =3D=3D 0) {
>> +		if (AXI_REGION_0_SIZE < (2ULL << num_pass_bits))
>> +		return -EINVAL;
>> +	}
>> +	if (region_no !=3D 0) {
>> +		if (AXI_REGION_SIZE < (2ULL << num_pass_bits))
>> +		return -EINVAL;
>> +	}
>> +	aw_base =3D pp->apb_base + PCIE_CORE_AXI_CONF_BASE;
>> +	aw_base +=3D (region_no << OB_REG_SIZE_SHIFT);
>> +
>> +	ob_addr_0 =3D (ob_addr_0 &
>> +		     ~0x0000003fU) | (num_pass_bits &
>> +		     0x0000003fU);
>> +	ob_addr_0 =3D (ob_addr_0 &
>> +		     ~0xffffff00U) | (lower_addr & 0xffffff00U);
>> +	ob_addr_1 =3D upper_addr;
>> +	ob_desc_0 =3D (1 << 23 | type);
>> +
>> +	writel(ob_addr_0, aw_base);
>> +	writel(ob_addr_1, aw_base + PCIE_CORE_OB_REGION_ADDR1);
>> +	writel(ob_desc_0, aw_base + PCIE_CORE_OB_REGION_DESC0);
>> +	writel(ob_desc_1, aw_base + PCIE_CORE_OB_REGION_DESC1);
>> +
>> +	return 0;
>> +}
>> +
>> +static int rockchip_pcie_prog_ib_atu(struct rockchip_pcie_port *pp,
>> +				     int region_no,
>> +				     u8 num_pass_bits,
>> +				     u32 lower_addr,
>> +				     u32 upper_addr)
>> +{
>> +	u32 ib_addr_0 =3D 0;
>> +	u32 ib_addr_1 =3D 0;
>> +	void __iomem *aw_base;
>> +
>> +	if (!pp)
>> +		return -EINVAL;
>> +	if (region_no > MAX_AXI_IB_ROOTPORT_REGION_NUM)
>> +		return -EINVAL;
>> +	if ((num_pass_bits + 1) < MIN_AXI_ADDR_BITS_PASSED)
>> +		return -EINVAL;
>> +	if (num_pass_bits > 63)
>> +		return -EINVAL;
>> +	aw_base =3D pp->apb_base + PCIE_CORE_AXI_INBOUND_BASE;
>> +	aw_base +=3D (region_no << IB_ROOT_PORT_REG_SIZE_SHIFT);
>> +	ib_addr_0 =3D (ib_addr_0 &
>> +		     ~0x0000003fU) | (num_pass_bits &
>> +		     0x0000003fU);
>> +
>> +	ib_addr_0 =3D (ib_addr_0 & ~0xffffff00U) |
>> +		     ((lower_addr << 8) & 0xffffff00U);
>> +	ib_addr_1 =3D upper_addr;
>> +
>> +	writel(ib_addr_0, aw_base);
>> +	writel(ib_addr_1, aw_base + PCIE_RP_IB_ADDR_TRANS);
>> +
>> +	return 0;
>> +}
>> +
>> +static int rockchip_pcie_probe(struct platform_device *pdev)
>> +{
>> +	struct rockchip_pcie_port *port;
>> +	struct device *dev =3D &pdev->dev;
>> +	struct pci_bus *bus, *child;
>> +	struct resource_entry *win;
>> +	resource_size_t io_base;
>> +	struct resource	*busn;
>> +	struct resource	*mem;
>> +	struct resource	*io;
>> +	phys_addr_t io_bus_addr;
>> +	u32 io_size;
>> +	phys_addr_t mem_bus_addr;
>> +	u32 mem_size;
>> +	int reg_no;
>> +	int err =3D 0;
>> +	int offset =3D 0;
>> +
>> +	LIST_HEAD(res);
>> +
>> +	if (!dev->of_node)
>> +		return -ENODEV;
>> +
>> +	port =3D devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
>> +	if (!port)
>> +		return -ENOMEM;
>> +
>> +	port->dev =3D dev;
>> +
>> +	err =3D rockchip_pcie_parse_dt(port);
>> +	if (err)
>> +		return err;
>> +
>> +	err =3D clk_prepare_enable(port->aclk_pcie);
>> +	if (err) {
>> +		dev_err(dev, "Unable to enable aclk_pcie clock.\n");
>> +		goto err_aclk_pcie;
>> +	}
>> +
>> +	err =3D clk_prepare_enable(port->aclk_perf_pcie);
>> +	if (err) {
>> +		dev_err(dev, "Unable to enable aclk_perf_pcie clock.\n");
>> +		goto err_aclk_perf_pcie;
>> +	}
>> +
>> +	err =3D clk_prepare_enable(port->hclk_pcie);
>> +	if (err) {
>> +		dev_err(dev, "Unable to enable hclk_pcie clock.\n");
>> +		goto err_hclk_pcie;
>> +	}
>> +
>> +	err =3D clk_prepare_enable(port->clk_pcie_pm);
>> +	if (err) {
>> +		dev_err(dev, "Unable to enable hclk_pcie clock.\n");
>> +		goto err_pcie_pm;
>> +	}
>> +
>> +	err =3D rockchip_pcie_set_vpcie(port);
>> +	if (err) {
>> +		dev_err(port->dev, "Fail to set vpcie regulator.\n");
>> +		goto err_set_vpcie;
>> +	}
>> +
>> +	err =3D rockchip_pcie_init_port(port);
>> +	if (err)
>> +		goto err_vpcie;
>> +
>> +	platform_set_drvdata(pdev, port);
>> +
>> +	rockchip_pcie_enable_interrupts(port);
>> +
>> +	err =3D rockchip_pcie_init_irq_domain(port);
>> +	if (err < 0)
>> +		goto err_vpcie;
>> +
>> +	err =3D of_pci_get_host_bridge_resources(dev->of_node, 0, 0xff,
>> +					       &res, &io_base);
>> +	if (err)
>> +		goto err_vpcie;
>> +
>> +	/* Get the I/O and memory ranges from DT */
>> +	resource_list_for_each_entry(win, &res) {
>> +		switch (resource_type(win->res)) {
>> +		case IORESOURCE_IO:
>> +			io =3D win->res;
>> +			io->name =3D "I/O";
>> +			io_size =3D resource_size(io);
>> +			io_bus_addr =3D io->start - win->offset;
>> +			err =3D pci_remap_iospace(io, io_base);
>> +			if (err) {
>> +				dev_warn(port->dev, "error %d: failed to map resource %pR\n",
>> +					 err, io);
>> +				continue;
>> +			}
>> +			break;
>> +		case IORESOURCE_MEM:
>> +			mem =3D win->res;
>> +			mem->name =3D "MEM";
>> +			mem_size =3D resource_size(mem);
>> +			mem_bus_addr =3D mem->start - win->offset;
>> +			break;
>> +		case 0:
>
> Why case 0? That doesn't seem right.

I will remove it as it actually means configure space. But my controlle=
r
has the fixed cfg space inside the core, so we never need to get it
from parsing DT.

>
>> +			break;
>> +		case IORESOURCE_BUS:
>> +			busn =3D win->res;
>> +			break;
>> +		default:
>> +			continue;
>> +		}
>> +	}
>> +
>> +	for (reg_no =3D 0; reg_no < (mem_size >> 20); reg_no++) {
>
> kbuildbot already complained about potential unused warnings here and
> elsewhere. One problem that this highlights:
>
> what happens if the expected resources aren't included in your device
> tree? Seems like you'll just keep going, with uninitialized data.
> Probably want some kind of checks to make sure we found the necessary
> resources.

yes, I saw the report from kbuildbot and I will fix it.

>
>> +		err =3D rockchip_pcie_prog_ob_atu(port, reg_no + 1,
>> +						AXI_WRAPPER_MEM_WRITE,
>> +						20 - 1,
>> +						mem_bus_addr +
>> +							(reg_no << 20),
>> +						0);
>> +		if (err) {
>> +			dev_err(dev, "Program RC mem outbound atu failed\n");
>> +			goto err_vpcie;
>> +		}
>> +	}
>> +
>> +	err =3D rockchip_pcie_prog_ib_atu(port, 2, 32 - 1, 0x0, 0);
>> +	if (err) {
>> +		dev_err(dev, "Program RC mem inbound atu failed\n");
>> +		goto err_vpcie;
>> +	}
>> +
>> +	offset =3D mem_size >> 20;
>> +
>> +	for (reg_no =3D 0; reg_no < (io_size >> 20); reg_no++) {
>> +		err =3D rockchip_pcie_prog_ob_atu(port,
>> +						reg_no + 1 + offset,
>> +						AXI_WRAPPER_IO_WRITE,
>> +						20 - 1,
>> +						io_bus_addr +
>> +							(reg_no << 20),
>> +						0);
>> +		if (err) {
>> +			dev_err(dev, "Program RC io outbound atu failed\n");
>> +			goto err_vpcie;
>> +		}
>> +	}
>> +
>> +	port->root_bus_nr =3D busn->start;
>> +
>> +	bus =3D pci_scan_root_bus(&pdev->dev, 0,
>> +				&rockchip_pcie_ops, port, &res);
>> +
>> +	if (!bus) {
>> +		err =3D -ENOMEM;
>> +		goto err_vpcie;
>> +	}
>> +
>> +	pci_bus_size_bridges(bus);
>> +	pci_bus_assign_resources(bus);
>> +	list_for_each_entry(child, &bus->children, node)
>> +	pcie_bus_configure_settings(child);
>
> Bad indentation: the above line is part of a loop, so it should be
> indented one more.
>

My bad, will fix it.

>> +
>> +	pci_bus_add_devices(bus);
>> +
>> +	return err;
>> +
>> +err_vpcie:
>> +	if (!IS_ERR(port->vpcie3v3))
>> +		regulator_disable(port->vpcie3v3);
>> +	if (!IS_ERR(port->vpcie1v8))
>> +		regulator_disable(port->vpcie1v8);
>> +	if (!IS_ERR(port->vpcie0v9))
>> +		regulator_disable(port->vpcie0v9);
>> +err_set_vpcie:
>> +	clk_disable_unprepare(port->clk_pcie_pm);
>> +err_pcie_pm:
>> +	clk_disable_unprepare(port->hclk_pcie);
>> +err_hclk_pcie:
>> +	clk_disable_unprepare(port->aclk_perf_pcie);
>> +err_aclk_perf_pcie:
>> +	clk_disable_unprepare(port->aclk_pcie);
>> +err_aclk_pcie:
>> +	return err;
>> +}
>> +
>> +static const struct of_device_id rockchip_pcie_of_match[] =3D {
>> +	{ .compatible =3D "rockchip,rk3399-pcie", },
>> +	{}
>> +};
>> +
>> +static struct platform_driver rockchip_pcie_driver =3D {
>> +	.driver =3D {
>> +		.name =3D "rockchip-pcie",
>> +		.of_match_table =3D rockchip_pcie_of_match,
>> +	},
>> +	.probe =3D rockchip_pcie_probe,
>> +
>> +};
>> +module_platform_driver(rockchip_pcie_driver);
>> +
>> +MODULE_AUTHOR("Rockchip Inc");
>> +MODULE_DESCRIPTION("Rockchip AXI PCIe driver");
>> +MODULE_LICENSE("GPL v2");
>> --
>> 2.3.7
>
> Brian
>
>
>


--=20
Best Regards
Shawn Lin
