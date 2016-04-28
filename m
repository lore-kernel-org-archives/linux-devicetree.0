Return-Path: <fixed-term.Oleksij.Rempel@de.bosch.com>
Subject: Re: [PATCH 3/5] Input: zforce_ts: Add device tree support for
 scanning frequency
References: <1461135285-17582-1-git-send-email-dirk.behme@de.bosch.com>
 <1461135285-17582-3-git-send-email-dirk.behme@de.bosch.com>
 <20160425211122.GD26059@dtor-ws>
 <CAL_JsqJhtBp6vp6AL4=gKTbvzm_ae0TGzHHitc4=6pdiE=V_sA@mail.gmail.com>
From: fixed-term.Oleksij.Rempel <fixed-term.Oleksij.Rempel@de.bosch.com>
Message-ID: <5721B790.6020204@de.bosch.com>
Date: Thu, 28 Apr 2016 09:11:12 +0200
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJhtBp6vp6AL4=gKTbvzm_ae0TGzHHitc4=6pdiE=V_sA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Rob Herring <robh@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Dirk Behme <dirk.behme@de.bosch.com>, "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Knut Wohlrab <Knut.Wohlrab@de.bosch.com>, Oleksij Rempel <linux@rempel-privat.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi

On 27.04.2016 16:44, Rob Herring wrote:
> On Mon, Apr 25, 2016 at 4:11 PM, Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
>> Adding devicetree overlords...
>>
>> On Wed, Apr 20, 2016 at 08:54:43AM +0200, Dirk Behme wrote:
>>> From: Knut Wohlrab <Knut.Wohlrab@de.bosch.com>
>>>
>>> Add device tree support for idle and finger scanning frequency.
>>>
>>> Signed-off-by: Knut Wohlrab <Knut.Wohlrab@de.bosch.com>
>>> Signed-off-by: Oleksij Rempel <linux@rempel-privat.de>
>>> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
>>> ---
>>>  .../devicetree/bindings/input/touchscreen/zforce_ts.txt   |  4 ++++
>>>  drivers/input/touchscreen/zforce_ts.c                     | 15 ++++++++++++++-
>>>  include/linux/platform_data/zforce_ts.h                   |  2 ++
>>>  3 files changed, 20 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/input/touchscreen/zforce_ts.txt b/Documentation/devicetree/bindings/input/touchscreen/zforce_ts.txt
>>> index e3c27c4..09ead84 100644
>>> --- a/Documentation/devicetree/bindings/input/touchscreen/zforce_ts.txt
>>> +++ b/Documentation/devicetree/bindings/input/touchscreen/zforce_ts.txt
>>> @@ -11,6 +11,8 @@ Required properties:
>>>  Optional properties:
>>>  - irq-gpios : interrupt gpio the chip is connected to
> 
> BTW, this should really be an "interrupts" property

this pin is used for polling and needed to reduce interrupt load any
latency. Are there a way to get gpio descriptor from interrupts?
Any way, it is out of scope of this patch.

> 
>>>  - vdd-supply: Regulator controlling the controller supply
>>> +- scan-freq-idle: idle scanning frequency in Hz (0 - 65535 Hz; default 10 Hz)
>>> +- scan-freq-finger: touch scanning frequeny in Hz (0 - 65535 Hz; default 50 Hz)
> 
> I use my toes for touchscreens.

Same as before - "Finger Frequency" is used in the documentation. What
exactly are you using for touchscreens is personal decision :) My point
is to be as clase as possible to docs, so other people can find it.
> 
> Can you really scan at 65kHz?

No idea what kind of voodoo is done insight of firmware for this device.
This values will be send to the firmware and it will make some kind of
wrong or good decisions.

Would you accept this names?
scan-idle-hz
scan-finger-hz (can be interpreted as scan-toes-hz if you like :) )
or instead of this should i use scan-active-hz?

> a typo here as well.

ok, thank you

> 
>> Should we cal it scan-freq-active instead?
> 
> Don't we have a standard property for this?  These should really have
> -hz appended. So scan-idle-hz and scan-active-hz, but at least the
> active case should be common IMO. Idle scan seems a bit unusual unless
> you don't have an interrupt.
> 
> Rob
