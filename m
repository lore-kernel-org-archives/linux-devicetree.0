From: Pawel Laszczak <pawell@cadence.com>
Subject: RE: [PATCH v9 5/6] usb:cdns3 Add Cadence USB3 DRD Driver
Date: Sat, 10 Aug 2019 20:39:19 +0000
Message-ID: <BYAPR07MB4709B0A4FADFB76183D651DCDDD10@BYAPR07MB4709.namprd07.prod.outlook.com>
References: <1562324238-16655-1-git-send-email-pawell@cadence.com>
 <1562324238-16655-6-git-send-email-pawell@cadence.com>
 <877e8tm25r.fsf@linux.intel.com>
 <BYAPR07MB4709152CB29B6B027ABEB688DDCF0@BYAPR07MB4709.namprd07.prod.outlook.com>
 <8736idnu0q.fsf@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8736idnu0q.fsf@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <felipe.balbi@linux.intel.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "rogerq@ti.com" <rogerq@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, "peter.chen@nxp.com" <peter.chen@nxp.com>, Jayshri Dajiram Pawar <jpawar@cadence.com>, Rahul Kumar <kurahul@cadence.com>
List-Id: devicetree@vger.kernel.org

Hi,

>
>Pawel Laszczak <pawell@cadence.com> writes:
>>>> +static int cdns3_gadget_start(struct cdns3 *cdns)
>>>> +{
>>>> +	struct cdns3_device *priv_dev;
>>>> +	u32 max_speed;
>>>> +	int ret;
>>>> +
>>>> +	priv_dev =3D kzalloc(sizeof(*priv_dev), GFP_KERNEL);
>>>> +	if (!priv_dev)
>>>> +		return -ENOMEM;
>>>> +
>>>> +	cdns->gadget_dev =3D priv_dev;
>>>> +	priv_dev->sysdev =3D cdns->dev;
>>>> +	priv_dev->dev =3D cdns->dev;
>>>> +	priv_dev->regs =3D cdns->dev_regs;
>>>> +
>>>> +	device_property_read_u16(priv_dev->dev, "cdns,on-chip-buff-size",
>>>> +				 &priv_dev->onchip_buffers);
>>>> +
>>>> +	if (priv_dev->onchip_buffers <=3D  0) {
>>>> +		u32 reg =3D readl(&priv_dev->regs->usb_cap2);
>>>> +
>>>> +		priv_dev->onchip_buffers =3D USB_CAP2_ACTUAL_MEM_SIZE(reg);
>>>> +	}
>>>> +
>>>> +	if (!priv_dev->onchip_buffers)
>>>> +		priv_dev->onchip_buffers =3D 256;
>>>> +
>>>> +	max_speed =3D usb_get_maximum_speed(cdns->dev);
>>>> +
>>>> +	/* Check the maximum_speed parameter */
>>>> +	switch (max_speed) {
>>>> +	case USB_SPEED_FULL:
>>>> +	case USB_SPEED_HIGH:
>>>> +	case USB_SPEED_SUPER:
>>>> +		break;
>>>> +	default:
>>>> +		dev_err(cdns->dev, "invalid maximum_speed parameter %d\n",
>>>> +			max_speed);
>>>> +		/* fall through */
>>>> +	case USB_SPEED_UNKNOWN:
>>>> +		/* default to superspeed */
>>>> +		max_speed =3D USB_SPEED_SUPER;
>>>> +		break;
>>>> +	}
>>>> +
>>>> +	/* fill gadget fields */
>>>> +	priv_dev->gadget.max_speed =3D max_speed;
>>>> +	priv_dev->gadget.speed =3D USB_SPEED_UNKNOWN;
>>>> +	priv_dev->gadget.ops =3D &cdns3_gadget_ops;
>>>> +	priv_dev->gadget.name =3D "usb-ss-gadget";
>>>> +	priv_dev->gadget.sg_supported =3D 1;
>>>> +
>>>> +	spin_lock_init(&priv_dev->lock);
>>>> +	INIT_WORK(&priv_dev->pending_status_wq,
>>>> +		  cdns3_pending_setup_status_handler);
>>>> +
>>>> +	/* initialize endpoint container */
>>>> +	INIT_LIST_HEAD(&priv_dev->gadget.ep_list);
>>>> +	INIT_LIST_HEAD(&priv_dev->aligned_buf_list);
>>>> +
>>>> +	ret =3D cdns3_init_eps(priv_dev);
>>>> +	if (ret) {
>>>> +		dev_err(priv_dev->dev, "Failed to create endpoints\n");
>>>> +		goto err1;
>>>> +	}
>>>> +
>>>> +	/* allocate memory for setup packet buffer */
>>>> +	priv_dev->setup_buf =3D dma_alloc_coherent(priv_dev->sysdev, 8,
>>>> +						 &priv_dev->setup_dma, GFP_DMA);
>>>> +	if (!priv_dev->setup_buf) {
>>>> +		ret =3D -ENOMEM;
>>>> +		goto err2;
>>>> +	}
>>>> +
>>>> +	priv_dev->dev_ver =3D readl(&priv_dev->regs->usb_cap6);
>>>> +
>>>> +	dev_dbg(priv_dev->dev, "Device Controller version: %08x\n",
>>>> +		readl(&priv_dev->regs->usb_cap6));
>>>> +	dev_dbg(priv_dev->dev, "USB Capabilities:: %08x\n",
>>>> +		readl(&priv_dev->regs->usb_cap1));
>>>> +	dev_dbg(priv_dev->dev, "On-Chip memory cnfiguration: %08x\n",
>>>> +		readl(&priv_dev->regs->usb_cap2));
>>>> +
>>>> +	priv_dev->dev_ver =3D GET_DEV_BASE_VERSION(priv_dev->dev_ver);
>>>> +
>>>> +	priv_dev->zlp_buf =3D kzalloc(CDNS3_EP_ZLP_BUF_SIZE, GFP_KERNEL);
>>>> +	if (!priv_dev->zlp_buf) {
>>>> +		ret =3D -ENOMEM;
>>>> +		goto err3;
>>>> +	}
>>>> +
>>>> +	/* add USB gadget device */
>>>> +	ret =3D usb_add_gadget_udc(priv_dev->dev, &priv_dev->gadget);
>>>> +	if (ret < 0) {
>>>> +		dev_err(priv_dev->dev,
>>>> +			"Failed to register USB device controller\n");
>>>> +		goto err4;
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +err4:
>>>> +	kfree(priv_dev->zlp_buf);
>>>> +err3:
>>>> +	dma_free_coherent(priv_dev->sysdev, 8, priv_dev->setup_buf,
>>>> +			  priv_dev->setup_dma);
>>>> +err2:
>>>> +	cdns3_free_all_eps(priv_dev);
>>>> +err1:
>>>> +	cdns->gadget_dev =3D NULL;
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +static int __cdns3_gadget_init(struct cdns3 *cdns)
>>>> +{
>>>> +	struct cdns3_device *priv_dev;
>>>> +	int ret =3D 0;
>>>> +
>>>> +	cdns3_drd_switch_gadget(cdns, 1);
>>>> +	pm_runtime_get_sync(cdns->dev);
>>>> +
>>>> +	ret =3D cdns3_gadget_start(cdns);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	priv_dev =3D cdns->gadget_dev;
>>>> +	ret =3D devm_request_threaded_irq(cdns->dev, cdns->dev_irq,
>>>> +					cdns3_device_irq_handler,
>>>> +					cdns3_device_thread_irq_handler,
>>>> +					IRQF_SHARED, dev_name(cdns->dev), cdns);
>>>
>>>copied handlers here for commenting. Note that you don't have
>>>IRQF_ONESHOT:
>>
>> I know, I can't use  IRQF_ ONESHOT flag in this case. I have implemented
>> some code for masking/unmasking interrupts in cdns3_device_irq_handler.
>>
>> Some priority interrupts should be handled ASAP so I can't blocked inter=
rupt
>> Line.
>
>You're completely missing my comment. Your top half should be as short
>as possile. It should only check if current device generated
>interrupts. If it did, then you should wake the thread handler.
>
>This is to improve realtime behavior but not keeping preemption disabled
>for longer than necessary.

Ok, I understand. I will move it to thread handler.

I can't use IRQF_ONESHOT flag because it doesn't work when interrupt line i=
s shared.=20
I have such situation in which one interrupt line is shared with ehci and c=
dns3 driver.=20
In such case this function returns error code.=20

So probably I will need to mask only the reported interrupts.=20
I can't mask all interrupt using controller register because I can miss som=
e of them.=20
After masking all interrupt  the next new event will not be reported in  us=
b_ists, ep_ists=20
registers.

>
>>>> +static irqreturn_t cdns3_device_irq_handler(int irq, void *data)
>>>> +{
>>>> +	struct cdns3_device *priv_dev;
>>>> +	struct cdns3 *cdns =3D data;
>>>> +	irqreturn_t ret =3D IRQ_NONE;
>>>> +	unsigned long flags;
>>>> +	u32 reg;
>>>> +
>>>> +	priv_dev =3D cdns->gadget_dev;
>>>> +	spin_lock_irqsave(&priv_dev->lock, flags);
>>>
>>>the top half handler runs in hardirq context. You don't need any locks
>>>here. Also IRQs are *already* disabled, you don't need to disable them a=
gain.
>>
>> I will remove spin_lock_irqsave but I need to disable only some of the i=
nterrupts.
>> I disable interrupts associated with USB endpoints. Handling of them can=
 be
>> deferred to thread handled.
>
>you should defer all of them to thread. Endpoints or otherwise.

I will do this.=20

Also I remove spin_lock_irqsave(&priv_dev->lock, flags);=20
As I remember it's not needed here.=20

>
>>>> +
>>>> +	/* check USB device interrupt */
>>>> +	reg =3D readl(&priv_dev->regs->usb_ists);
>>>> +
>>>> +	if (reg) {
>>>> +		writel(reg, &priv_dev->regs->usb_ists);
>>>> +		cdns3_check_usb_interrupt_proceed(priv_dev, reg);
>>>> +		ret =3D IRQ_HANDLED;
>>>
>>>now, because you _don't_ mask this interrupt, you're gonna have
>>>issues. Say we actually get both device and endpoint interrupts while
>>>the thread is already running with previous endpoint interrupts. Now
>>>we're gonna reenter the top half, because device interrupts are *not*
>>>masked, which will read usb_ists and handle it here.
>>
>> Endpoint interrupts are masked in cdns3_device_irq_handler and stay mask=
ed
>> until they are not handled in threaded handler.
>
>Quick question, then: these ISTS registers, are they masked interrupt
>status or raw interrupt status?

Yes it's masked, but after masking them the new interrupts will not be repo=
rted=20
In ISTS registers. Form this reason I can mask only reported interrupt.=20

>
>> Of course, not all endpoint interrupts are masked, but only reported in =
ep_ists.
>> USB interrupt will be handled immediately.
>>
>> Also, I can get next endpoint interrupt from not masked endpoint and dri=
ver also again wake
>> the thread. I saw such situation, but threaded interrupt handler has bee=
n working correct
>> in such situations.
>>
>> In thread handler driver checks again which endpoint should be handled i=
n ep_ists.
>>
>> I think that such situation should also occurs during our LPM enter/exit=
 test.
>> So, driver has  been tested for such case. During this test driver durin=
g
>> transferring data generate a huge number of LPM interrupts which
>> are usb interrupts.
>>
>> I can't block usb interrupts interrupts because:
>> /*
>>  * WORKAROUND: CDNS3 controller has issue with hardware resuming
>>  * from L1. To fix it, if any DMA transfer is pending driver
>>  * must starts driving resume signal immediately.
>>  */
>
>I can't see why this would prevent you from defering handling to thread
>handler.
>

I also will  try to move it, but this change can has impact on performance.=
=20

>
>>>> +	if (priv_dev->run_garbage_colector) {
>>>
>>>wait, what?
>>
>> DMA require data buffer aligned to 8 bytes. So, if buffer data is not al=
igned
>> driver allocate aligned buffer for data and copy it from unaligned to
>> Aligned.
>>
>>>
>>>ps: correct spelling is "collector" ;-)
>>
>> Ok, thanks.
>>>
>>>> +		struct cdns3_aligned_buf *buf, *tmp;
>>>> +
>>>> +		list_for_each_entry_safe(buf, tmp, &priv_dev->aligned_buf_list,
>>>> +					 list) {
>>>> +			if (!buf->in_use) {
>>>> +				list_del(&buf->list);
>>>> +
>>>> +				spin_unlock_irqrestore(&priv_dev->lock, flags);
>>>
>>>creates the possibility of a race condition
>> Why? In this place the buf can't be used.
>
>but you're reenabling interrupts, right?

Yes, driver frees not used buffers here.=20
I think that it's the safest place for this purpose.=20

>
>>>> +				dma_free_coherent(priv_dev->sysdev, buf->size,
>>>> +						  buf->buf,
>>>> +						  buf->dma);
>>>> +				spin_lock_irqsave(&priv_dev->lock, flags);
>>>> +
>>>> +				kfree(buf);
>>>
>>>why do you even need this "garbage collector"?
>>
>> I need to free not used memory. The once allocated buffer will be associ=
ated with
>> request, but if request.length will be increased in usb_request then dri=
ver will
>> must allocate the  bigger buffer. As I remember I couldn't call dma_free=
_coherent
>> in interrupt context so I had to move it to thread handled. This flag wa=
s used to avoid
>> going through whole  aligned_buf_list  every time.
>> In most cases this part will never called int this place
>
>Did you try, btw, setting the quirk flag which tells gadget drivers to
>always allocate buffers aligned to MaxPacketSize? Wouldn't that be enough?

If found only  quirk_ep_out_aligned_size flag, but it align only buffer siz=
e.=20

DMA used by this controller must have buffer address aligned to 8.
I think that on most architecture kmalloc should guarantee such aligned.
The problem was detected on NXP testing board. =20
On my board all buffer address are alignment at least to 8. =20

>
>>>> +	TP_printk("%s: req: %p, req buff %p, length: %u/%u %s%s%s, status: %=
d,"
>>>> +		cd   " trb: [start:%d, end:%d: virt addr %pa], flags:%x ",
>>>> +		__get_str(name), __entry->req, __entry->buf, __entry->actual,
>>>> +		__entry->length,
>>>> +		__entry->zero ? "zero | " : "",
>>>> +		__entry->short_not_ok ? "short | " : "",
>>>> +		__entry->no_interrupt ? "no int" : "",
>>>
>>>I guess you didn't really think the formatting through. Think about what
>>>happens if you get a request with only zero flag or only short flag. How
>>>will this log look like?
>>
>> Like this:
>> cdns3_gadget_giveback: ep0: req: 0000000071a6a5f5, req buff 000000008d40=
c4db, length: 60/60 zero | , status: 0, trb: [start:0, end:0:
>virt addr (null)], flags:0
>>
>> Is it something wrong with this?. Maybe one extra sign |.
>
>yes, the extra | :-)
>
>This is one reason why I switched to character flags where a lower case
>character means flag is cleared while uppercase means it's set.

I've made it in this way in v10

--

Thanks
Pawell
