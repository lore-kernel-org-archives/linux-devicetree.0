From: Raveendra Padasalagi <raveendra.padasalagi@broadcom.com>
Subject: Re: [PATCH v2 2/3] drivers: phy: broadcom: Add driver for Cygnus USB
 phy controller
Date: Wed, 8 Nov 2017 21:47:09 +0530
Message-ID: <CAAFb_vr1g84hhSGuvQZ1TrRe=u6-WCc47LE8kpN3HQYpNGBA1w@mail.gmail.com>
References: <1510127203-5815-1-git-send-email-raveendra.padasalagi@broadcom.com>
 <1510127203-5815-3-git-send-email-raveendra.padasalagi@broadcom.com>
 <CGME20171108075237epcas4p1ff44128cefdf883b180fa1d0e673be24@epcas4p1.samsung.com>
 <CAAFb_vrE=hg2aRvyAv=KCQaoVYqi0EszQ3NsmmRX+xKypVmiUg@mail.gmail.com> <5A02DE4A.8030408@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5A02DE4A.8030408@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kishon Vijay Abraham I <kishon@ti.com>, Russell King <linux@armlinux.org.uk>, Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, Srinath Mannam <srinath.mannam@broadcom.com>, Vikram Prakash <vikram.prakash@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Raviteja Garimella <raviteja.garimella@broadcom.com>, Rafal Milecki <rafal@milecki.pl>, Arnd Bergmann <arnd@arndb.de>, Viresh Kumar <viresh.kumar@linaro.org>, Jaehoon Chung <jh80.chung@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedbac
List-Id: devicetree@vger.kernel.org

Hi,

