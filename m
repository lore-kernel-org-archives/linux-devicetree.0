From: Pawel Laszczak <pawell@cadence.com>
Subject: RE: [PATCH v9 5/6] usb:cdns3 Add Cadence USB3 DRD Driver
Date: Mon, 15 Jul 2019 11:00:11 +0000
Message-ID: <BYAPR07MB4709152CB29B6B027ABEB688DDCF0@BYAPR07MB4709.namprd07.prod.outlook.com>
References: <1562324238-16655-1-git-send-email-pawell@cadence.com>
 <1562324238-16655-6-git-send-email-pawell@cadence.com>
 <877e8tm25r.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <877e8tm25r.fsf@linux.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <felipe.balbi@linux.intel.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "rogerq@ti.com" <rogerq@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, "peter.chen@nxp.com" <peter.chen@nxp.com>, Jayshri Dajiram Pawar <jpawar@cadence.com>, Rahul Kumar <kurahul@cadence.com>
List-Id: devicetree@vger.kernel.org

Hi Felipe

>
>Hi,
>
>Pawel Laszczak <pawell@cadence.com> writes:
>> +static void cdns3_gadget_config(struct cdns3_device *priv_dev)
>> +{
>> +	struct cdns3_usb_regs __iomem *regs =3D priv_dev->regs;
>> +	u32 reg;
>> +
>> +	cdns3_ep0_config(priv_dev);
>> +
>> +	/* enable interrupts for endpoint 0 (in and out) */
>> +	writel(EP_IEN_EP_OUT0 | EP_IEN_EP_IN0, &regs->ep_ien);
>> +
>> +	/*
>> +	 *Driver need modify LFPS minimal U1 Exit time for 0x00024505 revision
>
>comment style
>
>> +	 * of controller
>> +	 */
>> +	if (priv_dev->dev_ver =3D=3D DEV_VER_TI_V1) {
>
>this version is really only for TI? And there's another only for NXP?

Yes, from driver point of view the only difference for this version is  LFP=
S=20
parameter. It's depend on the kind of used PHY and should be set on=20
integration level. Default value is incorrect for DEV_VER_TI_V1 version and
it cause some issue for  one of the Link Layer test.

>
>+#define DEV_VER_NXP_V1		0x00024502
>+#define DEV_VER_TI_V1		0x00024509
>+#define DEV_VER_V2		0x0002450C
>+#define DEV_VER_V3		0x0002450d
>
>How do you actually decode this?

It's read from register: USB_CAP6
priv_dev->dev_ver =3D readl(&priv_dev->regs->usb_cap6);
But's only 3  less significant  bytes are used as version.=20

>
>> +static int cdns3_gadget_udc_stop(struct usb_gadget *gadget)
>> +{
>> +	struct cdns3_device *priv_dev =3D gadget_to_cdns3_device(gadget);
>> +	struct cdns3_endpoint *priv_ep;
>> +	u32 bEndpointAddress;
>> +	struct usb_ep *ep;
>> +	int ret =3D 0;
>> +
>> +	priv_dev->gadget_driver =3D NULL;
>> +
>> +	priv_dev->onchip_used_size =3D 0;
>> +	priv_dev->out_mem_is_allocated =3D 0;
>> +	priv_dev->gadget.speed =3D USB_SPEED_UNKNOWN;
>> +
>> +	list_for_each_entry(ep, &priv_dev->gadget.ep_list, ep_list) {
>> +		priv_ep =3D ep_to_cdns3_ep(ep);
>> +		bEndpointAddress =3D priv_ep->num | priv_ep->dir;
>> +		cdns3_select_ep(priv_dev, bEndpointAddress);
>> +		writel(EP_CMD_EPRST, &priv_dev->regs->ep_cmd);
>> +		ret =3D cdns3_handshake(&priv_dev->regs->ep_cmd,
>> +				      EP_CMD_EPRST, 0, 100);
>> +		cdns3_free_trb_pool(priv_ep);
>
>are you sure you want to free your trb pool when a gadget driver is
>unloaded? One can easily fragment memory by constantly loading and
>unloading a gadget driver, no?

I think that such constantly loading/unloading will occurs only during=20
testing.
=20
>
>How about you allocate the trb poll during cdns3 load and free it when
>cdns3 is unloaded?

This allocation is made only in cdns3_gadget_ep_enable, so memory=20
is allocated only for  endpoint in use. We save a lot of memory, especially
for streams and ISOC endpoint.=20

Streams support is not implemented now but it will be added as separate
patch in the feature. It will require allocation multiple Transfer Rings.=20

The second issue are ISOC endpoints. For each ITP we need separate TRB.=20
So, for bInterval > 1 driver must allocate the quite big size of Transfer R=
ing. =20

During loading cdns3 we don't know which endpoint and how it will be used.

If someone from customers will complain about current implementation,=20
Then I will try to implement some improvement.=20
=20
>
>> +static int cdns3_gadget_start(struct cdns3 *cdns)
>> +{
>> +	struct cdns3_device *priv_dev;
>> +	u32 max_speed;
>> +	int ret;
>> +
>> +	priv_dev =3D kzalloc(sizeof(*priv_dev), GFP_KERNEL);
>> +	if (!priv_dev)
>> +		return -ENOMEM;
>> +
>> +	cdns->gadget_dev =3D priv_dev;
>> +	priv_dev->sysdev =3D cdns->dev;
>> +	priv_dev->dev =3D cdns->dev;
>> +	priv_dev->regs =3D cdns->dev_regs;
>> +
>> +	device_property_read_u16(priv_dev->dev, "cdns,on-chip-buff-size",
>> +				 &priv_dev->onchip_buffers);
>> +
>> +	if (priv_dev->onchip_buffers <=3D  0) {
>> +		u32 reg =3D readl(&priv_dev->regs->usb_cap2);
>> +
>> +		priv_dev->onchip_buffers =3D USB_CAP2_ACTUAL_MEM_SIZE(reg);
>> +	}
>> +
>> +	if (!priv_dev->onchip_buffers)
>> +		priv_dev->onchip_buffers =3D 256;
>> +
>> +	max_speed =3D usb_get_maximum_speed(cdns->dev);
>> +
>> +	/* Check the maximum_speed parameter */
>> +	switch (max_speed) {
>> +	case USB_SPEED_FULL:
>> +	case USB_SPEED_HIGH:
>> +	case USB_SPEED_SUPER:
>> +		break;
>> +	default:
>> +		dev_err(cdns->dev, "invalid maximum_speed parameter %d\n",
>> +			max_speed);
>> +		/* fall through */
>> +	case USB_SPEED_UNKNOWN:
>> +		/* default to superspeed */
>> +		max_speed =3D USB_SPEED_SUPER;
>> +		break;
>> +	}
>> +
>> +	/* fill gadget fields */
>> +	priv_dev->gadget.max_speed =3D max_speed;
>> +	priv_dev->gadget.speed =3D USB_SPEED_UNKNOWN;
>> +	priv_dev->gadget.ops =3D &cdns3_gadget_ops;
>> +	priv_dev->gadget.name =3D "usb-ss-gadget";
>> +	priv_dev->gadget.sg_supported =3D 1;
>> +
>> +	spin_lock_init(&priv_dev->lock);
>> +	INIT_WORK(&priv_dev->pending_status_wq,
>> +		  cdns3_pending_setup_status_handler);
>> +
>> +	/* initialize endpoint container */
>> +	INIT_LIST_HEAD(&priv_dev->gadget.ep_list);
>> +	INIT_LIST_HEAD(&priv_dev->aligned_buf_list);
>> +
>> +	ret =3D cdns3_init_eps(priv_dev);
>> +	if (ret) {
>> +		dev_err(priv_dev->dev, "Failed to create endpoints\n");
>> +		goto err1;
>> +	}
>> +
>> +	/* allocate memory for setup packet buffer */
>> +	priv_dev->setup_buf =3D dma_alloc_coherent(priv_dev->sysdev, 8,
>> +						 &priv_dev->setup_dma, GFP_DMA);
>> +	if (!priv_dev->setup_buf) {
>> +		ret =3D -ENOMEM;
>> +		goto err2;
>> +	}
>> +
>> +	priv_dev->dev_ver =3D readl(&priv_dev->regs->usb_cap6);
>> +
>> +	dev_dbg(priv_dev->dev, "Device Controller version: %08x\n",
>> +		readl(&priv_dev->regs->usb_cap6));
>> +	dev_dbg(priv_dev->dev, "USB Capabilities:: %08x\n",
>> +		readl(&priv_dev->regs->usb_cap1));
>> +	dev_dbg(priv_dev->dev, "On-Chip memory cnfiguration: %08x\n",
>> +		readl(&priv_dev->regs->usb_cap2));
>> +
>> +	priv_dev->dev_ver =3D GET_DEV_BASE_VERSION(priv_dev->dev_ver);
>> +
>> +	priv_dev->zlp_buf =3D kzalloc(CDNS3_EP_ZLP_BUF_SIZE, GFP_KERNEL);
>> +	if (!priv_dev->zlp_buf) {
>> +		ret =3D -ENOMEM;
>> +		goto err3;
>> +	}
>> +
>> +	/* add USB gadget device */
>> +	ret =3D usb_add_gadget_udc(priv_dev->dev, &priv_dev->gadget);
>> +	if (ret < 0) {
>> +		dev_err(priv_dev->dev,
>> +			"Failed to register USB device controller\n");
>> +		goto err4;
>> +	}
>> +
>> +	return 0;
>> +err4:
>> +	kfree(priv_dev->zlp_buf);
>> +err3:
>> +	dma_free_coherent(priv_dev->sysdev, 8, priv_dev->setup_buf,
>> +			  priv_dev->setup_dma);
>> +err2:
>> +	cdns3_free_all_eps(priv_dev);
>> +err1:
>> +	cdns->gadget_dev =3D NULL;
>> +	return ret;
>> +}
>> +
>> +static int __cdns3_gadget_init(struct cdns3 *cdns)
>> +{
>> +	struct cdns3_device *priv_dev;
>> +	int ret =3D 0;
>> +
>> +	cdns3_drd_switch_gadget(cdns, 1);
>> +	pm_runtime_get_sync(cdns->dev);
>> +
>> +	ret =3D cdns3_gadget_start(cdns);
>> +	if (ret)
>> +		return ret;
>> +
>> +	priv_dev =3D cdns->gadget_dev;
>> +	ret =3D devm_request_threaded_irq(cdns->dev, cdns->dev_irq,
>> +					cdns3_device_irq_handler,
>> +					cdns3_device_thread_irq_handler,
>> +					IRQF_SHARED, dev_name(cdns->dev), cdns);
>
>copied handlers here for commenting. Note that you don't have
>IRQF_ONESHOT:

I know, I can't use  IRQF_ ONESHOT flag in this case. I have implemented=20
some code for masking/unmasking interrupts in cdns3_device_irq_handler.

Some priority interrupts should be handled ASAP so I can't blocked interrup=
t=20
Line.=20

>
>> +static irqreturn_t cdns3_device_irq_handler(int irq, void *data)
>> +{
>> +	struct cdns3_device *priv_dev;
>> +	struct cdns3 *cdns =3D data;
>> +	irqreturn_t ret =3D IRQ_NONE;
>> +	unsigned long flags;
>> +	u32 reg;
>> +
>> +	priv_dev =3D cdns->gadget_dev;
>> +	spin_lock_irqsave(&priv_dev->lock, flags);
>
>the top half handler runs in hardirq context. You don't need any locks
>here. Also IRQs are *already* disabled, you don't need to disable them aga=
in.

I will remove spin_lock_irqsave but I need to disable only some of the inte=
rrupts.=20
I disable interrupts associated with USB endpoints. Handling of them can be=
=20
deferred to thread handled.=20

>> +
>> +	/* check USB device interrupt */
>> +	reg =3D readl(&priv_dev->regs->usb_ists);
>> +
>> +	if (reg) {
>> +		writel(reg, &priv_dev->regs->usb_ists);
>> +		cdns3_check_usb_interrupt_proceed(priv_dev, reg);
>> +		ret =3D IRQ_HANDLED;
>
>now, because you _don't_ mask this interrupt, you're gonna have
>issues. Say we actually get both device and endpoint interrupts while
>the thread is already running with previous endpoint interrupts. Now
>we're gonna reenter the top half, because device interrupts are *not*
>masked, which will read usb_ists and handle it here.

Endpoint interrupts are masked in cdns3_device_irq_handler and stay masked
until they are not handled in threaded handler.=20
Of course, not all endpoint interrupts are masked, but only reported in ep_=
ists.
USB interrupt will be handled immediately.=20

Also, I can get next endpoint interrupt from not masked endpoint and driver=
 also again wake=20
the thread. I saw such situation, but threaded interrupt handler has been w=
orking correct
in such situations.

In thread handler driver checks again which endpoint should be handled in e=
p_ists.=20

I think that such situation should also occurs during our LPM enter/exit te=
st.=20
So, driver has  been tested for such case. During this test driver during=20
transferring data generate a huge number of LPM interrupts which=20
are usb interrupts.

I can't block usb interrupts interrupts because:
/*
 * WORKAROUND: CDNS3 controller has issue with hardware resuming
 * from L1. To fix it, if any DMA transfer is pending driver
 * must starts driving resume signal immediately.
 */


>
>Then it will ahead and read ep_ists and wake the thread that's already
>running.
>
>This hasn't really been tested, has it?

It has been tested. And I've haven't seen any issue with this.

>
>> +static irqreturn_t cdns3_device_thread_irq_handler(int irq, void *data)
>> +{
>> +	struct cdns3_device *priv_dev;
>> +	struct cdns3 *cdns =3D data;
>> +	irqreturn_t ret =3D IRQ_NONE;
>> +	unsigned long flags;
>> +	u32 ep_ien;
>> +	int bit;
>> +	u32 reg;
>> +
>> +	priv_dev =3D cdns->gadget_dev;
>> +	spin_lock_irqsave(&priv_dev->lock, flags);
>
>Ideally, the _irqsave() here wouldn't be necessary (since this device's
>interrupts are already masked), but removing _irqsave() causes problem
>with networking gadgets. Just thought I'd leave a note here, nothing to
>change in this handler.
>
>> +	reg =3D readl(&priv_dev->regs->ep_ists);
>> +
>> +	/* handle default endpoint OUT */
>> +	if (reg & EP_ISTS_EP_OUT0) {
>> +		cdns3_check_ep0_interrupt_proceed(priv_dev, USB_DIR_OUT);
>> +		ret =3D IRQ_HANDLED;
>> +	}
>> +
>> +	/* handle default endpoint IN */
>> +	if (reg & EP_ISTS_EP_IN0) {
>> +		cdns3_check_ep0_interrupt_proceed(priv_dev, USB_DIR_IN);
>> +		ret =3D IRQ_HANDLED;
>> +	}
>> +
>> +	/* check if interrupt from non default endpoint, if no exit */
>> +	reg &=3D ~(EP_ISTS_EP_OUT0 | EP_ISTS_EP_IN0);
>> +	if (!reg)
>> +		goto irqend;
>> +
>> +	for_each_set_bit(bit, (unsigned long *)&reg,
>> +			 sizeof(u32) * BITS_PER_BYTE) {
>> +		priv_dev->shadow_ep_en |=3D BIT(bit);
>> +		cdns3_check_ep_interrupt_proceed(priv_dev->eps[bit]);
>> +		ret =3D IRQ_HANDLED;
>> +	}
>> +
>> +	if (priv_dev->run_garbage_colector) {
>
>wait, what?

DMA require data buffer aligned to 8 bytes. So, if buffer data is not align=
ed=20
driver allocate aligned buffer for data and copy it from unaligned to=20
Aligned. =20

>
>ps: correct spelling is "collector" ;-)

Ok, thanks.=20
>
>> +		struct cdns3_aligned_buf *buf, *tmp;
>> +
>> +		list_for_each_entry_safe(buf, tmp, &priv_dev->aligned_buf_list,
>> +					 list) {
>> +			if (!buf->in_use) {
>> +				list_del(&buf->list);
>> +
>> +				spin_unlock_irqrestore(&priv_dev->lock, flags);
>
>creates the possibility of a race condition
Why? In this place the buf can't be used.=20
>
>> +				dma_free_coherent(priv_dev->sysdev, buf->size,
>> +						  buf->buf,
>> +						  buf->dma);
>> +				spin_lock_irqsave(&priv_dev->lock, flags);
>> +
>> +				kfree(buf);
>
>why do you even need this "garbage collector"?

I need to free not used memory. The once allocated buffer will be associate=
d with
request, but if request.length will be increased in usb_request then driver=
 will =20
must allocate the  bigger buffer. As I remember I couldn't call dma_free_co=
herent
in interrupt context so I had to move it to thread handled. This flag was u=
sed to avoid
going through whole  aligned_buf_list  every time.=20
In most cases this part will never called int this place=20
>
>> +static int cdns3_gadget_suspend(struct cdns3 *cdns, bool do_wakeup)
>> +{
>> +	cdns3_gadget_exit(cdns);
>
>so on suspend you completely teardown the entire controller? This means
>that a mounted mass storage gadget will, actually, disconnect from the
>host, no?

Yes It's true. I know that it's not good idea.=20
I will try to improve it.=20

>
>> diff --git a/drivers/usb/cdns3/trace.h b/drivers/usb/cdns3/trace.h
>> new file mode 100644
>> index 000000000000..1cc2abca320c
>> --- /dev/null
>> +++ b/drivers/usb/cdns3/trace.h
>> @@ -0,0 +1,447 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * USBSS device controller driver.
>> + * Trace support header file.
>> + *
>> + * Copyright (C) 2018 Cadence.
>> + *
>> + * Author: Pawel Laszczak <pawell@cadence.com>
>> + */
>> +
>> +#undef TRACE_SYSTEM
>> +#define TRACE_SYSTEM cdns3
>> +
>> +#if !defined(__LINUX_CDNS3_TRACE) || defined(TRACE_HEADER_MULTI_READ)
>> +#define __LINUX_CDNS3_TRACE
>> +
>> +#include <linux/types.h>
>> +#include <linux/tracepoint.h>
>> +#include <asm/byteorder.h>
>> +#include <linux/usb/ch9.h>
>> +#include "core.h"
>> +#include "gadget.h"
>> +#include "debug.h"
>> +
>> +#define CDNS3_MSG_MAX	500
>> +
>> +TRACE_EVENT(cdns3_log,
>> +	TP_PROTO(struct cdns3_device *priv_dev, struct va_format *vaf),
>> +	TP_ARGS(priv_dev, vaf),
>> +	TP_STRUCT__entry(
>> +		__string(name, dev_name(priv_dev->dev))
>> +		__dynamic_array(char, msg, CDNS3_MSG_MAX)
>> +	),
>> +	TP_fast_assign(
>> +		__assign_str(name, dev_name(priv_dev->dev));
>> +		vsnprintf(__get_str(msg), CDNS3_MSG_MAX, vaf->fmt, *vaf->va);
>> +	),
>> +	TP_printk("%s: %s", __get_str(name), __get_str(msg))
>> +);
>> +
>> +DECLARE_EVENT_CLASS(cdns3_log_doorbell,
>> +	TP_PROTO(const char *ep_name, u32 ep_trbaddr),
>> +	TP_ARGS(ep_name, ep_trbaddr),
>> +	TP_STRUCT__entry(
>> +		__string(name, ep_name)
>> +		__field(u32, ep_trbaddr)
>> +	),
>> +	TP_fast_assign(
>> +		__assign_str(name, ep_name);
>> +		__entry->ep_trbaddr =3D ep_trbaddr;
>> +	),
>> +	TP_printk("%s, ep_trbaddr %08x", __get_str(name),
>
>nit-picking but... the event name will be printed on trace log. You
>don't need this "Ding Dong" string here :-p

I will remove it:

>
>> +	TP_printk("%s: req: %p, req buff %p, length: %u/%u %s%s%s, status: %d,=
"
>> +		cd   " trb: [start:%d, end:%d: virt addr %pa], flags:%x ",
>> +		__get_str(name), __entry->req, __entry->buf, __entry->actual,
>> +		__entry->length,
>> +		__entry->zero ? "zero | " : "",
>> +		__entry->short_not_ok ? "short | " : "",
>> +		__entry->no_interrupt ? "no int" : "",
>
>I guess you didn't really think the formatting through. Think about what
>happens if you get a request with only zero flag or only short flag. How
>will this log look like?

Like this:
cdns3_gadget_giveback: ep0: req: 0000000071a6a5f5, req buff 000000008d40c4d=
b, length: 60/60 zero | , status: 0, trb: [start:0, end:0: virt addr (null)=
], flags:0

Is it something wrong with this?. Maybe one extra sign |.

Pawell
