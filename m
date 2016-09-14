From: John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 1/6] usb: dwc2: add support for Meson8b and GXBB SoCs
Date: Wed, 14 Sep 2016 11:26:54 -0700
Message-ID: <40e49082-3635-5b99-863b-f51f97258864@synopsys.com>
References: <20160904213152.25837-1-martin.blumenstingl@googlemail.com>
 <20160911134111.31141-1-martin.blumenstingl@googlemail.com>
 <20160911134111.31141-2-martin.blumenstingl@googlemail.com>
 <m24m5ixxyu.fsf@baylibre.com>
 <0d587b46-4c6e-c2ec-a62e-5d0c5a5bd902@synopsys.com>
 <CAOi56cW+zJ8_Gf6xKMyKNk7YB1+MpWHrtmv=+Xxs0PZy9rAXqQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOi56cW+zJ8_Gf6xKMyKNk7YB1+MpWHrtmv=+Xxs0PZy9rAXqQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: "linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org" <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, "kishon-l0cyMroinI0@public.gmane.org" <kishon-l0cyMroinI0@public.gmane.org>, "carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org" <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org" <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, "will.deacon-5wv7dgnIgG8@public.gmane.org" <will.deacon-5wv7dgnIgG8@public.gmane.org>, "catalin.marinas-5wv7dgnIgG8@public.gmane.org" <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, robh+dt-DgEjT+Ai2yhQFI55V6+gNQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 9/14/2016 11:17 AM, Kevin Hilman wrote:
> On Wed, Sep 14, 2016 at 11:12 AM, John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org> wrote:
>> On 9/14/2016 9:11 AM, Kevin Hilman wrote:
>>> Hi John,
>>>
>>> Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> writes:
>>>
>>>> From: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
>>>>
>>>> Add compatible strings for amlogic Meson8b and GXBB SoCs with the
>>>> corresponding configuration parameters.
>>>>
>>>> Signed-off-by: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
>>>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
>>>
>>> Are you OK with adding this platform for v4.9?  I know you mentioned
>>> you're working on new bindings to replace the current way, but since
>>> that hasn't been posted AFAICT, it would be nice to get this merged now
>>> and we can help test the new bindings when you're ready.
>>>
>>> If you're OK with that, and with your Ack, I can take merge the driver
>>> changes through the arm-soc tree along with the rest of the DT patches.
>>>
>>
>> Sure. Unfortunately, I wasn't able to complete it for 4.9.
>>
>> You can add my acked-by on this:
>>
>> Acked-by: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
> 
> Great, thanks!  I assume you're OK with PATCH 2/2 for the bindings as
> well (at least for now until you rework them?)
> 
> Kevin
> 

Do you mean PATCH 2/6 from this series?

It doesn't seem to add or remove any bindings in dwc2 so I'm fine with
it.

Regards,
John
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
