From: Alexander Sverdlin <alexander.sverdlin-OYasijW0DpE@public.gmane.org>
Subject: Re: [PATCH 0/3 - V2] Introducing Device Tree Overlays
Date: Thu, 07 Nov 2013 10:45:58 +0100
Message-ID: <527B6156.1080000@nsn.com>
References: <1383676898-29819-1-git-send-email-panto@antoniou-consulting.com> <20131106190152.GA8662@breakpoint.cc> <C10E33D7-53F6-4A50-9B84-1149DDBDC46F@antoniou-consulting.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <C10E33D7-53F6-4A50-9B84-1149DDBDC46F-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ext Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>, Sebastian Andrzej Siewior <bigeasy-E0PNVn5OA6ohrxcnuTQ+TQ@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Alison Chaiken <Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Lubbe <jluebbe-H4yykcOXDpCzQB+pC5nmwQ@public.gmane.org>, Michael Stickel <ms-g5CePrrZ5ROELgA04lAiVw@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Dirk Behme <dirk.behme-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alan Tull <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Michael Bohan <mbohan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ionut Nicu <ioan.nicu.ext-OYasijW0DpE@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi!

On 06/11/13 20:08, ext Pantelis Antoniou wrote:
>>> The following patchset introduces Device Tree overlays, a method
>>> of dynamically altering the kernel's live Device Tree, along with
>>> a generic interface to use it in a board agnostic manner.
>>
>> In case this has been discussed and I missed it: Why are we doing this?
>> Isn't it possible to d o the overlay thingy in u-boot and pass a
>> complete device tree to the kernel?
>> Are you trying to do something like hotplug-PCI where the PCI card can
>> be replaced at runtime?
>>
> 
> It has been discussed.
> 
> We are doing it because
> 
> a) We tried to do it in u-boot and it has been a complete disaster.
> Regular users just can't handle bootloader updates.

There are buses we simply do not want to deal with in uboot, like SRIO, PCIe, everything-over-ethernet.
All of them are hot-pluggable. And yeah, device-tree processing in uboot is possible, but in Linux
it's way easier...
 
> b) It is similar to that. It was originally created for the beaglebone,
> which has a concept of capes (similar to Arduino shields).
> http://circuitco.com/support/index.php?title=BeagleBone_Capes
> Turns out it's really useful to anyone doing reconfigurable hardware too,
> so that's why FPGA people are thinking of using it.
> 
> c) There are people that want to tinker with Linux based hardware boards
> but are not kernel developers. This gives them a way to do so without
> having to recompile the kernel and/or reboot while tinkering.
>  
>> Sebastian
> 
> Regards
> 
> -- Pantelis
> 
> 
> 

-- 
Best regards,
Alexander Sverdlin.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
