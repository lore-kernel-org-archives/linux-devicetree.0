Return-Path: <gabriel.fernandez@linaro.org>
MIME-Version: 1.0
In-Reply-To: <000f01d01a88$60405e50$20c11af0$%han@samsung.com>
References: <1418812486-12394-1-git-send-email-gabriel.fernandez@linaro.org>
	<1418812486-12394-4-git-send-email-gabriel.fernandez@linaro.org>
	<000f01d01a88$60405e50$20c11af0$%han@samsung.com>
Date: Mon, 19 Jan 2015 13:38:38 +0100
Message-ID: <CAG374jDdeTNznUayqqVr7t37oa8eg6GkQrPv06kCVZwPoJgaSA@mail.gmail.com>
Subject: Re: [PATCH 3/5] PCI: st: Provide support for the sti PCIe controller
From: Gabriel Fernandez <gabriel.fernandez@linaro.org>
Content-Type: multipart/alternative; boundary=001a11330e3a098c4d050d009a7d
To: Jingoo Han <jg1.han@samsung.com>
Cc: Gabriel FERNANDEZ <gabriel.fernandez@st.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, Maxime Coquelin <maxime.coquelin@st.com>, Patrice Chotard <patrice.chotard@st.com>, Russell King <linux@arm.linux.org.uk>, Bjorn Helgaas <bhelgaas@google.com>, Mohit Kumar <mohit.kumar@st.com>, Grant Likely <grant.likely@linaro.org>, Fabrice Gasnier <fabrice.gasnier@st.com>, Arnd Bergmann <arnd@arndb.de>, Viresh Kumar <viresh.kumar@linaro.org>, Thierry Reding <treding@nvidia.com>, Minghuan Lian <Minghuan.Lian@freescale.com>, Magnus Damm <damm@opensource.se>, Will Deacon <will.deacon@arm.com>, Tanmay Inamdar <tinamdar@apm.com>, Murali Karicheri <m-karicheri2@ti.com>, Kishon Vijay Abraham I <kishon@ti.com>, Pratyush Anand <pratyush.anand@st.com>, Sachin Kamat <sachin.kamat@samsung.com>, Andrew Lunn <andrew@lunn.ch>, Liviu Dudau <Liviu.Dudau@arm.com>, Srikanth Thokala <sthokal@xilinx.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "kernel@stlinux.com" <kernel@stlinux.com>, linux-pci@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
List-ID: <devicetree@vger.kernel.org>

--001a11330e3a098c4d050d009a7d
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

=E2=80=8BHi Jingoo,

Thanks for reviewing=E2=80=8B

On 18 December 2014 at 07:03, Jingoo Han <jg1.han@samsung.com> wrote:

> On Wednesday, December 17, 2014 7:35 PM, Gabriel FERNANDEZ wrote:
> >
> > sti pcie is built around a Synopsis Designware PCIe IP.
> >
> > Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> > Signed-off-by: Gabriel Fernandez <gabriel.fernandez@linaro.org>
> > ---
> >  drivers/pci/host/Kconfig  |   5 +
> >  drivers/pci/host/Makefile |   1 +
> >  drivers/pci/host/pci-st.c | 713
> ++++++++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 719 insertions(+)
> >  create mode 100644 drivers/pci/host/pci-st.c
> >
> > diff --git a/drivers/pci/host/Kconfig b/drivers/pci/host/Kconfig
> > index c4b6568..999d2b9 100644
> > --- a/drivers/pci/host/Kconfig
> > +++ b/drivers/pci/host/Kconfig
> > @@ -102,4 +102,9 @@ config PCI_LAYERSCAPE
> >       help
> >         Say Y here if you want PCIe controller support on Layerscape
> SoCs.
> >
> > +config PCI_ST
> > +     bool "ST STiH41x PCIe controller"
> > +     depends on ARCH_STI
> > +     select PCIE_DW
> > +
> >  endmenu
> > diff --git a/drivers/pci/host/Makefile b/drivers/pci/host/Makefile
> > index 44c2699..ca14829 100644
> > --- a/drivers/pci/host/Makefile
> > +++ b/drivers/pci/host/Makefile
> > @@ -12,3 +12,4 @@ obj-$(CONFIG_PCI_KEYSTONE) +=3D pci-keystone-dw.o
> pci-keystone.o
> >  obj-$(CONFIG_PCIE_XILINX) +=3D pcie-xilinx.o
> >  obj-$(CONFIG_PCI_XGENE) +=3D pci-xgene.o
> >  obj-$(CONFIG_PCI_LAYERSCAPE) +=3D pci-layerscape.o
> > +obj-$(CONFIG_PCI_ST) +=3D pci-st.o
> > diff --git a/drivers/pci/host/pci-st.c b/drivers/pci/host/pci-st.c
> > new file mode 100644
> > index 0000000..bd3d32d
> > --- /dev/null
> > +++ b/drivers/pci/host/pci-st.c
> > @@ -0,0 +1,713 @@
> > +/*
> > + * Copyright (C) 2014 STMicroelectronics
> > + *
> > + * STMicroelectronics PCI express Driver for sti SoCs.
> > + * ST PCIe IPs are built around a Synopsys IP Core.
> > + *
> > + * Author: Fabrice Gasnier <fabrice.gasnier@st.com>
> > + *
> > + * This program is free software; you can redistribute it and/or modif=
y
> > + * it under the terms of the GNU General Public License version 2, as
> > + * published by the Free Software Foundation.
> > + *
> > + */
> > +
> > +#include <linux/module.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/of_address.h>
> > +#include <linux/of_pci.h>
> > +#include <linux/of_platform.h>
> > +#include <linux/of_gpio.h>
> > +#include <linux/regmap.h>
> > +#include <linux/mfd/syscon.h>
> > +#include <linux/delay.h>
> > +#include <linux/reset.h>
> > +#include <linux/phy/phy.h>
>
> Please, re-order these headers alphabetically.
> It enhances the readability.
>

=E2=80=8Bsure
=E2=80=8B


