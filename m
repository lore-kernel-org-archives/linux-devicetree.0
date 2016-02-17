From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/5] dt/bindings: Add binding for the DA8xx MUSB driver
Date: Wed, 17 Feb 2016 12:51:34 -0600
Message-ID: <CAL_JsqK4gmzBTxFNs93aT3XUqMp-6eyyL-GEUtrGm-snSeTQ7w@mail.gmail.com>
References: <1455188466-10879-1-git-send-email-petr@barix.com>
 <20160212162110.GA21833@rob-hp-laptop> <56BE1531.8060800@barix.com>
 <CAL_Jsq+uBoSc_LutGrLswYYPGa5gZL3UqLxQxMi=KcxaDpAu8w@mail.gmail.com> <56C4B870.2070707@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56C4B870.2070707-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Linux USB List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 17, 2016 at 12:14 PM, Sergei Shtylyov
<sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org> wrote:
> On 02/16/2016 11:05 PM, Rob Herring wrote:
>
>>>>> + - mentor,power : Specifies the maximum current in milliamperes the
>>>>> controller can
>>>>> +     supply in host mode.
>>>>
>>>>
>>>> Still a no for me. Looks like this just sets hcd->power_budget. This
>>>> property may not be a regulator, but ultimately the value depends on
>>>> some regulator supplying Vbus. Also, given this has nothing to do with
>>>> MUSB h/w, however this is described should be generic.
>>>
>>>
>>>
>>> I understand your point that the description should be generic.
>>> However the USB 2.0 specification does not define any relation between
>>> the
>>> bMaxPower provided by the device and the actual power control.
>>> As far as I understand the value just serves the purpose to raise a flag
>>> to
>>> the user if the attached device would draw too much power, and not to
>>> enable
>>> it at all.
>>
>>
>> That won't really work given devices lie. My bus powered USB disk
>> enclosure reports something like 10mA. That's pretty good considering
>> I have a 5W drive in it.
>
>
>>> Further, the value used by the protocol is not necessarily related to the
>>> real current that can be supported. The maximum current supported by the
>>> protocol is 510mA.
>>>
>>> For instance on my development board the real maximum current is limited
>>> only by the mains power-supply used.
>>> So it cannot even be modelled in the DT as a regulator because the
>>> power-supply is not part of the HW and
>>> everybody can take a different one.
>>
>>
>> Not part of which h/w? Different for everyone is exactly why Vbus
>> supply should be described in DT.
>
>
>    I'm afraid you're misunderstanding the nature of VBUS regulator still.
> It's a voltage regulator with some maximum value of the current that can be
> sourced from it when it's powered (+5 V). The power chip can typically
> detect and report the over-current condition inj which case VBUS will be
> turned off).

Yes, I understand that exactly. I've seen and reviewed a USB circuit
or two.  You're describing a regulator, I'm saying describe the
regulator in DT and Petr is saying that's too complex.

>>> So defining a regulator just to store this arbitrary USB 2.0 value is a
>>> bit
>>> overkill for me.
>>
>>
>> If it is just arbitrary, then put it into the driver. I would do 500mA
>
>
>    You clearly misunderstand things. The regulator used depends on the board
> design, the driver (or glue in this case) doesn't, it's just SoC specific.
> That's why this power budget thing ended up in the platform data in the
> first place...

The driver needs to be able to query the supply and get the current
limit. We have the technology.

>
>> and be done with it. I'd guess there is nothing real behind the
>> current default of 250mA.
>
>
>    500 mA actually, it's multiplied by 2.

Ok. For 2 ports?

In any case, if there is effectively no limit (Vbus comes from the
wall), then yes a regulator is probably an overkill. So make the case
with no Vbus regulator (or regulator with no limit set) in DT be the
max current. However, if the controller has a signal to turn on/off
Vbus, then that should be modeled as a regulator.

Rob
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
