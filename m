From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: still unclear on a couple DT questions from my initial post
Date: Fri, 1 Sep 2017 13:21:36 -0500
Message-ID: <CAL_JsqLOOMQXNZ0LxVv8Ox3E6R59A4k1mJC55AQSnhrrkSRZ2g@mail.gmail.com>
References: <alpine.LFD.2.21.1709010121140.20957@localhost.localdomain>
 <20170901085144.GA1933@leverpostej> <alpine.LFD.2.21.1709011314001.2699@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.LFD.2.21.1709011314001.2699-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Robert P. J. Day" <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 1, 2017 at 12:14 PM, Robert P. J. Day <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org> wrote:
> On Fri, 1 Sep 2017, Mark Rutland wrote:
>
>> On Fri, Sep 01, 2017 at 01:29:31AM -0400, Robert P. J. Day wrote:
>> >   again, more nitpicky pedantry, but from my initial post, i'm still
>> > unclear on a couple things.
>> >
>> >   first, a number of powerpc .dts files contain the line:
>> >
>> >     dcr-parent = <&{/cpus/cpu@0}>;
>> >
>> > and it's not clear to me why there are curly braces there. that is the
>> > only example of that, but i see no mention of that in the spec. is it
>> > meaningful? or are they superfluous?
>>
>> This syntax allows us to refer to a node by path, even if it doesn't
>> have an existing label. The &foo syntax only allows us to refer to
>> an existing label called foo.
>
>   ah ... is that mentioned in the spec somewhere? i don't recall
> seeing that.
>
>> >   also, the spec states that status could be set to "okay", but a pile
>> > of .dts files in the current kernel have the shorter form:
>> >
>> >   status = "ok";
>> >
>> > and the current kernel code in drivers/of explicitly accepts both
>> > forms. is that a formal spec property, or is the kernel code simply
>> > allowing people to be sloppy?
>>
>> The kernel is catering for sloppiness. We should probably fix those up
>> in the kernel tree.
>
>   the vast majority of that is under arch/arm*, if you want to take
> care of that, and i can see about the rest.

My preference would be to first add a check into dtc. It has a check
for status currently, but only that it is a string. Then others can
get annoyed with the warning and fix.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
