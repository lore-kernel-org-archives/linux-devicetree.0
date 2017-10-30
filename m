From: Raveendra Padasalagi <raveendra.padasalagi@broadcom.com>
Subject: Re: [PATCH 2/3] drivers: phy: broadcom: Add driver for Cygnus USB phy controller
Date: Mon, 30 Oct 2017 10:32:19 +0530
Message-ID: <CAAFb_vqiA6fdqKjxLFVg705TFiO6rspbS8E3-Opqzw=09TMB_A@mail.gmail.com>
References: <1508819822-29956-1-git-send-email-raveendra.padasalagi@broadcom.com>
 <1508819822-29956-3-git-send-email-raveendra.padasalagi@broadcom.com>
 <CGME20171027083627epcas4p30080cde5f056ea7f3bbda6718a49651a@epcas4p3.samsung.com>
 <bc03bbcf-c487-9da6-a138-136a36537626@ti.com> <59F66BF9.7040806@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <59F66BF9.7040806@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, Srinath Mannam <srinath.mannam@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Raviteja Garimella <raviteja.garimella@broadcom.com>, Rafal Milecki <rafal@milecki.pl>, Arnd Bergmann <arnd@arndb.de>, Viresh Kumar <viresh.kumar@linaro.org>, Jaehoon Chung <jh80.chung@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>
List-Id: devicetree@vger.kernel.org

Hi Chanwoo,

On Mon, Oct 30, 2017 at 5:32 AM, Chanwoo Choi <cw00.choi@samsung.com> wrote=
:
> Hi,
>
> On 2017=EB=85=84 10=EC=9B=94 27=EC=9D=BC 17:35, Kishon Vijay Abraham I wr=
ote:
>> +Chanwoo, for reviewing extcon
>>
>> Hi.
>>
>> On Tuesday 24 October 2017 10:07 AM, Raveendra Padasalagi wrote:
>>> Add driver for Broadcom's USB phy controller's used in Cygnus
>>> familyof SoC. Cygnus has three USB phy controller's, port 0,
>>> port 1 provides USB host functionality and port 2 can be configured
>>> for host/device role.
>>>
>>> Configuration of host/device role for port 2 is achieved based on
>>> the extcon events, the driver registers to extcon framework to get
>>> appropriate connect events for Host/Device cables connect/disconnect
>>> states based on VBUS and ID interrupts.
>>>
>>> Signed-off-by: Raveendra Padasalagi <raveendra.padasalagi@broadcom.com>
>>> ---
>>>  drivers/phy/broadcom/Kconfig              |  14 +
>>>  drivers/phy/broadcom/Makefile             |   1 +
>>>  drivers/phy/broadcom/phy-bcm-cygnus-usb.c | 672 ++++++++++++++++++++++=
++++++++
>>>  3 files changed, 687 insertions(+)
>>>  create mode 100644 drivers/phy/broadcom/phy-bcm-cygnus-usb.c
>>>
>>> diff --git a/drivers/phy/broadcom/Kconfig b/drivers/phy/broadcom/Kconfi=
g
>>> index 64fc59c..3179daf 100644
>>> --- a/drivers/phy/broadcom/Kconfig
>>> +++ b/drivers/phy/broadcom/Kconfig
>>> @@ -1,6 +1,20 @@
>>>  #
>>>  # Phy drivers for Broadcom platforms
>>>  #
>>> +config PHY_BCM_CYGNUS_USB
>>> +    tristate "Broadcom Cygnus USB PHY support"
>>> +    depends on OF
>>> +    depends on ARCH_BCM_CYGNUS || COMPILE_TEST
>>> +    select GENERIC_PHY
>>> +    select EXTCON_USB_GPIO
>
> IMO, it is not good to add the dependency to the specific device driver.
> Instead, you better to depend on the EXTCON framework (select EXTCON)
> such as 'select GENERIC_PHY'.

GENERIC_PHY dependency is anyway needed and it's added as dependency.
Let me add "depends on EXTCON" instead of "select EXTCON"

