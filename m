From: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Subject: Re: [PATCH v3 2/3] OF: Introduce DT overlay support.
Date: Fri, 15 Nov 2013 09:34:21 +0100
Message-ID: <D048F1EA-B78C-4B10-9A6D-726A17036B42@antoniou-consulting.com>
References: <1383923170-24914-1-git-send-email-panto@antoniou-consulting.com > <1383923170-24914-3-git-send-email-panto@antoniou-consulting.com> < 20131111184245.D569DC4234A@trevor.secretlab.ca> < ED51965C-6EC8-48AE-A59C-CD09FFD57731@antoniou-consulting.com> < 20131114013124.7DD0AC404DF@trevor.secretlab.ca> < E4922A5F-11B3-4167-91EF-C0D5F3F77D40@antoniou-consulting.com> <20131114212206.EAD1BC402B4@trevor.secretlab.ca>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131114212206.EAD1BC402B4-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Alison Chaiken <Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Lubbe <jluebbe-H4yykcOXDpCzQB+pC5nmwQ@public.gmane.org>, Alexander Sverdlin <alexander.sverdlin-OYasijW0DpE@public.gmane.org>, Michael Stickel <ms-g5CePrrZ5ROELgA04lAiVw@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Dirk Behme <dirk.behme-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alan Tull <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Michael Bohan <mbohan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ionut Nicu <ioan.nicu.ext-OYasijW0DpE@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Joel Becker <jlbec-aKy9MeLSZ9dg9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Grant,

On Nov 14, 2013, at 10:22 PM, Grant Likely wrote:

> On Thu, 14 Nov 2013 11:01:35 +0100, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org> wrote:
>> On Nov 14, 2013, at 2:31 AM, Grant Likely wrote:
>>> On Tue, 12 Nov 2013 10:30:37 +0100, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org> wrote:
>>>> On Nov 11, 2013, at 7:42 PM, Grant Likely wrote:
>>>>> On Fri,  8 Nov 2013 17:06:09 +0200, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org> wrote:
>>>> I'm of the opinion that 'platform_device' shouldn't exist at all btw :)
>>>> Most of it's functionality can pretty easily be subsumed by device proper
>>>> and the world would be a better place :)
>>> 
>>> I'm fine for merging some/all of the platform_device fields into struct
>>> device. There are a few things, like resources, which would probably be
>>> useful to have common on all struct device variants. However,
>>> platform_device is far more about matching drivers to devices. Even if
>>> all of platform_device went into struct device, there would still need
>>> to be the platform_bus_type as the collection point for the device
>>> drivers.
>>> 
>> 
>> We don't really need the resources structures on OF. That information is
>> present in OF format, which we can use to generate transient resources for
>> usage with the standard kernel interfaces.
>> 
>> BTW, last time I checked resource handling was broken on release.
>> There are a few patches I sent out fixing it but they were probably ignored.
> 
> Please send them again. They probably got lost.
> 
>>>>> Can overlays interact in bad ways? If overlay 1 is installed before
>>>>> overlay 2, what happens if overlay 1 is removed?
>>>>> 
>>>> 
>>>> Yes, they can. It is not something easily fixed; the proper way would
>>>> be to calculate overlay intersection points and refuse to unload.
>>> 
>>> I think this is important. If it cannot be solved immediately, then the
>>> kernel should enforce overlays always get removed in the reverse order
>>> that they were added. There may be use-cases that don't like it, but it
>>> is safe.
>> 
>> OK, that makes sense.
>> 
>> We are not talking about a global overlay stack though, we're talking about
>> an overlay stack for overlays that overlap.
> 
> I'm actually talking about a global overlay stack. Otherwise you've
> still got the ever-increasing-phandles problem again.
> 

A global overlay stack is easiest. Let's do that first.

There are use cases for multiple overlay stacks though. Take for instance the
case where you have multiple plugin connectors.

Each one can lead to creating a new platform device under ocp, but there is
no overlap.

Of course stackable expansion boards work just fine with a global overlay stack :)

> Cheers,
> g.

Regards

-- Pantelis

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
