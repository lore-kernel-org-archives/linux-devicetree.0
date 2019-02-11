From: Pawel Laszczak <pawell@cadence.com>
Subject: RE: [PATCH v3 2/6] usb:common Separated decoding functions from dwc3
 driver.
Date: Mon, 11 Feb 2019 12:56:25 +0000
Message-ID: <BYAPR07MB4709A40204EF528F8A04E1EDDD640@BYAPR07MB4709.namprd07.prod.outlook.com>
References: <1548935553-452-1-git-send-email-pawell@cadence.com>
 <1548935553-452-3-git-send-email-pawell@cadence.com>
 <20190204114502.GA28608@kroah.com> <87y36vmyeb.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87y36vmyeb.fsf@linux.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <felipe.balbi@linux.intel.com>, Greg KH <gregkh@linuxfoundation.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "rogerq@ti.com" <rogerq@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, "peter.chen@nxp.com" <peter.chen@nxp.com>, Pawel Jez <pjez@cadence.com>, Rahul Kumar <kurahul@cadence.com>
List-Id: devicetree@vger.kernel.org

Hi,

>
>Greg KH <gregkh@linuxfoundation.org> writes:
>> On Thu, Jan 31, 2019 at 11:52:29AM +0000, Pawel Laszczak wrote:
>>> Patch moves some decoding functions from driver/usb/dwc3/debug.h driver
>>> to driver/usb/common/debug.c file. These moved functions include:
>>>     dwc3_decode_get_status
>>>     dwc3_decode_set_clear_feature
>>>     dwc3_decode_set_address
>>>     dwc3_decode_get_set_descriptor
>>>     dwc3_decode_get_configuration
>>>     dwc3_decode_set_configuration
>>>     dwc3_decode_get_intf
>>>     dwc3_decode_set_intf
>>>     dwc3_decode_synch_frame
>>>     dwc3_decode_set_sel
>>>     dwc3_decode_set_isoch_delay
>>>     dwc3_decode_ctrl
>>>
>>> These functions are used also in inroduced cdns3 driver.
>>>
>>> All functions prefixes were changed from dwc3 to usb.
>>
>> Ick, why?
>
>moving dwc3-specific code into generic code.
>
>>> Also, function's parameters has been extended according to the name
>>> of fields in standard SETUP packet.
>>> Additionally, patch adds usb_decode_ctrl function to
>>> include/linux/usb/ch9.h file.
>>
>> Why ch9.h?  It's not something that is specified in the spec, it's a
>> usb-specific thing :)
>
>agree.

Similar as usb_state_string function from include/linux/usb/ch9.h which=20
"Returns human readable name for the state", the usb_decode_ctrl function=20
make the same but for standard USB request.
USB Request is usb-specifing thing.=20

If my idea is not correct, can you suggest where this function declaration =
should be moved.   =20
>
>>> +/**
>>> + * usb_decode_ctrl - Returns human readable representation of control =
request.
>>> + * @str: buffer to return a human-readable representation of control r=
equest.
>>> + *       This buffer should have about 200 bytes.
>>
>> "about 200 bytes" is not very specific.
>>
>> Pass in the length so we know we don't overflow it.
>
>agree.
I also agree and I will add such parameter.=20
>
>>> + * @bRequestType: matches the USB bmRequestType field
>>> + * @bRequest: matches the USB bRequest field
>>> + * @wValue: matches the USB wValue field (CPU byte order)
>>> + * @wIndex: matches the USB wIndex field (CPU byte order)
>>> + * @wLength: matches the USB wLength field (CPU byte order)
>>> + *
>>> + * Function returns decoded, formatted and human-readable description =
of
>>> + * control request packet.
>>> + *
>>> + * Important: wValue, wIndex, wLength parameters before invoking this =
function
>>> + * should be processed by le16_to_cpu macro.
>>> + */
>>> +const char *usb_decode_ctrl(char *str, __u8 bRequestType, __u8 bReques=
t,
>>> +			    __u16 wValue,  __u16 wIndex, __u16 wLength);
>>
>> Why are you returning a value, isn't the data stored in str?  Why not
>> just return an int saying if the call succeeded or not?
>
>There is one detail here. The usage scenario for this is for
>tracepoints. When dealing with tracepoints we want to delay decoding of
>the data into strings until print-time. I guess it's best to illustrate
>with an example:
>
>DECLARE_EVENT_CLASS(dwc3_log_ctrl,
>	TP_PROTO(struct usb_ctrlrequest *ctrl),
>	TP_ARGS(ctrl),
>	TP_STRUCT__entry(
>		__field(__u8, bRequestType)
>		__field(__u8, bRequest)
>		__field(__u16, wValue)
>		__field(__u16, wIndex)
>		__field(__u16, wLength)
>		__dynamic_array(char, str, DWC3_MSG_MAX)
>	),
>	TP_fast_assign(
>		__entry->bRequestType =3D ctrl->bRequestType;
>		__entry->bRequest =3D ctrl->bRequest;
>		__entry->wValue =3D le16_to_cpu(ctrl->wValue);
>		__entry->wIndex =3D le16_to_cpu(ctrl->wIndex);
>		__entry->wLength =3D le16_to_cpu(ctrl->wLength);
>	),
>	TP_printk("%s", dwc3_decode_ctrl(__get_str(str), DWC3_MSG_MAX,
>					__entry->bRequestType,
>					__entry->bRequest, __entry->wValue,
>					__entry->wIndex, __entry->wLength)
>	)
>);
>
>The above is the code is today (well, I've added buffer size as an
>argument). If I make dwc3_decode_ctrl() return an integer, I can't call
>it from TP_printk() time. I'd have to move it to TP_fast_assign() time
>which is supposed to be, simply, a copy of the necessary data. IOW, I
>would have this:
>
>DECLARE_EVENT_CLASS(dwc3_log_ctrl,
>	TP_PROTO(struct usb_ctrlrequest *ctrl),
>	TP_ARGS(ctrl),
>	TP_STRUCT__entry(
>		__dynamic_array(char, str, DWC3_MSG_MAX)
>	),
>	TP_fast_assign(
>		dwc3_decode_ctrl(__get_str(str), DWC3_MSG_MAX,
>				ctrl->bRequestType,
>				ctrl->bRequest,
>                                le16_to_cpu(ctrl->wValue),
>				le16_to_cpu(ctrl->wIndex),
>                                le16_to_cpu(ctrl->wLength));
>	),
>	TP_printk("%s", __get_str(str)
>	)
>);
>
>Essentially, we end up moving decoding of the tracepoint to the time it
>is captured; IOW, we reintroduce regular latency of string formatting.
>
>What we could do, is move all functions called by dwc3_decode_ctrl() to
>return int, but leave dwc3_decode_ctrl() returning a pointer to str just
>so we continue decoding the data at printing time.

I will try to change these functions in this way.=20
>
>--
Thanks=20
Pawel