>
> > +
> > +#include "pcie-designware.h"
> > +
> > +#define TRANSLATION_CONTROL          0x900
> > +/* Controls if area is inclusive or exclusive */
> > +#define RC_PASS_ADDR_RANGE           BIT(1)
> > +
> > +/* Base of area reserved for config accesses. Fixed size of 64K. */
> > +#define CFG_BASE_ADDRESS             0x92c
> > +#define CFG_REGION_SIZE                      65536
> > +
> > +/* First 4K of config space has this BDF (bus,device,function) */
> > +#define FUNC0_BDF_NUM                        0x930
> > +
> > +/* Mem regions */
> > +#define IN0_MEM_ADDR_START           0x964
> > +#define IN0_MEM_ADDR_LIMIT           0x968
> > +#define IN1_MEM_ADDR_START           0x974
> > +#define IN1_MEM_ADDR_LIMIT           0x978
> > +
> > +/* This actually contains the LTSSM state machine state */
> > +#define PORT_LOGIC_DEBUG_REG_0               0x728
> > +
> > +/* LTSSM state machine values        */
> > +#define DEBUG_REG_0_LTSSM_MASK               0x1f
> > +#define S_DETECT_QUIET                       0x00
> > +#define S_DETECT_ACT                 0x01
> > +#define S_POLL_ACTIVE                        0x02
> > +#define S_POLL_COMPLIANCE            0x03
> > +#define S_POLL_CONFIG                        0x04
> > +#define S_PRE_DETECT_QUIET           0x05
> > +#define S_DETECT_WAIT                        0x06
> > +#define S_CFG_LINKWD_START           0x07
> > +#define S_CFG_LINKWD_ACEPT           0x08
> > +#define S_CFG_LANENUM_WAIT           0x09
> > +#define S_CFG_LANENUM_ACEPT          0x0A
> > +#define S_CFG_COMPLETE                       0x0B
> > +#define S_CFG_IDLE                   0x0C
> > +#define S_RCVRY_LOCK                 0x0D
> > +#define S_RCVRY_SPEED                        0x0E
> > +#define S_RCVRY_RCVRCFG                      0x0F
> > +#define S_RCVRY_IDLE                 0x10
> > +#define S_L0                         0x11
> > +#define S_L0S                                0x12
> > +#define S_L123_SEND_EIDLE            0x13
> > +#define S_L1_IDLE                    0x14
> > +#define S_L2_IDLE                    0x15
> > +#define S_L2_WAKE                    0x16
> > +#define S_DISABLED_ENTRY             0x17
> > +#define S_DISABLED_IDLE                      0x18
> > +#define S_DISABLED                   0x19
> > +#define S_LPBK_ENTRY                 0x1A
> > +#define S_LPBK_ACTIVE                        0x1B
> > +#define S_LPBK_EXIT                  0x1C
> > +#define S_LPBK_EXIT_TIMEOUT          0x1D
> > +#define S_HOT_RESET_ENTRY            0x1E
> > +#define S_HOT_RESET                  0x1F
> > +
> > +/* syscfg bits */
> > +#define PCIE_SYS_INT                 BIT(5)
> > +#define PCIE_APP_REQ_RETRY_EN                BIT(3)
> > +#define PCIE_APP_LTSSM_ENABLE                BIT(2)
> > +#define PCIE_APP_INIT_RST            BIT(1)
> > +#define PCIE_DEVICE_TYPE             BIT(0)
> > +#define PCIE_DEFAULT_VAL             PCIE_DEVICE_TYPE
> > +
> > +/* Time to wait between testing the link in msecs (hardware poll
> interval) */
> > +#define LINK_LOOP_DELAY_MS 1
> > +/* Total amount of time to wait for the link to come up in msecs */
> > +#define LINK_WAIT_MS 120
> > +#define LINK_LOOP_COUNT (LINK_WAIT_MS / LINK_LOOP_DELAY_MS)
> > +
> > +/* st,syscfg offsets */
> > +#define SYSCFG0_REG  1
> > +#define SYSCFG1_REG  2
> > +
> > +#define to_st_pcie(x)        container_of(x, struct st_pcie, pp)
> > +
> > +/**
> > + * struct st_pcie_ops - SOC dependent data
> > + * @init: reference to controller power & reset init routine
> > + * @enable_ltssm: reference to controller link enable routine
> > + * @disable_ltssm:  reference to controller link disable routine
> > + * @phy_auto: flag when phy automatically configured
> > + */
> > +struct st_pcie_ops {
> > +     int (*init)(struct pcie_port *pp);
> > +     int (*enable_ltssm)(struct pcie_port *pp);
> > +     int (*disable_ltssm)(struct pcie_port *pp);
> > +     bool phy_auto;
> > +};
> > +
> > +/**
> > + * struct st_pcie - private data of the controller
> > + * @pp: designware pcie port
> > + * @syscfg0: PCIe configuration 0 register, regmap offset
> > + * @syscfg1: PCIe configuration 1 register, regmap offset
> > + * @phy: associated pcie phy
> > + * @config_area: PCIe configuration space
> > + * @lmi: memory made available to the controller
> > + * @data: SOC dependent data
> > + * @regmap: Syscfg registers bank in which PCIe port is configured
> > + * @pwr: power control
> > + * @rst: reset control
> > + * @reset_gpio: optional reset gpio
> > + * @config_window_start: start address of 64K config space area
> > + */
> > +struct st_pcie {
> > +     struct pcie_port pp;
> > +     int syscfg0;
> > +     int syscfg1;
> > +     struct phy *phy;
> > +     void __iomem *config_area;
> > +     struct resource *lmi;
> > +     const struct st_pcie_ops *data;
> > +     struct regmap *regmap;
> > +     struct reset_control *pwr;
> > +     struct reset_control *rst;
> > +     int reset_gpio;
> > +     phys_addr_t config_window_start;
> > +};
> > +
> > +/*
> > + * Function to test if the link is in an operational state or not. We
> must
> > + * ensure the link is operational before we try to do a configuration
> access.
> > + */
> > +static int st_pcie_link_up(struct pcie_port *pp)
> > +{
> > +     u32 status;
> > +     int link_up;
> > +     int count =3D 0;
> > +
> > +     /*
> > +      * We have to be careful here. This is used in config read/write,
> > +      * The higher levels switch off interrupts, so you cannot use
> > +      * jiffies to do a timeout, or reschedule
> > +      */
> > +     do {
> > +             /*
> > +              * What about L2? I think software intervention is
> > +              * required to get it out of L2, so in effect the link
> > +              * is down. Requires more work when/if we implement power
> > +              * management
> > +              */
> > +             status =3D readl_relaxed(pp->dbi_base +
> PORT_LOGIC_DEBUG_REG_0);
> > +             status &=3D DEBUG_REG_0_LTSSM_MASK;
> > +
> > +             link_up =3D (status =3D=3D S_L0) || (status =3D=3D S_L0S)=
 ||
> > +                       (status =3D=3D S_L1_IDLE);
> > +
> > +             /*
> > +              * It can take some considerable time for the link to
> actually
> > +              * come up, caused by the PLLs. Experiments indicate it
> takes
> > +              * about 8ms to actually bring the link up, but this can
> vary
> > +              * considerably according to the specification. This code
> should
> > +              * allow sufficient time
> > +              */
> > +             if (!link_up)
> > +                     mdelay(LINK_LOOP_DELAY_MS);
> > +
> > +     } while (!link_up && ++count < LINK_LOOP_COUNT);
> > +
> > +     return link_up;
> > +}
> > +
> > +/*
> > + * On ARM platforms, we actually get a bus error returned when the PCI=
e
> IP
> > + * returns a UR or CRS instead of an OK.
> > + */
> > +static int st_pcie_abort_handler(unsigned long addr, unsigned int fsr,
> > +                              struct pt_regs *regs)
> > +{
> > +     return 0;
> > +}
> > +
> > +/*
> > + * The PCI express core IP expects the following arrangement on it's
> address
> > + * bus (slv_haddr) when driving config cycles.
> > + * bus_number                [31:24]
> > + * dev_number                [23:19]
> > + * func_number               [18:16]
> > + * unused            [15:12]
> > + * ext_reg_number    [11:8]
> > + * reg_number                [7:2]
> > + *
> > + * Bits [15:12] are unused.
> > + *
> > + * In the glue logic there is a 64K region of address space that can b=
e
> > + * written/read to generate config cycles. The base address of this is
> > + * controlled by CFG_BASE_ADDRESS. There are 8 16 bit registers called
> > + * FUNC0_BDF_NUM to FUNC8_BDF_NUM. These split the bottom half of the
> 64K
> > + * window into 8 regions at 4K boundaries. These control the bus,devic=
e
> and
> > + * function number you are trying to talk to.
> > + *
> > + * The decision on whether to generate a type 0 or type 1 access is
> controlled
> > + * by bits 15:12 of the address you write to.  If they are zero, then =
a
> type 0
> > + * is generated, if anything else it will be a type 1. Thus the bottom
> 4K
> > + * region controlled by FUNC0_BDF_NUM can only generate type 0, all th=
e
> others
> > + * can only generate type 1.
> > + *
> > + * We only use FUNC0_BDF_NUM and FUNC1_BDF_NUM. Which one you use is
> selected
> > + * by bit 12 of the address you write to. The selected register is the=
n
> used
> > + * for the top 16 bits of the slv_haddr to form the bus/dev/func, bit
> 15:12 are
> > + * wired to zero, and bits 11:2 form the address of the register you
> want to
> > + * read in config space.
> > + *
> > + * We always write FUNC0_BDF_NUM as a 32 bit write. So if we want type=
 1
> > + * accesses we have to shift by 16 so in effect we are writing to
> FUNC1_BDF_NUM
> > + */
> > +static inline u32 bdf_num(int bus, int devfn, int is_root_bus)
> > +{
> > +     return ((bus << 8) | devfn) << (is_root_bus ? 0 : 16);
> > +}
> > +
> > +static inline unsigned config_addr(int where, int is_root_bus)
> > +{
> > +     return (where & ~3) | (!is_root_bus << 12);
> > +}
> > +
> > +static int st_pcie_rd_other_conf(struct pcie_port *pp, struct pci_bus
> *bus,
> > +                              unsigned int devfn, int where, int size,
> > +                              u32 *val)
> > +{
> > +     u32 data;
> > +     u32 bdf;
> > +     struct st_pcie *pcie =3D to_st_pcie(pp);
> > +     int is_root_bus =3D pci_is_root_bus(bus);
> > +     int retry_count =3D 0;
> > +     int ret;
> > +     void __iomem *addr;
> > +
> > +     /*
> > +      * Prerequisite
> > +      * PCI express devices will respond to all config type 0 cycles,
> since
> > +      * they are point to point links. Thus to avoid probing for
> multiple
> > +      * devices on the root, dw-pcie already check for us if it is on
> the
> > +      * root bus / other slots. Also, dw-pcie checks for the link bein=
g
> up
> > +      * as we will hang if we issue a config request and the link is
> down.
> > +      * A switch will reject requests for slots it knows do not exist.
> > +      */
> > +     bdf =3D bdf_num(bus->number, devfn, is_root_bus);
> > +     addr =3D pcie->config_area + config_addr(where,
> > +                     bus->parent->number =3D=3D pp->root_bus_nr);
> > +retry:
> > +     /* Set the config packet devfn */
> > +     writel_relaxed(bdf, pp->dbi_base + FUNC0_BDF_NUM);
> > +     readl_relaxed(pp->dbi_base + FUNC0_BDF_NUM);
> > +
> > +     ret =3D dw_pcie_cfg_read(addr, where, size, &data);
> > +
> > +     /*
> > +      * This is intended to help with when we are probing the bus. The
> > +      * problem is that the wrapper logic doesn't have any way to
> > +      * interrogate if the configuration request failed or not.
> > +      * On the ARM we actually get a real bus error.
> > +      *
> > +      * Unfortunately this means it is impossible to tell the differen=
ce
> > +      * between when a device doesn't exist (the switch will return a =
UR
> > +      * completion) or the device does exist but isn't yet ready to
> accept
> > +      * configuration requests (the device will return a CRS completio=
n)
> > +      *
> > +      * The result of this is that we will miss devices when probing.
> > +      *
> > +      * So if we are trying to read the dev/vendor id on devfn 0 and w=
e
> > +      * appear to get zero back, then we retry the request.  We know
> that
> > +      * zero can never be a valid device/vendor id. The specification
> says
> > +      * we must retry for up to a second before we decide the device i=
s
> > +      * dead. If we are still dead then we assume there is nothing
> there and
> > +      * return ~0
> > +      *
> > +      * The downside of this is that we incur a delay of 1s for every
> pci
> > +      * express link that doesn't have a device connected.
> > +      */
> > +     if (((where & ~3) =3D=3D 0) && devfn =3D=3D 0 && (data =3D=3D 0 |=
| data =3D=3D
> ~0)) {
> > +             if (retry_count++ < 1000) {
> > +                     mdelay(1);
> > +                     goto retry;
> > +             } else {
> > +                     *val =3D ~0;
> > +                     return PCIBIOS_DEVICE_NOT_FOUND;
> > +             }
> > +     }
> > +
> > +     *val =3D data;
> > +     return ret;
> > +}
> > +
> > +static int st_pcie_wr_other_conf(struct pcie_port *pp, struct pci_bus
> *bus,
> > +                              unsigned int devfn, int where, int size,
> > +                              u32 val)
> > +{
> > +     u32 bdf;
> > +     struct st_pcie *pcie =3D to_st_pcie(pp);
> > +     int is_root_bus =3D pci_is_root_bus(bus);
> > +     void __iomem *addr;
> > +
> > +     bdf =3D bdf_num(bus->number, devfn, is_root_bus);
> > +     addr =3D pcie->config_area + config_addr(where,
> > +                     bus->parent->number =3D=3D pp->root_bus_nr);
> > +
> > +     /* Set the config packet devfn */
> > +     writel_relaxed(bdf, pp->dbi_base + FUNC0_BDF_NUM);
> > +     readl_relaxed(pp->dbi_base + FUNC0_BDF_NUM);
> > +
> > +     return dw_pcie_cfg_write(addr, where, size, val);
> > +}
> > +
> > +static void st_pcie_board_reset(struct pcie_port *pp)
> > +{
> > +     struct st_pcie *pcie =3D to_st_pcie(pp);
> > +
> > +     if (!gpio_is_valid(pcie->reset_gpio))
> > +             return;
> > +
> > +     if (gpio_direction_output(pcie->reset_gpio, 0)) {
> > +             dev_err(pp->dev, "Cannot set PERST# (gpio %u) to output\n=
",
> > +                     pcie->reset_gpio);
> > +             return;
> > +     }
> > +
> > +     /* From PCIe spec */
> > +     usleep_range(1000, 2000);
> > +     gpio_direction_output(pcie->reset_gpio, 1);
> > +
> > +     /*
> > +      * PCIe specification states that you should not issue any config
> > +      * requests until 100ms after asserting reset, so we enforce that
> here
> > +      */
> > +     usleep_range(100000, 150000);
> > +}
> > +
> > +static void st_pcie_hw_setup(struct pcie_port *pp)
> > +{
> > +     struct st_pcie *pcie =3D to_st_pcie(pp);
> > +
> > +     dw_pcie_setup_rc(pp);
> > +
> > +     /* Set up the config window to the top of the PCI address space *=
/
> > +     writel_relaxed(pcie->config_window_start,
> > +                    pp->dbi_base + CFG_BASE_ADDRESS);
> > +
> > +     /*
> > +      * Open up memory to the PCI controller. We could do slightly
> > +      * better than this and exclude the kernel text segment and bss
> etc.
> > +      * They are base/limit registers so can be of arbitrary alignment
> > +      * presumably
> > +      */
> > +     writel_relaxed(pcie->lmi->start, pp->dbi_base +
> IN0_MEM_ADDR_START);
> > +     writel_relaxed(pcie->lmi->end, pp->dbi_base + IN0_MEM_ADDR_LIMIT)=
;
> > +
> > +     /* Disable the 2nd region */
> > +     writel_relaxed(~0, pp->dbi_base + IN1_MEM_ADDR_START);
> > +     writel_relaxed(0, pp->dbi_base + IN1_MEM_ADDR_LIMIT);
> > +
> > +     writel_relaxed(RC_PASS_ADDR_RANGE, pp->dbi_base +
> TRANSLATION_CONTROL);
> > +
> > +     /* Now assert the board level reset to the other PCIe device */
> > +     st_pcie_board_reset(pp);
> > +}
> > +
> > +static irqreturn_t st_pcie_msi_irq_handler(int irq, void *arg)
> > +{
> > +     struct pcie_port *pp =3D arg;
> > +
> > +     return dw_handle_msi_irq(pp);
> > +}
> > +
> > +static void st_msi_init_one(struct pcie_port *pp)
> > +{
> > +     struct st_pcie *pcie =3D to_st_pcie(pp);
> > +
> > +     /*
> > +      * Set the magic address the hardware responds to. This has to be
> in
> > +      * the range the PCI controller can write to.
> > +      */
> > +     dw_pcie_msi_init(pp);
> > +
> > +     if ((virt_to_phys((void *)pp->msi_data) < pcie->lmi->start) ||
> > +         (virt_to_phys((void *)pp->msi_data) > pcie->lmi->end))
> > +             dev_err(pp->dev, "MSI addr miss-configured\n");
> > +}
> > +
> > +static void st_pcie_host_init(struct pcie_port *pp)
> > +{
> > +     struct st_pcie *pcie =3D to_st_pcie(pp);
> > +     int err;
> > +
> > +     /*
> > +      * We have to initialise the PCIe cell on some hardware before we
> can
> > +      * talk to the phy
> > +      */
> > +     err =3D pcie->data->init(pp);
> > +     if (err)
> > +             return;
> > +
> > +     err =3D pcie->data->disable_ltssm(pp);
> > +     if (err) {
> > +             dev_err(pp->dev, "disable ltssm failed, %d\n", err);
> > +             return;
> > +     }
> > +
> > +     if (!pcie->data->phy_auto) {
> > +             /* Now init the associated miphy */
> > +             err =3D phy_init(pcie->phy);
> > +             if (err < 0) {
> > +                     dev_err(pp->dev, "Cannot init PHY: %d\n", err);
> > +                     return;
> > +             }
> > +     }
> > +
> > +     /* Now do all the register poking */
> > +     st_pcie_hw_setup(pp);
> > +
> > +     /* Re-enable the link */
> > +     err =3D pcie->data->enable_ltssm(pp);
> > +     if (err)
> > +             dev_err(pp->dev, "enable ltssm failed, %d\n", err);
> > +
> > +     if (IS_ENABLED(CONFIG_PCI_MSI))
> > +             st_msi_init_one(pp);
> > +}
> > +
> > +static struct pcie_host_ops st_pcie_host_ops =3D {
> > +     .rd_other_conf =3D st_pcie_rd_other_conf,
> > +     .wr_other_conf =3D st_pcie_wr_other_conf,
> > +     .link_up =3D st_pcie_link_up,
> > +     .host_init =3D st_pcie_host_init,
> > +};
> > +
> > +static int st_pcie_init(struct pcie_port *pp)
> > +{
> > +     struct st_pcie *pcie =3D to_st_pcie(pp);
> > +     int ret;
> > +
> > +     ret =3D reset_control_deassert(pcie->pwr);
> > +     if (ret) {
> > +             dev_err(pp->dev, "unable to bring out of powerdown\n");
> > +             return ret;
> > +     }
> > +
> > +     ret =3D reset_control_deassert(pcie->rst);
> > +     if (ret) {
> > +             dev_err(pp->dev, "unable to bring out of softreset\n");
> > +             return ret;
> > +     }
> > +
> > +     /* Set device type : Root Complex */
> > +     ret =3D regmap_write(pcie->regmap, pcie->syscfg0, PCIE_DEVICE_TYP=
E);
> > +     if (ret < 0) {
> > +             dev_err(pp->dev, "unable to set device type\n");
> > +             return ret;
> > +     }
> > +
> > +     usleep_range(1000, 2000);
> > +     return ret;
> > +}
> > +
> > +/* STiH407 */
> > +static int stih407_pcie_enable_ltssm(struct pcie_port *pp)
> > +{
> > +     struct st_pcie *pcie =3D to_st_pcie(pp);
> > +
> > +     if (!pcie->syscfg1)
> > +             return -EINVAL;
> > +
> > +     return regmap_update_bits(pcie->regmap, pcie->syscfg1,
> > +                               PCIE_APP_LTSSM_ENABLE,
> PCIE_APP_LTSSM_ENABLE);
> > +}
> > +
> > +static int stih407_pcie_disable_ltssm(struct pcie_port *pp)
> > +{
> > +     struct st_pcie *pcie =3D to_st_pcie(pp);
> > +
> > +     if (!pcie->syscfg1)
> > +             return -EINVAL;
> > +
> > +     return regmap_update_bits(pcie->regmap, pcie->syscfg1,
> > +                               PCIE_APP_LTSSM_ENABLE, 0);
> > +}
> > +
> > +static struct st_pcie_ops stih407_pcie_ops =3D {
> > +     .init =3D st_pcie_init,
> > +     .enable_ltssm =3D stih407_pcie_enable_ltssm,
> > +     .disable_ltssm =3D stih407_pcie_disable_ltssm,
> > +};
> > +
> > +static const struct of_device_id st_pcie_of_match[] =3D {
> > +     { .compatible =3D "st,stih407-pcie", .data =3D (void
> *)&stih407_pcie_ops},
> > +     { },
> > +};
> > +
> > +#ifdef CONFIG_PM
> > +static int st_pcie_suspend(struct device *pcie_dev)
> > +{
> > +     struct st_pcie *pcie =3D dev_get_drvdata(pcie_dev);
> > +
> > +     /* To guarantee a real phy initialization on resume */
> > +     if (!pcie->data->phy_auto)
> > +             phy_exit(pcie->phy);
> > +
> > +     return 0;
> > +}
> > +
> > +static int st_pcie_resume(struct device *pcie_dev)
> > +{
> > +     struct st_pcie *pcie =3D dev_get_drvdata(pcie_dev);
> > +
> > +     st_pcie_host_init(&pcie->pp);
> > +
> > +     return 0;
> > +}
> > +#endif
> > +
> > +const struct dev_pm_ops st_pcie_pm_ops =3D {
> > +     .suspend_noirq =3D st_pcie_suspend,
> > +     .resume_noirq =3D st_pcie_resume,
> > +};
> > +
> > +static int __init st_pcie_probe(struct platform_device *pdev)
> > +{
> > +     struct resource *res;
> > +     struct st_pcie *pcie;
> > +     struct device_node *np =3D pdev->dev.of_node;
> > +     struct pcie_port *pp;
> > +     int ret;
> > +
> > +     pcie =3D devm_kzalloc(&pdev->dev, sizeof(*pcie), GFP_KERNEL);
> > +     if (!pcie)
> > +             return -ENOMEM;
> > +
> > +     memset(pcie, 0, sizeof(*pcie));
> > +
> > +     pp =3D &pcie->pp;
> > +     pp->dev =3D &pdev->dev;
> > +
> > +     /* mem regions */
> > +     res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "dbi")=
;
> > +     pp->dbi_base =3D devm_ioremap_resource(&pdev->dev, res);
> > +     if (IS_ERR(pp->dbi_base))
> > +             return PTR_ERR(pp->dbi_base);
> > +
> > +     res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "confi=
g");
> > +     if (!res)
> > +             return -ENXIO;
> > +
> > +     /* Check that this has sensible values */
> > +     if ((resource_size(res) !=3D CFG_REGION_SIZE) ||
> > +         (res->start & (CFG_REGION_SIZE - 1))) {
> > +             dev_err(&pdev->dev, "Invalid config space properties\n");
> > +             return -EINVAL;
> > +     }
> > +     pcie->config_window_start =3D res->start;
> > +
> > +     pcie->config_area =3D devm_ioremap_resource(&pdev->dev, res);
> > +     if (IS_ERR(pcie->config_area))
> > +             return PTR_ERR(pcie->config_area);
> > +
> > +     pcie->lmi =3D platform_get_resource_byname(pdev, IORESOURCE_MEM,
> > +                                              "mem-window");
> > +     if (!pcie->lmi)
> > +             return -ENXIO;
> > +
> > +     /* regmap registers for PCIe IP configuration */
> > +     pcie->regmap =3D syscon_regmap_lookup_by_phandle(np, "st,syscfg")=
;
> > +     if (IS_ERR(pcie->regmap)) {
> > +             dev_err(&pdev->dev, "No syscfg phandle specified\n");
> > +             return PTR_ERR(pcie->regmap);
> > +     }
> > +
> > +     ret =3D of_property_read_u32_index(np, "st,syscfg", SYSCFG0_REG,
> > +                                      &pcie->syscfg0);
> > +     if (ret) {
> > +             dev_err(&pdev->dev, "can't get syscfg0 offset (%d)\n",
> ret);
> > +             return ret;
> > +     }
> > +
> > +     ret =3D of_property_read_u32_index(np, "st,syscfg", SYSCFG1_REG,
> > +                                      &pcie->syscfg1);
> > +     if (ret) {
> > +             dev_err(&pdev->dev, "can't get syscfg1 offset (%d)\n",
> ret);
> > +             return ret;
> > +     }
> > +
> > +     /* retrieve data opts from compatible */
> > +     pcie->data =3D of_match_node(st_pcie_of_match, np)->data;
> > +     if (!pcie->data) {
> > +             dev_err(&pdev->dev, "compatible data not provided\n");
> > +             return -EINVAL;
> > +     }
> > +
> > +     /* powerdown / resets */
> > +     pcie->pwr =3D devm_reset_control_get(&pdev->dev, "powerdown");
> > +     if (IS_ERR(pcie->pwr)) {
> > +             dev_err(&pdev->dev, "powerdown reset control not
> defined\n");
> > +             return -EINVAL;
>
> Please return PTR_ERR(pcie->pwr) instead of '-EINVAL'.
>

=E2=80=8Bok
=E2=80=8B


>
> > +     }
> > +
> > +     pcie->rst =3D devm_reset_control_get(&pdev->dev, "softreset");
> > +     if (IS_ERR(pcie->rst)) {
> > +             dev_err(&pdev->dev, "Soft reset control not defined\n");
> > +             return -EINVAL;
>
> Please return PTR_ERR(pcie->pwr) instead of '-EINVAL'.
>

=E2=80=8Bok
=E2=80=8B


>
> > +     }
> > +
> > +     /* phy */
> > +     if (!pcie->data->phy_auto) {
> > +             pcie->phy =3D devm_phy_get(&pdev->dev, "pcie_phy");
> > +             if (IS_ERR(pcie->phy)) {
> > +                     dev_err(&pdev->dev, "no PHY configured\n");
> > +                     return PTR_ERR(pcie->phy);
> > +             }
> > +     }
> > +
> > +     /* Claim the GPIO for PRST# if available */
> > +     pcie->reset_gpio =3D of_get_named_gpio(np, "reset-gpio", 0);
> > +     if (!gpio_is_valid(pcie->reset_gpio))
> > +             dev_dbg(&pdev->dev, "No reset-gpio configured\n");
> > +     else {
> > +             ret =3D devm_gpio_request(&pdev->dev,
> > +                                     pcie->reset_gpio,
> > +                                     "PCIe reset");
> > +             if (ret) {
> > +                     dev_err(&pdev->dev, "Cannot request reset-gpio
> %d\n",
> > +                             pcie->reset_gpio);
> > +                     return ret;
> > +             }
> > +     }
> > +
> > +     if (IS_ENABLED(CONFIG_PCI_MSI)) {
> > +             pp->msi_irq =3D platform_get_irq_byname(pdev, "msi");
> > +             if (pp->msi_irq <=3D 0) {
> > +                     dev_err(&pdev->dev, "failed to get MSI irq\n");
> > +                     return -ENODEV;
> > +             }
> > +
> > +             ret =3D devm_request_irq(&pdev->dev, pp->msi_irq,
> > +                                    st_pcie_msi_irq_handler,
> > +                                    IRQF_SHARED, "st-pcie-msi", pp);
> > +             if (ret) {
> > +                     dev_err(&pdev->dev, "failed to request MSI irq\n"=
);
> > +                     return -ENODEV;
> > +             }
> > +     }
> > +
> > +     if (IS_ENABLED(CONFIG_ARM)) {
> > +             /*
> > +              * We have to hook the abort handler so that we can
> intercept
> > +              * bus errors when doing config read/write that return UR=
,
> > +              * which is flagged up as a bus error
> > +              */
> > +             hook_fault_code(16+6, st_pcie_abort_handler, SIGBUS, 0,
> > +                             "imprecise external abort");
> > +     }
> > +
> > +     pp->root_bus_nr =3D -1;
> > +     pp->ops =3D &st_pcie_host_ops;
> > +
> > +     ret =3D dw_pcie_host_init(pp);
> > +     if (ret) {
> > +             dev_err(&pdev->dev, "failed to initialize host\n");
> > +             return ret;
> > +     }
> > +
> > +     platform_set_drvdata(pdev, pcie);
> > +
> > +     dev_info(&pdev->dev, "Initialized\n");
> > +     return 0;
> > +}
> > +
> > +MODULE_DEVICE_TABLE(of, st_pcie_of_match);
> > +
> > +static struct platform_driver st_pcie_driver =3D {
> > +     .driver =3D {
> > +             .name =3D "st-pcie",
> > +             .of_match_table =3D st_pcie_of_match,
> > +             .pm =3D &st_pcie_pm_ops,
> > +     },
> > +};
> > +
> > +/* ST PCIe driver does not allow module unload */
> > +static int __init pcie_init(void)
> > +{
> > +     return platform_driver_probe(&st_pcie_driver, st_pcie_probe);
> > +}
> > +device_initcall(pcie_init);
> > +
> > +MODULE_AUTHOR("Fabrice Gasnier <fabrice.gasnier@st.com>");
> > +MODULE_DESCRIPTION("PCI express Driver for ST SoCs");
> > +MODULE_LICENSE("GPLv2");
>
> Please add one space between 'GPL' and 'v2'.
>
> s/"GPLv2"/"GPL v2"
>
> According to the license_is_gpl_compatible(), the MODULE_LICENSE() string
> for GPL v2 is "GPL v2" not "GPLv2".
>
>
=E2=80=8BOk


