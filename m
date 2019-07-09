From: Pawel Laszczak <pawell@cadence.com>
Subject: RE: [PATCH v9 5/6] usb:cdns3 Add Cadence USB3 DRD Driver
Date: Tue, 9 Jul 2019 07:07:30 +0000
Message-ID: <BYAPR07MB47092C1E19FD36FB336A55C2DDF10@BYAPR07MB4709.namprd07.prod.outlook.com>
References: <1562324238-16655-1-git-send-email-pawell@cadence.com>
 <1562324238-16655-6-git-send-email-pawell@cadence.com>
 <87r274lmqk.fsf@linux.intel.com>
 <BYAPR07MB4709EF3753AC0B87606B1182DDF70@BYAPR07MB4709.namprd07.prod.outlook.com>
 <87a7dpm442.fsf@linux.intel.com>
 <BYAPR07MB47094B372CEC6DFD25FC78E1DDF10@BYAPR07MB4709.namprd07.prod.outlook.com>
 <87pnmj67ee.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87pnmj67ee.fsf@linux.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <felipe.balbi@linux.intel.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "rogerq@ti.com" <rogerq@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, "peter.chen@nxp.com" <peter.chen@nxp.com>, Jayshri Dajiram Pawar <jpawar@cadence.com>, Rahul Kumar <kurahul@cadence.com>
List-Id: devicetree@vger.kernel.org

>
>Hi,
>
>Pawel Laszczak <pawell@cadence.com> writes:
>>>> IRQF_ONESHOT can be used  only in threaded handled.
>>>> "
>>>>  * IRQF_ONESHOT - Interrupt is not reenabled after the hardirq handler=
 finished.
>>>>  *                Used by threaded interrupts which need to keep the
>>>>  *                irq line disabled until the threaded handler has bee=
n run.
>>>> "
>>>
>>>so?
>>
>> I don't understand why If I don't have threaded handler why I need IRQF_=
ONESHOT.
>> Why interrupt cannot be reenabled after hardirq handler finished ?
>> I do not use threaded handler so this flag seem unnecessary.
>
>Unless this has changed over the years, it was a requirement from IRQ susb=
ystem.
>
>	/*
>	 * Drivers are often written to work w/o knowledge about the
>	 * underlying irq chip implementation, so a request for a
>	 * threaded irq without a primary hard irq context handler
>	 * requires the ONESHOT flag to be set. Some irq chips like
>	 * MSI based interrupts are per se one shot safe. Check the
>	 * chip flags, so we can avoid the unmask dance at the end of
>	 * the threaded handler for those.
>	 */
>	if (desc->irq_data.chip->flags & IRQCHIP_ONESHOT_SAFE)
>		new->flags &=3D ~IRQF_ONESHOT;

>From description I understand that it should be set when driver uses only=20
threaded handler without hard irq handler.
eg.=20

	ret =3D devm_request_threaded_irq(dev, data->usb_id_irq,
					NULL, int3496_thread_isr,
					IRQF_SHARED | IRQF_ONESHOT |
					IRQF_TRIGGER_RISING |
					IRQF_TRIGGER_FALLING,
					dev_name(dev), data);

It make sense, we don't have hard irq handler so we can't clear source of i=
nterrupt.=20
If we clear it immediately in interrupt controller then the same interrupt =
could=20
be raised again, because it was not cleared e.g in controller register.=20


>>>>>> +	} else {
>>>>>> +		struct usb_request *request;
>>>>>> +
>>>>>> +		if (priv_dev->eps[index]->flags & EP_WEDGE) {
>>>>>> +			cdns3_select_ep(priv_dev, 0x00);
>>>>>> +			return 0;
>>>>>> +		}
>>>>>> +
>>>>>> +		cdns3_dbg(priv_ep->cdns3_dev, "Clear Stalled endpoint %s\n",
>>>>>> +			  priv_ep->name);
>>>>>
>>>>>why do you need your own wrapper around dev_dbg()? This looks quite un=
necessary.
>>>>
>>>> It's generic function used for adding message to trace.log.  It's not =
wrapper to dev_dbg
>>>>
>>>> void cdns3_dbg(struct cdns3_device *priv_dev, const char *fmt, ...)
>>>> {
>>>> 	struct va_format vaf;
>>>> 	va_list args;
>>>>
>>>> 	va_start(args, fmt);
>>>> 	vaf.fmt =3D fmt;
>>>> 	vaf.va =3D &args;
>>>> 	trace_cdns3_log(priv_dev, &vaf);
>>>> 	va_end(args);
>>>> }
>>>
>>>oh. Don't do it like that. Add a proper trace event that actually
>>>decodes the information you want. These random messages will give you
>>>trouble in the future. I had this sort of construct in dwc3 for a while
>>>and it became clear that it's a bad idea. It's best to have trace events
>>>that decode information coming from the HW. That way your trace logs
>>>have a "predictable" shape/format and you can easily find problem areas.
>>
>> Ok , I will change this.
>> I used such solution because I didn't want to create to many trace event=
s.
>> I used it only for rely used messages.
>
>If you have these messages that are *really* needed, then you should add
>a trace event for it. Look at the events we have on dwc3 if you need
>some inspiration. Could also look at the history of our trace events to
>figure out how things changed over time.
>
>cheers
>
>--
>balbi
