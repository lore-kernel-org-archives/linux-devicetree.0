From: Ganapatrao Kulkarni <gpkulkarni-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v7 2/4] Documentation, dt, arm64/arm: dt bindings for numa.
Date: Fri, 18 Dec 2015 08:40:09 +0530
Message-ID: <CAFpQJXX1T9KO33=cW9Q0pa6qOL7y36tbFf8jP-C3ByAcds286g@mail.gmail.com>
References: <1447780843-9223-1-git-send-email-gkulkarni@caviumnetworks.com>
	<1447780843-9223-3-git-send-email-gkulkarni@caviumnetworks.com>
	<20151211135307.GB20666@leverpostej>
	<CAFpQJXXopH4_GjE=dX0+NPcfwzRgErEFVMkGd57K+4=YZPDVsw@mail.gmail.com>
	<20151217190708.GA14030@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151217190708.GA14030@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Ganapatrao Kulkarni <gkulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, rfranz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Steve Capper <steve.capper-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Al Stone <al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Len Brown <lenb-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Robert Richter <rrichter@>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 18, 2015 at 12:37 AM, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
> Hi,
>
> On Fri, Dec 11, 2015 at 08:11:07PM +0530, Ganapatrao Kulkarni wrote:
>> On Fri, Dec 11, 2015 at 7:23 PM, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
>> > Hi,
>> >
>> > On Tue, Nov 17, 2015 at 10:50:41PM +0530, Ganapatrao Kulkarni wrote:
>> >> DT bindings for numa mapping of memory, cores and IOs.
>> >>
>> >> Reviewed-by: Robert Richter <rrichter-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
>> >> Signed-off-by: Ganapatrao Kulkarni <gkulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
>> >
>> > Overall this looks good to me. However, I have a couple of concerns.
>> thanks.
>
> [...]
>
>> >> +==============================================================================
>> >> +2 - numa-node-id
>> >> +==============================================================================
>> >> +The device node property numa-node-id describes numa domains within a
>> >> +machine. This property can be used in device nodes like cpu, memory, bus and
>> >> +devices to map to respective numa nodes.
>> >> +
>> >> +numa-node-id property is a 32-bit integer which defines numa node id to which
>> >> +this device node has numa domain association.
>> >
>> > I'd prefer if the above two paragraphs were replaced with:
>> >
>> >         For the purpose of identification, each NUMA node is associated
>> >         with a unique token known as a node id. For the purpose of this
>> >         binding a node id is a 32-bit integer.
>> >
>> >         A device node is associated with a NUMA node by the presence of
>> >         a numa-node-id property which contains the node id of the
>> >         device.
>> ok, will do.
>
> [...]
>
>> >> +==============================================================================
>> >> +3 - distance-map
>> >> +==============================================================================
>> >> +
>> >> +The device tree node distance-map describes the relative
>> >> +distance (memory latency) between all numa nodes.
>> >
>> > Is this not a combined approximation for latency and bandwidth?
>> AFAIK, it is to represent inter-node memory access latency.
>> >
>> >> +- compatible : Should at least contain "numa,distance-map-v1".
>> >
>> > Please use "numa-distance-map-v1", as "numa" is not a vendor.
>> ok
>> >
>> >> +- distance-matrix
>> >> +  This property defines a matrix to describe the relative distances
>> >> +  between all numa nodes.
>> >> +  It is represented as a list of node pairs and their relative distance.
>> >> +
>> >> +  Note:
>> >> +     1. Each entry represents distance from first node to second node.
>> >> +     2. If both directions between 2 nodes have the same distance, only
>> >> +            one entry is required.
>> >
>> > I still don't understand what direction means in this context. Are there
>> > systems (of any architecture) which don't have symmetric distances?
>> > Which accesses does this apply differently to?
>> >
>> > Given that, I think that it might be best to explicitly call out
>> > distances as being equal, and leave any directionality for a later
>> > revision of the binding when we have some semantics for directionality.
>> agreed, given that there is no know system to substantiate dual direction,
>> let us not explicit about direction.
>
> Regarding your comment in [1], I was expecting a respin of this series
> with the above comments addressed. I will not provide an ack until I've
> seen that.
sure, i will respin with the comments addressed.
>
> Additional concerns below also apply.
>
>> >> +     2. distance-matrix shold have entries in lexicographical ascending order of nodes.
>> >> +     3. There must be only one Device node distance-map and must reside in the root node.
>> >> +
>> >> +Example:
>> >> +     4 nodes connected in mesh/ring topology as below,
>> >> +
>> >> +             0_______20______1
>> >> +             |               |
>> >> +             |               |
>> >> +           20|               |20
>> >> +             |               |
>> >> +             |               |
>> >> +             |_______________|
>> >> +             3       20      2
>> >> +
>> >> +     if relative distance for each hop is 20,
>> >> +     then inter node distance would be for this topology will be,
>> >> +           0 -> 1 = 20
>> >> +           1 -> 2 = 20
>> >> +           2 -> 3 = 20
>> >> +           3 -> 0 = 20
>> >> +           0 -> 2 = 40
>> >> +           1 -> 3 = 40
>> >
>> > How is this scaled relative to a local access?
>> this is based on representing local distance with 10 and
>> all inter-node latency being represented as multiple of 10.
>>
>> >
>> > Do we assume that a local access has value 1, e.g. each hop takes 20x a
>> > local access in this example?
>> The local distance is represented as 10, this is fixed and same as in ACPI.
>> Inter-node distance can be any number greater than 10.
>> this information can be added here to make it clear.
>
> This seems rather arbitrary.
>
> Why can we not define the local distance in the DT? I appreciate that
> the value is hard-coded for ACPI, but we don't have to copy that
> limitation.
yes, we can mention local distance.
>
> I'm not sure if asymmetric local distances matter.
>
> Thanks,
> Mark.
>
> [1] http://lists.infradead.org/pipermail/linux-arm-kernel/2015-December/394634.html

thanks
Ganapat
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