On Wed, Nov 8, 2017 at 4:06 PM, Chanwoo Choi <cw00.choi@samsung.com> wrote:
> Hi,
>
> On 2017=EB=85=84 11=EC=9B=94 08=EC=9D=BC 16:52, Raveendra Padasalagi wrot=
e:
>> Hi,
>>
>> Adding Chanwoo Choi to review extcon API's.
>>
>> -Raveendra
>> On Wed, Nov 8, 2017 at 1:16 PM, Raveendra Padasalagi
>> <raveendra.padasalagi@broadcom.com> wrote:
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
>>>  drivers/phy/broadcom/phy-bcm-cygnus-usb.c | 690 ++++++++++++++++++++++=
++++++++
>>>  3 files changed, 705 insertions(+)
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
>>> +       tristate "Broadcom Cygnus USB PHY support"
>>> +       depends on OF
>>> +       depends on ARCH_BCM_CYGNUS || COMPILE_TEST
>>> +       select GENERIC_PHY
>>> +       select EXTCON_USB_GPIO
>
> As I commented on v1 patch, it is not proper to select the specific
> device driver. Instead, you should select the framework as following:
>
>         select EXTCON
>
> And if you want to enable the specific device driver,
> you need to add the configuration to the config file
> (such as arch/arm64/configs/*defconfig).
>
Ok, Got confused with the suggestion on previous patch.
Without selecting EXTCON_USB_GPIO, "linux,usb-gpio" driver was not
getting enabled in the build.

It's clear now, I will keep "select EXTCON"  in this Kconfig and send
another patch to enable
EXTCON_USB_GPIO in required defconfig.

>>> +       default ARCH_BCM_CYGNUS
>>> +       help
>>> +         Enable this to support three USB PHY's present in Broadcom's
>>> +         Cygnus chip.
>>> +
>>> +         The phys are capable of supporting host mode on all ports and
>>> +         device mode for port 2.
>>> +
>>>  config PHY_CYGNUS_PCIE
>>>         tristate "Broadcom Cygnus PCIe PHY driver"
>>>         depends on OF && (ARCH_BCM_CYGNUS || COMPILE_TEST)
>>> diff --git a/drivers/phy/broadcom/Makefile b/drivers/phy/broadcom/Makef=
ile
>>> index 4eb82ec..3dec23c 100644
>>> --- a/drivers/phy/broadcom/Makefile
>>> +++ b/drivers/phy/broadcom/Makefile
>>> @@ -1,4 +1,5 @@
>>>  obj-$(CONFIG_PHY_CYGNUS_PCIE)          +=3D phy-bcm-cygnus-pcie.o
>>> +obj-$(CONFIG_PHY_BCM_CYGNUS_USB)       +=3D phy-bcm-cygnus-usb.o
>>>  obj-$(CONFIG_BCM_KONA_USB2_PHY)                +=3D phy-bcm-kona-usb2.=
o
>>>  obj-$(CONFIG_PHY_BCM_NS_USB2)          +=3D phy-bcm-ns-usb2.o
>>>  obj-$(CONFIG_PHY_BCM_NS_USB3)          +=3D phy-bcm-ns-usb3.o
>>> diff --git a/drivers/phy/broadcom/phy-bcm-cygnus-usb.c b/drivers/phy/br=
oadcom/phy-bcm-cygnus-usb.c
>>> new file mode 100644
>>> index 0000000..cf957d4
>>> --- /dev/null
>>> +++ b/drivers/phy/broadcom/phy-bcm-cygnus-usb.c
>>> @@ -0,0 +1,690 @@
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
>>> +/* CDRU Block Register Offsets and bit definitions */
>>> +#define CDRU_USBPHY_CLK_RST_SEL_OFFSET                 0x0
>>> +#define CDRU_USBPHY2_HOST_DEV_SEL_OFFSET               0x4
>>> +#define CDRU_USB_DEV_SUSPEND_RESUME_CTRL_OFFSET                0x5C
>>> +#define CDRU_USBPHY_P0_STATUS_OFFSET                   0x1C
>>> +#define CDRU_USBPHY_P1_STATUS_OFFSET                   0x34
>>> +#define CDRU_USBPHY_P2_STATUS_OFFSET                   0x4C
>>> +
>>> +#define CDRU_USBPHY_USBPHY_ILDO_ON_FLAG                        BIT(1)
>>> +#define CDRU_USBPHY_USBPHY_PLL_LOCK                    BIT(0)
>>> +#define CDRU_USB_DEV_SUSPEND_RESUME_CTRL_DISABLE       BIT(0)
>>> +
>>> +/* CRMU Block Register Offsets and bit definitions */
>>> +#define CRMU_USB_PHY_AON_CTRL_OFFSET                   0x0
>>> +#define CRMU_USBPHY_P0_AFE_CORERDY_VDDC                        BIT(1)
>>> +#define CRMU_USBPHY_P0_RESETB                          BIT(2)
>>> +#define CRMU_USBPHY_P1_AFE_CORERDY_VDDC                        BIT(9)
>>> +#define CRMU_USBPHY_P1_RESETB                          BIT(10)
>>> +#define CRMU_USBPHY_P2_AFE_CORERDY_VDDC                        BIT(17)
>>> +#define CRMU_USBPHY_P2_RESETB                          BIT(18)
>>> +
>>> +/* USB2 IDM Block register Offset and bit definitions */
>>> +#define USB2_IDM_IDM_IO_CONTROL_DIRECT_OFFSET          0x0408
>>> +#define USB2_IDM_IDM_IO_CONTROL_DIRECT_CLK_ENABLE      BIT(0)
>>> +#define SUSPEND_OVERRIDE_0                             BIT(13)
>>> +#define SUSPEND_OVERRIDE_0_POS                         13
>>> +#define SUSPEND_OVERRIDE_1                             BIT(14)
>>> +#define SUSPEND_OVERRIDE_1_POS                         14
>>> +#define SUSPEND_OVERRIDE_2                             BIT(15)
>>> +#define SUSPEND_OVERRIDE_2_POS                         15
>>> +
>>> +#define USB2_IDM_IDM_RESET_CONTROL_OFFSET              0x0800
>>> +#define USB2_IDM_IDM_RESET_CONTROL__RESET              BIT(0)
>>> +#define USB2D_IDM_IDM_IO_SS_CLEAR_NAK_NEMPTY_EN_I      BIT(24)
>>> +
>>> +#define PHY2_DEV_HOST_CTRL_SEL_DEVICE                  0
>>> +#define PHY2_DEV_HOST_CTRL_SEL_HOST                    1
>>> +#define PHY2_DEV_HOST_CTRL_SEL_IDLE                    2
>>> +
>>> +#define PLL_LOCK_RETRY_COUNT                           1000
>>> +#define MAX_REGULATOR_NAME_LEN                         25
>>> +#define DUAL_ROLE_PHY                                  2
>>> +
>>> +#define USBPHY_WQ_DELAY_MS             msecs_to_jiffies(500)
>>> +#define USB2_SEL_DEVICE                        0
>>> +#define USB2_SEL_HOST                  1
>>> +#define USB2_SEL_IDLE                  2
>>> +#define USB_CONNECTED                  1
>>> +#define USB_DISCONNECTED               0
>>> +#define MAX_NUM_PHYS                   3
>>> +
>>> +static const int status_reg[] =3D {CDRU_USBPHY_P0_STATUS_OFFSET,
>>> +                               CDRU_USBPHY_P1_STATUS_OFFSET,
>>> +                               CDRU_USBPHY_P2_STATUS_OFFSET};
>>> +
>>> +struct cygnus_phy_instance;
>>> +
>>> +struct cygnus_phy_driver {
>>> +       void __iomem *cdru_usbphy_regs;
>>> +       void __iomem *crmu_usbphy_aon_ctrl_regs;
>>> +       void __iomem *usb2h_idm_regs;
>>> +       void __iomem *usb2d_idm_regs;
>>> +       int num_phys;
>>> +       bool idm_host_enabled;
>>> +       struct cygnus_phy_instance *instances;
>>> +       int phyto_src_clk;
>>> +       struct platform_device *pdev;
>>> +};
>>> +
>>> +struct cygnus_phy_instance {
>>> +       struct cygnus_phy_driver *driver;
>>> +       struct phy *generic_phy;
>>> +       int port;
>>> +       int new_state;          /* 1 - Host, 0 - device, 2 - idle*/
>>> +       bool power;             /* 1 - powered_on 0 - powered off */
>>> +       struct regulator *vbus_supply;
>>> +       spinlock_t lock;
>>> +       struct extcon_dev *edev;
>>> +       struct notifier_block   device_nb;
>>> +       struct notifier_block   host_nb;
>>> +};
>>> +
>>> +static inline int phy_pll_lock_stat(u32 usb_reg, int bit_mask,
>>> +                                   struct cygnus_phy_driver *phy_drive=
r)
>>> +{
>>> +       /* Wait for the PLL lock status */
>>> +       int retry =3D PLL_LOCK_RETRY_COUNT;
>>> +       u32 reg_val;
>>> +
>>> +       do {
>>> +               udelay(1);
>>> +               reg_val =3D readl(phy_driver->cdru_usbphy_regs +
>>> +                               usb_reg);
>>> +               if (reg_val & bit_mask)
>>> +                       return 0;
>>> +       } while (--retry > 0);
>>> +
>>> +       return -EBUSY;
>>> +}
>>> +
>>> +static struct phy *cygnus_phy_xlate(struct device *dev,
>>> +                                   struct of_phandle_args *args)
>>> +{
>>> +       struct cygnus_phy_driver *phy_driver =3D dev_get_drvdata(dev);
>>> +       struct cygnus_phy_instance *instance_ptr;
>>> +
>>> +       if (!phy_driver)
>>> +               return ERR_PTR(-EINVAL);
>>> +
>>> +       if (WARN_ON(args->args[0] >=3D phy_driver->num_phys))
>>> +               return ERR_PTR(-ENODEV);
>>> +
>>> +       if (WARN_ON(args->args_count < 1))
>>> +               return ERR_PTR(-EINVAL);
>>> +
>>> +       instance_ptr =3D &phy_driver->instances[args->args[0]];
>>> +       if (instance_ptr->port > phy_driver->phyto_src_clk)
>>> +               phy_driver->phyto_src_clk =3D instance_ptr->port;
>>> +
>>> +       if (instance_ptr->port =3D=3D DUAL_ROLE_PHY)
>>> +               goto ret_p2;
>>> +       phy_driver->instances[instance_ptr->port].new_state =3D
>>> +                                               PHY2_DEV_HOST_CTRL_SEL_=
HOST;
>>> +
>>> +ret_p2:
>>> +       return phy_driver->instances[instance_ptr->port].generic_phy;
>>> +}
>>> +
>>> +static void cygnus_usbp2_dev_clock_init(struct phy *generic_phy, bool =
enable)
>>> +{
>>> +       u32 reg_val;
>>> +       struct cygnus_phy_instance *instance_ptr =3D phy_get_drvdata(ge=
neric_phy);
>>> +       struct cygnus_phy_driver *phy_driver =3D instance_ptr->driver;
>>> +
>>> +       reg_val =3D readl(phy_driver->usb2d_idm_regs +
>>> +                       USB2_IDM_IDM_IO_CONTROL_DIRECT_OFFSET);
>>> +
>>> +       if (enable)
>>> +               reg_val |=3D USB2_IDM_IDM_IO_CONTROL_DIRECT_CLK_ENABLE;
>>> +       else
>>> +               reg_val &=3D ~USB2_IDM_IDM_IO_CONTROL_DIRECT_CLK_ENABLE=
;
>>> +
>>> +       writel(reg_val, phy_driver->usb2d_idm_regs +
>>> +               USB2_IDM_IDM_IO_CONTROL_DIRECT_OFFSET);
>>> +
>>> +       reg_val =3D readl(phy_driver->usb2d_idm_regs +
>>> +                       USB2_IDM_IDM_RESET_CONTROL_OFFSET);
>>> +
>>> +       if (enable)
>>> +               reg_val &=3D ~USB2_IDM_IDM_RESET_CONTROL__RESET;
>>> +       else
>>> +               reg_val |=3D USB2_IDM_IDM_RESET_CONTROL__RESET;
>>> +
>>> +       writel(reg_val, phy_driver->usb2d_idm_regs +
>>> +               USB2_IDM_IDM_RESET_CONTROL_OFFSET);
>>> +}
>>> +
>>> +static void cygnus_phy_clk_reset_src_switch(struct phy *generic_phy,
>>> +                                           u32 src_phy)
>>> +{
>>> +       u32 reg_val;
>>> +       struct cygnus_phy_instance *instance_ptr =3D phy_get_drvdata(ge=
neric_phy);
>>> +       struct cygnus_phy_driver *phy_driver =3D instance_ptr->driver;
>>> +
>>> +       writel(src_phy, phy_driver->cdru_usbphy_regs +
>>> +               CDRU_USBPHY_CLK_RST_SEL_OFFSET);
>>> +
>>> +       /* Force the clock/reset source phy to not suspend */
>>> +       reg_val =3D readl(phy_driver->usb2h_idm_regs +
>>> +                       USB2_IDM_IDM_IO_CONTROL_DIRECT_OFFSET);
>>> +       reg_val &=3D ~(SUSPEND_OVERRIDE_0 | SUSPEND_OVERRIDE_1 |
>>> +                       SUSPEND_OVERRIDE_2);
>>> +
>>> +       reg_val |=3D BIT(SUSPEND_OVERRIDE_0_POS + src_phy);
>>> +
>>> +       writel(reg_val, phy_driver->usb2h_idm_regs +
>>> +               USB2_IDM_IDM_IO_CONTROL_DIRECT_OFFSET);
>>> +}
>>> +
>>> +static void cygnus_phy_dual_role_init(struct cygnus_phy_instance *inst=
ance_ptr)
>>> +{
>>> +       u32 reg_val;
>>> +       struct cygnus_phy_driver *phy_driver =3D instance_ptr->driver;
>>> +
>>> +       if (instance_ptr->new_state =3D=3D PHY2_DEV_HOST_CTRL_SEL_HOST)=
 {
>>> +               writel(PHY2_DEV_HOST_CTRL_SEL_HOST,
>>> +                       phy_driver->cdru_usbphy_regs +
>>> +                       CDRU_USBPHY2_HOST_DEV_SEL_OFFSET);
>>> +               return;
>>> +       }
>>> +
>>> +       /*
>>> +        * Disable suspend/resume signals to device controller
>>> +        * when a port is in device mode
>>> +        */
>>> +       writel(PHY2_DEV_HOST_CTRL_SEL_DEVICE,
>>> +               phy_driver->cdru_usbphy_regs +
>>> +               CDRU_USBPHY2_HOST_DEV_SEL_OFFSET);
>>> +       reg_val =3D readl(phy_driver->cdru_usbphy_regs +
>>> +                       CDRU_USB_DEV_SUSPEND_RESUME_CTRL_OFFSET);
>>> +       reg_val |=3D CDRU_USB_DEV_SUSPEND_RESUME_CTRL_DISABLE;
>>> +       writel(reg_val, phy_driver->cdru_usbphy_regs +
>>> +                       CDRU_USB_DEV_SUSPEND_RESUME_CTRL_OFFSET);
>>> +}
>>> +
>>> +static int cygnus_phy_init(struct phy *generic_phy)
>>> +{
>>> +       struct cygnus_phy_instance *instance_ptr =3D phy_get_drvdata(ge=
neric_phy);
>>> +
>>> +       if (instance_ptr->port =3D=3D DUAL_ROLE_PHY)
>>> +               cygnus_phy_dual_role_init(instance_ptr);
>>> +
>>> +       return 0;
>>> +}
>>> +
>>> +static int cygnus_phy_shutdown(struct phy *generic_phy)
>>> +{
>>> +       u32 reg_val;
>>> +       int i, ret;
>>> +       unsigned long flags;
>>> +       bool power_off_flag =3D true;
>>> +       struct cygnus_phy_instance *instance_ptr =3D phy_get_drvdata(ge=
neric_phy);
>>> +       struct cygnus_phy_driver *phy_driver =3D instance_ptr->driver;
>>> +
>>> +       if (instance_ptr->vbus_supply) {
>>> +               ret =3D regulator_disable(instance_ptr->vbus_supply);
>>> +               if (ret) {
>>> +                       dev_err(&generic_phy->dev,
>>> +                                       "Failed to disable regulator\n"=
);
>>> +                       return ret;
>>> +               }
>>> +       }
>>> +
>>> +       spin_lock_irqsave(&instance_ptr->lock, flags);
>>> +
>>> +       /* power down the phy */
>>> +       reg_val =3D readl(phy_driver->crmu_usbphy_aon_ctrl_regs +
>>> +                       CRMU_USB_PHY_AON_CTRL_OFFSET);
>>> +       if (instance_ptr->port =3D=3D 0) {
>>> +               reg_val &=3D ~CRMU_USBPHY_P0_AFE_CORERDY_VDDC;
>>> +               reg_val &=3D ~CRMU_USBPHY_P0_RESETB;
>>> +       } else if (instance_ptr->port =3D=3D 1) {
>>> +               reg_val &=3D ~CRMU_USBPHY_P1_AFE_CORERDY_VDDC;
>>> +               reg_val &=3D ~CRMU_USBPHY_P1_RESETB;
>>> +       } else if (instance_ptr->port =3D=3D 2) {
>>> +               reg_val &=3D ~CRMU_USBPHY_P2_AFE_CORERDY_VDDC;
>>> +               reg_val &=3D ~CRMU_USBPHY_P2_RESETB;
>>> +       }
>>> +       writel(reg_val, phy_driver->crmu_usbphy_aon_ctrl_regs +
>>> +               CRMU_USB_PHY_AON_CTRL_OFFSET);
>>> +
>>> +       instance_ptr->power =3D false;
>>> +
>>> +       /* Determine whether all the phy's are powered off */
>>> +       for (i =3D 0; i < phy_driver->num_phys; i++) {
>>> +               if (phy_driver->instances[i].power =3D=3D true) {
>>> +                       power_off_flag =3D false;
>>> +                       break;
>>> +               }
>>> +       }
>>> +
>>> +       /* Disable clock to USB device and keep the USB device in reset=
 */
>>> +       if (instance_ptr->port =3D=3D DUAL_ROLE_PHY)
>>> +               cygnus_usbp2_dev_clock_init(instance_ptr->generic_phy,
>>> +                                           false);
>>> +
>>> +       /*
>>> +        * Put the host controller into reset state and
>>> +        * disable clock if all the phy's are powered off
>>> +        */
>>> +       if (power_off_flag) {
>>> +               reg_val =3D readl(phy_driver->usb2h_idm_regs +
>>> +                       USB2_IDM_IDM_IO_CONTROL_DIRECT_OFFSET);
>>> +               reg_val &=3D ~USB2_IDM_IDM_IO_CONTROL_DIRECT_CLK_ENABLE=
;
>>> +               writel(reg_val, phy_driver->usb2h_idm_regs +
>>> +                               USB2_IDM_IDM_IO_CONTROL_DIRECT_OFFSET);
>>> +
>>> +               reg_val =3D readl(phy_driver->usb2h_idm_regs +
>>> +                                USB2_IDM_IDM_RESET_CONTROL_OFFSET);
>>> +               reg_val |=3D USB2_IDM_IDM_RESET_CONTROL__RESET;
>>> +               writel(reg_val, phy_driver->usb2h_idm_regs +
>>> +                               USB2_IDM_IDM_RESET_CONTROL_OFFSET);
>>> +               phy_driver->idm_host_enabled =3D false;
>>> +       }
>>> +       spin_unlock_irqrestore(&instance_ptr->lock, flags);
>>> +       return 0;
>>> +}
>>> +
>>> +static int cygnus_phy_poweron(struct phy *generic_phy)
>>> +{
>>> +       int ret;
>>> +       unsigned long flags;
>>> +       u32 reg_val;
>>> +       struct cygnus_phy_instance *instance_ptr =3D phy_get_drvdata(ge=
neric_phy);
>>> +       struct cygnus_phy_driver *phy_driver =3D instance_ptr->driver;
>>> +       u32 extcon_event =3D instance_ptr->new_state;
>>> +
>>> +       /*
>>> +        * Switch on the regulator only if in HOST mode
>>> +        */
>>> +       if (instance_ptr->vbus_supply) {
>>> +               ret =3D regulator_enable(instance_ptr->vbus_supply);
>>> +               if (ret) {
>>> +                       dev_err(&generic_phy->dev,
>>> +                               "Failed to enable regulator\n");
>>> +                       goto err_shutdown;
>>> +               }
>>> +       }
>>> +
>>> +       spin_lock_irqsave(&instance_ptr->lock, flags);
>>> +       /* Bring the AFE block out of reset to start powering up the PH=
Y */
>>> +       reg_val =3D readl(phy_driver->crmu_usbphy_aon_ctrl_regs +
>>> +                       CRMU_USB_PHY_AON_CTRL_OFFSET);
>>> +       if (instance_ptr->port =3D=3D 0)
>>> +               reg_val |=3D CRMU_USBPHY_P0_AFE_CORERDY_VDDC;
>>> +       else if (instance_ptr->port =3D=3D 1)
>>> +               reg_val |=3D CRMU_USBPHY_P1_AFE_CORERDY_VDDC;
>>> +       else if (instance_ptr->port =3D=3D 2)
>>> +               reg_val |=3D CRMU_USBPHY_P2_AFE_CORERDY_VDDC;
>>> +       writel(reg_val, phy_driver->crmu_usbphy_aon_ctrl_regs +
>>> +               CRMU_USB_PHY_AON_CTRL_OFFSET);
>>> +
>>> +       /* Check for power on and PLL lock */
>>> +       ret =3D phy_pll_lock_stat(status_reg[instance_ptr->port],
>>> +                               CDRU_USBPHY_USBPHY_ILDO_ON_FLAG, phy_dr=
iver);
>>> +       if (ret < 0) {
>>> +               dev_err(&generic_phy->dev,
>>> +                       "Timed out waiting for USBPHY_ILDO_ON_FLAG on p=
ort %d",
>>> +                       instance_ptr->port);
>>> +               spin_unlock_irqrestore(&instance_ptr->lock, flags);
>>> +               goto err_shutdown;
>>> +       }
>>> +       ret =3D phy_pll_lock_stat(status_reg[instance_ptr->port],
>>> +                               CDRU_USBPHY_USBPHY_PLL_LOCK, phy_driver=
);
>>> +       if (ret < 0) {
>>> +               dev_err(&generic_phy->dev,
>>> +                       "Timed out waiting for USBPHY_PLL_LOCK on port =
%d",
>>> +                       instance_ptr->port);
>>> +               spin_unlock_irqrestore(&instance_ptr->lock, flags);
>>> +               goto err_shutdown;
>>> +       }
>>> +
>>> +       instance_ptr->power =3D true;
>>> +
>>> +       /* Enable clock to USB device and take the USB device out of re=
set */
>>> +       if (instance_ptr->port =3D=3D DUAL_ROLE_PHY)
>>> +               cygnus_usbp2_dev_clock_init(instance_ptr->generic_phy, =
true);
>>> +
>>> +       /* Set clock source provider to be the last powered on phy */
>>> +       if (instance_ptr->port =3D=3D phy_driver->phyto_src_clk)
>>> +               cygnus_phy_clk_reset_src_switch(generic_phy,
>>> +                               instance_ptr->port);
>>> +
>>> +       if (phy_driver->idm_host_enabled !=3D true &&
>>> +               extcon_event =3D=3D PHY2_DEV_HOST_CTRL_SEL_HOST) {
>>> +               /* Enable clock to USB host and take the host out of re=
set */
>>> +               reg_val =3D readl(phy_driver->usb2h_idm_regs +
>>> +                               USB2_IDM_IDM_IO_CONTROL_DIRECT_OFFSET);
>>> +               reg_val |=3D USB2_IDM_IDM_IO_CONTROL_DIRECT_CLK_ENABLE;
>>> +               writel(reg_val, phy_driver->usb2h_idm_regs +
>>> +                               USB2_IDM_IDM_IO_CONTROL_DIRECT_OFFSET);
>>> +
>>> +               reg_val =3D readl(phy_driver->usb2h_idm_regs +
>>> +                               USB2_IDM_IDM_RESET_CONTROL_OFFSET);
>>> +               reg_val &=3D ~USB2_IDM_IDM_RESET_CONTROL__RESET;
>>> +               writel(reg_val, phy_driver->usb2h_idm_regs +
>>> +                                USB2_IDM_IDM_RESET_CONTROL_OFFSET);
>>> +               phy_driver->idm_host_enabled =3D true;
>>> +       }
>>> +       spin_unlock_irqrestore(&instance_ptr->lock, flags);
>>> +
>>> +       return 0;
>>> +err_shutdown:
>>> +       cygnus_phy_shutdown(generic_phy);
>>> +       return ret;
>>> +}
>>> +
>>> +static int usbd_connect_notify(struct notifier_block *self,
>>> +                              unsigned long event, void *ptr)
>>> +{
>>> +       struct cygnus_phy_instance *instance_ptr =3D container_of(self,
>>> +                                       struct cygnus_phy_instance, dev=
ice_nb);
>>> +
>>> +       if (event) {
>>> +               instance_ptr->new_state =3D PHY2_DEV_HOST_CTRL_SEL_DEVI=
CE;
>>> +               cygnus_phy_dual_role_init(instance_ptr);
>>> +       }
>
> As I commented on v1 patch, this callback function considers the attached=
 state.
> Is it right that you don't consider the detached state?

I am aware of this, I don't need to handle detached state. Interested in on=
ly
device cable connect state as I have to change the role of the PHY only on
attach state. On detach phy is assumed to continue in the previous mode.

>>> +
>>> +       return NOTIFY_OK;
>>> +}
>>> +
>>> +static int usbh_connect_notify(struct notifier_block *self,
>>> +                              unsigned long event, void *ptr)
>>> +{
>>> +       struct cygnus_phy_instance *instance_ptr =3D container_of(self,
>>> +                                       struct cygnus_phy_instance, hos=
t_nb);
>>> +       if (event) {
>>> +               instance_ptr->new_state =3D PHY2_DEV_HOST_CTRL_SEL_HOST=
;
>>> +               cygnus_phy_dual_role_init(instance_ptr);
>>> +       }
>
> ditto.

I am aware of this, I don't need to handle detached state. Interested in on=
ly
host cable connect state as explained above.

>>> +
>>> +       return NOTIFY_OK;
>>> +}
>>> +
>>> +static int cygnus_register_extcon_notifiers(
>>> +                               struct cygnus_phy_instance *instance_pt=
r)
>>> +{
>>> +       int ret =3D 0;
>>> +       struct device *dev =3D &instance_ptr->generic_phy->dev;
>>> +
>>> +       if (of_property_read_bool(dev->of_node, "extcon")) {
>>> +               instance_ptr->edev =3D extcon_get_edev_by_phandle(dev, =
0);
>>> +               if (IS_ERR(instance_ptr->edev)) {
>>> +                       if (PTR_ERR(instance_ptr->edev) =3D=3D -EPROBE_=
DEFER)
>>> +                               return -EPROBE_DEFER;
>>> +                       ret =3D PTR_ERR(instance_ptr->edev);
>>> +                       goto err;
>>> +               }
>>> +
>>> +               instance_ptr->device_nb.notifier_call =3D usbd_connect_=
notify;
>>> +               ret =3D devm_extcon_register_notifier(dev,
>>> +                                               instance_ptr->edev,
>>> +                                               EXTCON_USB,
>>> +                                               &instance_ptr->device_n=
b);
>>> +               if (ret < 0) {
>>> +                       dev_err(dev, "Can't register extcon notifier\n"=
);
>>> +                       goto err;
>>> +               }
>>> +
>>> +               if (extcon_get_state(instance_ptr->edev, EXTCON_USB) =
=3D=3D true) {
>>> +                       instance_ptr->new_state =3D PHY2_DEV_HOST_CTRL_=
SEL_DEVICE;
>>> +                       cygnus_phy_dual_role_init(instance_ptr);
>>> +               }
>>> +
>>> +               instance_ptr->host_nb.notifier_call =3D usbh_connect_no=
tify;
>>> +               ret =3D devm_extcon_register_notifier(dev,
>>> +                                               instance_ptr->edev,
>>> +                                               EXTCON_USB_HOST,
>>> +                                               &instance_ptr->host_nb)=
;
>>> +               if (ret < 0) {
>>> +                       dev_err(dev, "Can't register extcon notifier\n"=
);
>>> +                       goto err;
>>> +               }
>>> +
>>> +               if (extcon_get_state(instance_ptr->edev, EXTCON_USB_HOS=
T)
>>> +                                       =3D=3D true) {
>>> +                       instance_ptr->new_state =3D PHY2_DEV_HOST_CTRL_=
SEL_HOST;
>>> +                       cygnus_phy_dual_role_init(instance_ptr);
>>> +               }
>>> +       } else {
>>> +               dev_err(dev, "Extcon device handle not found\n");
>>> +               return -EINVAL;
>>> +       }
>>> +
>>> +       return 0;
>>> +err:
>>> +       return ret;
>>> +}
>>> +
>>> +static const struct phy_ops ops =3D {
>>> +       .init           =3D cygnus_phy_init,
>>> +       .power_on       =3D cygnus_phy_poweron,
>>> +       .power_off      =3D cygnus_phy_shutdown,
>>> +       .owner =3D THIS_MODULE,
>>> +};
>>> +
>>> +static void cygnus_phy_shutdown_all(struct cygnus_phy_driver *phy_driv=
er)
>>> +{
>>> +       u32 reg_val;
>>> +
>>> +       /*
>>> +        * Shutdown all ports. They can be powered up as
>>> +        * required
>>> +        */
>>> +       reg_val =3D readl(phy_driver->crmu_usbphy_aon_ctrl_regs +
>>> +                       CRMU_USB_PHY_AON_CTRL_OFFSET);
>>> +       reg_val &=3D ~CRMU_USBPHY_P0_AFE_CORERDY_VDDC;
>>> +       reg_val &=3D ~CRMU_USBPHY_P0_RESETB;
>>> +       reg_val &=3D ~CRMU_USBPHY_P1_AFE_CORERDY_VDDC;
>>> +       reg_val &=3D ~CRMU_USBPHY_P1_RESETB;
>>> +       reg_val &=3D ~CRMU_USBPHY_P2_AFE_CORERDY_VDDC;
>>> +       reg_val &=3D ~CRMU_USBPHY_P2_RESETB;
>>> +       writel(reg_val, phy_driver->crmu_usbphy_aon_ctrl_regs +
>>> +               CRMU_USB_PHY_AON_CTRL_OFFSET);
>>> +}
>>> +
>>> +static int cygnus_phy_instance_create(struct cygnus_phy_driver *phy_dr=
iver)
>>> +{
>>> +       struct device_node *child;
>>> +       char *vbus_name;
>>> +       struct platform_device *pdev =3D phy_driver->pdev;
>>> +       struct device *dev =3D &pdev->dev;
>>> +       struct device_node *node =3D dev->of_node;
>>> +       struct cygnus_phy_instance *instance_ptr;
>>> +       unsigned int id, ret;
>>> +
>>> +       for_each_available_child_of_node(node, child) {
>>> +               if (of_property_read_u32(child, "reg", &id)) {
>>> +                       dev_err(dev, "missing reg property for %s\n",
>>> +                               child->name);
>>> +                       ret =3D -EINVAL;
>>> +                       goto put_child;
>>> +               }
>>> +
>>> +               if (id >=3D MAX_NUM_PHYS) {
>>> +                       dev_err(dev, "invalid PHY id: %u\n", id);
>>> +                       ret =3D -EINVAL;
>>> +                       goto put_child;
>>> +               }
>>> +
>>> +               instance_ptr =3D &phy_driver->instances[id];
>>> +               instance_ptr->driver =3D phy_driver;
>>> +               instance_ptr->port =3D id;
>>> +               spin_lock_init(&instance_ptr->lock);
>>> +
>>> +               if (instance_ptr->generic_phy) {
>>> +                       dev_err(dev, "duplicated PHY id: %u\n", id);
>>> +                       ret =3D -EINVAL;
>>> +                       goto put_child;
>>> +               }
>>> +
>>> +               instance_ptr->generic_phy =3D
>>> +                               devm_phy_create(dev, child, &ops);
>>> +               if (IS_ERR(instance_ptr->generic_phy)) {
>>> +                       dev_err(dev, "Failed to create usb phy %d", id)=
;
>>> +                       ret =3D PTR_ERR(instance_ptr->generic_phy);
>>> +                       goto put_child;
>>> +               }
>>> +
>>> +               vbus_name =3D devm_kzalloc(&instance_ptr->generic_phy->=
dev,
>>> +                                       MAX_REGULATOR_NAME_LEN,
>>> +                                       GFP_KERNEL);
>>> +               if (!vbus_name) {
>>> +                       ret =3D -ENOMEM;
>>> +                       goto put_child;
>>> +               }
>>> +
>>> +               /* regulator use is optional */
>>> +               sprintf(vbus_name, "vbus-p%d", id);
>>> +               instance_ptr->vbus_supply =3D
>>> +                       devm_regulator_get(&instance_ptr->generic_phy->=
dev,
>>> +                                       vbus_name);
>>> +               if (IS_ERR(instance_ptr->vbus_supply))
>>> +                       instance_ptr->vbus_supply =3D NULL;
>>> +               devm_kfree(&instance_ptr->generic_phy->dev, vbus_name);
>>> +               phy_set_drvdata(instance_ptr->generic_phy, instance_ptr=
);
>>> +       }
>>> +
>>> +       return 0;
>>> +
>>> +put_child:
>>> +       of_node_put(child);
>>> +       return ret;
>>> +}
>>> +
>>> +static int cygnus_phy_probe(struct platform_device *pdev)
>>> +{
>>> +       struct resource *res;
>>> +       struct cygnus_phy_driver *phy_driver;
>>> +       struct phy_provider *phy_provider;
>>> +       int i, ret;
>>> +       u32 reg_val;
>>> +       struct device *dev =3D &pdev->dev;
>>> +       struct device_node *node =3D dev->of_node;
>>> +
>>> +       /* allocate memory for each phy instance */
>>> +       phy_driver =3D devm_kzalloc(dev, sizeof(struct cygnus_phy_drive=
r),
>>> +                                 GFP_KERNEL);
>>> +       if (!phy_driver)
>>> +               return -ENOMEM;
>>> +
>>> +       phy_driver->num_phys =3D of_get_child_count(node);
>>> +
>>> +       if (phy_driver->num_phys =3D=3D 0) {
>>> +               dev_err(dev, "PHY no child node\n");
>>> +               return -ENODEV;
>>> +       }
>>> +
>>> +       phy_driver->instances =3D devm_kzalloc(dev, phy_driver->num_phy=
s *
>>> +                                            sizeof(struct cygnus_phy_i=
nstance),
>>> +                                            GFP_KERNEL);
>>> +       if (!phy_driver->instances)
>>> +               return -ENOMEM;
>>> +
>>> +       phy_driver->pdev =3D pdev;
>>> +       platform_set_drvdata(pdev, phy_driver);
>>> +
>>> +       ret =3D cygnus_phy_instance_create(phy_driver);
>>> +       if (ret)
>>> +               return ret;
>>> +
>>> +       res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM,
>>> +                                          "crmu-usbphy-aon-ctrl");
>>> +       phy_driver->crmu_usbphy_aon_ctrl_regs =3D devm_ioremap_resource=
(dev, res);
>>> +       if (IS_ERR(phy_driver->crmu_usbphy_aon_ctrl_regs))
>>> +               return PTR_ERR(phy_driver->crmu_usbphy_aon_ctrl_regs);
>>> +
>>> +       res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM,
>>> +                                          "cdru-usbphy");
>>> +       phy_driver->cdru_usbphy_regs =3D devm_ioremap_resource(dev, res=
);
>>> +       if (IS_ERR(phy_driver->cdru_usbphy_regs))
>>> +               return PTR_ERR(phy_driver->cdru_usbphy_regs);
>>> +
>>> +       res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "usb=
2h-idm");
>>> +       phy_driver->usb2h_idm_regs =3D devm_ioremap_resource(dev, res);
>>> +       if (IS_ERR(phy_driver->usb2h_idm_regs))
>>> +               return PTR_ERR(phy_driver->usb2h_idm_regs);
>>> +
>>> +       res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "usb=
2d-idm");
>>> +       phy_driver->usb2d_idm_regs =3D devm_ioremap_resource(dev, res);
>>> +       if (IS_ERR(phy_driver->usb2d_idm_regs))
>>> +               return PTR_ERR(phy_driver->usb2d_idm_regs);
>>> +
>>> +       reg_val =3D readl(phy_driver->usb2d_idm_regs);
>>> +       writel((reg_val | USB2D_IDM_IDM_IO_SS_CLEAR_NAK_NEMPTY_EN_I),
>>> +                  phy_driver->usb2d_idm_regs);
>>> +       phy_driver->idm_host_enabled =3D false;
>>> +
>>> +       /* Shutdown all ports. They can be powered up as required */
>>> +       cygnus_phy_shutdown_all(phy_driver);
>>> +
>>> +       phy_provider =3D devm_of_phy_provider_register(dev, cygnus_phy_=
xlate);
>>> +       if (IS_ERR(phy_provider)) {
>>> +               dev_err(dev, "Failed to register as phy provider\n");
>>> +               ret =3D PTR_ERR(phy_provider);
>>> +               return ret;
>>> +       }
>>> +
>>> +       for (i =3D 0; i < phy_driver->num_phys; i++) {
>>> +               if (phy_driver->instances[i].port =3D=3D DUAL_ROLE_PHY)=
 {
>>> +                       ret =3D cygnus_register_extcon_notifiers(
>>> +                               &phy_driver->instances[DUAL_ROLE_PHY]);
>>> +                       if (ret) {
>>> +                               dev_err(dev, "Failed to register notifi=
er\n");
>>> +                               return ret;
>>> +                       }
>>> +               }
>>> +       }
>>> +
>>> +       return 0;
>>> +}
>>> +
>>> +static const struct of_device_id cygnus_phy_dt_ids[] =3D {
>>> +       { .compatible =3D "brcm,cygnus-usb-phy", },
>>> +       { }
>>> +};
>>> +MODULE_DEVICE_TABLE(of, cygnus_phy_dt_ids);
>>> +
>>> +static struct platform_driver cygnus_phy_driver =3D {
>>> +       .probe =3D cygnus_phy_probe,
>>> +       .driver =3D {
>>> +               .name =3D "bcm-cygnus-usbphy",
>>> +               .of_match_table =3D of_match_ptr(cygnus_phy_dt_ids),
>>> +       },
>>> +};
>>> +module_platform_driver(cygnus_phy_driver);
>>> +
>>> +MODULE_ALIAS("platform:bcm-cygnus-usbphy");
>>> +MODULE_AUTHOR("Raveendra Padasalagi <Raveendra.padasalagi@broadcom.com=
");
>>> +MODULE_DESCRIPTION("Broadcom Cygnus USB PHY driver");
>>> +MODULE_LICENSE("GPL v2");
>>> --
>>> 1.9.1
>>>
>>
>>
>>
>
>
> --
> Best Regards,
> Chanwoo Choi
> Samsung Electronics