>>
>> Didn't this throw up a warning for selecting config without caring for t=
he
>> dependency?
>>
>>> +    default ARCH_BCM_CYGNUS
>>> +    help
>>> +      Enable this to support three USB PHY's present in Broadcom's
>>> +      Cygnus chip.
>>> +
>>> +      The phys are capable of supporting host mode on all ports and
>>> +      device mode for port 2.
>>> +
>>>  config PHY_CYGNUS_PCIE
>>>      tristate "Broadcom Cygnus PCIe PHY driver"
>>>      depends on OF && (ARCH_BCM_CYGNUS || COMPILE_TEST)
>>> diff --git a/drivers/phy/broadcom/Makefile b/drivers/phy/broadcom/Makef=
ile
>>> index 4eb82ec..3dec23c 100644
>>> --- a/drivers/phy/broadcom/Makefile
>>> +++ b/drivers/phy/broadcom/Makefile
>>> @@ -1,4 +1,5 @@
>>>  obj-$(CONFIG_PHY_CYGNUS_PCIE)               +=3D phy-bcm-cygnus-pcie.o
>>> +obj-$(CONFIG_PHY_BCM_CYGNUS_USB)    +=3D phy-bcm-cygnus-usb.o
>>>  obj-$(CONFIG_BCM_KONA_USB2_PHY)             +=3D phy-bcm-kona-usb2.o
>>>  obj-$(CONFIG_PHY_BCM_NS_USB2)               +=3D phy-bcm-ns-usb2.o
>>>  obj-$(CONFIG_PHY_BCM_NS_USB3)               +=3D phy-bcm-ns-usb3.o
>>> diff --git a/drivers/phy/broadcom/phy-bcm-cygnus-usb.c b/drivers/phy/br=
oadcom/phy-bcm-cygnus-usb.c
>>> new file mode 100644
>>> index 0000000..ef2a94c
>>> --- /dev/null
>>> +++ b/drivers/phy/broadcom/phy-bcm-cygnus-usb.c
>>> @@ -0,0 +1,672 @@
>>> +/*
>>> + * Copyright 2017 Broadcom
>>> + *
>>> + * This program is free software; you can redistribute it and/or modif=
y
>>> + * it under the terms of the GNU General Public License, version 2, as
>>> + * published by the Free Software Foundation (the "GPL").
>>> + *
>>> + * This program is distributed in the hope that it will be useful, but
>>> + * WITHOUT ANY WARRANTY; without even the implied warranty of
>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
>>> + * General Public License version 2 (GPLv2) for more details.
>>> + *
>>> + * You should have received a copy of the GNU General Public License
>>> + * version 2 (GPLv2) along with this source code.
>>> + */
>>> +
>>> +#include <linux/module.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/io.h>
>>> +#include <linux/of.h>
>>> +#include <linux/of_address.h>
>>> +#include <linux/phy/phy.h>
>>> +#include <linux/delay.h>
>>> +#include <linux/regulator/consumer.h>
>>> +#include <linux/extcon.h>
>>> +#include <linux/gpio.h>
>>> +#include <linux/gpio/consumer.h>
>>> +#include <linux/interrupt.h>
>>> +
>>> +#define CDRU_USBPHY_CLK_RST_SEL_OFFSET                      0x0
>>> +#define CDRU_USBPHY2_HOST_DEV_SEL_OFFSET            0x4
>>> +#define CDRU_USB_DEV_SUSPEND_RESUME_CTRL_OFFSET             0x5C
>>> +#define CDRU_USBPHY_P0_STATUS_OFFSET                        0x1C
>>> +#define CDRU_USBPHY_P1_STATUS_OFFSET                        0x34
>>> +#define CDRU_USBPHY_P2_STATUS_OFFSET                        0x4C
>>
>> Looks like it has 2 different blocks; CDRU and CMRU. Having a comment fo=
r each
>> of the block will help.
>>> +#define CRMU_USB_PHY_AON_CTRL_OFFSET                        0x0
>>> +
>>> +#define CDRU_USBPHY_USBPHY_ILDO_ON_FLAG                     BIT(1)
>>> +#define CDRU_USBPHY_USBPHY_PLL_LOCK                 BIT(0)
>>> +#define CDRU_USB_DEV_SUSPEND_RESUME_CTRL_DISABLE    BIT(0)
>>> +
>>> +#define PHY2_DEV_HOST_CTRL_SEL_DEVICE                       0
>>> +#define PHY2_DEV_HOST_CTRL_SEL_HOST                 1
>>> +#define PHY2_DEV_HOST_CTRL_SEL_IDLE                 2
>>> +#define CRMU_USBPHY_P0_AFE_CORERDY_VDDC                     BIT(1)
>>> +#define CRMU_USBPHY_P0_RESETB                               BIT(2)
>>> +#define CRMU_USBPHY_P1_AFE_CORERDY_VDDC                     BIT(9)
>>> +#define CRMU_USBPHY_P1_RESETB                               BIT(10)
>>> +#define CRMU_USBPHY_P2_AFE_CORERDY_VDDC                     BIT(17)
>>> +#define CRMU_USBPHY_P2_RESETB                               BIT(18)
>>> +
>>> +#define USB2_IDM_IDM_IO_CONTROL_DIRECT_OFFSET               0x0408
>>> +#define USB2_IDM_IDM_IO_CONTROL_DIRECT_CLK_ENABLE   BIT(0)
>>> +#define SUSPEND_OVERRIDE_0                          13
>>> +#define SUSPEND_OVERRIDE_1                          14
>>> +#define SUSPEND_OVERRIDE_2                          15
>>> +#define USB2_IDM_IDM_RESET_CONTROL_OFFSET           0x0800
>>> +#define USB2_IDM_IDM_RESET_CONTROL__RESET           0
>>> +#define USB2D_IDM_IDM_IO_SS_CLEAR_NAK_NEMPTY_EN_I   BIT(24)
>>> +
>>> +#define PLL_LOCK_RETRY_COUNT                                1000
>>> +#define MAX_REGULATOR_NAME_LEN                              25
>>> +#define DUAL_ROLE_PHY                                       2
>>> +
>>> +#define USBPHY_WQ_DELAY_MS          msecs_to_jiffies(500)
>>> +#define USB2_SEL_DEVICE                     0
>>> +#define USB2_SEL_HOST                       1
>>> +#define USB2_SEL_IDLE                       2
>>> +#define USB_CONNECTED                       1
>>> +#define USB_DISCONNECTED            0
>>> +#define MAX_NUM_PHYS                        3
>>> +
>>> +static const int status_reg[] =3D {CDRU_USBPHY_P0_STATUS_OFFSET,
>>> +                            CDRU_USBPHY_P1_STATUS_OFFSET,
>>> +                            CDRU_USBPHY_P2_STATUS_OFFSET};
>>> +
>>> +struct cygnus_phy_instance;
>>> +
>>> +struct cygnus_phy_driver {
>>> +    void __iomem *cdru_usbphy_regs;
>>> +    void __iomem *crmu_usbphy_aon_ctrl_regs;
>>> +    void __iomem *usb2h_idm_regs;
>>> +    void __iomem *usb2d_idm_regs;
>>> +    int num_phys;
>>> +    bool idm_host_enabled;
>>> +    struct cygnus_phy_instance *instances;
>>> +    int phyto_src_clk;
>>> +    struct platform_device *pdev;
>>> +};
>>> +
>>> +struct cygnus_phy_instance {
>>> +    struct cygnus_phy_driver *driver;
>>> +    struct phy *generic_phy;
>>> +    int port;
>>> +    int new_state;          /* 1 - Host, 0 - device, 2 - idle*/
>>> +    bool power;             /* 1 - powered_on 0 - powered off */
>>> +    struct regulator *vbus_supply;
>>> +    spinlock_t lock;
>>> +    struct extcon_dev *edev;
>>> +    struct notifier_block   device_nb;
>>> +    struct notifier_block   host_nb;
>>> +};
>>> +
>>> +static const unsigned int usb_extcon_cable[] =3D {
>>> +    EXTCON_USB,
>>> +    EXTCON_USB_HOST,
>>> +    EXTCON_NONE,
>>> +};
>
> The usb_extcon_cable[] is not used in this driver.
> Please remove it. This array is required on the extcon
> provider driver. But, in this case, it is consumer driver.

