From: Pawel Laszczak <pawell@cadence.com>
Subject: RE: [PATCH v9 5/6] usb:cdns3 Add Cadence USB3 DRD Driver
Date: Mon, 12 Aug 2019 10:26:49 +0000
Message-ID: <BYAPR07MB470931F8C699784CC88E21CBDDD30@BYAPR07MB4709.namprd07.prod.outlook.com>
References: <1562324238-16655-1-git-send-email-pawell@cadence.com>
 <1562324238-16655-6-git-send-email-pawell@cadence.com>
 <877e8tm25r.fsf@linux.intel.com>
 <BYAPR07MB4709152CB29B6B027ABEB688DDCF0@BYAPR07MB4709.namprd07.prod.outlook.com>
 <8736idnu0q.fsf@gmail.com>
 <BYAPR07MB4709B0A4FADFB76183D651DCDDD10@BYAPR07MB4709.namprd07.prod.outlook.com>
 <87k1bjvtvi.fsf@gmail.com>
 <BYAPR07MB470926DA6241B54FC5AF3C2ADDD30@BYAPR07MB4709.namprd07.prod.outlook.com>
 <87imr2u77c.fsf@gmail.com>
 <BYAPR07MB4709C07ED94C952886858F14DDD30@BYAPR07MB4709.namprd07.prod.outlook.com>
 <87d0hau37p.fsf@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87d0hau37p.fsf@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <felipe.balbi@linux.intel.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "rogerq@ti.com" <rogerq@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, "peter.chen@nxp.com" <peter.chen@nxp.com>, Jayshri Dajiram Pawar <jpawar@cadence.com>, Rahul Kumar <kurahul@cadence.com>
List-Id: devicetree@vger.kernel.org

>
>Hi,
>
>Pawel Laszczak <pawell@cadence.com> writes:
>>>>>>>Quick question, then: these ISTS registers, are they masked interrup=
t
>>>>>>>status or raw interrupt status?
>>>>>>
>>>>>> Yes it's masked, but after masking them the new interrupts will not =
be reported
>>>>>> In ISTS registers. Form this reason I can mask only reported interru=
pt.
>>>>>
>>>>>and what happens when you unmask the registers? Do they get reported?
>>>>
>>>> No they are not reported in case of USB_ISTS register.
>>>> They should be reported in case EP_ISTS, but I need to test it.
>>>
>>>okay, please _do_ test and verify the behavior. The description above
>>>sounds really surprising to me. Does it really mean that if you mask all
>>>USB_ISTS and then disconnect the cable while interrupt is masked, you
>>>won't know cable was disconnected?
>>
>> Yes, exactly.
>>
>> Initially I've tested it and it's work correct.
>> I can even simply write 0 to EP_IEN in hard irq and ~0 in thread handler=
.
>> It's simplest and sufficient way.
>
>okay. Just to be sure I understand correctly. If you mask USB_IEN, then
>we would miss a cable disconnect event. Right?
>
>>>>>>>>>> +		struct cdns3_aligned_buf *buf, *tmp;
>>>>>>>>>> +
>>>>>>>>>> +		list_for_each_entry_safe(buf, tmp, &priv_dev->aligned_buf_lis=
t,
>>>>>>>>>> +					 list) {
>>>>>>>>>> +			if (!buf->in_use) {
>>>>>>>>>> +				list_del(&buf->list);
>>>>>>>>>> +
>>>>>>>>>> +				spin_unlock_irqrestore(&priv_dev->lock, flags);
>>>>>>>>>
>>>>>>>>>creates the possibility of a race condition
>>>>>>>> Why? In this place the buf can't be used.
>>>>>>>
>>>>>>>but you're reenabling interrupts, right?
>>>>>>
>>>>>> Yes, driver frees not used buffers here.
>>>>>> I think that it's the safest place for this purpose.
>>>>>
>>>>>I guess you missed the point a little. Since you reenable interrupts
>>>>>just to free the buffer, you end up creating the possibility for a rac=
e
>>>>>condition. Specially since you don't mask all interrupt events. The
>>>>>moment you reenable interrupts, one of your not-unmasked interrupt
>>>>>sources could trigger, then top-half gets scheduled which tries to wak=
e
>>>>>up the IRQ thread again and things go boom.
>>>>
>>>> Ok, I think I understand.  So I have 3 options:
>>>> 1. Mask the USB_IEN and EP_IEN interrupts, but then I can lost some US=
B_ISTS
>>>> events. It's dangerous options.
>>>
>>>sure sounds dangerous, but also sounds quite "peculiar" :-)
>>>
>>>> 2. Remove implementation of handling unaligned buffers and assume that
>>>>     upper layer will worry about this. What with vendor specific drive=
rs that
>>>>     can be used by companies and not upstreamed  ?
>>>>     It could be good to have such safety mechanism even if it is not c=
urrently used.
>>>
>>>dunno. It may become dead code that's NEVER used :-)
>>>
>>>> 3. Delegate this part of code for instance to separate thread that wil=
l be called
>>>>    In free time.
>>>
>>>Yet another thread? Can't you just run this right before giving back the
>>>USB request? So, don't do it from IRQ handler, but from giveback path?
>>
>> Do you mean in:
>> 	if (request->complete) {
>> 		spin_unlock(&priv_dev->lock);
>> 		if (priv_dev->run_garbage_collector) {
>> 			....
>> 		}
>> 		usb_gadget_giveback_request(&priv_ep->endpoint,
>> 					    request);
>> 		spin_lock(&priv_dev->lock);
>> 	}
>> ??
>
>right, you can do it right before giving back the request. Or right
>after.
>
>> I ask because this is finally also called from IRQ handler:
>>
>> cdns3_device_thread_irq_handler
>>     -> cdns3_check_ep_interrupt_proceed
>>         -> cdns3_transfer_completed
>>             -> cdns3_gadget_giveback
>>                 -> usb_gadget_giveback_request
>
>Did you notice that it doesn't reenable interrupts, though?

I noticed that there is a lack of reenabling interrupts :)

