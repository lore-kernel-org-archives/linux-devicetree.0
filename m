From: Pawel Laszczak <pawell@cadence.com>
Subject: RE: [PATCH v9 5/6] usb:cdns3 Add Cadence USB3 DRD Driver
Date: Mon, 12 Aug 2019 09:13:56 +0000
Message-ID: <BYAPR07MB4709C07ED94C952886858F14DDD30@BYAPR07MB4709.namprd07.prod.outlook.com>
References: <1562324238-16655-1-git-send-email-pawell@cadence.com>
 <1562324238-16655-6-git-send-email-pawell@cadence.com>
 <877e8tm25r.fsf@linux.intel.com>
 <BYAPR07MB4709152CB29B6B027ABEB688DDCF0@BYAPR07MB4709.namprd07.prod.outlook.com>
 <8736idnu0q.fsf@gmail.com>
 <BYAPR07MB4709B0A4FADFB76183D651DCDDD10@BYAPR07MB4709.namprd07.prod.outlook.com>
 <87k1bjvtvi.fsf@gmail.com>
 <BYAPR07MB470926DA6241B54FC5AF3C2ADDD30@BYAPR07MB4709.namprd07.prod.outlook.com>
 <87imr2u77c.fsf@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87imr2u77c.fsf@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <felipe.balbi@linux.intel.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "rogerq@ti.com" <rogerq@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, "peter.chen@nxp.com" <peter.chen@nxp.com>, Jayshri Dajiram Pawar <jpawar@cadence.com>, Rahul Kumar <kurahul@cadence.com>
List-Id: devicetree@vger.kernel.org

Hi,

>
>Pawel Laszczak <pawell@cadence.com> writes:
>>>> I have such situation in which one interrupt line is shared with ehci =
and cdns3 driver.
>>>> In such case this function returns error code.
>>>
>>>which function returns error code?
>>
>> devm_request_threaded_irq, of course if I set IRQF_SHARED | IRQF_ONESHOT=
.
>> As I remember it was EBUSY error.
>
>oh, right. That's probably because the handlers must agree on IRQ flags.
>
>>>> So probably I will need to mask only the reported interrupts.
>>>
>>>you should mask all interrupts from your device, otherwise you top-halt
>>>may still end up reentrant.
>>>
>>>> I can't mask all interrupt using controller register because I can mis=
s some of them.
>>>
>>>why would you miss them? They would be left in the register until you
>>>unmask them and the line is raised again.
>>
>> I consult this with author of controller.
>> We have:
>> USB_IEN  and USB_ISTS for  generic interrupts
>> EP_IEN and EP_ISTS for endpoint interrupts
>>
>> Both these group works different.
>> For endpoint I can disable all interrupt and I don't miss any of them.
>> So it's normal behavior.
>>
>> But USB_ISTS work little different. If we mask all interrupt in USB_IEN
>> then when new event occurs the EP_ISTS will not be updated.
>
>wait a minute. When you mask USB_ISTS, then EP_ISTS isn't updated? Is
>this a quirk on the controller or a design choice?
>
>> It's not standard and not expected behavior but it works in this way.
>
>Yeah, sounds rather odd.
>

Oh no. My mistake.  Of course I mean USB_ISTS.

If we mask all interrupt in USB_IEN
then when new event occurs the USB_ISTS will not be updated.

