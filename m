From: Richard Leitner <dev-M/VWbR8SM2SsTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH v4] usb: misc: add USB251xB/xBi Hi-Speed Hub Controller
 Driver
Date: Wed, 8 Feb 2017 19:45:31 +0100
Message-ID: <80e533b6-4eb3-0019-fe18-82dd0d7aaa1c@g0hl1n.net>
References: <1486543976-28006-1-git-send-email-richard.leitner@skidata.com>
 <1486560068.2133.395.camel@linux.intel.com> <20170208135957.GA916@kroah.com>
 <96c8a6f9-3b93-8ba0-22b1-502e22dac31c@skidata.com>
 <1486572009.2133.406.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1486572009.2133.406.camel-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Richard Leitner <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, dev-M/VWbR8SM2SsTnJN9+BGXg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 02/08/2017 05:40 PM, Andy Shevchenko wrote:
> On Wed, 2017-02-08 at 16:17 +0100, Richard Leitner wrote:
>> On 02/08/2017 02:59 PM, Greg KH wrote:
>>> On Wed, Feb 08, 2017 at 03:21:08PM +0200, Andy Shevchenko wrote:
>>>> On Wed, 2017-02-08 at 09:52 +0100, Richard Leitner wrote:
>>>>> From: Richard Leitner <dev-M/VWbR8SM2SsTnJN9+BGXg@public.gmane.org>

>>>>> +#define DRIVER_NAME "usb251xb"
>>>>> +#define DRIVER_DESC "Microchip USB 2.0 Hi-Speed Hub Controller"
>>>>> +#define DRIVER_VERSION "1.0"
>>>>
>>>> Is it my MUA, or all above indentations are broken?
>>>
>>> What do you mean?
>>
>> Should the strings be aligned, like the following?
>> #define DRIVER_NAME     "usb251xb"
>> #define DRIVER_DESC     "Microchip USB .."
>> #define DRIVER_VERSION	"1.0"
>
> Yep, tab vs. space indentation.

Ok, will do that for v5.

>>>> Above doesn't make much sense. Why not to use
>>>>
>>>>> BIT(bit)
>>>>
>>>> and
>>>>
>>>> & ~BIT(bit)
>>>>
>>>> in place?
>>>
>>> I thought we already had functions to do this for you.  Don't write
>>> new
>>> ones "by hand" either wya.
>>
>> Which functions do you mean? I only found set_bit() and clear_bit()
>> from
>> atomic_ops. But those operate on "unsigned long" variables. From the
>> documentation:
>> 	Native atomic bit operations are defined to operate
>> 	on objects aligned to the size of an "unsigned long"
>> 	C data type, and are least of that size.
>
> __set_bit(), __clear_bit() -- non-atomic variants, but you are right,
> that (unsigned long) exactly the point I didn't propose them.

So the preferred solution is the BIT() stuff?

>>>>> +		/* the first data byte transferred tells the
>>>>> hub how
>>>>> many data
>>>>> +		 * bytes will follow (byte count)
>>>>> +		 */
>>>>
>>>> I'm not sure this is good formatted comment for USB subsystem.
>>>
>>> Looks fine to me, why do you think it is incorrect?
>
> I would do like
>
> /*
>  * The multi-line
>  * comment.
>  */
>
> Capital letter, period at the end, first empty line (unlike in net
> subsystem).

So what's the preferred format? Empty line at the beginning or not?

The captital letter and period looks fine. I'll apply that for v5.

>>>
>>>>> +#else /* CONFIG_OF */
>>>>> +static int usb251xb_get_ofdata(struct usb251xb *hub,
>>>>> +			       struct usb251xb_data *data)
>>>>> +{
>>>>> +	return 0;
>>>>> +}
>>>>> +#endif /* CONFIG_OF */
>>>>
>>>> I don't think it's a good idea to have those ugly #ifdef.
>>>
>>> How can it be removed?
>
> __maybe_unused for function, device_property_*() instead of
> of_property_*() calls.
>
> Something like that. But if you are insisting this is *only* OF
> available hardware or we don't care, I'll not object.

In usb3503.c and usb4604.c we have that #ifdef CONFIG_OF too. IMHO those 
drivers should use the same solution here. But you guys are the ones 
with tons of kernel coding experience, so just say how it should be done :-)

Thanks & regards,
Richard L
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