The problem is that If I have disabled interrupt the kernel complains
for using dma_free_coherent function in such place.=20

Here you have a fragment of complaints:=20
[ 7420.502863] WARNING: CPU: 0 PID: 10260 at kernel/dma/mapping.c:281 dma_f=
ree_attrs+0xa0/0xd0
[ 7420.502866] Modules linked in: usb_f_mass_storage cdns3(OE) cdns3_pci_wr=
ap(OE) libcomposite
		...
[ 7420.502965]  cdns3_gadget_giveback+0x159/0x2a0 [cdns3]
[ 7420.502975]  cdns3_transfer_completed+0xc5/0x3c0 [cdns3]
[ 7420.502986]  cdns3_device_thread_irq_handler+0x1b1/0xab0 [cdns3]
[ 7420.502991]  ? __schedule+0x333/0x7e0
[ 7420.503001]  irq_thread_fn+0x26/0x60
[ 7420.503006]  ? irq_thread+0xa8/0x1b0
[ 7420.503011]  irq_thread+0x10e/0x1b0
[ 7420.503015]  ? irq_forced_thread_fn+0x80/0x80
[ 7420.503021]  ? wake_threads_waitq+0x30/0x30
[ 7420.503029]  kthread+0x12c/0x150
[ 7420.503034]  ? irq_thread_check_affinity+0xe0/0xe0
[ 7420.503038]  ? kthread_park+0x90/0x90
[ 7420.503045]  ret_from_fork+0x3a/0x50
[ 7420.503061] irq event stamp: 2962
[ 7420.503065] hardirqs last  enabled at (2961): [<ffffffffb252672c>] _raw_=
spin_unlock_irq+0x2c/0x40
[ 7420.503070] hardirqs last disabled at (2962): [<ffffffffb25268f5>] _raw_=
spin_lock_irqsave+0x25/0x60
[ 7420.503074] softirqs last  enabled at (2918): [<ffffffffb2800340>] __do_=
softirq+0x340/0x451
[ 7420.503079] softirqs last disabled at (2657): [<ffffffffb1aa02b6>] irq_e=
xit+0xc6/0xd0
[ 7420.503082] ---[ end trace d02652af11011c3b ]---

Maybe it's a bug in implementation of this function.  I allocate memory wit=
h flag GFP_ATOMIC with=20
disabled interrupt, but I can't free such memory.=20

--
pawell