Best regards,
> Jingoo Han
>
> > --
> > 1.9.1
>

=E2=80=8BBR

Gabriel=E2=80=8B

--001a11330e3a098c4d050d009a7d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:courier =
new,monospace"><br></div><div class=3D"gmail_extra"><div class=3D"gmail_def=
ault" style=3D"font-family:&#39;courier new&#39;,monospace">=E2=80=8BHi Jin=
goo,</div><div class=3D"gmail_default" style=3D"font-family:&#39;courier ne=
w&#39;,monospace"><br></div><div class=3D"gmail_default" style=3D"font-fami=
ly:&#39;courier new&#39;,monospace">Thanks for reviewing=E2=80=8B</div><br>=
<div class=3D"gmail_quote">On 18 December 2014 at 07:03, Jingoo Han <span d=
ir=3D"ltr">&lt;<a href=3D"mailto:jg1.han@samsung.com" target=3D"_blank">jg1=
.han@samsung.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><d=
iv><div>On Wednesday, December 17, 2014 7:35 PM, Gabriel FERNANDEZ wrote:<b=
r>
&gt;<br>
&gt; sti pcie is built around a Synopsis Designware PCIe IP.<br>
&gt;<br>
&gt; Signed-off-by: Fabrice Gasnier &lt;<a href=3D"mailto:fabrice.gasnier@s=
t.com" target=3D"_blank">fabrice.gasnier@st.com</a>&gt;<br>
&gt; Signed-off-by: Gabriel Fernandez &lt;<a href=3D"mailto:gabriel.fernand=
ez@linaro.org" target=3D"_blank">gabriel.fernandez@linaro.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/pci/host/Kconfig=C2=A0 |=C2=A0 =C2=A05 +<br>
&gt;=C2=A0 drivers/pci/host/Makefile |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 drivers/pci/host/pci-st.c | 713 ++++++++++++++++++++++++++++++++=
++++++++++++++<br>
&gt;=C2=A0 3 files changed, 719 insertions(+)<br>
&gt;=C2=A0 create mode 100644 drivers/pci/host/pci-st.c<br>
&gt;<br>
&gt; diff --git a/drivers/pci/host/Kconfig b/drivers/pci/host/Kconfig<br>
&gt; index c4b6568..999d2b9 100644<br>
&gt; --- a/drivers/pci/host/Kconfig<br>
&gt; +++ b/drivers/pci/host/Kconfig<br>
&gt; @@ -102,4 +102,9 @@ config PCI_LAYERSCAPE<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Say Y here if you want PCIe controlle=
r support on Layerscape SoCs.<br>
&gt;<br>
&gt; +config PCI_ST<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool &quot;ST STiH41x PCIe controller&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on ARCH_STI<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select PCIE_DW<br>
&gt; +<br>
&gt;=C2=A0 endmenu<br>
&gt; diff --git a/drivers/pci/host/Makefile b/drivers/pci/host/Makefile<br>
&gt; index 44c2699..ca14829 100644<br>
&gt; --- a/drivers/pci/host/Makefile<br>
&gt; +++ b/drivers/pci/host/Makefile<br>
&gt; @@ -12,3 +12,4 @@ obj-$(CONFIG_PCI_KEYSTONE) +=3D pci-keystone-dw.o pc=
i-keystone.o<br>
&gt;=C2=A0 obj-$(CONFIG_PCIE_XILINX) +=3D pcie-xilinx.o<br>
&gt;=C2=A0 obj-$(CONFIG_PCI_XGENE) +=3D pci-xgene.o<br>
&gt;=C2=A0 obj-$(CONFIG_PCI_LAYERSCAPE) +=3D pci-layerscape.o<br>
&gt; +obj-$(CONFIG_PCI_ST) +=3D pci-st.o<br>
&gt; diff --git a/drivers/pci/host/pci-st.c b/drivers/pci/host/pci-st.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000..bd3d32d<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/pci/host/pci-st.c<br>
&gt; @@ -0,0 +1,713 @@<br>
&gt; +/*<br>
&gt; + * Copyright (C) 2014 STMicroelectronics<br>
&gt; + *<br>
&gt; + * STMicroelectronics PCI express Driver for sti SoCs.<br>
&gt; + * ST PCIe IPs are built around a Synopsys IP Core.<br>
&gt; + *<br>
&gt; + * Author: Fabrice Gasnier &lt;<a href=3D"mailto:fabrice.gasnier@st.c=
om" target=3D"_blank">fabrice.gasnier@st.com</a>&gt;<br>
&gt; + *<br>
&gt; + * This program is free software; you can redistribute it and/or modi=
fy<br>
&gt; + * it under the terms of the GNU General Public License version 2, as=
<br>
&gt; + * published by the Free Software Foundation.<br>
&gt; + *<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &lt;linux/module.h&gt;<br>
&gt; +#include &lt;linux/interrupt.h&gt;<br>
&gt; +#include &lt;linux/of_address.h&gt;<br>
&gt; +#include &lt;linux/of_pci.h&gt;<br>
&gt; +#include &lt;linux/of_platform.h&gt;<br>
&gt; +#include &lt;linux/of_gpio.h&gt;<br>
&gt; +#include &lt;linux/regmap.h&gt;<br>
&gt; +#include &lt;linux/mfd/syscon.h&gt;<br>
&gt; +#include &lt;linux/delay.h&gt;<br>
&gt; +#include &lt;linux/reset.h&gt;<br>
&gt; +#include &lt;linux/phy/phy.h&gt;<br>
<br>
</div></div>Please, re-order these headers alphabetically.<br>
It enhances the readability.<br></blockquote><div><div class=3D"gmail_defau=
lt" style=3D"font-family:&#39;courier new&#39;,monospace;display:inline"><b=
r></div></div><div><div class=3D"gmail_default" style=3D"font-family:&#39;c=
ourier new&#39;,monospace;display:inline">=E2=80=8Bsure</div></div><div><di=
v class=3D"gmail_default" style=3D"font-family:&#39;courier new&#39;,monosp=
ace;display:inline">=E2=80=8B</div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">
<div><div><br>
&gt; +<br>
&gt; +#include &quot;pcie-designware.h&quot;<br>
&gt; +<br>
&gt; +#define TRANSLATION_CONTROL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x900<b=
r>
&gt; +/* Controls if area is inclusive or exclusive */<br>
&gt; +#define RC_PASS_ADDR_RANGE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BI=
T(1)<br>
&gt; +<br>
&gt; +/* Base of area reserved for config accesses. Fixed size of 64K. */<b=
r>
&gt; +#define CFG_BASE_ADDRESS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A00x92c<br>
&gt; +#define CFG_REGION_SIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 65536<br>
&gt; +<br>
&gt; +/* First 4K of config space has this BDF (bus,device,function) */<br>
&gt; +#define FUNC0_BDF_NUM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x930<br>
&gt; +<br>
&gt; +/* Mem regions */<br>
&gt; +#define IN0_MEM_ADDR_START=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x=
964<br>
&gt; +#define IN0_MEM_ADDR_LIMIT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x=
968<br>
&gt; +#define IN1_MEM_ADDR_START=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x=
974<br>
&gt; +#define IN1_MEM_ADDR_LIMIT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x=
978<br>
&gt; +<br>
&gt; +/* This actually contains the LTSSM state machine state */<br>
&gt; +#define PORT_LOGIC_DEBUG_REG_0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A00x728<br>
&gt; +<br>
&gt; +/* LTSSM state machine values=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +#define DEBUG_REG_0_LTSSM_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A00x1f<br>
&gt; +#define S_DETECT_QUIET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x00<br>
&gt; +#define S_DETECT_ACT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A00x01<br>
&gt; +#define S_POLL_ACTIVE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x02<br>
&gt; +#define S_POLL_COMPLIANCE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x=
03<br>
&gt; +#define S_POLL_CONFIG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x04<br>
&gt; +#define S_PRE_DETECT_QUIET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x=
05<br>
&gt; +#define S_DETECT_WAIT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x06<br>
&gt; +#define S_CFG_LINKWD_START=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x=
07<br>
&gt; +#define S_CFG_LINKWD_ACEPT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x=
08<br>
&gt; +#define S_CFG_LANENUM_WAIT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x=
09<br>
&gt; +#define S_CFG_LANENUM_ACEPT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0A<br=
>
&gt; +#define S_CFG_COMPLETE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0B<br>
&gt; +#define S_CFG_IDLE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A00x0C<br>
&gt; +#define S_RCVRY_LOCK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A00x0D<br>
&gt; +#define S_RCVRY_SPEED=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0E<br>
&gt; +#define S_RCVRY_RCVRCFG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0F<br>
&gt; +#define S_RCVRY_IDLE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A00x10<br>
&gt; +#define S_L0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x11<br>
&gt; +#define S_L0S=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x12<br>
&gt; +#define S_L123_SEND_EIDLE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x=
13<br>
&gt; +#define S_L1_IDLE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0x14<br>
&gt; +#define S_L2_IDLE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0x15<br>
&gt; +#define S_L2_WAKE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0x16<br>
&gt; +#define S_DISABLED_ENTRY=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A00x17<br>
&gt; +#define S_DISABLED_IDLE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x18<br>
&gt; +#define S_DISABLED=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A00x19<br>
&gt; +#define S_LPBK_ENTRY=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A00x1A<br>
&gt; +#define S_LPBK_ACTIVE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x1B<br>
&gt; +#define S_LPBK_EXIT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 0x1C<br>
&gt; +#define S_LPBK_EXIT_TIMEOUT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x1D<br=
>
&gt; +#define S_HOT_RESET_ENTRY=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x=
1E<br>
&gt; +#define S_HOT_RESET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 0x1F<br>
&gt; +<br>
&gt; +/* syscfg bits */<br>
&gt; +#define PCIE_SYS_INT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0BIT(5)<br>
&gt; +#define PCIE_APP_REQ_RETRY_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 BIT(3)<br>
&gt; +#define PCIE_APP_LTSSM_ENABLE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 BIT(2)<br>
&gt; +#define PCIE_APP_INIT_RST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BI=
T(1)<br>
&gt; +#define PCIE_DEVICE_TYPE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0BIT(0)<br>
&gt; +#define PCIE_DEFAULT_VAL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0PCIE_DEVICE_TYPE<br>
&gt; +<br>
&gt; +/* Time to wait between testing the link in msecs (hardware poll inte=
rval) */<br>
&gt; +#define LINK_LOOP_DELAY_MS 1<br>
&gt; +/* Total amount of time to wait for the link to come up in msecs */<b=
r>
&gt; +#define LINK_WAIT_MS 120<br>
&gt; +#define LINK_LOOP_COUNT (LINK_WAIT_MS / LINK_LOOP_DELAY_MS)<br>
&gt; +<br>
&gt; +/* st,syscfg offsets */<br>
&gt; +#define SYSCFG0_REG=C2=A0 1<br>
&gt; +#define SYSCFG1_REG=C2=A0 2<br>
&gt; +<br>
&gt; +#define to_st_pcie(x)=C2=A0 =C2=A0 =C2=A0 =C2=A0 container_of(x, stru=
ct st_pcie, pp)<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * struct st_pcie_ops - SOC dependent data<br>
&gt; + * @init: reference to controller power &amp; reset init routine<br>
&gt; + * @enable_ltssm: reference to controller link enable routine<br>
&gt; + * @disable_ltssm:=C2=A0 reference to controller link disable routine=
<br>
&gt; + * @phy_auto: flag when phy automatically configured<br>
&gt; + */<br>
&gt; +struct st_pcie_ops {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int (*init)(struct pcie_port *pp);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int (*enable_ltssm)(struct pcie_port *pp);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int (*disable_ltssm)(struct pcie_port *pp);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool phy_auto;<br>
&gt; +};<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * struct st_pcie - private data of the controller<br>
&gt; + * @pp: designware pcie port<br>
&gt; + * @syscfg0: PCIe configuration 0 register, regmap offset<br>
&gt; + * @syscfg1: PCIe configuration 1 register, regmap offset<br>
&gt; + * @phy: associated pcie phy<br>
&gt; + * @config_area: PCIe configuration space<br>
&gt; + * @lmi: memory made available to the controller<br>
&gt; + * @data: SOC dependent data<br>
&gt; + * @regmap: Syscfg registers bank in which PCIe port is configured<br=
>
&gt; + * @pwr: power control<br>
&gt; + * @rst: reset control<br>
&gt; + * @reset_gpio: optional reset gpio<br>
&gt; + * @config_window_start: start address of 64K config space area<br>
&gt; + */<br>
&gt; +struct st_pcie {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct pcie_port pp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int syscfg0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int syscfg1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct phy *phy;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0void __iomem *config_area;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct resource *lmi;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const struct st_pcie_ops *data;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct regmap *regmap;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct reset_control *pwr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct reset_control *rst;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int reset_gpio;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0phys_addr_t config_window_start;<br>
&gt; +};<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * Function to test if the link is in an operational state or not. We=
 must<br>
