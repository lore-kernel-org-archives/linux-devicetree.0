From: Roger Quadros <rogerq@ti.com>
Subject: Re: [PATCH v9 2/6] usb:gadget Separated decoding functions from dwc3
 driver.
Date: Wed, 7 Aug 2019 13:17:39 +0300
Message-ID: <b66216dd-6fcf-2900-e67b-42fdb81af78a@ti.com>
References: <1562324238-16655-1-git-send-email-pawell@cadence.com>
 <1562324238-16655-3-git-send-email-pawell@cadence.com>
 <87tvc0lngz.fsf@linux.intel.com>
 <BYAPR07MB4709964C1D0AA2A851BF2F55DDF50@BYAPR07MB4709.namprd07.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR07MB4709964C1D0AA2A851BF2F55DDF50@BYAPR07MB4709.namprd07.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pawel Laszczak <pawell@cadence.com>, Felipe Balbi <felipe.balbi@linux.intel.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, "peter.chen@nxp.com" <peter.chen@nxp.com>, Jayshri Dajiram Pawar <jpawar@cadence.com>, Rahul Kumar <kurahul@cadence.com>
List-Id: devicetree@vger.kernel.org



On 05/07/2019 14:44, Pawel Laszczak wrote:
> 
>> EXTERNAL MAIL
>>
>>
>>
>> Hi,
>>
>> Pawel Laszczak <pawell@cadence.com> writes:
>>> diff --git a/include/linux/usb/ch9.h b/include/linux/usb/ch9.h
>>> index da82606be605..d388a3a5ab7e 100644
>>> --- a/include/linux/usb/ch9.h
>>> +++ b/include/linux/usb/ch9.h
>>> @@ -70,4 +70,29 @@ extern enum usb_device_speed usb_get_maximum_speed(struct device *dev);
>>>   */
>>>  extern const char *usb_state_string(enum usb_device_state state);
>>>
>>> +/**
>>> + * usb_decode_ctrl - Returns human readable representation of control request.
>>> + * @str: buffer to return a human-readable representation of control request.
>>> + *       This buffer should have about 200 bytes.
>>> + * @size: size of str buffer.
>>> + * @bRequestType: matches the USB bmRequestType field
>>> + * @bRequest: matches the USB bRequest field
>>> + * @wValue: matches the USB wValue field (CPU byte order)
>>> + * @wIndex: matches the USB wIndex field (CPU byte order)
>>> + * @wLength: matches the USB wLength field (CPU byte order)
>>> + *
>>> + * Function returns decoded, formatted and human-readable description of
>>> + * control request packet.
>>> + *
>>> + * The usage scenario for this is for tracepoints, so function as a return
>>> + * use the same value as in parameters. This approach allows to use this
>>> + * function in TP_printk
>>> + *
>>> + * Important: wValue, wIndex, wLength parameters before invoking this function
>>> + * should be processed by le16_to_cpu macro.
>>> + */
>>> +extern const char *usb_decode_ctrl(char *str, size_t size, __u8 bRequestType,
>>> +				   __u8 bRequest, __u16 wValue, __u16 wIndex,
>>> +				   __u16 wLength);
>>> +
>>
>> where's the stub when !TRACING?
> 
> Right, I will add 
> #ifdef	CONFIG_TRACING 
> 	.....
> #endif 

Can usb_decode_ctrl() be used even when CONFIG_TRACING is not set?
If yes then above #ifdefe is not sufficient.

You might need to do something like

#if defined(CONFIG_TRACING)

extern const char *usb_decode_ctrl(..)

#else

static inline const char *usb_decode_ctrl(..) {
	return NULL;
}

#endif

--
cheers,
-roger 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
