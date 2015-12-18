From: Ganapatrao Kulkarni <gpkulkarni-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RESEND PATCH v7 2/4] Documentation, dt, arm64/arm: dt bindings
 for numa.
Date: Fri, 18 Dec 2015 21:00:18 +0530
Message-ID: <CAFpQJXVmXkgD1FuMbU3rWg5MR3AEeneHAiG6XVfOs6m6e6=byQ@mail.gmail.com>
References: <1450413433-7467-1-git-send-email-gkulkarni@caviumnetworks.com>
	<20151218141826.GB30229@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151218141826.GB30229@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Ganapatrao Kulkarni <gkulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, rfranz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Steve Capper <steve.capper-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Al Stone <al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Len Brown <lenb-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Robert Richter <rrichter@>
List-Id: devicetree@vger.kernel.org

Hi Mark,


On Fri, Dec 18, 2015 at 7:48 PM, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
> Hi,
>
>> +==============================================================================
>> +2 - numa-node-id
>> +==============================================================================
>> +
>> +For the purpose of identification, each NUMA node is associated with a unique
>> +token known as a node id. For the purpose of this binding
>> +a node id is a 32-bit integer.
>> +
>> +A device node is associated with a NUMA node by the presence of a
>> +numa-node-id property which contains the node id of the device.
>> +
>> +Example:
>> +     /* numa node 0 */
>> +     numa-node-id = <0>;
>> +
>> +     /* numa node 1 */
>> +     numa-node-id = <1>;
>> +
>> +==============================================================================
>> +3 - distance-map
>> +==============================================================================
>> +
>> +The device tree node distance-map describes the relative
>> +distance(memory latency) between all numa nodes.
>> +
>> +- compatible : Should at least contain "numa-distance-map-v1".
>
> Thank you for updating these per my request.
>
> The fact that these have changed since the late posting [1] means that
> this is a new version of the patch rather than a resend. Please update
> the PATCHvX number when changes are made.
>
> You also need to update the driver for the new compatible string, so a
> new version of that is required.
>
>> +- distance-matrix
>> +  This property defines a matrix to describe the relative distances
>> +  between all numa nodes.
>> +  It is represented as a list of node pairs and their relative distance.
>> +
>> +  Note:
>> +     1. Each entry represents distance from first node to second node.
>> +     The distance are equal in either direction.
>> +     2. The distance from a node to self(local distance) is represented
>> +     with value 10 and all inter node distance should be represented with
>> +     value greater than 10.
>> +     3. distance-matrix shold have entries in lexicographical ascending
>> +     order of nodes.
>> +     4. There must be only one Device node distance-map and must reside in the root node.
>
> I am still concerned that the local distance of 10 is completely
> arbitrary.
IMHO, i do not see any issue in having defined local distance to
arbitrary number(10).
inter node numa distance is relative number with respect to local distance
we have to fix local distance to some value, having it in dt to make
generic will not add
any additional value as compared to having the fixed local distance to 10.

 #define LOCAL_DISTANCE          10
this macro which is defined in common code and used in many places in
common code as well in other arch specific codes.
If we add property to define local distance and it imply that local
distance can be changed to any value other than 10.
having this change demands common code changes wherever LOCAL_DISTANCE is used!.
I am not finding any reasoning to make local distance generic.

please correct me, if i misunderstood your suggestion
>
> Please:
>
> * Add a new local-distance property to the distance-map node allowing a
>   uniform local distance to be described, and require this property to
>   be present.
>
> * Update the driver to account for that and the compatible string
>   change.
>
> * Send a complete PATCHv8 (or PATCHv$X where X > 7) series with a proper
>   changelog.
>
> Thanks,
> Mark.
>
> [1] http://lists.infradead.org/pipermail/linux-arm-kernel/2015-November/385826.html

thanks
Ganapat
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