&gt; + * ensure the link is operational before we try to do a configuration=
 access.<br>
&gt; + */<br>
&gt; +static int st_pcie_link_up(struct pcie_port *pp)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 status;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int link_up;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int count =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * We have to be careful here. This is used in co=
nfig read/write,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * The higher levels switch off interrupts, so yo=
u cannot use<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * jiffies to do a timeout, or reschedule<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0do {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * What about L2? I t=
hink software intervention is<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * required to get it=
 out of L2, so in effect the link<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * is down. Requires =
more work when/if we implement power<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * management<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D readl_rela=
xed(pp-&gt;dbi_base + PORT_LOGIC_DEBUG_REG_0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status &amp;=3D DEBUG=
_REG_0_LTSSM_MASK;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0link_up =3D (status =
=3D=3D S_L0) || (status =3D=3D S_L0S) ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0(status =3D=3D S_L1_IDLE);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * It can take some c=
onsiderable time for the link to actually<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * come up, caused by=
 the PLLs. Experiments indicate it takes<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * about 8ms to actua=
lly bring the link up, but this can vary<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * considerably accor=
ding to the specification. This code should<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * allow sufficient t=
ime<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!link_up)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0mdelay(LINK_LOOP_DELAY_MS);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} while (!link_up &amp;&amp; ++count &lt; LINK_LO=
OP_COUNT);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return link_up;<br>
&gt; +}<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * On ARM platforms, we actually get a bus error returned when the PC=
Ie IP<br>
&gt; + * returns a UR or CRS instead of an OK.<br>
&gt; + */<br>
&gt; +static int st_pcie_abort_handler(unsigned long addr, unsigned int fsr=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct pt_regs *regs)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * The PCI express core IP expects the following arrangement on it&#3=
9;s address<br>
&gt; + * bus (slv_haddr) when driving config cycles.<br>
&gt; + * bus_number=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
[31:24]<br>
&gt; + * dev_number=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
[23:19]<br>
&gt; + * func_number=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
[18:16]<br>
&gt; + * unused=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [15:12]<br>
&gt; + * ext_reg_number=C2=A0 =C2=A0 [11:8]<br>
&gt; + * reg_number=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
[7:2]<br>
&gt; + *<br>
&gt; + * Bits [15:12] are unused.<br>
&gt; + *<br>
&gt; + * In the glue logic there is a 64K region of address space that can =
be<br>
&gt; + * written/read to generate config cycles. The base address of this i=
s<br>
&gt; + * controlled by CFG_BASE_ADDRESS. There are 8 16 bit registers calle=
d<br>
&gt; + * FUNC0_BDF_NUM to FUNC8_BDF_NUM. These split the bottom half of the=
 64K<br>
