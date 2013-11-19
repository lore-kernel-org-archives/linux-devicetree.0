From: Shirish S <shirish-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 4/4] drm: exynos: hdmi: Add dt support for hdmiphy settings
Date: Tue, 19 Nov 2013 09:50:32 +0530
Message-ID: <CAHvYUDD7-hXHpK19vKKR7ommUY8OPKvsrZnBLnAoGM6RJDhu_Q@mail.gmail.com>
References: <1383034352-15494-1-git-send-email-s.shirish@samsung.com>
	<1383034352-15494-5-git-send-email-s.shirish@samsung.com>
	<20131115161732.GG24831@e106331-lin.cambridge.arm.com>
	<CAHvYUDB3RxudtcBRnH1iyfPVHUE4cAkfq_DoXB3UCs_b16fL4g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAHvYUDB3RxudtcBRnH1iyfPVHUE4cAkfq_DoXB3UCs_b16fL4g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Shirish S <s.shirish-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org" <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Mark,
I have uploaded patch set 5 and 6 back to back, but unfortunately
still nr-configs is stuck in the example explanation in the
exynos_hdmi.txt, just to inform you that am waiting for your review
comments so that i can rectify it along with them in the next patch
set.
Regards,
Shirish S

On Mon, Nov 18, 2013 at 11:37 AM, Shirish S <shirish-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> Hi,
>
> On Fri, Nov 15, 2013 at 9:47 PM, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
>> On Tue, Oct 29, 2013 at 08:12:32AM +0000, Shirish S wrote:
>>> This patch adds dt support to hdmiphy config settings
>>> as it is board specific and depends on the signal pattern
>>> of board.
>>>
>>> Signed-off-by: Shirish S <s.shirish-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>> ---
>>>  .../devicetree/bindings/video/exynos_hdmi.txt      |   34 +++++++++
>>>  drivers/gpu/drm/exynos/exynos_hdmi.c               |   79 +++++++++++++++++++-
>>>  2 files changed, 109 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/video/exynos_hdmi.txt b/Documentation/devicetree/bindings/video/exynos_hdmi.txt
>>> index 323983b..c685c90 100644
>>> --- a/Documentation/devicetree/bindings/video/exynos_hdmi.txt
>>> +++ b/Documentation/devicetree/bindings/video/exynos_hdmi.txt
>>> @@ -13,6 +13,32 @@ Required properties:
>>>       b) pin number within the gpio controller.
>>>       c) optional flags and pull up/down.
>>>
>>> +- hdmiphy-configs: following information about the hdmiphy config settings.
>>> +        a) "nr-configs" specifies the number of pixel clocks supported.
>>
>> I really don't see why this is necessary. It's redundant, and it's easy
>> for the driver to derive this from the number of config<N> nodes, which
>> it can count.
>>
> Agreed, i have removed this field and now use the pixel clock to update the
> required values.
>>> +     b) "config<N>: config<N>" specifies the phy configuration settings,
>>> +             wher 'N' denotes the number of iteration.
>>
>> The number of iteration?
> Corrected in next patch set.
>>
>>> +             "pixel-clock" specifies the pixel clock
>>> +             "conifig-de-emphasis-level" specifies the 8 bit configuration
>>> +             of Data De-emphasis levels,below shown is example for
>>> +             data de-emphasis register at address 0x145D0040.
>>> +                     hdmiphy@38[16] for bits[3:0] permitted values:
>>> +                             0000 means 760 mVdiff && 1111 means 1400 mVdiff
>>> +                             1LSB corresponds to 20mVdiff
>>> +                     hdmiphy@38[16] for bits[7:4] permitted values:
>>> +                             0000    0dB
>>> +                             0001    -0.25dB
>>> +                             0010    -0.7dB
>>> +                             0011    -1.15dB
>>> +                             1111    -7.45dB
>>> +             "config-clock-level" specifies the 8 bit configuration for
>>> +             the corresponding clock level, for example if 0x145D005C
>>> +             is the address of clock level register.
>>
>> I don't understand what this intended to mean.
> Have updated in next patch set, hope its understandable.
>>
>>> +                     hdmiphy@38[23] for bits [1:0] permitted values:
>>> +                             00 means 0 mVdiff && 11 means 60 mVdiff
>>> +                     hdmiphy@38[23] for bits [7:3] permitted values:
>>> +                             00000 is 790 mVdiff
>>> +                             11111 is 1430 mVdiff
>>> +                             1LSB corresponds to 20mVdiff
>>
>> That last line was confusing. Why not state that this is a value between
>> 790 and 1430 mV in 20mV increments?
>>
> Agreed, have made the change in next patch set.
>> Thanks,
>> Mark.
> Thanks,
> Shirish S
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
