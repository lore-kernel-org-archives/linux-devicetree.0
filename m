From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v4 2/8] OF: Introduce DT overlay support.
Date: Thu, 15 May 2014 00:14:37 -0700
Message-ID: <4E9BC0D6-C8A7-4967-8F98-82D7D93B9667@konsulko.com>
References: <1396615441-29630-1-git-send-email-pantelis.antoniou@konsulko.com> <1396615441-29630-3-git-send-email-pantelis.antoniou@konsulko.com> <20140514100856.5198DC4153D@trevor.secretlab.ca> <53735D88.5090108@mycable.de>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53735D88.5090108-g5CePrrZ5ROELgA04lAiVw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Stickel <ms-g5CePrrZ5ROELgA04lAiVw@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Alison Chaiken <Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Lubbe <jluebbe-H4yykcOXDpCzQB+pC5nmwQ@public.gmane.org>, Alexander Sverdlin <alexander.sverdlin-OYasijW0DpE@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Dirk Behme <dirk.behme-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alan Tull <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Michael Bohan <mbohan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ionut Nicu <ioan.nicu.ext-OYasijW0DpE@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pete Popov <pete.popov-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Dan Malek <dan.malek-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Georgi Vlaev <georgi.vlaev-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Michael,

On May 14, 2014, at 5:11 AM, Michael Stickel wrote:

> Hi Grant,
> 
> Am 14.05.2014 12:08, schrieb Grant Likely:
>> More generally I am concerned about whether or not overlays
>> will introduce corner cases that can never be handled correctly,
>> particularly in how multiple overlays will get handled. I want to see
>> very clear rules on what happens when multiple overlays are applied, and
>> then removed again. Is it possible to remove overlays out of order? If
>> so, what are the conditions that would not be allowed?
> 
> Yes, it is possible that an overlay depends on another.
> 
> The problem is not, that an overlay is removed other overlays depend on,
> but that nodes of an overlay may depend on the to-be-removed overlay and
> the resulting devicetree can become inconsistent.
> 
> 
> I have an SPI Bus with two slaves. The second slave is used only on one
> of our boards. That is why we split the overlays the following way:
> 
> xxxx_spi1.dts:
>  Pinmux for SPI-Bus and activation of spi-controller.
>  Pinmux for CS0 and definition of first slave.
> 
> xxxx_spi1_cs1:
>  Pinmux for CS1 and definition of second slave.
> 
> When the overlay for the bus is removed, the overlays for the second
> slave does not make any sense anymore.
> 
> It is even worse in a scenario we have with a test board.
> One of the slaves is an spi-io-controller with a few bitbanging i2c
> masters. In an extreme case, each component is defined in a separate
> overlay and only the overlay with the master is removed. I know, that
> this is completely sick. The devices are removed cleanly because of the
> device dependency.
> 

Well, shouldn't you be reverting the overlays in reverse sequence?

As I see it, when proper subtree tracking is implemented this use case 
(of removing #0 before #1) will not be allowed.

What is your ideal scenario for this use case?

> Michael
> 

Regards

-- Pantelis

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
