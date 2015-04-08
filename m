From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: fix of_property_read_string
Date: Wed, 8 Apr 2015 09:25:56 -0500
Message-ID: <CAL_JsqL1+oXxV=4pNieCD=+8qb9-9GKREg366Mj8wu3sPRDzBg@mail.gmail.com>
References: <1428401462-5907-1-git-send-email-Shengzhou.Liu@freescale.com>
 <CAL_JsqLpD8UXoHZ-KF74LaN5HEvu3bpu6aeO9_SOHYrut0nV_Q@mail.gmail.com> <BLUPR03MB391F3BA6A3691F36D73D5EDF8FC0@BLUPR03MB391.namprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <BLUPR03MB391F3BA6A3691F36D73D5EDF8FC0-GeMU99GfrrvhK2sv/vn9KOO6mTEJWrR4XA4E9RH9d+qIuWR1G4zioA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Shengzhou.Liu-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <Shengzhou.Liu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 8, 2015 at 1:29 AM, Shengzhou.Liu-KZfg59tc24xl57MIdRCFDg@public.gmane.org
<Shengzhou.Liu-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
>> On Tue, Apr 7, 2015 at 5:11 AM, Shengzhou Liu
>> <Shengzhou.Liu-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
>> > In of_property_read_string function, strnlen(prop->value,
>> > prop->length) is always less or equal to prop->length, and we should
>> allow the '=='
>> > condition, so let's remove the original unreasonable condition.
>>
>> I believe we don't want to allow equal because prop->length should
>> include the \0 termination while strnlen will not.
>>
>> Rob
>
> Yes, I thought so, ideally prop->length should be assigned with strlen(value)+1,
> but unfortunately in u-boot and kernel there are too many callers that have prop->length assigned
> with strlen(value) instead of strlen(value)+1, in practice, we can allow equal.

No one should touch prop->length and it comes from the DTB directly.
It doesn't come from strlen.

> For example, in of_property_read_string_helper function, following two lines had been removed by commit 6faa2909871d8937.

I don't have that commit in my tree.

> -       if (strnlen(prop->value, prop->length) >= prop->length)
> -               return -EILSEQ;
>
> So allowing equal should be acceptable, because in this function, the equal can't prevent stack overflow issue.

What stack overflow issue?

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
