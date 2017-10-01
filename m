From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] drm/panel: Add DT bindings for Ilitek ILI9322
Date: Sun, 1 Oct 2017 10:15:00 -0500
Message-ID: <CAL_JsqLdq5zp3SWDe180KbsvBUCwvqCXEoY+rgG_c62HGb25ig@mail.gmail.com>
References: <20170813114448.20179-1-linus.walleij@linaro.org>
 <20170813114448.20179-2-linus.walleij@linaro.org> <20170817204424.e2wdkmyp4vyx2qj3@rob-hp-laptop>
 <CACRpkdZgaKUDhVZ4spMsK_pG+LWOAkSWKrQTAbbXOFpUEk4rLQ@mail.gmail.com>
 <CACRpkdY2bo0EBp+d16ksrjwsVTLp2BzV7=XS0vWxno5EHWoFig@mail.gmail.com>
 <CAL_JsqKNprVAW_5XBGjwm3EzqVh=xP1Q9gQ8n_taWFDzzcz2Aw@mail.gmail.com> <CACRpkdaP42pRR=M-QPQr5k-KDau-5zkA0UVY8O9DYf8czcY3Rg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdaP42pRR=M-QPQr5k-KDau-5zkA0UVY8O9DYf8czcY3Rg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "open list:DRM PANEL DRIVERS" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Sep 30, 2017 at 6:42 PM, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Sun, Sep 24, 2017 at 10:36 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>> On Wed, Sep 20, 2017 at 6:56 AM, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>>> On Sat, Sep 2, 2017 at 11:17 PM, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>
>>>>> Normally, we the physical panel is described which would imply all these
>>>>> settings. Are there lots of panels with this controller that would
>>>>> justify all these settings?
>>>>
>>>> The datasheet for the ili9322 just says it "drives panels" essentially.
>>>> Googling around gives at hand that it is used pretty frequently in
>>>> Shenzhen China for adapting different off-the-shelf panels to
>>>> different inputs.
>>>>
>>>> I can't really answer how many of these products that run one or
>>>> another OS using device tree to describe the configuration. It feels more
>>>> like I'm paving the road for others to travel.
>>
>> Not really a road I want to pave and encourage others.
>
> It's good when maintainers say "no"! :)

Only other maintainers think so. :)


>>>>>> +  - ilitek,entry-mode: the panel can be connected to various input streams
>>>>>> +    and four of them can be selected by electronic straps on the display.
>>>>>> +    However it is possible to select another mode or override the
>>>>>> +    electronic default with this property. Valid values:
>>>>>> +    0: 8 bit serial RGB through
>>>>>> +    1: 8 bit serial RGB aligned
>>>>>> +    2: 8 bit serial RGB dummy 320x240
>>>>>> +    3: 8 bit serial RGB dummy 360x240
>>>>>> +    4: disabled
>>>>>> +    5: 24 bit parallel RGB through
>>>>>> +    6: 24 bit parallel RGB aligned
>>>>>> +    7: 24 bit YUV 640Y 320CbCr
>>>>>> +    8: 24 bit YUV 720Y 360CbCr
>>>>>> +    9: disabled
>>>>>> +    10: 8 bit ITU-R BT.656 720Y 360CbCr
>>>>>> +    11: 8 bit ITU-R BT.656 640Y 320CbCr
>>>>>
>>>>> To some extent, we have some standard bindings to describe this.
>>>>
>>>> I don't find any. Maybe I'm looking in the wrong places :(
>>
>> I guess bus-width is all we have. Normally, this is all implied by the
>> compatible strings of either the controller, panel or both.
>>
>> Another way to look at it is, we already have support for lots of
>> panels and controllers. If those haven't needed to specify this
>> information, then why do you?
>
> It's a question about devicetree vs driver configuration data altogether.
> An intuitive thing, gray area. Your intuition is likely better.
>
> I feel the same about the people who push too much pin control
> data into the device tree instead of the driver so I understand the
> issue. (If it is that.)

Yes, that's it. We don't want bindings that try to parameterize
*everything* in "generic" bindings.

>>>> Also the input modes of ili9322 is coupled with resolution so
>>>> it would need two more cells or so for resolution so I feel
>>>> it would over-complicate things for these 12 enumerators.
>>>
>>> Can we proceed with these patches?
>>>
>>> Any opinion from DT or panel maintainers?
>>
>> You have my opinion. I don't think Thierry's will be different.
>>
>> My suggestion is to move the settings you need into the panel driver
>> and out of DT. We can always move things to DT later if it makes
>> sense.
>
> Sure thing. I will take the approach of compatible string like this:
>
> compatible = "ilitek,ili9322", "dlink,dir685-panel";
>
> And use the latter compatible to set up all the stuff in the panel
> driver, what about that?

Sounds good, but you need to reverse the order here. Most specific first.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
