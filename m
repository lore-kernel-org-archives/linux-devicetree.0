From: Pawel Laszczak <pawell@cadence.com>
Subject: RE: [RFC PATCH v2 05/15] usb:cdns3: Added DRD support
Date: Mon, 26 Nov 2018 07:23:11 +0000
Message-ID: <BYAPR07MB470991EB0AE200B6481AEE35DDD70@BYAPR07MB4709.namprd07.prod.outlook.com>
References: <1542535751-16079-1-git-send-email-pawell@cadence.com>
 <1542535751-16079-6-git-send-email-pawell@cadence.com>
 <5BF8140C.7000605@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5BF8140C.7000605@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Roger Quadros <rogerq@ti.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alan Douglas <adouglas@cadence.com>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, "peter.chen@nxp.com" <peter.chen@nxp.com>, Pawel Jez <pjez@cadence.com>, Rahul Kumar <kurahul@cadence.com>
List-Id: devicetree@vger.kernel.org

Hi Roger,

>On 18/11/18 12:09, Pawel Laszczak wrote:
>> Patch adds supports for detecting Host/Device mode.
>> Controller has additional OTG register that allow
>> implement even whole OTG functionality.
>> At this moment patch adds support only for detecting
>> the appropriate mode based on strap pins and ID pin.
>>
>> Signed-off-by: Pawel Laszczak <pawell@cadence.com>
>> ---
>>  drivers/usb/cdns3/Makefile |   2 +-
>>  drivers/usb/cdns3/core.c   |  27 +++--
>>  drivers/usb/cdns3/drd.c    | 229 +++++++++++++++++++++++++++++++++++++
>>  drivers/usb/cdns3/drd.h    | 122 ++++++++++++++++++++
>>  4 files changed, 372 insertions(+), 8 deletions(-)
>>  create mode 100644 drivers/usb/cdns3/drd.c
>>  create mode 100644 drivers/usb/cdns3/drd.h
>>
>> diff --git a/drivers/usb/cdns3/Makefile b/drivers/usb/cdns3/Makefile
>> index 02d25b23c5d3..e779b2a2f8eb 100644
>> --- a/drivers/usb/cdns3/Makefile
>> +++ b/drivers/usb/cdns3/Makefile
>> @@ -1,5 +1,5 @@
>>  obj-$(CONFIG_USB_CDNS3)			+=3D cdns3.o
>>  obj-$(CONFIG_USB_CDNS3_PCI_WRAP)	+=3D cdns3-pci.o
>>
>> -cdns3-y					:=3D core.o
>> +cdns3-y					:=3D core.o drd.o
>>  cdns3-pci-y		 		:=3D cdns3-pci-wrap.o
>> diff --git a/drivers/usb/cdns3/core.c b/drivers/usb/cdns3/core.c
>> index f9055d4da67f..dbee4325da7f 100644
>> --- a/drivers/usb/cdns3/core.c
>> +++ b/drivers/usb/cdns3/core.c
>> @@ -17,6 +17,7 @@
>>
>>  #include "gadget.h"
>>  #include "core.h"
>> +#include "drd.h"
>>
>>  static inline struct cdns3_role_driver *cdns3_get_current_role_driver(s=
truct cdns3 *cdns)
>>  {
>> @@ -57,8 +58,10 @@ static inline void cdns3_role_stop(struct cdns3 *cdns=
)
>>  static enum cdns3_roles cdns3_get_role(struct cdns3 *cdns)
>>  {
>>  	if (cdns->roles[CDNS3_ROLE_HOST] && cdns->roles[CDNS3_ROLE_GADGET]) {
>> -		//TODO: implements selecting device/host mode
>> -		return CDNS3_ROLE_HOST;
>> +		if (cdns3_is_host(cdns))
>> +			return CDNS3_ROLE_HOST;
>> +		if (cdns3_is_device(cdns))
>> +			return CDNS3_ROLE_GADGET;
>>  	}
>>  	return cdns->roles[CDNS3_ROLE_HOST]
>>  		? CDNS3_ROLE_HOST
>> @@ -124,6 +127,12 @@ static irqreturn_t cdns3_irq(int irq, void *data)
>>  	struct cdns3 *cdns =3D data;
>>  	irqreturn_t ret =3D IRQ_NONE;
>>
>> +	if (cdns->dr_mode =3D=3D USB_DR_MODE_OTG) {
>> +		ret =3D cdns3_drd_irq(cdns);
>> +		if (ret =3D=3D IRQ_HANDLED)
>> +			return ret;
>> +	}
>
>The kernel's shared IRQ model takes care of sharing the same interrupt
>between different devices and their drivers. You don't need to manually
>handle it here. Just let all 3 drivers do a request_irq() and have
>handlers check if the IRQ was theirs or not and return IRQ_HANDLED or
>IRQ_NONE accordingly.
>
>Looks like you can do away with irq member of the role driver struct.

Ok, I will split it into 3 separate part, but in this case, I additionally =
have to check the current=20
role in ISR function. Driver can't read host side registers when controller=
 works in device role=20
and vice versa. One part of controller is kept in reset. Only DRD registers=
 are common and are all accessible.

>> +
>>  	/* Handle device/host interrupt */
>>  	if (cdns->role !=3D CDNS3_ROLE_END)
>>  		ret =3D cdns3_get_current_role_driver(cdns)->irq(cdns);
>> @@ -176,11 +185,8 @@ static void cdns3_role_switch(struct work_struct *w=
ork)
>>
>>  	cdns =3D container_of(work, struct cdns3, role_switch_wq);
>>
>> -	//TODO: implements this functions.
>> -	//host =3D cdns3_is_host(cdns);
>> -	//device =3D cdns3_is_device(cdns);
>> -	host =3D 1;
>> -	device =3D 0;
>> +	host =3D cdns3_is_host(cdns);
>> +	device =3D cdns3_is_device(cdns);
>
>What if there is a ID transition between the 2 functions so that
>and both host and device become true?
>Since you are checking the ID level separately in both the functions.
>
>How about instead having cdns3_get_id() and using
>it to start/stop relevant roles if we are in OTG mode.
>
>Is this going to be used for a role switch even if we're not in OTG mode?
>If not then it is a BUG if we get here.
>
Good point.
User can change current mode by debugfs and then this function will also in=
voked.
Probably I use  cdns3_get_id as you suggest.=20

>>
>>  	if (host)
>>  		role =3D CDNS3_ROLE_HOST;
>> @@ -194,6 +200,12 @@ static void cdns3_role_switch(struct work_struct *w=
ork)
>>  	pm_runtime_get_sync(cdns->dev);
>>  	cdns3_role_stop(cdns);
>>
>> +	if (cdns->desired_dr_mode !=3D cdns->current_dr_mode) {
>
>This is about roles, why are we checking dr_mode here?

Because after changing dr_mode by means of debugfs we need to update mode.=
=20
Driver should do this after stopping the previous role.  I will move this c=
ondition=20
to cdns3_drd_update_mode and add comment in this place.=20

>
>> +		cdns3_drd_update_mode(cdns);
>> +		host =3D cdns3_is_host(cdns);
>> +		device =3D cdns3_is_device(cdns);
>> +	}
>> +
>>  	if (host) {
>>  		if (cdns->roles[CDNS3_ROLE_HOST])
>>  			cdns3_do_role_switch(cdns, CDNS3_ROLE_HOST);
>> @@ -287,6 +299,7 @@ static int cdns3_probe(struct platform_device *pdev)
>>  	if (ret)
>>  		goto err2;
>>
>> +	ret =3D cdns3_drd_init(cdns);
>>  	if (ret)
>>  		goto err2;
>>
>> diff --git a/drivers/usb/cdns3/drd.c b/drivers/usb/cdns3/drd.c
>> new file mode 100644
>> index 000000000000..ac741c80e776
>> --- /dev/null
>> +++ b/drivers/usb/cdns3/drd.c
>> @@ -0,0 +1,229 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Cadence USBSS DRD Driver.
>> + *
>> + * Copyright (C) 2018 Cadence.
>> + *
>> + * Author: Pawel Laszczak <pawell@cadence.com
>> + *
>> + */
>> +#include <linux/kernel.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/delay.h>
>> +#include <linux/usb/otg.h>
>> +
>> +#include "gadget.h"
>> +#include "drd.h"
>> +
>> +/**
>> + * cdns3_set_mode - change mode of OTG Core
>> + * @cdns: pointer to context structure
>> + * @mode: selected mode from cdns_role
>> + */
>> +void cdns3_set_mode(struct cdns3 *cdns, enum usb_dr_mode mode)
>> +{
>> +	u32 reg;
>> +
>> +	cdns->current_dr_mode =3D mode;
>> +	switch (mode) {
>> +	case USB_DR_MODE_PERIPHERAL:
>> +		dev_info(cdns->dev, "Set controller to Gadget mode\n");
>> +		writel(OTGCMD_DEV_BUS_REQ | OTGCMD_OTG_DIS,
>> +		       &cdns->otg_regs->cmd);
>> +		break;
>> +	case USB_DR_MODE_HOST:
>> +		dev_info(cdns->dev, "Set controller to Host mode\n");
>> +		writel(OTGCMD_HOST_BUS_REQ | OTGCMD_OTG_DIS,
>> +		       &cdns->otg_regs->cmd);
>> +		break;
>> +	case USB_DR_MODE_OTG:
>> +		dev_info(cdns->dev, "Set controller to OTG mode\n");
>> +		reg =3D readl(&cdns->otg_regs->ctrl1);
>> +		reg |=3D OTGCTRL1_IDPULLUP;
>> +		writel(reg, &cdns->otg_regs->ctrl1);
>> +
>> +		/* wait until valid ID (ID_VALUE) can be sampled (50ms). */
>> +		mdelay(50);
>> +		break;
>> +	default:
>> +		cdns->current_dr_mode =3D USB_DR_MODE_UNKNOWN;
>> +		dev_err(cdns->dev, "Unsupported mode of operation %d\n", mode);
>> +		return;
>> +	}
>> +}
>> +
>> +static int cdns3_otg_get_id(struct cdns3 *cdns)
>> +{
>> +	int id;
>> +
>> +	id =3D readl(&cdns->otg_regs->sts) & OTGSTS_ID_VALUE;
>> +	dev_dbg(cdns->dev, "OTG ID: %d", id);
>> +	return id;
>> +}
>> +
>> +int cdns3_is_host(struct cdns3 *cdns)
>> +{
>> +	if (cdns->current_dr_mode =3D=3D USB_DR_MODE_HOST)
>> +		return 1;
>
>Why do you need this?

I assumed that some SoC could have cut DRD /OTG and Device or Host part.=20
In such case the driver cannot be based on ID pin.=20
For only HOST it's not a problem because=20
the standard XHCI driver will be used.  Probably I will remove this fragmen=
t.
>
>> +	else if (cdns->current_dr_mode =3D=3D USB_DR_MODE_OTG)
>> +		if (!cdns3_otg_get_id(cdns))
>> +			return 1;
>> +
>> +	return 0;
>> +}
>> +
>> +int cdns3_is_device(struct cdns3 *cdns)
>> +{
>> +	if (cdns->current_dr_mode =3D=3D USB_DR_MODE_PERIPHERAL)
>> +		return 1;
>> +	else if (cdns->current_dr_mode =3D=3D USB_DR_MODE_OTG)
>> +		if (cdns3_otg_get_id(cdns))
>> +			return 1;
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * cdns3_otg_disable_irq - Disable all OTG interrupts
>> + * @cdns: Pointer to controller context structure
>> + */
>> +static void cdns3_otg_disable_irq(struct cdns3 *cdns)
>> +{
>> +	writel(0, &cdns->otg_regs->ien);
>> +}
>> +
>> +/**
>> + * cdns3_otg_enable_irq - enable id and sess_valid interrupts
>> + * @cdns: Pointer to controller context structure
>> + */
>> +static void cdns3_otg_enable_irq(struct cdns3 *cdns)
>> +{
>> +	writel(OTGIEN_ID_CHANGE_INT | OTGIEN_VBUSVALID_RISE_INT |
>> +	       OTGIEN_VBUSVALID_FALL_INT, &cdns->otg_regs->ien);
>> +}
>> +
>> +/**
>> + * cdns3_init_otg_mode - initialize drd controller
>> + * @cdns: Pointer to controller context structure
>> + *
>> + * Returns 0 on success otherwise negative errno
>> + */
>> +static void cdns3_init_otg_mode(struct cdns3 *cdns)
>> +{
>> +	cdns3_otg_disable_irq(cdns);
>> +	/* clear all interrupts */
>> +	writel(~0, &cdns->otg_regs->ivect);
>> +
>> +	cdns3_set_mode(cdns, USB_DR_MODE_OTG);
>> +
>> +	cdns3_otg_enable_irq(cdns);
>> +}
>> +
>> +/**
>> + * cdns3_drd_update_mode - initialize mode of operation
>
>Looks like this will be called only once. How about calling it
>
>cdns3_drd_init_mode()?

It will be also called after changing dr_mode from debugfs.

>> + * @cdns: Pointer to controller context structure
>> + *
>> + * Returns 0 on success otherwise negative errno
>> + */
>> +int cdns3_drd_update_mode(struct cdns3 *cdns)
>> +{
>> +	int ret =3D 0;
>> +
>> +	switch (cdns->desired_dr_mode) {
>
>I think we can get rid of desired_dr_mode member in struct cdns.
>Just pass the mode as an argument to cdns3_drd_init_mode()

This will be used also in patch that introduce debugfs. This filed is also =
used=20
during changing dr_mode from user space.

My intention was:
dr_mode - indicated what driver can support, this filed based on dr_mode fr=
om device tree,=20
	     straps bits from otg register and kernel configuration.=20
desired_ dr_mode - the next mode desired by user, changed by debugfs=20
current_dr_mode  - actually selected mode=20

>
>And we already have cdns->dr_mode.
>
>> +	case USB_DR_MODE_PERIPHERAL:
>> +		cdns3_set_mode(cdns, USB_DR_MODE_PERIPHERAL);
>> +		break;
>> +	case USB_DR_MODE_HOST:
>> +		cdns3_set_mode(cdns, USB_DR_MODE_HOST);
>> +		break;
>> +	case USB_DR_MODE_OTG:
>> +		cdns3_init_otg_mode(cdns);
>> +		break;
>> +	default:
>> +		dev_err(cdns->dev, "Unsupported mode of operation %d\n",
>> +			cdns->dr_mode);
>> +		return -EINVAL;
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +irqreturn_t cdns3_drd_irq(struct cdns3 *cdns)
>> +{
>> +	irqreturn_t ret =3D IRQ_NONE;
>> +	u32 reg;
>> +
>> +	if (cdns->dr_mode !=3D USB_DR_MODE_OTG)
>> +		return ret;
>> +
>> +	reg =3D readl(&cdns->otg_regs->ivect);
>> +	if (!reg)
>> +		return ret;
>> +
>> +	if (reg & OTGIEN_ID_CHANGE_INT) {
>> +		int id =3D cdns3_otg_get_id(cdns);
>> +
>> +		dev_dbg(cdns->dev, "OTG IRQ: new ID: %d\n",
>> +			cdns3_otg_get_id(cdns));
>> +
>> +		if (id)
>> +			cdns->role =3D CDNS3_ROLE_GADGET;
>> +		else
>> +			cdns->role =3D CDNS3_ROLE_HOST;
>
>Why check ID and set role here? It might change by the time
>the role_switch_wq starts up. Why not check the ID status there?
>
>Also directly changing role here doesn't make sense as
>there will be a mismatch between currently active role and cdns->role.

Yes this fragment does not make sense. =20
>> +
>> +		queue_work(system_freezable_wq, &cdns->role_switch_wq);
>> +
>> +		ret =3D IRQ_HANDLED;
>> +	}
>> +
>> +	writel(~0, &cdns->otg_regs->ivect);
>> +	return IRQ_HANDLED;
>
>return ret;
>
>> +}
>> +
>> +int cdns3_drd_init(struct cdns3 *cdns)
>> +{
>> +	enum usb_dr_mode dr_mode;
>> +	int ret =3D 0;
>> +	u32 state;
>> +
>> +	state =3D OTGSTS_STRAP(readl(&cdns->otg_regs->sts));
>> +
>> +	dr_mode =3D cdns->dr_mode;
>> +	if (state =3D=3D OTGSTS_STRAP_HOST) {
>> +		dev_info(cdns->dev, "Controller strapped to HOST\n");
>> +		dr_mode =3D USB_DR_MODE_HOST;
>> +		if (cdns->dr_mode !=3D USB_DR_MODE_HOST &&
>> +		    cdns->dr_mode !=3D USB_DR_MODE_OTG)
>> +			ret =3D -EINVAL;
>> +	} else if (state =3D=3D OTGSTS_STRAP_GADGET) {
>> +		dev_info(cdns->dev, "Controller strapped to PERIPHERAL\n");
>> +		dr_mode =3D USB_DR_MODE_PERIPHERAL;
>> +		if (cdns->dr_mode !=3D USB_DR_MODE_PERIPHERAL &&
>> +		    cdns->dr_mode !=3D USB_DR_MODE_OTG)
>> +			ret =3D -EINVAL;
>> +	}
>> +
>> +	if (ret) {
>> +		dev_err(cdns->dev, "Incorrect DRD configuration\n");
>> +		return ret;
>> +	}
>> +
>> +	//Updating DR mode according to strap.
>> +	cdns->dr_mode =3D dr_mode;
>> +	cdns->desired_dr_mode =3D dr_mode;
>> +	cdns->current_dr_mode =3D USB_DR_MODE_UNKNOWN;
>> +
>> +	dev_info(cdns->dev, "Controller Device ID: %08lx, Revision ID: %08lx\n=
",
>> +		 CDNS_RID(readl(&cdns->otg_regs->rid)),
>> +		 CDNS_DID(readl(&cdns->otg_regs->did)));
>
>dev_info should be moved at the end if cdns3_drd_update_mode() if it succe=
eded.
Ok,=20
>
>> +
>> +	state =3D readl(&cdns->otg_regs->sts);
>> +	if (OTGSTS_OTG_NRDY(state) !=3D 0) {
>> +		dev_err(cdns->dev, "Cadence USB3 OTG device not ready\n");
>> +		return -ENODEV;
>> +	}
>> +
>> +	ret =3D cdns3_drd_update_mode(cdns);
>> +
>> +	return ret;
>> +}
>> diff --git a/drivers/usb/cdns3/drd.h b/drivers/usb/cdns3/drd.h
>> new file mode 100644
>> index 000000000000..0faa7520ecac
>> --- /dev/null
>> +++ b/drivers/usb/cdns3/drd.h
>> @@ -0,0 +1,122 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Cadence USB3 DRD part of USBSS driver
>> + *
>> + * Copyright (C) 2018 Cadence.
>> + *
>> + * Author: Pawel Laszczak <pawell@cadence.com>
>> + */
>> +#ifndef __LINUX_CDNS3_DRD
>> +#define __LINUX_CDNS3_DRD
>> +
>> +#include <linux/usb/otg.h>
>> +#include <linux/phy/phy.h>
>> +#include "core.h"
>> +
>> +/*  DRD register interface. */
>> +struct cdns3_otg_regs {
>> +	__le32 did;
>> +	__le32 rid;
>> +	__le32 capabilities;
>> +	__le32 reserved1;
>> +	__le32 cmd;
>> +	__le32 sts;
>> +	__le32 state;
>> +	__le32 reserved2;
>> +	__le32 ien;
>> +	__le32 ivect;
>> +	__le32 refclk;
>> +	__le32 tmr;
>> +	__le32 reserved3[4];
>> +	__le32 simulate;
>> +	__le32 override;
>> +	__le32 susp_ctrl;
>> +	__le32 reserved4;
>> +	__le32 anasts;
>> +	__le32 adp_ramp_time;
>> +	__le32 ctrl1;
>> +	__le32 ctrl2;
>> +};
>> +
>> +/* CDNS_RID - bitmasks */
>> +#define CDNS_RID(p)			((p) & GENMASK(15, 0))
>> +
>> +/* CDNS_VID - bitmasks */
>> +#define CDNS_DID(p)			((p) & GENMASK(31, 0))
>> +
>> +/* OTGCMD - bitmasks */
>> +/* "Request the bus for Device mode. */
>> +#define OTGCMD_DEV_BUS_REQ	BIT(0)
>> +/* Request the bus for Host mode */
>> +#define OTGCMD_HOST_BUS_REQ		BIT(1)
>> +/* Enable OTG mode. */
>> +#define OTGCMD_OTG_EN			BIT(2)
>> +/* Disable OTG mode */
>> +#define OTGCMD_OTG_DIS			BIT(3)
>> +/*"Configure OTG as A-Device. */
>> +#define OTGCMD_A_DEV_EN			BIT(4)
>> +/*"Configure OTG as A-Device. */
>> +#define OTGCMD_A_DEV_DIS		BIT(5)
>> +/* Drop the bus for Device mod	e. */
>> +#define OTGCMD_DEV_BUS_DROP		BIT(8)
>> +/* Drop the bus for Host mode*/
>> +#define OTGCMD_HOST_BUS_DROP		BIT(9)
>> +/* Power Down USBSS-DEV. */
>> +#define OTGCMD_DEV_POWER_OFF		BIT(11)
>> +/* Power Down CDNSXHCI. */
>> +#define OTGCMD_HOST_POWER_OFF		BIT(12)
>> +
>> +/* OTGIEN - bitmasks */
>> +/* ID change interrupt enable */
>> +#define OTGIEN_ID_CHANGE_INT		BIT(0)
>> +/* Vbusvalid fall detected interrupt enable.*/
>> +#define OTGIEN_VBUSVALID_RISE_INT	BIT(4)
>> +/* Vbusvalid fall detected interrupt enable */
>> +#define OTGIEN_VBUSVALID_FALL_INT	BIT(5)
>> +
>> +/* OTGSTS - bitmasks */
>> +/*
>> + * Current value of the ID pin. It is only valid when idpullup in
>> + *  OTGCTRL1_TYPE register is set to '1'.
>> + */
>> +#define OTGSTS_ID_VALUE			BIT(0)
>> +/* Current value of the vbus_valid */
>> +#define OTGSTS_VBUS_VALID		BIT(1)
>> +/* Current value of the b_sess_vld */
>> +#define OTGSTS_SESSION_VALID		BIT(2)
>> +/*Device mode is active*/
>> +#define OTGSTS_DEV_ACTIVE		BIT(3)
>> +/* Host mode is active. */
>> +#define OTGSTS_HOST_ACTIVE		BIT(4)
>> +/* OTG Controller not ready. */
>> +#define OTGSTS_OTG_NRDY_MASK		BIT(11)
>> +#define OTGSTS_OTG_NRDY(p)		((p) & OTGSTS_OTG_NRDY_MASK)
>> +/*
>> + * Value of the strap pins.
>> + * 000 - no default configuration
>> + * 010 - Controller initiall configured as Host
>> + * 100 - Controller initially configured as Device
>> + */
>> +#define OTGSTS_STRAP(p)			(((p) & GENMASK(14, 12)) >> 12)
>> +#define OTGSTS_STRAP_NO_DEFAULT_CFG	0x00
>> +#define OTGSTS_STRAP_HOST_OTG		0x01
>> +#define OTGSTS_STRAP_HOST		0x02
>> +#define OTGSTS_STRAP_GADGET		0x04
>> +/* Host mode is turned on. */
>> +#define OTGSTSE_XHCI_READYF		BIT(26)
>> +/* "Device mode is turned on .*/
>> +#define OTGSTS_DEV_READY		BIT(27)
>> +
>> +/* OTGREFCLK - bitmasks */
>> +#define OTGREFCLK_STB_CLK_SWITCH_EN	BIT(31)
>> +
>> +/* OTGCTRL1 - bitmasks */
>> +#define OTGCTRL1_IDPULLUP		BIT(24)
>> +
>> +int cdns3_is_host(struct cdns3 *cdns);
>> +int cdns3_is_device(struct cdns3 *cdns);
>> +int cdns3_drd_init(struct cdns3 *cdns);
>> +int cdns3_drd_update_mode(struct cdns3 *cdns);
>> +irqreturn_t cdns3_drd_irq(struct cdns3 *cdns);
>> +
>> +#endif /* __LINUX_CDNS3_DRD */
>>
>
>cheers,
>-roger
>--
>Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
>Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

Thanks for all your comments.
Cheers=20
Pawel