&gt; + * window into 8 regions at 4K boundaries. These control the bus,devi=
ce and<br>
&gt; + * function number you are trying to talk to.<br>
&gt; + *<br>
&gt; + * The decision on whether to generate a type 0 or type 1 access is c=
ontrolled<br>
&gt; + * by bits 15:12 of the address you write to.=C2=A0 If they are zero,=
 then a type 0<br>
&gt; + * is generated, if anything else it will be a type 1. Thus the botto=
m 4K<br>
&gt; + * region controlled by FUNC0_BDF_NUM can only generate type 0, all t=
he others<br>
&gt; + * can only generate type 1.<br>
&gt; + *<br>
&gt; + * We only use FUNC0_BDF_NUM and FUNC1_BDF_NUM. Which one you use is =
selected<br>
&gt; + * by bit 12 of the address you write to. The selected register is th=
en used<br>
&gt; + * for the top 16 bits of the slv_haddr to form the bus/dev/func, bit=
 15:12 are<br>
&gt; + * wired to zero, and bits 11:2 form the address of the register you =
want to<br>
&gt; + * read in config space.<br>
&gt; + *<br>
&gt; + * We always write FUNC0_BDF_NUM as a 32 bit write. So if we want typ=
e 1<br>
&gt; + * accesses we have to shift by 16 so in effect we are writing to FUN=
C1_BDF_NUM<br>
&gt; + */<br>
&gt; +static inline u32 bdf_num(int bus, int devfn, int is_root_bus)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return ((bus &lt;&lt; 8) | devfn) &lt;&lt; (is_ro=
ot_bus ? 0 : 16);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static inline unsigned config_addr(int where, int is_root_bus)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return (where &amp; ~3) | (!is_root_bus &lt;&lt; =
12);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int st_pcie_rd_other_conf(struct pcie_port *pp, struct pci_bus=
 *bus,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int devfn, int where, int size=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 *val)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 data;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 bdf;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct st_pcie *pcie =3D to_st_pcie(pp);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int is_root_bus =3D pci_is_root_bus(bus);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int retry_count =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0void __iomem *addr;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * Prerequisite<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * PCI express devices will respond to all config=
 type 0 cycles, since<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * they are point to point links. Thus to avoid p=
