From: Ganapatrao Kulkarni <gpkulkarni-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RESEND PATCH v7 2/4] Documentation, dt, arm64/arm: dt bindings
 for numa.
Date: Sat, 19 Dec 2015 08:19:29 +0530
Message-ID: <CAFpQJXXcQ9TfWHv8vC9ZxcedPyb1xJwASz7Ox=vtrJU40=sO9A@mail.gmail.com>
References: <1450413433-7467-1-git-send-email-gkulkarni@caviumnetworks.com>
	<20151218141826.GB30229@leverpostej>
	<CAFpQJXVmXkgD1FuMbU3rWg5MR3AEeneHAiG6XVfOs6m6e6=byQ@mail.gmail.com>
	<20151218180346.GF30229@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151218180346.GF30229@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Ganapatrao Kulkarni <gkulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, rfranz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Steve Capper <steve.capper-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Al Stone <al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Len Brown <lenb-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Robert Richter <rrichter@>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 18, 2015 at 11:33 PM, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
> On Fri, Dec 18, 2015 at 09:00:18PM +0530, Ganapatrao Kulkarni wrote:
>> Hi Mark,
>>
>> On Fri, Dec 18, 2015 at 7:48 PM, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
>> >> +- distance-matrix
>> >> +  This property defines a matrix to describe the relative distances
>> >> +  between all numa nodes.
>> >> +  It is represented as a list of node pairs and their relative distance.
>> >> +
>> >> +  Note:
>> >> +     1. Each entry represents distance from first node to second node.
>> >> +     The distance are equal in either direction.
>> >> +     2. The distance from a node to self(local distance) is represented
>> >> +     with value 10 and all inter node distance should be represented with
>> >> +     value greater than 10.
>> >> +     3. distance-matrix shold have entries in lexicographical ascending
>> >> +     order of nodes.
>> >> +     4. There must be only one Device node distance-map and must reside in the root node.
>> >
>> > I am still concerned that the local distance of 10 is completely
>> > arbitrary.
>> IMHO, i do not see any issue in having defined local distance to
>> arbitrary number(10).
>> inter node numa distance is relative number with respect to local distance
>> we have to fix local distance to some value, having it in dt to make
>> generic will not add
>> any additional value as compared to having the fixed local distance to 10.
>
> That's not quite true. The figure chosen for the local distance affects
> the granularity with which you can describe all distances.
>
> By using a local distance of 10 we can only encode distances in 10%
> chunks of that. Using a local distance of 100 we could encode in 1%
> chunks of that.
>
> I believe that for some systems we may need a granularity better than
> 10%. Certainly for others we may not. Having an explicit property allows
> for the description of either, and should be sufficient for a reasonable
> period of time to come.
can we keep support for 1% granularity to numa-distance-map-v2
when * some system * which needs this becomes a reality.
>
>>  #define LOCAL_DISTANCE          10
>> this macro which is defined in common code and used in many places in
>> common code as well in other arch specific codes.
>> If we add property to define local distance and it imply that local
>> distance can be changed to any value other than 10.
>> having this change demands common code changes wherever LOCAL_DISTANCE is used!.
>
> While certainly painful, occasionally such changes are necessary.
i have no confidence that the maintainers of acpi, x86 and other common code
will agree to modify LOCAL_DISTANCE unless there is platform exist
which needs such granularity.
AFAIK, i dont see any existing platforms needs this.
IMO, Lets not deprive support for existing platforms for some not
known/future systems.
AFAIK, distance is just a relative number and in no way it is used to
infer granularity.


>
> Another option is to scale the input to the kernel's idea of a local
> distance (at the possible loss of some granularity).
>
>> I am not finding any reasoning to make local distance generic.
>
> I hope the above has answered some of that.
>
> Thanks,
> Mark.
thanks
Ganapat
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