Ok, Thanks. I will fix it in the next version of the patch.
>>> +
>>> +static inline int phy_pll_lock_stat(u32 usb_reg, int bit_mask,
>>> +                                struct cygnus_phy_driver *phy_driver)
>>> +{
>>> +    /* Wait for the PLL lock status */
>>> +    int retry =3D PLL_LOCK_RETRY_COUNT;
>>> +    u32 reg_val;
>>> +
>>> +    do {
>>> +            udelay(1);
>>> +            reg_val =3D readl(phy_driver->cdru_usbphy_regs +
>>> +                            usb_reg);
>>> +            if (reg_val & bit_mask)
>>> +                    return 0;
>>> +    } while (--retry > 0);
>>> +
>>> +    return -EBUSY;
>>> +}
>>> +
>>> +static struct phy *cygnus_phy_xlate(struct device *dev,
>>> +                                struct of_phandle_args *args)
>>> +{
>>> +    struct cygnus_phy_driver *phy_driver =3D dev_get_drvdata(dev);
>>> +    struct cygnus_phy_instance *instance_ptr;
>>> +
>>> +    if (!phy_driver)
>>> +            return ERR_PTR(-EINVAL);
>>> +
>>> +    if (WARN_ON(args->args[0] >=3D phy_driver->num_phys))
>>> +            return ERR_PTR(-ENODEV);
>>> +
>>> +    if (WARN_ON(args->args_count < 1))
>>> +            return ERR_PTR(-EINVAL);
>>> +
>>> +    instance_ptr =3D &phy_driver->instances[args->args[0]];
>>
>> if the PHY consumer driver points the PHY sub-node, then of_xlate provid=
ed in
>> phy core could be used instead of the custom xlate.
>>> +    if (instance_ptr->port > phy_driver->phyto_src_clk)
>>> +            phy_driver->phyto_src_clk =3D instance_ptr->port;
>>> +
>>> +    if (instance_ptr->port =3D=3D DUAL_ROLE_PHY)
>>> +            goto ret_p2;
>>> +    phy_driver->instances[instance_ptr->port].new_state =3D
>>> +                                            PHY2_DEV_HOST_CTRL_SEL_HOS=
T;
>>> +
>>> +ret_p2:
>>> +    return phy_driver->instances[instance_ptr->port].generic_phy;
>>> +}
>>> +
>>> +static void cygnus_usbp2_dev_clock_init(struct phy *generic_phy, bool =
enable)
>>> +{
>>> +    u32 reg_val;
>>> +    struct cygnus_phy_instance *instance_ptr =3D phy_get_drvdata(gener=
ic_phy);
>>> +    struct cygnus_phy_driver *phy_driver =3D instance_ptr->driver;
>>> +
>>> +    reg_val =3D readl(phy_driver->usb2d_idm_regs +
>>> +                    USB2_IDM_IDM_IO_CONTROL_DIRECT_OFFSET);
>>> +
>>> +    if (enable)
>>> +            reg_val |=3D USB2_IDM_IDM_IO_CONTROL_DIRECT_CLK_ENABLE;
>>> +    else
>>> +            reg_val &=3D ~USB2_IDM_IDM_IO_CONTROL_DIRECT_CLK_ENABLE;
>>> +
>>> +    writel(reg_val, phy_driver->usb2d_idm_regs +
>>> +            USB2_IDM_IDM_IO_CONTROL_DIRECT_OFFSET);
>>> +
>>> +    reg_val =3D readl(phy_driver->usb2d_idm_regs +
>>> +                    USB2_IDM_IDM_RESET_CONTROL_OFFSET);
>>> +
>>> +    if (enable)
>>> +            reg_val &=3D ~BIT(USB2_IDM_IDM_RESET_CONTROL__RESET);
>>> +    else
>>> +            reg_val |=3D BIT(USB2_IDM_IDM_RESET_CONTROL__RESET);
>>> +
>>> +    writel(reg_val, phy_driver->usb2d_idm_regs +
>>> +            USB2_IDM_IDM_RESET_CONTROL_OFFSET);
>>> +}
>>> +
>>> +static void cygnus_phy_clk_reset_src_switch(struct phy *generic_phy,
>>> +                                        u32 src_phy)
>>> +{
>>> +    u32 reg_val;
>>> +    struct cygnus_phy_instance *instance_ptr =3D phy_get_drvdata(gener=
ic_phy);
>>> +    struct cygnus_phy_driver *phy_driver =3D instance_ptr->driver;
>>> +
>>> +    writel(src_phy, phy_driver->cdru_usbphy_regs +
>>> +            CDRU_USBPHY_CLK_RST_SEL_OFFSET);
>>> +
>>> +    /* Force the clock/reset source phy to not suspend */
>>> +    reg_val =3D readl(phy_driver->usb2h_idm_regs +
>>> +                    USB2_IDM_IDM_IO_CONTROL_DIRECT_OFFSET);
>>> +    reg_val &=3D ~(BIT(SUSPEND_OVERRIDE_0) |
>>> +                    BIT(SUSPEND_OVERRIDE_1) |
>>> +                    BIT(SUSPEND_OVERRIDE_2));
>>> +    reg_val |=3D BIT(SUSPEND_OVERRIDE_0 + src_phy);
>>> +
>>> +    writel(reg_val, phy_driver->usb2h_idm_regs +
>>> +            USB2_IDM_IDM_IO_CONTROL_DIRECT_OFFSET);
>>> +}
>>> +
>>> +static void cygnus_phy_dual_role_init(struct cygnus_phy_instance *inst=
ance_ptr)
>>> +{
>>> +    u32 reg_val;
>>> +    struct cygnus_phy_driver *phy_driver =3D instance_ptr->driver;
>>> +
>>> +    if (instance_ptr->new_state =3D=3D PHY2_DEV_HOST_CTRL_SEL_HOST) {
>>> +            writel(PHY2_DEV_HOST_CTRL_SEL_HOST,
>>> +                    phy_driver->cdru_usbphy_regs +
>>> +                    CDRU_USBPHY2_HOST_DEV_SEL_OFFSET);
>>
>> If you add a return here, the below block can be placed outside the else=
 block.
>>> +    } else {
>>> +            /*
>>> +             * Disable suspend/resume signals to device controller
>>> +             * when a port is in device mode
>>> +             */
>>> +            writel(PHY2_DEV_HOST_CTRL_SEL_DEVICE,
>>> +                    phy_driver->cdru_usbphy_regs +
>>> +                    CDRU_USBPHY2_HOST_DEV_SEL_OFFSET);
>>> +            reg_val =3D readl(phy_driver->cdru_usbphy_regs +
>>> +                            CDRU_USB_DEV_SUSPEND_RESUME_CTRL_OFFSET);
>>> +            reg_val |=3D CDRU_USB_DEV_SUSPEND_RESUME_CTRL_DISABLE;
>>> +            writel(reg_val, phy_driver->cdru_usbphy_regs +
>>> +                            CDRU_USB_DEV_SUSPEND_RESUME_CTRL_OFFSET);
>>> +    }
>>> +}
>>> +
>>> +static int cygnus_phy_init(struct phy *generic_phy)
>>> +{
>>> +    struct cygnus_phy_instance *instance_ptr =3D phy_get_drvdata(gener=
ic_phy);
>>> +
>>> +    if (instance_ptr->port =3D=3D DUAL_ROLE_PHY)
>>> +            cygnus_phy_dual_role_init(instance_ptr);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int cygnus_phy_shutdown(struct phy *generic_phy)
>>> +{
>>> +    u32 reg_val;
>>> +    int i, ret;
>>> +    unsigned long flags;
>>> +    bool power_off_flag =3D true;
>>> +    struct cygnus_phy_instance *instance_ptr =3D phy_get_drvdata(gener=
ic_phy);
>>> +    struct cygnus_phy_driver *phy_driver =3D instance_ptr->driver;
>>> +
>>> +    if (instance_ptr->vbus_supply) {
>>
>> phy core supports phy-supply generic property which can be handled by ph=
y-core.
>>> +            ret =3D regulator_disable(instance_ptr->vbus_supply);
>>> +            if (ret) {
>>> +                    dev_err(&generic_phy->dev,
>>> +                                    "Failed to disable regulator\n");
>>> +                    return ret;
>>> +            }
>>> +    }
>>> +
>>> +    spin_lock_irqsave(&instance_ptr->lock, flags);
>>> +
>>> +    /* power down the phy */
>>> +    reg_val =3D readl(phy_driver->crmu_usbphy_aon_ctrl_regs +
>>> +                    CRMU_USB_PHY_AON_CTRL_OFFSET);
>>> +    if (instance_ptr->port =3D=3D 0) {
>>> +            reg_val &=3D ~CRMU_USBPHY_P0_AFE_CORERDY_VDDC;
>>> +            reg_val &=3D ~CRMU_USBPHY_P0_RESETB;
>>> +    } else if (instance_ptr->port =3D=3D 1) {
>>> +            reg_val &=3D ~CRMU_USBPHY_P1_AFE_CORERDY_VDDC;
>>> +            reg_val &=3D ~CRMU_USBPHY_P1_RESETB;
>>> +    } else if (instance_ptr->port =3D=3D 2) {
>>> +            reg_val &=3D ~CRMU_USBPHY_P2_AFE_CORERDY_VDDC;
>>> +            reg_val &=3D ~CRMU_USBPHY_P2_RESETB;
>>> +    }
>>> +    writel(reg_val, phy_driver->crmu_usbphy_aon_ctrl_regs +
>>> +            CRMU_USB_PHY_AON_CTRL_OFFSET);
>>> +
>>> +    instance_ptr->power =3D false;
>>> +
>>> +    /* Determine whether all the phy's are powered off */
>>> +    for (i =3D 0; i < phy_driver->num_phys; i++) {
>>> +            if (phy_driver->instances[i].power =3D=3D true) {
>>> +                    power_off_flag =3D false;
>>> +                    break;
>>> +            }
>>> +    }
>>> +
>>> +    /* Disable clock to USB device and keep the USB device in reset */
>>> +    if (instance_ptr->port =3D=3D DUAL_ROLE_PHY)
>>> +            cygnus_usbp2_dev_clock_init(instance_ptr->generic_phy,
>>> +                                        false);
>>> +
>>> +    /*
>>> +     * Put the host controller into reset state and
>>> +     * disable clock if all the phy's are powered off
>>> +     */
>>> +    if (power_off_flag) {
>>> +            reg_val =3D readl(phy_driver->usb2h_idm_regs +
>>> +                    USB2_IDM_IDM_IO_CONTROL_DIRECT_OFFSET);
>>> +            reg_val &=3D ~USB2_IDM_IDM_IO_CONTROL_DIRECT_CLK_ENABLE;
>>> +            writel(reg_val, phy_driver->usb2h_idm_regs +
>>> +                            USB2_IDM_IDM_IO_CONTROL_DIRECT_OFFSET);
>>> +
>>> +            reg_val =3D readl(phy_driver->usb2h_idm_regs +
>>> +                             USB2_IDM_IDM_RESET_CONTROL_OFFSET);
>>> +            reg_val |=3D BIT(USB2_IDM_IDM_RESET_CONTROL__RESET);
>>> +            writel(reg_val, phy_driver->usb2h_idm_regs +
>>> +                            USB2_IDM_IDM_RESET_CONTROL_OFFSET);
>>> +            phy_driver->idm_host_enabled =3D false;
>>> +    }
>>> +    spin_unlock_irqrestore(&instance_ptr->lock, flags);
>>> +    return 0;
>>> +}
>>> +
>>> +static int cygnus_phy_poweron(struct phy *generic_phy)
>>> +{
>>> +    int ret;
>>> +    unsigned long flags;
>>> +    u32 reg_val;
>>> +    struct cygnus_phy_instance *instance_ptr =3D phy_get_drvdata(gener=
ic_phy);
>>> +    struct cygnus_phy_driver *phy_driver =3D instance_ptr->driver;
>>> +    u32 extcon_event =3D instance_ptr->new_state;
>>> +
>>> +    /*
>>> +     * Switch on the regulator only if in HOST mode
>>> +     */
>>> +    if (instance_ptr->vbus_supply) {
>>> +            ret =3D regulator_enable(instance_ptr->vbus_supply);
>>> +            if (ret) {
>>> +                    dev_err(&generic_phy->dev,
>>> +                            "Failed to enable regulator\n");
>>> +                    goto err_shutdown;
>>> +            }
>>> +    }
>>> +
>>> +    spin_lock_irqsave(&instance_ptr->lock, flags);
>>> +    /* Bring the AFE block out of reset to start powering up the PHY *=
/
>>> +    reg_val =3D readl(phy_driver->crmu_usbphy_aon_ctrl_regs +
>>> +                    CRMU_USB_PHY_AON_CTRL_OFFSET);
>>> +    if (instance_ptr->port =3D=3D 0)
>>> +            reg_val |=3D CRMU_USBPHY_P0_AFE_CORERDY_VDDC;
>>> +    else if (instance_ptr->port =3D=3D 1)
>>> +            reg_val |=3D CRMU_USBPHY_P1_AFE_CORERDY_VDDC;
>>> +    else if (instance_ptr->port =3D=3D 2)
>>> +            reg_val |=3D CRMU_USBPHY_P2_AFE_CORERDY_VDDC;
>>> +    writel(reg_val, phy_driver->crmu_usbphy_aon_ctrl_regs +
>>> +            CRMU_USB_PHY_AON_CTRL_OFFSET);
>>> +
>>> +    /* Check for power on and PLL lock */
>>> +    ret =3D phy_pll_lock_stat(status_reg[instance_ptr->port],
>>> +                            CDRU_USBPHY_USBPHY_ILDO_ON_FLAG, phy_drive=
r);
>>> +    if (ret < 0) {
>>> +            dev_err(&generic_phy->dev,
>>> +                    "Timed out waiting for USBPHY_ILDO_ON_FLAG on port=
 %d",
>>> +                    instance_ptr->port);
>>> +            spin_unlock_irqrestore(&instance_ptr->lock, flags);
>>> +            goto err_shutdown;
>>> +    }
>>> +    ret =3D phy_pll_lock_stat(status_reg[instance_ptr->port],
>>> +                            CDRU_USBPHY_USBPHY_PLL_LOCK, phy_driver);
>>> +    if (ret < 0) {
>>> +            dev_err(&generic_phy->dev,
>>> +                    "Timed out waiting for USBPHY_PLL_LOCK on port %d"=
,
>>> +                    instance_ptr->port);
>>> +            spin_unlock_irqrestore(&instance_ptr->lock, flags);
>>> +            goto err_shutdown;
>>> +    }
>>> +
>>> +    instance_ptr->power =3D true;
>>> +
>>> +    /* Enable clock to USB device and take the USB device out of reset=
 */
>>> +    if (instance_ptr->port =3D=3D DUAL_ROLE_PHY)
>>> +            cygnus_usbp2_dev_clock_init(instance_ptr->generic_phy, tru=
e);
>>> +
>>> +    /* Set clock source provider to be the last powered on phy */
>>> +    if (instance_ptr->port =3D=3D phy_driver->phyto_src_clk)
>>> +            cygnus_phy_clk_reset_src_switch(generic_phy,
>>> +                            instance_ptr->port);
>>> +
>>> +    if (phy_driver->idm_host_enabled !=3D true &&
>>> +            extcon_event =3D=3D PHY2_DEV_HOST_CTRL_SEL_HOST) {
>>> +            /* Enable clock to USB host and take the host out of reset=
 */
>>> +            reg_val =3D readl(phy_driver->usb2h_idm_regs +
>>> +                            USB2_IDM_IDM_IO_CONTROL_DIRECT_OFFSET);
>>> +            reg_val |=3D USB2_IDM_IDM_IO_CONTROL_DIRECT_CLK_ENABLE;
>>> +            writel(reg_val, phy_driver->usb2h_idm_regs +
>>> +                            USB2_IDM_IDM_IO_CONTROL_DIRECT_OFFSET);
>>> +
>>> +            reg_val =3D readl(phy_driver->usb2h_idm_regs +
>>> +                            USB2_IDM_IDM_RESET_CONTROL_OFFSET);
>>> +            reg_val &=3D ~BIT(USB2_IDM_IDM_RESET_CONTROL__RESET);
>>> +            writel(reg_val, phy_driver->usb2h_idm_regs +
>>> +                             USB2_IDM_IDM_RESET_CONTROL_OFFSET);
>>> +            phy_driver->idm_host_enabled =3D true;
>>> +    }
>>> +    spin_unlock_irqrestore(&instance_ptr->lock, flags);
>>> +
>>> +    return 0;
>>> +err_shutdown:
>>> +    cygnus_phy_shutdown(generic_phy);
>>> +    return ret;
>>> +}
>>> +
>>> +static int usbd_connect_notify(struct notifier_block *self,
>>> +                           unsigned long event, void *ptr)
>>> +{
>>> +    struct cygnus_phy_instance *instance_ptr =3D container_of(self,
>>> +                                    struct cygnus_phy_instance, device=
_nb);
>>> +
>>> +    if (event) {
>>> +            instance_ptr->new_state =3D PHY2_DEV_HOST_CTRL_SEL_DEVICE;
>>> +            cygnus_phy_dual_role_init(instance_ptr);
>>> +    }
>>> +
>>> +    return NOTIFY_OK;
>>> +}
>>> +
>>> +static int usbh_connect_notify(struct notifier_block *self,
>>> +                           unsigned long event, void *ptr)
>>> +{
>>> +    struct cygnus_phy_instance *instance_ptr =3D container_of(self,
>>> +                                    struct cygnus_phy_instance, host_n=
b);
>>> +    if (event) {
>>> +            instance_ptr->new_state =3D PHY2_DEV_HOST_CTRL_SEL_HOST;
>>> +            cygnus_phy_dual_role_init(instance_ptr);
>>> +    }
>>> +
>>> +    return NOTIFY_OK;
>>> +}
>>> +
>>> +static int cygnus_register_extcon_notifiers(
>>> +                            struct cygnus_phy_instance *instance_ptr)
>>> +{
>>> +    int ret =3D 0;
>>> +    struct device *dev =3D &instance_ptr->generic_phy->dev;
>>> +
>>> +    if (of_property_read_bool(dev->of_node, "extcon")) {
>>> +            instance_ptr->edev =3D extcon_get_edev_by_phandle(dev, 0);
>>> +            if (IS_ERR(instance_ptr->edev)) {
>>> +                    if (PTR_ERR(instance_ptr->edev) =3D=3D -EPROBE_DEF=
ER)
>>> +                            return -EPROBE_DEFER;
>>> +                    ret =3D PTR_ERR(instance_ptr->edev);
>>> +                    goto err;
>>> +            }
>>> +
>>> +            instance_ptr->device_nb.notifier_call =3D usbd_connect_not=
ify;
>>> +            ret =3D extcon_register_notifier(instance_ptr->edev, EXTCO=
N_USB,
>>> +                                            &instance_ptr->device_nb);
>
> You better to use devm_extcon_register_notifier
> because you didn't handle the unregister operation in this patch.

Ok, I will fix it in the next version of the patch.

>>> +            if (ret < 0) {
>>> +                    dev_err(dev, "Can't register extcon device\n");
>
> IMO, "can't register extcon notfiier' is more correct
> instead of 'extcon device' expression.

Ok, I will fix it in the next version of the patch.

>>> +                    goto err;
>>> +            }
>>> +
>>> +            if (extcon_get_state(instance_ptr->edev, EXTCON_USB) =3D=
=3D true) {
>>> +                    instance_ptr->new_state =3D PHY2_DEV_HOST_CTRL_SEL=
_DEVICE;
>>> +                    cygnus_phy_dual_role_init(instance_ptr);
>>> +            }
>>> +
>>> +            instance_ptr->host_nb.notifier_call =3D usbh_connect_notif=
y;
>>> +            ret =3D extcon_register_notifier(instance_ptr->edev,
>
> ditto. (devm_extcon_register_notifier)

Ok, I will fix it in the next version of the patch.

>>> +                                            EXTCON_USB_HOST,
>>> +                                            &instance_ptr->host_nb);
>>> +            if (ret < 0) {
>>> +                    dev_err(dev, "Can't register extcon device\n");
>
> ditto.

Ok, I will fix it in the next version of the patch.

>>> +                    goto err;
>>> +            }
>>> +
>>> +            if (extcon_get_state(instance_ptr->edev, EXTCON_USB_HOST)
>>> +                                    =3D=3D true) {
>>> +                    instance_ptr->new_state =3D PHY2_DEV_HOST_CTRL_SEL=
_HOST;
>>> +                    cygnus_phy_dual_role_init(instance_ptr);
>>> +            }
>>> +    } else {
>>> +            dev_err(dev, "Extcon device handle not found\n");
>>> +            return -EINVAL;
>
> I'm not sure about this error. Because it depend on how to
> develope the device driver. Each device driver can decide whether
> the extcon is necessary or optional.

In our case extcon is necessary because all of our SoC's will have
dual role phy.
So decided to return -EINVAL.

>>> +    }
>>> +
>>> +    return 0;
>>> +err:
>>> +    return ret;
>>> +}
>>> +
>>> +static const struct phy_ops ops =3D {
>>> +    .init           =3D cygnus_phy_init,
>>> +    .power_on       =3D cygnus_phy_poweron,
>>> +    .power_off      =3D cygnus_phy_shutdown,
>>
>>  missing .owner
>>> +};
>>> +
>>> +static int cygnus_phy_instance_create(struct cygnus_phy_driver *phy_dr=
iver)
>>> +{
>>> +    struct device_node *child;
>>> +    char *vbus_name;
>>> +    struct platform_device *pdev =3D phy_driver->pdev;
>>> +    struct device *dev =3D &pdev->dev;
>>> +    struct device_node *node =3D dev->of_node;
>>> +    struct cygnus_phy_instance *instance_ptr;
>>> +    unsigned int id, ret;
>>> +
>>> +    for_each_available_child_of_node(node, child) {
>>> +            if (of_property_read_u32(child, "reg", &id)) {
>>> +                    dev_err(dev, "missing reg property for %s\n",
>>> +                            child->name);
>>> +                    ret =3D -EINVAL;
>>> +                    goto put_child;
>>> +            }
>>> +
>>> +            if (id >=3D MAX_NUM_PHYS) {
>>> +                    dev_err(dev, "invalid PHY id: %u\n", id);
>>> +                    ret =3D -EINVAL;
>>> +                    goto put_child;
>>> +            }
>>> +
>>> +            instance_ptr =3D &phy_driver->instances[id];
>>> +            instance_ptr->driver =3D phy_driver;
>>> +            instance_ptr->port =3D id;
>>> +            spin_lock_init(&instance_ptr->lock);
>>> +
>>> +            if (instance_ptr->generic_phy) {
>>> +                    dev_err(dev, "duplicated PHY id: %u\n", id);
>>> +                    ret =3D -EINVAL;
>>> +                    goto put_child;
>>> +            }
>>> +
>>> +            instance_ptr->generic_phy =3D
>>> +                            devm_phy_create(dev, child, &ops);
>>> +            if (IS_ERR(instance_ptr->generic_phy)) {
>>> +                    dev_err(dev, "Failed to create usb phy %d", id);
>>> +                    ret =3D PTR_ERR(instance_ptr->generic_phy);
>>> +                    goto put_child;
>>> +            }
>>> +
>>> +            vbus_name =3D devm_kzalloc(&instance_ptr->generic_phy->dev=
,
>>> +                                    MAX_REGULATOR_NAME_LEN,
>>> +                                    GFP_KERNEL);
>>> +            if (!vbus_name) {
>>> +                    ret =3D -ENOMEM;
>>> +                    goto put_child;
>>> +            }
>>> +
>>> +            /* regulator use is optional */
>>> +            sprintf(vbus_name, "vbus-p%d", id);
>>> +            instance_ptr->vbus_supply =3D
>>> +                    devm_regulator_get(&instance_ptr->generic_phy->dev=
,
>>> +                                    vbus_name);
>>> +            if (IS_ERR(instance_ptr->vbus_supply))
>>> +                    instance_ptr->vbus_supply =3D NULL;
>>> +            devm_kfree(&instance_ptr->generic_phy->dev, vbus_name);
>>> +            phy_set_drvdata(instance_ptr->generic_phy, instance_ptr);
>>> +    }
>>> +
>>> +    return 0;
>>> +
>>> +put_child:
>>> +    of_node_put(child);
>>> +    return ret;
>>> +}
>>> +
>>> +static int cygnus_phy_probe(struct platform_device *pdev)
>>> +{
>>> +    struct resource *res;
>>> +    struct cygnus_phy_driver *phy_driver;
>>> +    struct phy_provider *phy_provider;
>>> +    int i, ret;
>>> +    u32 reg_val;
>>> +    struct device *dev =3D &pdev->dev;
>>> +    struct device_node *node =3D dev->of_node;
>>> +
>>> +    /* allocate memory for each phy instance */
>>> +    phy_driver =3D devm_kzalloc(dev, sizeof(struct cygnus_phy_driver),
>>> +                              GFP_KERNEL);
>>> +    if (!phy_driver)
>>> +            return -ENOMEM;
>>> +
>>> +    phy_driver->num_phys =3D of_get_child_count(node);
>>> +
>>> +    if (phy_driver->num_phys =3D=3D 0) {
>>> +            dev_err(dev, "PHY no child node\n");
>>> +            return -ENODEV;
>>> +    }
>>> +
>>> +    phy_driver->instances =3D devm_kcalloc(dev, phy_driver->num_phys,
>>> +                                         sizeof(struct cygnus_phy_inst=
ance),
>>> +                                         GFP_KERNEL);
>>> +    phy_driver->pdev =3D pdev;
>>> +    platform_set_drvdata(pdev, phy_driver);
>>> +
>>> +    ret =3D cygnus_phy_instance_create(phy_driver);
>>> +    if (ret)
>>> +            return ret;
>>> +
>>> +    res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM,
>>> +                                       "crmu-usbphy-aon-ctrl");
>>> +    phy_driver->crmu_usbphy_aon_ctrl_regs =3D devm_ioremap_resource(de=
v, res);
>>> +    if (IS_ERR(phy_driver->crmu_usbphy_aon_ctrl_regs))
>>> +            return PTR_ERR(phy_driver->crmu_usbphy_aon_ctrl_regs);
>>> +
>>> +    res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM,
>>> +                                       "cdru-usbphy");
>>> +    phy_driver->cdru_usbphy_regs =3D devm_ioremap_resource(dev, res);
>>> +    if (IS_ERR(phy_driver->cdru_usbphy_regs))
>>> +            return PTR_ERR(phy_driver->cdru_usbphy_regs);
>>> +
>>> +    res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "usb2h-=
idm");
>>> +    phy_driver->usb2h_idm_regs =3D devm_ioremap_resource(dev, res);
>>> +    if (IS_ERR(phy_driver->usb2h_idm_regs))
>>> +            return PTR_ERR(phy_driver->usb2h_idm_regs);
>>> +
>>> +    res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "usb2d-=
idm");
>>> +    phy_driver->usb2d_idm_regs =3D devm_ioremap_resource(dev, res);
>>> +    if (IS_ERR(phy_driver->usb2d_idm_regs))
>>> +            return PTR_ERR(phy_driver->usb2d_idm_regs);
>>> +
>>> +    reg_val =3D readl(phy_driver->usb2d_idm_regs);
>>> +    writel((reg_val | USB2D_IDM_IDM_IO_SS_CLEAR_NAK_NEMPTY_EN_I),
>>> +               phy_driver->usb2d_idm_regs);
>>> +    phy_driver->idm_host_enabled =3D false;
>>> +
>>> +    /*
>>> +     * Shutdown all ports. They can be powered up as
>>> +     * required
>>> +     */
>>> +    reg_val =3D readl(phy_driver->crmu_usbphy_aon_ctrl_regs +
>>> +                    CRMU_USB_PHY_AON_CTRL_OFFSET);
>>> +    reg_val &=3D ~CRMU_USBPHY_P0_AFE_CORERDY_VDDC;
>>> +    reg_val &=3D ~CRMU_USBPHY_P0_RESETB;
>>> +    reg_val &=3D ~CRMU_USBPHY_P1_AFE_CORERDY_VDDC;
>>> +    reg_val &=3D ~CRMU_USBPHY_P1_RESETB;
>>> +    reg_val &=3D ~CRMU_USBPHY_P2_AFE_CORERDY_VDDC;
>>> +    reg_val &=3D ~CRMU_USBPHY_P2_RESETB;
>>> +    writel(reg_val, phy_driver->crmu_usbphy_aon_ctrl_regs +
>>> +            CRMU_USB_PHY_AON_CTRL_OFFSET);
>>
>> move the above to a separate function to make probe a lot cleaner.
>>
>> Thanks
>> Kishon
>>
>>
>>
>
> --
> Best Regards,
> Chanwoo Choi
> Samsung Electronics