>>>>>>>> +	/* check USB device interrupt */
>>>>>>>> +	reg =3D readl(&priv_dev->regs->usb_ists);
>>>>>>>> +
>>>>>>>> +	if (reg) {
>>>>>>>> +		writel(reg, &priv_dev->regs->usb_ists);
>>>>>>>> +		cdns3_check_usb_interrupt_proceed(priv_dev, reg);
>>>>>>>> +		ret =3D IRQ_HANDLED;
>>>>>>>
>>>>>>>now, because you _don't_ mask this interrupt, you're gonna have
>>>>>>>issues. Say we actually get both device and endpoint interrupts whil=
e
>>>>>>>the thread is already running with previous endpoint interrupts. Now
>>>>>>>we're gonna reenter the top half, because device interrupts are *not=
*
>>>>>>>masked, which will read usb_ists and handle it here.
>>>>>>
>>>>>> Endpoint interrupts are masked in cdns3_device_irq_handler and stay =
masked
>>>>>> until they are not handled in threaded handler.
>>>>>
>>>>>Quick question, then: these ISTS registers, are they masked interrupt
>>>>>status or raw interrupt status?
>>>>
>>>> Yes it's masked, but after masking them the new interrupts will not be=
 reported
>>>> In ISTS registers. Form this reason I can mask only reported interrupt=
.
>>>
>>>and what happens when you unmask the registers? Do they get reported?
>>
>> No they are not reported in case of USB_ISTS register.
>> They should be reported in case EP_ISTS, but I need to test it.
>
>okay, please _do_ test and verify the behavior. The description above
>sounds really surprising to me. Does it really mean that if you mask all
>USB_ISTS and then disconnect the cable while interrupt is masked, you
>won't know cable was disconnected?

Yes, exactly.=20

Initially I've tested it and it's work correct.=20
I can even simply write 0 to EP_IEN in hard irq and ~0 in thread handler.=20
It's simplest and sufficient way. =20

>
>>>>>>>> +		struct cdns3_aligned_buf *buf, *tmp;
>>>>>>>> +
>>>>>>>> +		list_for_each_entry_safe(buf, tmp, &priv_dev->aligned_buf_list,
>>>>>>>> +					 list) {
>>>>>>>> +			if (!buf->in_use) {
>>>>>>>> +				list_del(&buf->list);
>>>>>>>> +
>>>>>>>> +				spin_unlock_irqrestore(&priv_dev->lock, flags);
>>>>>>>
>>>>>>>creates the possibility of a race condition
>>>>>> Why? In this place the buf can't be used.
>>>>>
>>>>>but you're reenabling interrupts, right?
>>>>
>>>> Yes, driver frees not used buffers here.
>>>> I think that it's the safest place for this purpose.
>>>
>>>I guess you missed the point a little. Since you reenable interrupts
>>>just to free the buffer, you end up creating the possibility for a race
>>>condition. Specially since you don't mask all interrupt events. The
>>>moment you reenable interrupts, one of your not-unmasked interrupt
>>>sources could trigger, then top-half gets scheduled which tries to wake
>>>up the IRQ thread again and things go boom.
>>
>> Ok, I think I understand.  So I have 3 options:
>> 1. Mask the USB_IEN and EP_IEN interrupts, but then I can lost some USB_=
ISTS
>> events. It's dangerous options.
>
>sure sounds dangerous, but also sounds quite "peculiar" :-)
>
>> 2. Remove implementation of handling unaligned buffers and assume that
>>     upper layer will worry about this. What with vendor specific drivers=
 that
>>     can be used by companies and not upstreamed  ?
>>     It could be good to have such safety mechanism even if it is not cur=
rently used.
>
>dunno. It may become dead code that's NEVER used :-)
>
>> 3. Delegate this part of code for instance to separate thread that will =
be called
>>    In free time.
>
>Yet another thread? Can't you just run this right before giving back the
>USB request? So, don't do it from IRQ handler, but from giveback path?

Do you mean in:
	if (request->complete) {
		spin_unlock(&priv_dev->lock);
		if (priv_dev->run_garbage_collector) {
			....
		}
		usb_gadget_giveback_request(&priv_ep->endpoint,
					    request);
		spin_lock(&priv_dev->lock);
	}
??

I ask because this is finally also called from IRQ handler:

cdns3_device_thread_irq_handler
    -> cdns3_check_ep_interrupt_proceed
        -> cdns3_transfer_completed
            -> cdns3_gadget_giveback
                -> usb_gadget_giveback_request

--
Pawell
