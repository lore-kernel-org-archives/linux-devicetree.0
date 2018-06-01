MIME-Version: 1.0
In-Reply-To: <66774364-2f51-e326-651f-f3beee7837e1@redhat.com>
References: <20180529115238.12965-1-hdegoede@redhat.com>
	<20180531172519.GA27468@rob-hp-laptop>
	<66774364-2f51-e326-651f-f3beee7837e1@redhat.com>
Date: Fri, 1 Jun 2018 09:15:25 -0500
Message-ID: <CAL_Jsq+a5_buaKG3WrnxWjcc9VMEgHu9Rcni+A2XrHR4dcD8Pg@mail.gmail.com>
Subject: Re: [PATCH] Input: of_touchscreen / generic bindings - Add support
 for touchscreen-min-x|y
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Hans de Goede <hdegoede@redhat.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, devicetree@vger.kernel.org, linux-input@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Thu, May 31, 2018 at 3:42 PM, Hans de Goede <hdegoede@redhat.com> wrote:
> Hi,
>
> On 31-05-18 19:25, Rob Herring wrote:
>>
>> On Tue, May 29, 2018 at 01:52:38PM +0200, Hans de Goede wrote:
>>>
>>> Some touchscreens, depending on the firmware and/or the digitizer report
>>> coordinates which never reach 0 along one or both of their axis.
>>>
>>> This has been seen for example on the Silead touchscreens on a Onda V891w
>>> and a Point of View mobii TAB-P800w(v2.0).
>>>
>>> This commit adds support for touchscreen-min-x and touchscreen-min-y
>>> device-properties which can be set to communicate the actual start
>>> coordinates (rather then 0,0) to userspace.
>>>
>>> When set this fixes e.g. not being able to click things in the GNOME3
>>> top-bar on the 2 example tablets.
>>>
>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>> ---
>>>   .../input/touchscreen/touchscreen.txt         |  6 ++--
>>
>>
>> Please split bindings to separate patch.
>
>
> Will do for v2.
>
>>>   drivers/input/touchscreen/of_touchscreen.c    | 36 ++++++++++++++-----
>>>   2 files changed, 32 insertions(+), 10 deletions(-)
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt
>>> b/Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt
>>> index 537643e86f61..8aff9551259f 100644
>>> --- a/Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt
>>> +++ b/Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt
>>> @@ -1,10 +1,12 @@
>>>   General Touchscreen Properties:
>>>     Optional properties for Touchscreens:
>>> + - touchscreen-min-x           : minimum x coordinate reported (0 if not
>>> set)
>>> + - touchscreen-min-y           : minimum y coordinate reported (0 if not
>>> set)
>>
>>
>> Maybe a min-max range would be better if size (in pixels) is also
>> needed?
>
>
> Size in pixels is never needed. The touchscreen-size-x /
> touchscreen-size-y have always been the max x/y coordinate reported + 1
> and may or may not have anything to do with pixels. I've noticed on
> some ARM tablets that the firmware in the touchscreen controller was
> programmed to send coordinates in the same range as the display
> resolution, but then the manufacturer would turn around, put in
> a higher res display and keep the same touchscreen range (or the
> otherway around). So it seems that there has been a 1:1 mapping on
> some devices, but that has not been true for a long time now.
>
>>>    - touchscreen-size-x         : horizontal resolution of touchscreen
>>> -                                 (in pixels)
>>> +                                 (maximum x coordinate reported + 1)
>>
>>
>> This is unrelated or at least not explained in the commit msg. I agree
>> this probably makes sense as units are often not pixels unless the hw/fw
>> is doing some scaling itself.
>
>
> Right I added this fix to make clear that we are indeed specifying a
> min-max range, with the oddity that instead of max we specify max + 1
> for historical reasons.
>
> Do you want me to split this out into a separate patch?

No, just some explanation in this one is fine.

Rob
