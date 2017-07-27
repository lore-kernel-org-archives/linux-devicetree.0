From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] Introducing yamldt, a yaml to dtb compiler
Date: Thu, 27 Jul 2017 18:00:00 -0500
Message-ID: <CAL_Jsq+NBEXyOmRx3Ar0OTpyaLeT0hEKw45R0PrVEdmOcd9czw@mail.gmail.com>
References: <1501174151.1055.8.camel@hp800z> <CAL_Jsq+eFTUsMNQgSHGc5ahE4LE42q=6TR6c3qDvGYAUG=fd=Q@mail.gmail.com>
 <1501181931.1055.18.camel@hp800z> <597A4B80.7000106@gmail.com> <1501191985.1055.50.camel@hp800z>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1501191985.1055.50.camel@hp800z>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Phil Elwell <philip.j.elwell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 27, 2017 at 4:46 PM, Pantelis Antoniou
<pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> Hi Frank,
>
> On Thu, 2017-07-27 at 13:22 -0700, Frank Rowand wrote:
>> Hi Pantelis,
>>
>> Keep in mind one of the reasons Linus says he is very direct is to
>> avoid leading a developer on, so that they don't waste a lot of time
>> trying to resolve the maintainer's issues instead of realizing that
>> the maintainer is saying "no". Please read my current answer as being
>> "no, not likely to ever be accepted", not "no, not in the current form".
>>
>> My first reaction is: no, this is not a good idea for the Linux kernel.
>>
>
> This has nothing to do with the kernel. It spits out valid DTBs that the
> kernel (or anything else) may use.

Let me rephrase Frank's statement: this is not a good idea for the
main repository of dts files.

But sure, DTS is already not the only source of DTBs. It comes from
firmware on Power systems. If you want to create and maintain your own
source format, then that is perfectly fine. But based on the current
understanding, I'm not seeing a reason we'd convert DTS files to YAML.
Maybe you're not proposing that now, but if that is not the end goal I
don't see the point of a new format. If YAML solves a bunch of
problems, then of course we'd want to convert DTS files at some point.

>> On 07/27/17 11:58, Pantelis Antoniou wrote:
>> > On Thu, 2017-07-27 at 13:09 -0500, Rob Herring wrote:
>> >> On Thu, Jul 27, 2017 at 11:49 AM, Pantelis Antoniou
>> >> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>> >>> Hi all,
>> >>>
>> >>> This is a project I've been working on lately and it's finally in a
>> >>> usuable form.
>> >>>
>> >>> I'm introducing yamldt.
>> >>>
>> >>> A YAML to DT blob generator/compiler, utilizing a YAML schema that is
>> >>> functionaly equivalent to DTS and supports all DTS features.
>> >>
>> >> What problem are you trying to solve?
>> >>
>> >
>> > I am demonstrating that the DTS source format is not the only way to
>> > describe hardware and generate a DTB that is functionally equivalent.
>> >
>> > I feel that the reliance on DTS has been holding progress back in
>> > expressing modern hardware and having a tool that generates DTB as well
>> > will allow me to experiment in ways that things like overlays and
>> > portable overlays can be defined.
>>
>> That seems to be multiple things, that should be expressed as individual
>> issues and not lumped into a simple statement (and thus can be addressed
>> separately):
>>
>>   1) DTS format is holding progress back in expressing modern hardware
>>
>> What are the issues you have encountered?
>
> DTS syntax is archaic and makes expressing things like overlays (and
> portable connectors) extremely hard.

That's a very vague statement. Can we have some examples of what you
can express with YAML that you can't with DTS? In the end, you are
still limited by the DTB format. If you're adding automagically
generated type information like what's been discussed recently for
phandles, that syntax in the DTB still has to be agreed on whether the
source is DTS or YAML.

> When you have a very large set of boards with are different but similar
> in ways, the syntax of DTS and the implementation of the single program
> that can generate a DTB is an impediment.

So how does using YAML solve this?

> Going on and fixing it is pointless since..
>
>> How would yaml syntax solve those issues?
>
> YAML has features that apply well to problem I'm trying to solve.
>
> The main thing is the availability of type information that can be made
> available both at runtime and at compile time.

How do you get it at runtime? You are still using DTB.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
