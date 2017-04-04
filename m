From: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Subject: Re: [PATCH v3 5/7] mfd: Add Device Tree bindings document for TI
 tps6105x chip
Date: Tue, 4 Apr 2017 07:48:48 -0400
Message-ID: <c2496732-b72d-e8f6-9b1d-2c06848fda07@osg.samsung.com>
References: <20170401071854.23198-1-javier@osg.samsung.com>
 <20170401071854.23198-6-javier@osg.samsung.com>
 <20170403111540.7k3rjucvcxe5cunf@dell>
 <b1118a87-9b39-bb04-d43e-f8f2b366904b@osg.samsung.com>
 <20170404082739.6w6ltgdr2mgaqq4l@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170404082739.6w6ltgdr2mgaqq4l@dell>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Lee,

On 04/04/2017 04:27 AM, Lee Jones wrote:
> On Mon, 03 Apr 2017, Javier Martinez Canillas wrote:
> 
>> Hello Lee,
>>
>> On 04/03/2017 07:15 AM, Lee Jones wrote:
>>
>> [snip]
>>
>>>> +
>>>> +The TP61050/TPS61052 is a high-power "white LED driver". This boost converter
>>>> +is also used for other things than white LEDs, and also contains a GPIO pin.
>>>
>>> What functions does it offer?
>>>
>>
>> Same comment than before, I'm not really familiar with this driver. But I'll
>> look what are the MFD cell instantiated to better understand dev functions
>> and expand this documentation accordingly.
> 
> Writing documentation for H/W you are unfamiliar with is a bad idea IMHO.
>

I just wanted to add an OF device ID table to the driver to make sure the
driver won't have a regression when the I2C core reports an OF modalias
but was asked to also write a DT binding doc in this case...

I'm happy to drop the DT binding doc patch and someone more familiar to do
it as a follow up.

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
