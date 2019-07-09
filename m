From: Pawel Laszczak <pawell@cadence.com>
Subject: RE: [PATCH v9 5/6] usb:cdns3 Add Cadence USB3 DRD Driver
Date: Tue, 9 Jul 2019 04:23:03 +0000
Message-ID: <BYAPR07MB47094B372CEC6DFD25FC78E1DDF10@BYAPR07MB4709.namprd07.prod.outlook.com>
References: <1562324238-16655-1-git-send-email-pawell@cadence.com>
 <1562324238-16655-6-git-send-email-pawell@cadence.com>
 <87r274lmqk.fsf@linux.intel.com>
 <BYAPR07MB4709EF3753AC0B87606B1182DDF70@BYAPR07MB4709.namprd07.prod.outlook.com>
 <87a7dpm442.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87a7dpm442.fsf@linux.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <felipe.balbi@linux.intel.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "rogerq@ti.com" <rogerq@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, "peter.chen@nxp.com" <peter.chen@nxp.com>, Jayshri Dajiram Pawar <jpawar@cadence.com>, Rahul Kumar <kurahul@cadence.com>
List-Id: devicetree@vger.kernel.org

>Hi,
>
>Pawel Laszczak <pawell@cadence.com> writes:
>>>> +void cdns3_role_stop(struct cdns3 *cdns)
>>>
>>>not static? Why is it so that _start() is static but _stop() is not?
>>>Looks fishy
>>
>> This function is used in cdns3_role_stop in debugfs.c file so it can't
>> be static.
>
>it's still super fishy. Why don't you need _start() from debugfs.c? In
>any case, the role framework would remove the need for any of this, I
>suppose.

