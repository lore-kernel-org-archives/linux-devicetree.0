From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] fdt: Allow stacked overlays phandle references
Date: Thu, 13 Jul 2017 12:51:34 -0700
Message-ID: <5967CF46.8060207@gmail.com>
References: <1497451946-15443-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1497451946-15443-2-git-send-email-pantelis.antoniou@konsulko.com>
 <20170703090648.GV13989@umbus.fritz.box> <1499085674.4225.17.camel@hp800z>
 <20170707070915.GD24325@umbus.fritz.box>
 <20170707140109.GE22707@bill-the-cat>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170707140109.GE22707@bill-the-cat>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/07/17 07:01, Tom Rini wrote:
> On Fri, Jul 07, 2017 at 05:09:15PM +1000, David Gibson wrote:
>> On Mon, Jul 03, 2017 at 03:41:14PM +0300, Pantelis Antoniou wrote:
>>> Hi David,
>>>
>>> On Mon, 2017-07-03 at 19:06 +1000, David Gibson wrote:
>>>> On Wed, Jun 14, 2017 at 05:52:25PM +0300, Pantelis Antoniou wrote:
>>>>> This patch enables an overlay to refer to a previous overlay's
>>>>> labels by performing a merge of symbol information at application
>>>>> time.
>>>>
>>>> This seems to be doing things the hard way.
>>>>
>>>
>>> It is the minimal implementation to get things to work, with the current
>>> overlay implementation.
>>
>> Is it, though?  I'd expect reworking the symbol creation during
>> compile to be of similar complexity to the symbol merging here.  And
>> it only needs to be done in one place, not two.  And it doesn't
>> implicitly extend the overlay spec.
>>
>>> I do have plans for a version 2 with fixes to
>>> a number of areas.
>>
>> Saying you'll fix it in v2 is missing the point.  If v1 is out there,
>> we have to keep supporting it.  The number of half-arsed overlay
>> variants out in the wild just seems to keep growing.
> 
> Erm, v1 is out there, because the patches are posted here in public,
> where reviews happen.  If some group picks them up and runs with them,
> perhaps it's worth asking why some group would be willing to pick up and
> run with v1 of a series?  Which, AFAIK, hasn't actually happened just
> yet..

I think I'm responding to a conversation where there is some talking
past each other, and my added observation is not directly to the point
of that conversation, but instead to some of what seems to me to be
implied by several previous posts.  So please forgive my off topic
drift.

As I have noted before, just because some Linux code is in the wild
or in widespread use does _not_ mean that it has placed any
constraints on what will be accepted into the Linux kernel.  That
is not the way the kernel development process works; for example,
just because a feature was implemented in a distro does not mean
that it will be accepted into the mainline kernel, or if it is
accepted into the mainline kernel that it will be the same
implementation when it gets into the mainline kernel.  All of the
major distros have the mantra of "Upstream First", which avoids that
issue.

< snip >

-Frank
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
