From: Pawel Laszczak <pawell@cadence.com>
Subject: RE: [PATCH v9 2/6] usb:gadget Separated decoding functions from dwc3
 driver.
Date: Thu, 8 Aug 2019 03:07:54 +0000
Message-ID: <BYAPR07MB470987E1FD7C2ED4ADC0516ADDD70@BYAPR07MB4709.namprd07.prod.outlook.com>
References: <1562324238-16655-1-git-send-email-pawell@cadence.com>
 <1562324238-16655-3-git-send-email-pawell@cadence.com>
 <87tvc0lngz.fsf@linux.intel.com>
 <BYAPR07MB4709964C1D0AA2A851BF2F55DDF50@BYAPR07MB4709.namprd07.prod.outlook.com>
 <b66216dd-6fcf-2900-e67b-42fdb81af78a@ti.com> <877e7pnula.fsf@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <877e7pnula.fsf@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <felipe.balbi@linux.intel.com>, Roger Quadros <rogerq@ti.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, "peter.chen@nxp.com" <peter.chen@nxp.com>, Jayshri Dajiram Pawar <jpawar@cadence.com>, Rahul Kumar <kurahul@cadence.com>
List-Id: devicetree@vger.kernel.org

Hi,

>
>Roger Quadros <rogerq@ti.com> writes:
>>>>> +extern const char *usb_decode_ctrl(char *str, size_t size, __u8 bReq=
uestType,
>>>>> +				   __u8 bRequest, __u16 wValue, __u16 wIndex,
>>>>> +				   __u16 wLength);
>>>>> +
>>>>
>>>> where's the stub when !TRACING?
>>>
>>> Right, I will add
>>> #ifdef	CONFIG_TRACING
>>> 	.....
>>> #endif
>>
>> Can usb_decode_ctrl() be used even when CONFIG_TRACING is not set?
>> If yes then above #ifdefe is not sufficient.
>>
>> You might need to do something like
>>
>> #if defined(CONFIG_TRACING)
>>
>> extern const char *usb_decode_ctrl(..)
>>
>> #else
>>
>> static inline const char *usb_decode_ctrl(..) {
>> 	return NULL;
>> }
>>
>> #endif
>
>This is what I mean. They shouldn't be used outside of TRACING, but it's
>far safer to have the stubs.

usb-common-$(CONFIG_TRACING)      +=3D debug.o
has been added in Makefile so  we don't want to use this if CONFIG_TRACING =
is not set.

I assume that with this approach this part is correct.

Thanks
Pawell

>
>--
>balbi
