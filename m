From: Pawel Laszczak <pawell@cadence.com>
Subject: RE: [PATCH v1 2/2] usb:cdns3 Add Cadence USB3 DRD Driver
Date: Mon, 17 Dec 2018 11:51:50 +0000
Message-ID: <BYAPR07MB47097F1DE4D13CB23763A7C8DDBC0@BYAPR07MB4709.namprd07.prod.outlook.com>
References: <1544445555-17325-1-git-send-email-pawell@cadence.com>
 <1544445555-17325-3-git-send-email-pawell@cadence.com>
 <87h8fkmfar.fsf@linux.intel.com>
 <BYAPR07MB47095110AF28CC11B4C9E144DDA60@BYAPR07MB4709.namprd07.prod.outlook.com>
 <87a7lbme3m.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87a7lbme3m.fsf@linux.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <balbi@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "rogerq@ti.com" <rogerq@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alan Douglas <adouglas@cadence.com>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, "peter.chen@nxp.com" <peter.chen@nxp.com>, Pawel Jez <pjez@cadence.com>, Rahul Kumar <kurahul@cadence.com>
List-Id: devicetree@vger.kernel.org

Hi,

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
>>>you're already running in hardirq context. Why do you need this lock at
>>>all? I would be better to use the hardirq handler to mask your
>>>interrupts, so they don't fire again, then used the top-half (softirq)
>>>handler to actually handle the interrupts.
>>
>> Yes, spin_lock_irqsave is not necessary here.
>>
>> Do you mean replacing devm_request_irq with a request_threaded_irq ?
>> I have single interrupt line shared between  Host, Driver, DRD/OTG.
>> I'm not sure if it will work more efficiently.
>
>The whole idea for running very little in hardirq context is to give the
>scheduler a chance to decide what should run. This is important to
>reduce latency when running with RT patchset applied, for
>example. However, I'll give you that, it's a minor requirement. It's
>just that, to me, it's a small detail that's easy to implement.

I will do it in PATCH v2 or PATCH v3. =20
I need to post next version before 24 of December, so if I can do it
before this date then it will be in PATCH v2.=20

Thanks=20
Pawel