robing for multiple<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * devices on the root, dw-pcie already check for=
 us if it is on the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * root bus / other slots. Also, dw-pcie checks f=
or the link being up<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * as we will hang if we issue a config request a=
nd the link is down.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * A switch will reject requests for slots it kno=
ws do not exist.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bdf =3D bdf_num(bus-&gt;number, devfn, is_root_bu=
s);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0addr =3D pcie-&gt;config_area + config_addr(where=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0bus-&gt;parent-&gt;number =3D=3D pp-&gt;root_bus_nr);<br>
&gt; +retry:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Set the config packet devfn */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel_relaxed(bdf, pp-&gt;dbi_base + FUNC0_BDF_N=
UM);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0readl_relaxed(pp-&gt;dbi_base + FUNC0_BDF_NUM);<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D dw_pcie_cfg_read(addr, where, size, &amp;=
data);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * This is intended to help with when we are prob=
ing the bus. The<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * problem is that the wrapper logic doesn&#39;t =
have any way to<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * interrogate if the configuration request faile=
d or not.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * On the ARM we actually get a real bus error.<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 *<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * Unfortunately this means it is impossible to t=
ell the difference<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * between when a device doesn&#39;t exist (the s=
witch will return a UR<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * completion) or the device does exist but isn&#=
39;t yet ready to accept<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * configuration requests (the device will return=
 a CRS completion)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 *<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * The result of this is that we will miss device=
