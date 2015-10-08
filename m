From: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] devicetree: add binding for generic mmio clocksource
Date: Thu, 08 Oct 2015 10:24:57 +0100
Message-ID: <yw1xmvvtk906.fsf@unicorn.mansr.com>
References: <1444232234-2133-1-git-send-email-mans@mansr.com>
	<20151007154727.GC28981@leverpostej>
	<yw1xvbaik4mn.fsf@unicorn.mansr.com>
	<CAL_JsqJDZKTB8xowVdGK=9=4omp_wHdwqYP_Ln3-QdknjAwxSg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJDZKTB8xowVdGK=9=4omp_wHdwqYP_Ln3-QdknjAwxSg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
	(Rob Herring's message of "Wed, 7 Oct 2015 14:40:53 -0500")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree@vger.kernel.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel@vger.kernel.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> On Wed, Oct 7, 2015 at 11:47 AM, M=E5ns Rullg=E5rd <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org> w=
rote:
>> Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> writes:
>>
>>> On Wed, Oct 07, 2015 at 04:37:13PM +0100, Mans Rullgard wrote:
>>>> This adds a DT binding for a generic mmio clocksource as implement=
ed
>>>> by clocksource_mmio_init().
>>>>
>>>> Signed-off-by: Mans Rullgard <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>
>>>> ---
>>>> Changed in v2:
>>>> - added sched_clock support
>>>> ---
>>>>  .../devicetree/bindings/timer/clocksource-mmio.txt | 28 +++++++++=
+++++++++++++
>>>>  1 file changed, 28 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/timer/clocks=
ource-mmio.txt
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/timer/clocksource-m=
mio.txt b/Documentation/devicetree/bindings/timer/clocksource-mmio.txt
>>>> new file mode 100644
>>>> index 0000000..cfb3601
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/timer/clocksource-mmio.txt
>>>> @@ -0,0 +1,28 @@
>>>> +Generic MMIO clocksource
>>>> +
>>>> +Required properties:
>>>> +
>>>> +- compatible: should be "clocksource-mmio"
>
> I'm doubtful this matches any h/w. This would assume there is no othe=
r
> control like enabling, reset, clock dividers, etc.

I know it matches real hardware.

> Who is your user of this?

Various Sigma Designs chips have such counters.  I figured others might
as well, and it seemed silly to tie such generic functionality to a
specific chip family.

>> I had a bad feeling about this.  How would you suggest determining a
>> suitable value from actual hardware parameters?
>
> I wouldn't. I think there is general agreement that rating is broken.

So hardcoding something like 300 would be OK?

>>>> +- linux,sched-clock: boolean, register clocksource as sched_clock
>>>
>>> Likewise, this property doesn't belong in the DT for the same reaso=
ns as
>>> clocksource-rating.
>>
>> What would be a proper way to select a sched_clock source?  I realis=
e
>> it's a Linux-specific thing and DT is supposed to be generic, but th=
e
>> information must be provided somehow.
>
> The kernel already has some logic to do this. Most number of bits
> followed by highest frequency will be the winning sched_clock. You
> might also want to look at things like always on or not.

The problem is that sched_clock_register() doesn't take a pointer to be
passed back to the read_sched_clock callback like most interfaces of
this type do.  This means the callback must use global variables set up
before the register call, but at that time there's no way of knowing
which one will be used.  If there were a way of getting a pointer to th=
e
callback, it would be a simple matter of registering all instances and
letting the kernel choose which to use.

--=20
M=E5ns Rullg=E5rd
mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
