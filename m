From: Pawel Laszczak <pawell@cadence.com>
Subject: RE: [PATCH v3 2/6] usb:common Separated decoding functions from dwc3
 driver.
Date: Tue, 5 Feb 2019 08:13:32 +0000
Message-ID: <BYAPR07MB4709F763E5F1823520FB2AF1DD6E0@BYAPR07MB4709.namprd07.prod.outlook.com>
References: <1548935553-452-1-git-send-email-pawell@cadence.com>
 <1548935553-452-3-git-send-email-pawell@cadence.com>
 <20190204114502.GA28608@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190204114502.GA28608@kroah.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "rogerq@ti.com" <rogerq@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, "peter.chen@nxp.com" <peter.chen@nxp.com>, Pawel Jez <pjez@cadence.com>, Rahul Kumar <kurahul@cadence.com>
List-Id: devicetree@vger.kernel.org

H Greg
>
>On Thu, Jan 31, 2019 at 11:52:29AM +0000, Pawel Laszczak wrote:
>> Patch moves some decoding functions from driver/usb/dwc3/debug.h driver
>> to driver/usb/common/debug.c file. These moved functions include:
>>     dwc3_decode_get_status
>>     dwc3_decode_set_clear_feature
>>     dwc3_decode_set_address
>>     dwc3_decode_get_set_descriptor
>>     dwc3_decode_get_configuration
>>     dwc3_decode_set_configuration
>>     dwc3_decode_get_intf
>>     dwc3_decode_set_intf
>>     dwc3_decode_synch_frame
>>     dwc3_decode_set_sel
>>     dwc3_decode_set_isoch_delay
>>     dwc3_decode_ctrl
>>
>> These functions are used also in inroduced cdns3 driver.
>>
>> All functions prefixes were changed from dwc3 to usb.
>
>Ick, why?

Because CDNS3 driver in one of the previous version had implemented very si=
milar function as dwc3 and Felipe suggested that we should=20
make common file with these functions. He also suggested that this function=
 also could be used on host side.=20
It was the reason why I've took function from DWC driver and put it in sepa=
rate file in usb/common directory.
I change only the prefix to make this function more common. =20

>
>> Also, function's parameters has been extended according to the name
>> of fields in standard SETUP packet.
>> Additionally, patch adds usb_decode_ctrl function to
>> include/linux/usb/ch9.h file.
>
>Why ch9.h?  It's not something that is specified in the spec, it's a
>usb-specific thing :)
Why not ?

Similar as usb_state_string function from include/linux/usb/ch9.h which=20
" Returns human readable name for the state", the usb_decode_ctrl function=
=20
make the same but for standard USB request.=20

>
>Also, the api for that function is not ok.  If you are going to make
>this something that the whole kernel can call, you have to fix it up:
>
>> +/**
>> + * usb_decode_ctrl - Returns human readable representation of control r=
equest.
>> + * @str: buffer to return a human-readable representation of control re=
quest.
>> + *       This buffer should have about 200 bytes.
>
>"about 200 bytes" is not very specific.
>
>Pass in the length so we know we don't overflow it.

I didn't want to change to much this code, because it's not my code.=20
I'm not sure if I should ?

>
>> + * @bRequestType: matches the USB bmRequestType field
>> + * @bRequest: matches the USB bRequest field
>> + * @wValue: matches the USB wValue field (CPU byte order)
>> + * @wIndex: matches the USB wIndex field (CPU byte order)
>> + * @wLength: matches the USB wLength field (CPU byte order)
>> + *
>> + * Function returns decoded, formatted and human-readable description o=
f
>> + * control request packet.
>> + *
>> + * Important: wValue, wIndex, wLength parameters before invoking this f=
unction
>> + * should be processed by le16_to_cpu macro.
>> + */
>> +const char *usb_decode_ctrl(char *str, __u8 bRequestType, __u8 bRequest=
,
>> +			    __u16 wValue,  __u16 wIndex, __u16 wLength);
>
>Why are you returning a value, isn't the data stored in str?  Why not
>just return an int saying if the call succeeded or not?

Currently this function is called only from trace point, and probably it wi=
ll be use only
In this way.=20
If function prototype looks like above, we can simply call it in following =
way:
	TP_printk("%s", usb_decode_ctrl(__get_str(str), __entry->bRequestType,
					__entry->bRequest, __entry->wValue,
					__entry->wIndex, __entry->wLength)


Thanks=20
Pawel laszczak
