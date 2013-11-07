From: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Subject: Re: [PATCH 0/3 - V2] Introducing Device Tree Overlays
Date: Thu, 7 Nov 2013 09:23:45 +0200
Message-ID: <94B1247B-32C1-49E7-AE33-67481007A7C0@antoniou-consulting.com>
References: <1383676898-29819-1-git-send-email-panto@antoniou-consulting.com> <20131106190152.GA8662@breakpoint.cc> <C10E33D7-53F6-4A50-9B84-1149DDBDC46F@antoniou-consulting.com> <20131106203102.GB8662@breakpoint.cc>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131106203102.GB8662-E0PNVn5OA6ohrxcnuTQ+TQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Andrzej Siewior <sebastian-E0PNVn5OA6ohrxcnuTQ+TQ@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Alison Chaiken <Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Lubbe <jluebbe-H4yykcOXDpCzQB+pC5nmwQ@public.gmane.org>, Alexander Sverdlin <alexander.sverdlin-OYasijW0DpE@public.gmane.org>, Michael Stickel <ms-g5CePrrZ5ROELgA04lAiVw@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Dirk Behme <dirk.behme-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alan Tull <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Michael Bohan <mbohan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ionut Nicu <ioan.nicu.ext-OYasijW0DpE@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Sebestian,

On Nov 6, 2013, at 10:31 PM, Sebastian Andrzej Siewior wrote:

> On 06.11.13, Pantelis Antoniou wrote:
>> Hi Sebastian,
> Hi Pantelis,
> 
>> It has been discussed.
>> 
>> We are doing it because
>> 
>> a) We tried to do it in u-boot and it has been a complete disaster.
>> Regular users just can't handle bootloader updates.
> 
> How so? The "additional" dtb piece was deleted by accident as part of
> the u-boot upgrade? Do you maybe a link which describes the disaster?
> 

You're assuming that bootloaders are anything like u-boot or barebox.
In the field, especially on consumer products, bootloaders are custom one-off
jobs that don't do much besides handing control to the kernel as soon as possible.

Even when using u-boot, end users botch updates related to bootloader in
such a way that systems end up RMAed.

Ask Koen Kooi in the CClist about the messy details.

>> b) It is similar to that. It was originally created for the beaglebone,
>> which has a concept of capes (similar to Arduino shields).
>> http://circuitco.com/support/index.php?title=BeagleBone_Capes
>> Turns out it's really useful to anyone doing reconfigurable hardware too,
>> so that's why FPGA people are thinking of using it.
> 
> I am aware of this. My understanding is that those capes have hardware
> information encoded in an eeprom behind i2c _and_ you can't or should
> not replace capes at runtime.
> Naive as I am I *assume* it should be easy to read this eeprom in u-boot
> as part of the boot setup and extend the dtb before passing it to the
> kernel. In case this works well, the problem here is a) ?
> 

It is just better system design to have it all done in the kernel.
Other people in the list can chime in, but it's hard to get a feel of the
problem if you haven't dealt with it before.

>> c) There are people that want to tinker with Linux based hardware boards
>> but are not kernel developers. This gives them a way to do so without
>> having to recompile the kernel and/or reboot while tinkering.
> 
> I understand that they want to avoid reboot. But they still need to
> recompile the device tree, don't they? Or does this allow to change the
> HW description without knowing the syntax of .dts?
> 

They understand the syntax of the DTS (barely).
They can't hack compiling the kernel and updating it, not by a long shot.
Not everyone is a kernel hacker (neither it needs be).

Imagine people coming over from Arduino trying to hack a 4K board file to
add support for the thing they're working on.

>> Regards
>> 
>> -- Pantelis
> 
> Sebastian

Regards

-- Pantelis

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