Yes, I'm going to use the role framework so it will be probably changed.=20
>
>>>> +static int cdns3_idle_role_start(struct cdns3 *cnds)
>>>> +{	/* Hold PHY in RESET */
>>>
>>>huh?
>>>
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static void cdns3_idle_role_stop(struct cdns3 *cnds)
>>>> +{
>>>> +	/* Program Lane swap and bring PHY out of RESET */
>>>
>>>double huh?
>>>
>>
>> These functions were added for consistency with FSM described in control=
ler specification.
>> Yes, I know that you don't like empty functions :), but it could be help=
ful in
>> understanding how this controller work.
>
>frankly, it really doesn't. An empty function doesn't really help IMHO.

I will change it.
>
>>>> +static const char *const cdns3_mode[] =3D {
>>>> +	[USB_DR_MODE_UNKNOWN]		=3D "unknown",
>>>> +	[USB_DR_MODE_OTG]		=3D "otg",
>>>> +	[USB_DR_MODE_HOST]		=3D "host",
>>>> +	[USB_DR_MODE_PERIPHERAL]	=3D "device",
>>>> +};
>>>
>>>don't we have a generic version of this under usb/common ?
>>>
>> Yes, there is a similar array, but it is defined also as static
>> and there is no function for converting value to string.
>> There is only function for converting string to value.
>
>right. You can add the missing interface generically instead of
>duplicating the enumeration.

Patch adding such extension has posted.=20

>
>> There is also:
>> [USB_DR_MODE_UNKNOWN]		=3D "",
>> Instead of:
>> [USB_DR_MODE_UNKNOWN]		=3D "unknown",
>>
>> So, for USB_DR_MODE_UNKNOWN user will not see anything information.
>
>But that's what "unknown" means :-) We don't know the information.
>
>>>> +static irqreturn_t cdns3_drd_irq(int irq, void *data)
>>>> +{
>>>> +	irqreturn_t ret =3D IRQ_NONE;
>>>> +	struct cdns3 *cdns =3D data;
>>>> +	u32 reg;
>>>> +
>>>> +	if (cdns->dr_mode !=3D USB_DR_MODE_OTG)
>>>> +		return ret;
>>>> +
>>>> +	reg =3D readl(&cdns->otg_regs->ivect);
>>>> +
>>>> +	if (!reg)
>>>> +		return ret;
>>>> +
>>>> +	if (reg & OTGIEN_ID_CHANGE_INT) {
>>>> +		dev_dbg(cdns->dev, "OTG IRQ: new ID: %d\n",
>>>> +			cdns3_get_id(cdns));
>>>> +
>>>> +		ret =3D IRQ_HANDLED;
>>>> +	}
>>>> +
>>>> +	if (reg & (OTGIEN_VBUSVALID_RISE_INT | OTGIEN_VBUSVALID_FALL_INT)) {
>>>> +		dev_dbg(cdns->dev, "OTG IRQ: new VBUS: %d\n",
>>>> +			cdns3_get_vbus(cdns));
>>>> +
>>>> +		ret =3D IRQ_HANDLED;
>>>> +	}
>>>> +
>>>> +	if (ret =3D=3D IRQ_HANDLED)
>>>> +		queue_work(system_freezable_wq, &cdns->role_switch_wq);
>>>> +
>>>> +	writel(~0, &cdns->otg_regs->ivect);
>>>> +	return ret;
>>>> +}
>>>
>>>seems like you could use threaded irq to avoid this workqueue.
>>
>>
>> This function is also called in cdns3_mode_write (debugfs.c file),
>> therefor after changing it to threaded irq I will still need workqueue.
>
>Why? debugfs writes are not atomic. They run in process context, right?
>Just don't disable interrupts while running this and you should be fine.

Yes, It should work.=20

>
>>>> +	cdns->desired_dr_mode =3D cdns->dr_mode;
>>>> +	cdns->current_dr_mode =3D USB_DR_MODE_UNKNOWN;
>>>> +
>>>> +	ret =3D devm_request_threaded_irq(cdns->dev, cdns->otg_irq,
>>>> +					cdns3_drd_irq,
>>>> +					NULL, IRQF_SHARED,
>>>
>>>if you don't have a threaded handler, you should set IRQF_ONESHOT. I
>>>would prefer if you implement a threaded handler that doesn't require
>>>IRQF_ONESHOT, though.
>>>
>>
>> IRQF_ONESHOT can be used  only in threaded handled.
>> "
>>  * IRQF_ONESHOT - Interrupt is not reenabled after the hardirq handler f=
inished.
>>  *                Used by threaded interrupts which need to keep the
>>  *                irq line disabled until the threaded handler has been =
run.
>> "
>
>so?

I don't understand why If I don't have threaded handler why I need IRQF_ONE=
SHOT.=20
Why interrupt cannot be reenabled after hardirq handler finished ?
I do not use threaded handler so this flag seem unnecessary.=20

>
>>>> +	} else {
>>>> +		struct usb_request *request;
>>>> +
>>>> +		if (priv_dev->eps[index]->flags & EP_WEDGE) {
>>>> +			cdns3_select_ep(priv_dev, 0x00);
>>>> +			return 0;
>>>> +		}
>>>> +
>>>> +		cdns3_dbg(priv_ep->cdns3_dev, "Clear Stalled endpoint %s\n",
>>>> +			  priv_ep->name);
>>>
>>>why do you need your own wrapper around dev_dbg()? This looks quite unne=
cessary.
>>
>> It's generic function used for adding message to trace.log.  It's not wr=
apper to dev_dbg
>>
>> void cdns3_dbg(struct cdns3_device *priv_dev, const char *fmt, ...)
>> {
>> 	struct va_format vaf;
>> 	va_list args;
>>
>> 	va_start(args, fmt);
>> 	vaf.fmt =3D fmt;
>> 	vaf.va =3D &args;
>> 	trace_cdns3_log(priv_dev, &vaf);
>> 	va_end(args);
>> }
>
>oh. Don't do it like that. Add a proper trace event that actually
>decodes the information you want. These random messages will give you
>trouble in the future. I had this sort of construct in dwc3 for a while
>and it became clear that it's a bad idea. It's best to have trace events
>that decode information coming from the HW. That way your trace logs
>have a "predictable" shape/format and you can easily find problem areas.

Ok , I will change this.
I used such solution because I didn't want to create to many trace events.=
=20
I used it only for rely used messages.=20

Thanks,
Regards
Pawel

>
>--
>balbi
