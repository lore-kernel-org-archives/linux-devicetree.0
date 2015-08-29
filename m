From: Ganapatrao Kulkarni <gpkulkarni-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 2/4] Documentation: arm64/arm: dt bindings for numa.
Date: Sat, 29 Aug 2015 20:26:42 +0530
Message-ID: <CAFpQJXWO0xT0kxWf09L_XcAOXm1Lov8i2U2BQzk-x0TStj7vBg@mail.gmail.com>
References: <1439570374-4079-1-git-send-email-gkulkarni@caviumnetworks.com>
	<1439570374-4079-3-git-send-email-gkulkarni@caviumnetworks.com>
	<20150828123228.GE31748@leverpostej>
	<CAL_JsqLOpUTVeKbkJ6uPi0EYistd=BowAHdtSmaUYYDhU6c9Sg@mail.gmail.com>
	<55E17F58.5020101@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55E17F58.5020101-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Leizhen (ThunderTown)" <thunder.leizhen-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "steve.capper-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <steve.capper-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, "al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, "leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "rfranz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org" <rfranz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Thunder,

On Sat, Aug 29, 2015 at 3:16 PM, Leizhen (ThunderTown)
<thunder.leizhen-hv44wF8Li93QT0dZR+AlfA@public.gmane.org> wrote:
>
>
> On 2015/8/28 22:02, Rob Herring wrote:
>> +benh
>>
>> On Fri, Aug 28, 2015 at 7:32 AM, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
>>> Hi,
>>>
>>> On Fri, Aug 14, 2015 at 05:39:32PM +0100, Ganapatrao Kulkarni wrote:
>>>> DT bindings for numa map for memory, cores and IOs using
>>>> arm,associativity device node property.
>>>
>>> Given this is just a copy of ibm,associativity, I'm not sure I see much
>>> point in renaming the properties.
>>
>> So just keep the ibm? I'm okay with that. That would help move to
>> common code. Alternatively, we could drop the vendor prefix and have
>> common code just check for both.
>>
>
> Hi all,
>
> Why not copy the method of ACPI numa? There only three elements should be configured:
> 1) a cpu belong to which node
> 2) a memory block belong to which node
> 3) the distance of each two nodes
>
> The devicetree nodes of numa can be like below:
> / {
>         ...
>
>         numa-nodes-info {
>                 node-name: node-description {
>                         mem-ranges = <...>;
>                         cpus-list = <...>;
>                 };
>
>                 nodes-distance {
>                         distance-list = <...>;
>                 };
>         };
>
>         ...
> };
>
some what similar to what your are proposing is already implemented in
my v2 patchset.
https://lwn.net/Articles/623920/
http://lists.infradead.org/pipermail/linux-arm-kernel/2014-November/305164.html
we have went to associativity property based implementation to keep it
more generic.
i do have both acpi(using linaro/hanjun's patches) and associativity
based implementations on our internal tree
and tested on thunderx platform.
i do see issue in creating numa mapping using ACPI for IOs(for
example, i am not able to create numa mapping for ITS which is on each
node, using ACPI tables),  since ACPI spec (tables SRAT and SLIT)
talks only about processor and memory.
however associativity is generic and you can apply on any dt node.
> Sorry, I don't think xxx,associativity is a good method, it's hard to config, and it
> seems hardware-dependent. Especially, when we want to support memory hot-add, it's too hard.
> Because xxx,associativity have no obvious information about it. Like powerpc, it use another
> property: "/ibm,dynamic-reconfiguration-memory".
>
> I spend almost a whole month to implement of_numa(configured by dt-nodes), base upon my opinion
> mentioned above. If somebody are interested in it, I can send my patchset to show it.
>
> Regards,
> Thunder.
>
thanks
ganapat
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
