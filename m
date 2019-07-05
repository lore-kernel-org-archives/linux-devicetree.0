From: Pawel Laszczak <pawell@cadence.com>
Subject: RE: [PATCH v9 2/6] usb:gadget Separated decoding functions from dwc3
 driver.
Date: Fri, 5 Jul 2019 11:44:15 +0000
Message-ID: <BYAPR07MB4709964C1D0AA2A851BF2F55DDF50@BYAPR07MB4709.namprd07.prod.outlook.com>
References: <1562324238-16655-1-git-send-email-pawell@cadence.com>
 <1562324238-16655-3-git-send-email-pawell@cadence.com>
 <87tvc0lngz.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87tvc0lngz.fsf@linux.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <felipe.balbi@linux.intel.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "rogerq@ti.com" <rogerq@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, "peter.chen@nxp.com" <peter.chen@nxp.com>, Jayshri Dajiram Pawar <jpawar@cadence.com>, Rahul Kumar <kurahul@cadence.com>
List-Id: devicetree@vger.kernel.org


>EXTERNAL MAIL
>
>
>
>Hi,
>
>Pawel Laszczak <pawell@cadence.com> writes:
>> diff --git a/include/linux/usb/ch9.h b/include/linux/usb/ch9.h
>> index da82606be605..d388a3a5ab7e 100644
>> --- a/include/linux/usb/ch9.h
>> +++ b/include/linux/usb/ch9.h
>> @@ -70,4 +70,29 @@ extern enum usb_device_speed usb_get_maximum_speed(st=
ruct device *dev);
>>   */
>>  extern const char *usb_state_string(enum usb_device_state state);
>>
>> +/**
>> + * usb_decode_ctrl - Returns human readable representation of control r=
equest.
>> + * @str: buffer to return a human-readable representation of control re=
quest.
>> + *       This buffer should have about 200 bytes.
>> + * @size: size of str buffer.
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
>> + * The usage scenario for this is for tracepoints, so function as a ret=
urn
>> + * use the same value as in parameters. This approach allows to use thi=
s
>> + * function in TP_printk
>> + *
>> + * Important: wValue, wIndex, wLength parameters before invoking this f=
unction
>> + * should be processed by le16_to_cpu macro.
>> + */
>> +extern const char *usb_decode_ctrl(char *str, size_t size, __u8 bReques=
tType,
>> +				   __u8 bRequest, __u16 wValue, __u16 wIndex,
>> +				   __u16 wLength);
>> +
>
>where's the stub when !TRACING?

Right, I will add=20
#ifdef	CONFIG_TRACING=20
	.....
#endif=20
>
>--
>balbi
