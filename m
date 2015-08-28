From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 2/4] Documentation: arm64/arm: dt bindings for numa.
Date: Fri, 28 Aug 2015 09:02:35 -0500
Message-ID: <CAL_JsqLOpUTVeKbkJ6uPi0EYistd=BowAHdtSmaUYYDhU6c9Sg@mail.gmail.com>
References: <1439570374-4079-1-git-send-email-gkulkarni@caviumnetworks.com>
 <1439570374-4079-3-git-send-email-gkulkarni@caviumnetworks.com> <20150828123228.GE31748@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150828123228.GE31748@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: Ganapatrao Kulkarni <gkulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "rfranz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org" <rfranz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, "ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "steve.capper-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <steve.capper-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak@codeaurora>
List-Id: devicetree@vger.kernel.org

+benh

On Fri, Aug 28, 2015 at 7:32 AM, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
> Hi,
>
> On Fri, Aug 14, 2015 at 05:39:32PM +0100, Ganapatrao Kulkarni wrote:
>> DT bindings for numa map for memory, cores and IOs using
>> arm,associativity device node property.
>
> Given this is just a copy of ibm,associativity, I'm not sure I see much
> point in renaming the properties.

So just keep the ibm? I'm okay with that. That would help move to
common code. Alternatively, we could drop the vendor prefix and have
common code just check for both.

>
> However, (somewhat counter to that) I'm also concerned that this isn't
> sufficient for systems we're beginning to see today (more on that
> below), so I don't think a simple copy of ibm,associativity is good
> enough.
>
>>
>> Signed-off-by: Ganapatrao Kulkarni <gkulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/arm/numa.txt | 212 +++++++++++++++++++++++++
>>  1 file changed, 212 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/arm/numa.txt
>>
>> diff --git a/Documentation/devicetree/bindings/arm/numa.txt b/Documentation/devicetree/bindings/arm/numa.txt
>> new file mode 100644
>> index 0000000..dc3ef86
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/numa.txt
>> @@ -0,0 +1,212 @@
>> +==============================================================================
>> +NUMA binding description.
>> +==============================================================================
>> +
>> +==============================================================================
>> +1 - Introduction
>> +==============================================================================
>> +
>> +Systems employing a Non Uniform Memory Access (NUMA) architecture contain
>> +collections of hardware resources including processors, memory, and I/O buses,
>> +that comprise what is commonly known as a NUMA node.
>> +Processor accesses to memory within the local NUMA node is generally faster
>> +than processor accesses to memory outside of the local NUMA node.
>> +DT defines interfaces that allow the platform to convey NUMA node
>> +topology information to OS.
>> +
>> +==============================================================================
>> +2 - arm,associativity
>> +==============================================================================
>> +The mapping is done using arm,associativity device property.
>> +this property needs to be present in every device node which needs to to be
>> +mapped to numa nodes.
>
> Can't there be some inheritance? e.g. all devices on a bus with an
> arm,associativity property being assumed to share that value?

There is actually already based on kernel code. So the documentation
just needs to be explicit.

>
>> +
>> +arm,associativity property is set of 32-bit integers which defines level of
>
> s/set/list/ -- the order is important.
>
>> +topology and boundary in the system at which a significant difference in
>> +performance can be measured between cross-device accesses within
>> +a single location and those spanning multiple locations.
>> +The first cell always contains the broadest subdivision within the system,
>> +while the last cell enumerates the individual devices, such as an SMT thread
>> +of a CPU, or a bus bridge within an SoC".
>
> While this gives us some hierarchy, this doesn't seem to encode relative
> distances at all. That seems like an oversight.
>
> Additionally, I'm somewhat unclear on how what you'd be expected to
> provide for this property in cases like ring or mesh interconnects,
> where there isn't a strict hierarchy (see systems with ARM's own CCN, or
> Tilera's TILE-Mx), but there is some measure of closeness.
>
> Must all of these have the same length? If so, why not have a
> #(whatever)-cells property in the root to describe the expected length?
> If not, how are they to be interpreted relative to each other?

All points that could be asked of the IBM binding. Perhaps Arnd or Ben
can provide some insight or know who can?

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
