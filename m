From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH v2 1/2] devicetree: add binding for generic mmio clocksource
Date: Wed, 7 Oct 2015 14:40:53 -0500
Message-ID: <CAL_JsqJDZKTB8xowVdGK=9=4omp_wHdwqYP_Ln3-QdknjAwxSg@mail.gmail.com>
References: <1444232234-2133-1-git-send-email-mans@mansr.com>
 <20151007154727.GC28981@leverpostej> <yw1xvbaik4mn.fsf@unicorn.mansr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <yw1xvbaik4mn.fsf@unicorn.mansr.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?TcOlbnMgUnVsbGfDpXJk?= <mans@mansr.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 7, 2015 at 11:47 AM, M=C3=A5ns Rullg=C3=A5rd <mans@mansr.co=
m> wrote:
> Mark Rutland <mark.rutland@arm.com> writes:
>
>> On Wed, Oct 07, 2015 at 04:37:13PM +0100, Mans Rullgard wrote:
>>> This adds a DT binding for a generic mmio clocksource as implemente=
d
>>> by clocksource_mmio_init().
>>>
>>> Signed-off-by: Mans Rullgard <mans@mansr.com>
>>> ---
>>> Changed in v2:
>>> - added sched_clock support
>>> ---
>>>  .../devicetree/bindings/timer/clocksource-mmio.txt | 28 ++++++++++=
++++++++++++
>>>  1 file changed, 28 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/timer/clockso=
urce-mmio.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/timer/clocksource-mm=
io.txt b/Documentation/devicetree/bindings/timer/clocksource-mmio.txt
>>> new file mode 100644
>>> index 0000000..cfb3601
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/timer/clocksource-mmio.txt
>>> @@ -0,0 +1,28 @@
>>> +Generic MMIO clocksource
>>> +
>>> +Required properties:
>>> +
>>> +- compatible: should be "clocksource-mmio"

I'm doubtful this matches any h/w. This would assume there is no other
control like enabling, reset, clock dividers, etc.

Who is your user of this?

>>> +- reg: the physical address of the counter register
>>> +- reg-io-width: size of counter register in bytes, should be 2 or =
4
>>
>> Can this not be inferred from the reg?
>
> You're right, it can.
>
>> What about 8 byte counters?
>
> The existing code only supports 2 or 4, but that of course doesn't
> matter here.
>
>>> +- clocks: phandle to the source clock
>>
>> Is the frequency expected to be exactly the source clock frequency? =
I
>> imagine it's possible for there to be a divisor.
>
> There could of course be, though there isn't in the hardware I'm deal=
ing
> with.  Is specifying it here preferable using a fixed-factor-clock?
>
>> We can add properties for that later, but we should be explcit as to
>> what we currently expect the relationship between the clock and the
>> clocksource to be.
>>
>>> +- clocksource-bits: number of valid bits
>>> +- clocksource-rating: rating of the clocksource
>>
>> NAK. This has no meaning w.r.t. the hardware. This should not be in =
the
>> DT. If there are criteria that bias this (e.g. frequency, latency), =
they
>> should either be described in the DT or determined dynamically.
>
> I had a bad feeling about this.  How would you suggest determining a
> suitable value from actual hardware parameters?

I wouldn't. I think there is general agreement that rating is broken.

This has come up a few times before in context of given a pile of
timer h/w how do you select one. Chosen properties have been one
example (I think that actually went in on Integrator, but we since
removed it). Think about what the properties of a timer are and then
you can decide based on properties for those. OMAP timers are a good
example.

>
>>> +- linux,sched-clock: boolean, register clocksource as sched_clock
>>
>> Likewise, this property doesn't belong in the DT for the same reason=
s as
>> clocksource-rating.
>
> What would be a proper way to select a sched_clock source?  I realise
> it's a Linux-specific thing and DT is supposed to be generic, but the
> information must be provided somehow.

The kernel already has some logic to do this. Most number of bits
followed by highest frequency will be the winning sched_clock. You
might also want to look at things like always on or not.

Rob

>
> --
> M=C3=A5ns Rullg=C3=A5rd
> mans@mansr.com
