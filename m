From: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] devicetree: add binding for generic mmio clocksource
Date: Wed, 07 Oct 2015 17:47:12 +0100
Message-ID: <yw1xvbaik4mn.fsf@unicorn.mansr.com>
References: <1444232234-2133-1-git-send-email-mans@mansr.com>
	<20151007154727.GC28981@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151007154727.GC28981@leverpostej> (Mark Rutland's message of
	"Wed, 7 Oct 2015 16:47:28 +0100")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> writes:

> On Wed, Oct 07, 2015 at 04:37:13PM +0100, Mans Rullgard wrote:
>> This adds a DT binding for a generic mmio clocksource as implemented
>> by clocksource_mmio_init().
>>=20
>> Signed-off-by: Mans Rullgard <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>
>> ---
>> Changed in v2:
>> - added sched_clock support
>> ---
>>  .../devicetree/bindings/timer/clocksource-mmio.txt | 28 +++++++++++=
+++++++++++
>>  1 file changed, 28 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/timer/clocksou=
rce-mmio.txt
>>=20
>> diff --git a/Documentation/devicetree/bindings/timer/clocksource-mmi=
o.txt b/Documentation/devicetree/bindings/timer/clocksource-mmio.txt
>> new file mode 100644
>> index 0000000..cfb3601
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/timer/clocksource-mmio.txt
>> @@ -0,0 +1,28 @@
>> +Generic MMIO clocksource
>> +
>> +Required properties:
>> +
>> +- compatible: should be "clocksource-mmio"
>> +- reg: the physical address of the counter register
>> +- reg-io-width: size of counter register in bytes, should be 2 or 4
>
> Can this not be inferred from the reg?

You're right, it can.

> What about 8 byte counters?

The existing code only supports 2 or 4, but that of course doesn't
matter here.

>> +- clocks: phandle to the source clock
>
> Is the frequency expected to be exactly the source clock frequency? I
> imagine it's possible for there to be a divisor.

There could of course be, though there isn't in the hardware I'm dealin=
g
with.  Is specifying it here preferable using a fixed-factor-clock?

> We can add properties for that later, but we should be explcit as to
> what we currently expect the relationship between the clock and the
> clocksource to be.
>
>> +- clocksource-bits: number of valid bits
>> +- clocksource-rating: rating of the clocksource
>
> NAK. This has no meaning w.r.t. the hardware. This should not be in t=
he
> DT. If there are criteria that bias this (e.g. frequency, latency), t=
hey
> should either be described in the DT or determined dynamically.

I had a bad feeling about this.  How would you suggest determining a
suitable value from actual hardware parameters?

>> +- linux,sched-clock: boolean, register clocksource as sched_clock
>
> Likewise, this property doesn't belong in the DT for the same reasons=
 as
> clocksource-rating.

What would be a proper way to select a sched_clock source?  I realise
it's a Linux-specific thing and DT is supposed to be generic, but the
information must be provided somehow.

--=20
M=E5ns Rullg=E5rd
mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
