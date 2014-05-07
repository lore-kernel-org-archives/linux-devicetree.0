From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH 0/3] devicetree, qcomm PMIC: fix node name conflict
Date: Wed, 7 May 2014 11:08:12 -0500
Message-ID: <CAL_JsqK5-kAHTgk=nbHToU9sU5fVW+mGXX9rBaYqw57x0Vkqdw@mail.gmail.com>
References: <536982E3.10303@gmail.com>
	<CAL_JsqL6+i_ED+s6kODsadszefaZUcA7VHCfZ4k4yj62iXsarQ@mail.gmail.com>
	<CAJAp7OiyjefyPMu2p8jTkbfQWYUKeYV62pVTtJ2JOP-6YOOGKA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAJAp7OiyjefyPMu2p8jTkbfQWYUKeYV62pVTtJ2JOP-6YOOGKA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Josh Cartwright <joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Courtney Cavin <courtney.cavin-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 7, 2014 at 10:12 AM, Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org> wrote:
> On Tue, May 6, 2014 at 6:32 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On Tue, May 6, 2014 at 7:48 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> An issue with the path of SPMI nodes under /sys/bus/... was reported in
>>> https://lkml.org/lkml/2014/4/23/312.  The symptom is that two different
>>> grandchild nodes of the spmi with the same node-name@unit-address will
>>> result in attempting to create duplicate links at
>>> /sys/bus/platform/devices/unit-address.node-name.  It turns out that the
>>> specific example provided might not be an expected configuration for
>>> current hardware, but the reported trap remains an issue.

[...]

>> This can be solved in a much less invasive way just in the DT naming
>> algorithm. This is slightly different from what I had suggested of
>> just dropping the unit address. It keeps the unit address, but adds
>> the unique index on untranslate-able addresses. The diff is bigger due
>> to refactoring to reduce the indentation levels. It is untested and
>> whitespace corrupted:
>
> The unique index leads to an interesting dependency between the order
> of nodes in the DTB and userspace; paths to e.g. our the path to our
> block devices contains soc.X where X changes now and then. Fortunately
> soc.X won't change that often, but forcing more peripheral nodes to use
> the same schema would show the problem quite often.

Userspace depending on the device names is broken and device names are
not considered part of the sysfs ABI. So devices having randomish
names is a feature. The names and location change when platforms
convert to DT. The location changes when someone decides to add an soc
device to a platform as well.

> Does translatable/untranslatable refer to if this is an address translatable
> my the cpu or that it's just a translatable address on this specific bus?
> As far as I can see it's the latter and in our case (revid { reg =
> <0x100, 0x100>; })
> seem to be translatable with the current implementation.

It should be the former. If the current behavior is the latter, then
the problem is in a different spot.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