s when probing.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 *<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * So if we are trying to read the dev/vendor id =
on devfn 0 and we<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * appear to get zero back, then we retry the req=
uest.=C2=A0 We know that<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * zero can never be a valid device/vendor id. Th=
e specification says<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * we must retry for up to a second before we dec=
ide the device is<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * dead. If we are still dead then we assume ther=
e is nothing there and<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * return ~0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 *<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * The downside of this is that we incur a delay =
of 1s for every pci<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * express link that doesn&#39;t have a device co=
nnected.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (((where &amp; ~3) =3D=3D 0) &amp;&amp; devfn =
=3D=3D 0 &amp;&amp; (data =3D=3D 0 || data =3D=3D ~0)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (retry_count++ &lt=
; 1000) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0mdelay(1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0goto retry;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0*val =3D ~0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return PCIBIOS_DEVICE_NOT_FOUND;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*val =3D data;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int st_pcie_wr_other_conf(struct pcie_port *pp, struct pci_bus=
 *bus,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int devfn, int where, int size=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 val)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 bdf;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct st_pcie *pcie =3D to_st_pcie(pp);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int is_root_bus =3D pci_is_root_bus(bus);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0void __iomem *addr;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bdf =3D bdf_num(bus-&gt;number, devfn, is_root_bu=
s);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0addr =3D pcie-&gt;config_area + config_addr(where=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0bus-&gt;parent-&gt;number =3D=3D pp-&gt;root_bus_nr);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Set the config packet devfn */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel_relaxed(bdf, pp-&gt;dbi_base + FUNC0_BDF_N=
UM);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0readl_relaxed(pp-&gt;dbi_base + FUNC0_BDF_NUM);<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return dw_pcie_cfg_write(addr, where, size, val);=
<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void st_pcie_board_reset(struct pcie_port *pp)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct st_pcie *pcie =3D to_st_pcie(pp);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!gpio_is_valid(pcie-&gt;reset_gpio))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (gpio_direction_output(pcie-&gt;reset_gpio, 0)=
) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(pp-&gt;dev, &=
quot;Cannot set PERST# (gpio %u) to output\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0pcie-&gt;reset_gpio);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* From PCIe spec */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0usleep_range(1000, 2000);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0gpio_direction_output(pcie-&gt;reset_gpio, 1);<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * PCIe specification states that you should not =
issue any config<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * requests until 100ms after asserting reset, so=
 we enforce that here<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0usleep_range(100000, 150000);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void st_pcie_hw_setup(struct pcie_port *pp)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct st_pcie *pcie =3D to_st_pcie(pp);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dw_pcie_setup_rc(pp);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Set up the config window to the top of the PCI=
 address space */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel_relaxed(pcie-&gt;config_window_start,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 pp-&gt;dbi_base + CFG_BASE_ADDRESS);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * Open up memory to the PCI controller. We could=
 do slightly<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * better than this and exclude the kernel text s=
egment and bss etc.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * They are base/limit registers so can be of arb=
itrary alignment<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * presumably<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel_relaxed(pcie-&gt;lmi-&gt;start, pp-&gt;dbi=
_base + IN0_MEM_ADDR_START);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel_relaxed(pcie-&gt;lmi-&gt;end, pp-&gt;dbi_b=
ase + IN0_MEM_ADDR_LIMIT);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Disable the 2nd region */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel_relaxed(~0, pp-&gt;dbi_base + IN1_MEM_ADDR=
_START);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel_relaxed(0, pp-&gt;dbi_base + IN1_MEM_ADDR_=
LIMIT);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0writel_relaxed(RC_PASS_ADDR_RANGE, pp-&gt;dbi_bas=
e + TRANSLATION_CONTROL);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Now assert the board level reset to the other =
PCIe device */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0st_pcie_board_reset(pp);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static irqreturn_t st_pcie_msi_irq_handler(int irq, void *arg)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct pcie_port *pp =3D arg;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return dw_handle_msi_irq(pp);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void st_msi_init_one(struct pcie_port *pp)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct st_pcie *pcie =3D to_st_pcie(pp);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * Set the magic address the hardware responds to=
. This has to be in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * the range the PCI controller can write to.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dw_pcie_msi_init(pp);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if ((virt_to_phys((void *)pp-&gt;msi_data) &lt; p=
cie-&gt;lmi-&gt;start) ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(virt_to_phys((void *)pp-&gt;msi_da=
ta) &gt; pcie-&gt;lmi-&gt;end))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(pp-&gt;dev, &=
quot;MSI addr miss-configured\n&quot;);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void st_pcie_host_init(struct pcie_port *pp)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct st_pcie *pcie =3D to_st_pcie(pp);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int err;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * We have to initialise the PCIe cell on some ha=
rdware before we can<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * talk to the phy<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0err =3D pcie-&gt;data-&gt;init(pp);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (err)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0err =3D pcie-&gt;data-&gt;disable_ltssm(pp);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (err) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(pp-&gt;dev, &=
quot;disable ltssm failed, %d\n&quot;, err);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!pcie-&gt;data-&gt;phy_auto) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Now init the assoc=
iated miphy */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D phy_init(pcie=
-&gt;phy);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (err &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dev_err(pp-&gt;dev, &quot;Cannot init PHY: %d\n&quot;, err);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Now do all the register poking */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0st_pcie_hw_setup(pp);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Re-enable the link */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0err =3D pcie-&gt;data-&gt;enable_ltssm(pp);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (err)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(pp-&gt;dev, &=
quot;enable ltssm failed, %d\n&quot;, err);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ENABLED(CONFIG_PCI_MSI))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0st_msi_init_one(pp);<=
br>
&gt; +}<br>
&gt; +<br>
&gt; +static struct pcie_host_ops st_pcie_host_ops =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.rd_other_conf =3D st_pcie_rd_other_conf,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.wr_other_conf =3D st_pcie_wr_other_conf,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.link_up =3D st_pcie_link_up,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.host_init =3D st_pcie_host_init,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static int st_pcie_init(struct pcie_port *pp)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct st_pcie *pcie =3D to_st_pcie(pp);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D reset_control_deassert(pcie-&gt;pwr);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(pp-&gt;dev, &=
quot;unable to bring out of powerdown\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D reset_control_deassert(pcie-&gt;rst);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(pp-&gt;dev, &=
quot;unable to bring out of softreset\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Set device type : Root Complex */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D regmap_write(pcie-&gt;regmap, pcie-&gt;sy=
scfg0, PCIE_DEVICE_TYPE);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(pp-&gt;dev, &=
quot;unable to set device type\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0usleep_range(1000, 2000);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +}<br>
&gt; +<br>
&gt; +/* STiH407 */<br>
&gt; +static int stih407_pcie_enable_ltssm(struct pcie_port *pp)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct st_pcie *pcie =3D to_st_pcie(pp);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!pcie-&gt;syscfg1)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return regmap_update_bits(pcie-&gt;regmap, pcie-&=
gt;syscfg1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PCIE_APP_LTSSM_ENABLE, PCIE_APP_L=
TSSM_ENABLE);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int stih407_pcie_disable_ltssm(struct pcie_port *pp)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct st_pcie *pcie =3D to_st_pcie(pp);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!pcie-&gt;syscfg1)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return regmap_update_bits(pcie-&gt;regmap, pcie-&=
gt;syscfg1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PCIE_APP_LTSSM_ENABLE, 0);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static struct st_pcie_ops stih407_pcie_ops =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.init =3D st_pcie_init,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.enable_ltssm =3D stih407_pcie_enable_ltssm,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.disable_ltssm =3D stih407_pcie_disable_ltssm,<br=
>
&gt; +};<br>
&gt; +<br>
&gt; +static const struct of_device_id st_pcie_of_match[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;st,stih407-pcie&quot;, .d=
ata =3D (void *)&amp;stih407_pcie_ops},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ },<br>
&gt; +};<br>
&gt; +<br>
&gt; +#ifdef CONFIG_PM<br>
&gt; +static int st_pcie_suspend(struct device *pcie_dev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct st_pcie *pcie =3D dev_get_drvdata(pcie_dev=
);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* To guarantee a real phy initialization on resu=
me */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!pcie-&gt;data-&gt;phy_auto)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0phy_exit(pcie-&gt;phy=
);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int st_pcie_resume(struct device *pcie_dev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct st_pcie *pcie =3D dev_get_drvdata(pcie_dev=
);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0st_pcie_host_init(&amp;pcie-&gt;pp);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +#endif<br>
&gt; +<br>
&gt; +const struct dev_pm_ops st_pcie_pm_ops =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.suspend_noirq =3D st_pcie_suspend,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.resume_noirq =3D st_pcie_resume,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static int __init st_pcie_probe(struct platform_device *pdev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct resource *res;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct st_pcie *pcie;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct device_node *np =3D pdev-&gt;dev.of_node;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct pcie_port *pp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pcie =3D devm_kzalloc(&amp;pdev-&gt;dev, sizeof(*=
pcie), GFP_KERNEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!pcie)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0memset(pcie, 0, sizeof(*pcie));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pp =3D &amp;pcie-&gt;pp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pp-&gt;dev =3D &amp;pdev-&gt;dev;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* mem regions */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0res =3D platform_get_resource_byname(pdev, IORESO=
URCE_MEM, &quot;dbi&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pp-&gt;dbi_base =3D devm_ioremap_resource(&amp;pd=
ev-&gt;dev, res);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(pp-&gt;dbi_base))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(pp-&gt=
;dbi_base);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0res =3D platform_get_resource_byname(pdev, IORESO=
URCE_MEM, &quot;config&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!res)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENXIO;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Check that this has sensible values */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if ((resource_size(res) !=3D CFG_REGION_SIZE) ||<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(res-&gt;start &amp; (CFG_REGION_SI=
ZE - 1))) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;pdev-&gt=
;dev, &quot;Invalid config space properties\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pcie-&gt;config_window_start =3D res-&gt;start;<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pcie-&gt;config_area =3D devm_ioremap_resource(&a=
mp;pdev-&gt;dev, res);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(pcie-&gt;config_area))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(pcie-&=
gt;config_area);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pcie-&gt;lmi =3D platform_get_resource_byname(pde=
v, IORESOURCE_MEM,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;mem-window&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!pcie-&gt;lmi)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENXIO;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* regmap registers for PCIe IP configuration */<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0pcie-&gt;regmap =3D syscon_regmap_lookup_by_phand=
le(np, &quot;st,syscfg&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(pcie-&gt;regmap)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;pdev-&gt=
;dev, &quot;No syscfg phandle specified\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(pcie-&=
gt;regmap);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D of_property_read_u32_index(np, &quot;st,s=
yscfg&quot;, SYSCFG0_REG,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;pcie-&=
gt;syscfg0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;pdev-&gt=
;dev, &quot;can&#39;t get syscfg0 offset (%d)\n&quot;, ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D of_property_read_u32_index(np, &quot;st,s=
yscfg&quot;, SYSCFG1_REG,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;pcie-&=
gt;syscfg1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;pdev-&gt=
;dev, &quot;can&#39;t get syscfg1 offset (%d)\n&quot;, ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* retrieve data opts from compatible */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pcie-&gt;data =3D of_match_node(st_pcie_of_match,=
 np)-&gt;data;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!pcie-&gt;data) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;pdev-&gt=
;dev, &quot;compatible data not provided\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* powerdown / resets */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pcie-&gt;pwr =3D devm_reset_control_get(&amp;pdev=
-&gt;dev, &quot;powerdown&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(pcie-&gt;pwr)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;pdev-&gt=
;dev, &quot;powerdown reset control not defined\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
<br>
</div></div>Please return PTR_ERR(pcie-&gt;pwr) instead of &#39;-EINVAL&#39=
;.<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=
=3D"font-family:&#39;courier new&#39;,monospace;display:inline">=E2=80=8Bok=
</div></div><div><div class=3D"gmail_default" style=3D"font-family:&#39;cou=
rier new&#39;,monospace;display:inline">=E2=80=8B</div>=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">
<span><br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pcie-&gt;rst =3D devm_reset_control_get(&amp;pdev=
-&gt;dev, &quot;softreset&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(pcie-&gt;rst)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;pdev-&gt=
;dev, &quot;Soft reset control not defined\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
<br>
</span>Please return PTR_ERR(pcie-&gt;pwr) instead of &#39;-EINVAL&#39;.<br=
></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"fon=
t-family:&#39;courier new&#39;,monospace;display:inline">=E2=80=8Bok</div><=
/div><div><div class=3D"gmail_default" style=3D"font-family:&#39;courier ne=
w&#39;,monospace;display:inline">=E2=80=8B</div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">
<div><div><br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* phy */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!pcie-&gt;data-&gt;phy_auto) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pcie-&gt;phy =3D devm=
_phy_get(&amp;pdev-&gt;dev, &quot;pcie_phy&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(pcie-&gt;p=
hy)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dev_err(&amp;pdev-&gt;dev, &quot;no PHY configured\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return PTR_ERR(pcie-&gt;phy);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Claim the GPIO for PRST# if available */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pcie-&gt;reset_gpio =3D of_get_named_gpio(np, &qu=
ot;reset-gpio&quot;, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!gpio_is_valid(pcie-&gt;reset_gpio))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(&amp;pdev-&gt=
;dev, &quot;No reset-gpio configured\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D devm_gpio_req=
uest(&amp;pdev-&gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pcie-&gt;res=
et_gpio,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;PCIe r=
eset&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dev_err(&amp;pdev-&gt;dev, &quot;Cannot request reset-gpio %d\n&quot=
;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pcie-&gt;reset_gpio);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ENABLED(CONFIG_PCI_MSI)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pp-&gt;msi_irq =3D pl=
atform_get_irq_byname(pdev, &quot;msi&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (pp-&gt;msi_irq &l=
t;=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dev_err(&amp;pdev-&gt;dev, &quot;failed to get MSI irq\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return -ENODEV;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D devm_request_=
irq(&amp;pdev-&gt;dev, pp-&gt;msi_irq,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 st_pcie_msi_irq_ha=
ndler,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 IRQF_SHARED, &quot=
;st-pcie-msi&quot;, pp);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dev_err(&amp;pdev-&gt;dev, &quot;failed to request MSI irq\n&quot;);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return -ENODEV;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ENABLED(CONFIG_ARM)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * We have to hook th=
e abort handler so that we can intercept<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * bus errors when do=
ing config read/write that return UR,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * which is flagged u=
p as a bus error<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hook_fault_code(16+6,=
 st_pcie_abort_handler, SIGBUS, 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;imprecise external abort&quot;);<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pp-&gt;root_bus_nr =3D -1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pp-&gt;ops =3D &amp;st_pcie_host_ops;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D dw_pcie_host_init(pp);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;pdev-&gt=
;dev, &quot;failed to initialize host\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0platform_set_drvdata(pdev, pcie);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev_info(&amp;pdev-&gt;dev, &quot;Initialized\n&q=
uot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +MODULE_DEVICE_TABLE(of, st_pcie_of_match);<br>
&gt; +<br>
&gt; +static struct platform_driver st_pcie_driver =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.driver =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;st-pc=
ie&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.of_match_table =3D s=
t_pcie_of_match,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.pm =3D &amp;st_pcie_=
pm_ops,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +};<br>
&gt; +<br>
&gt; +/* ST PCIe driver does not allow module unload */<br>
&gt; +static int __init pcie_init(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return platform_driver_probe(&amp;st_pcie_driver,=
 st_pcie_probe);<br>
&gt; +}<br>
&gt; +device_initcall(pcie_init);<br>
&gt; +<br>
&gt; +MODULE_AUTHOR(&quot;Fabrice Gasnier &lt;<a href=3D"mailto:fabrice.gas=
nier@st.com" target=3D"_blank">fabrice.gasnier@st.com</a>&gt;&quot;);<br>
&gt; +MODULE_DESCRIPTION(&quot;PCI express Driver for ST SoCs&quot;);<br>
&gt; +MODULE_LICENSE(&quot;GPLv2&quot;);<br>
<br>
</div></div>Please add one space between &#39;GPL&#39; and &#39;v2&#39;.<br=
>
<br>
s/&quot;GPLv2&quot;/&quot;GPL v2&quot;<br>
<br>
According to the license_is_gpl_compatible(), the MODULE_LICENSE() string<b=
r>
for GPL v2 is &quot;GPL v2&quot; not &quot;GPLv2&quot;.<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-family:&#39;courier new&#39;,monospace">=E2=80=8BOk</div><div class=3D=
"gmail_default" style=3D"font-family:&#39;courier new&#39;,monospace"><br><=
/div></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Best regards,<br>
Jingoo Han<br>
<span><font color=3D"#888888"><br>
&gt; --<br>
&gt; 1.9.1<br></font></span></blockquote><div><br></div><div><div class=3D"=
gmail_default" style=3D"font-family:&#39;courier new&#39;,monospace;display=
:inline">=E2=80=8BBR</div></div><div><div class=3D"gmail_default" style=3D"=
font-family:&#39;courier new&#39;,monospace;display:inline"><br></div></div=
><div><div class=3D"gmail_default" style=3D"font-family:&#39;courier new&#3=
9;,monospace;display:inline">Gabriel=E2=80=8B</div>=C2=A0</div></div><br></=
div></div>

--001a11330e3a098c4d050d009a7d--
