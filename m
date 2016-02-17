From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/5] dt/bindings: Add binding for the DA8xx MUSB driver
Date: Wed, 17 Feb 2016 21:14:08 +0300
Message-ID: <56C4B870.2070707@cogentembedded.com>
References: <1455188466-10879-1-git-send-email-petr@barix.com>
 <20160212162110.GA21833@rob-hp-laptop> <56BE1531.8060800@barix.com>
 <CAL_Jsq+uBoSc_LutGrLswYYPGa5gZL3UqLxQxMi=KcxaDpAu8w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+uBoSc_LutGrLswYYPGa5gZL3UqLxQxMi=KcxaDpAu8w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Linux USB List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 02/16/2016 11:05 PM, Rob Herring wrote:

>>>> + - mentor,power : Specifies the maximum current in milliamperes the
>>>> controller can
>>>> +     supply in host mode.
>>>
>>> Still a no for me. Looks like this just sets hcd->power_budget. This
>>> property may not be a regulator, but ultimately the value depends on
>>> some regulator supplying Vbus. Also, given this has nothing to do with
>>> MUSB h/w, however this is described should be generic.
>>
>>
>> I understand your point that the description should be generic.
>> However the USB 2.0 specification does not define any relation between the
>> bMaxPower provided by the device and the actual power control.
>> As far as I understand the value just serves the purpose to raise a flag to
>> the user if the attached device would draw too much power, and not to enable
>> it at all.
>
> That won't really work given devices lie. My bus powered USB disk
> enclosure reports something like 10mA. That's pretty good considering
> I have a 5W drive in it.

>> Further, the value used by the protocol is not necessarily related to the
>> real current that can be supported. The maximum current supported by the
>> protocol is 510mA.
>>
>> For instance on my development board the real maximum current is limited
>> only by the mains power-supply used.
>> So it cannot even be modelled in the DT as a regulator because the
>> power-supply is not part of the HW and
>> everybody can take a different one.
>
> Not part of which h/w? Different for everyone is exactly why Vbus
> supply should be described in DT.

    I'm afraid you're misunderstanding the nature of VBUS regulator still.
It's a voltage regulator with some maximum value of the current that can be 
sourced from it when it's powered (+5 V). The power chip can typically detect 
and report the over-current condition inj which case VBUS will be turned off).

>> So defining a regulator just to store this arbitrary USB 2.0 value is a bit
>> overkill for me.
>
> If it is just arbitrary, then put it into the driver. I would do 500mA

    You clearly misunderstand things. The regulator used depends on the board 
design, the driver (or glue in this case) doesn't, it's just SoC specific. 
That's why this power budget thing ended up in the platform data in the first 
place...

> and be done with it. I'd guess there is nothing real behind the
> current default of 250mA.

    500 mA actually, it's multiplied by 2.

> Rob

MBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
