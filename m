From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v4 2/8] OF: Introduce DT overlay support.
Date: Thu, 15 May 2014 00:15:23 -0700
Message-ID: <6DBEE287-AFB3-4616-AAA6-2F02B6B12D74@konsulko.com>
References: <1396615441-29630-1-git-send-email-pantelis.antoniou@konsulko.com>	<1396615441-29630-3-git-send-email-pantelis.antoniou@konsulko.com>	<20140514100856.5198DC4153D@trevor.secretlab.ca> <CAMuHMdXfNXB7s71+joCpkZrzPCJQFyNv3+bj+=usORRScZsHZQ@mail.gmail.com> <53736D42.1010302@roeck-us.net>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53736D42.1010302-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Alison Chaiken <Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Lubbe <jluebbe-H4yykcOXDpCzQB+pC5nmwQ@public.gmane.org>, Alexander Sverdlin <alexander.sverdlin-OYasijW0DpE@public.gmane.org>, Michael Stickel <ms-g5CePrrZ5ROELgA04lAiVw@public.gmane.org>, Dirk Behme <dirk.behme-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alan Tull <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Michael Bohan <mbohan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ionut Nicu <ioan.nicu.ext-OYasijW0DpE@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pete Popov <pete.popov-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Dan Malek <dan.malek@ko>
List-Id: devicetree@vger.kernel.org

Hi Guenter,

On May 14, 2014, at 6:18 AM, Guenter Roeck wrote:

> On 05/14/2014 06:03 AM, Geert Uytterhoeven wrote:
>> On Wed, May 14, 2014 at 12:08 PM, Grant Likely
>> <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
>>>> +config OF_OVERLAY
>>>> +     bool "OF overlay support"
>>>> +     depends on OF
>>>> +     select OF_DYNAMIC
>>>> +     select OF_DEVICE
>>>> +     select OF_RESOLVE
>>>> +     help
>>>> +       OpenFirmware overlay support. Allows you to modify on runtime the
>>>> +       live tree using overlays.
>>> 
>>> Should not be a user-visable option. Drivers using it should select it
>> 
>> Why not? It's up to the (final) user to use it, or not.
>> 
>>> or otherwise cause it to be enabled.
>> 
>> Why should this be driver-specific? Shouldn't this just work with all drivers?
>> 
> 
> It does once enabled.
> 
> I think what Grant refers to is that there has to be a driver which implements
> the actual overlay insertion and removal (ie calls the new API functions),
> and that the Kconfig option for this driver should select OF_OVERLAY
> instead of depending on it.
> 

That makes sense.

> Guenter
> 

Regards

-- Pantelis

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
