From: Sebastian Andrzej Siewior <sebastian-E0PNVn5OA6ohrxcnuTQ+TQ@public.gmane.org>
Subject: Re: [PATCH 0/3 - V2] Introducing Device Tree Overlays
Date: Thu, 7 Nov 2013 21:46:26 +0100
Message-ID: <20131107204626.GA11746@breakpoint.cc>
References: <1383676898-29819-1-git-send-email-panto@antoniou-consulting.com>
 <20131106190152.GA8662@breakpoint.cc>
 <20131106193041.GA26796@roeck-us.net>
 <20131106203821.GC8662@breakpoint.cc>
 <20131106211754.GA29300@roeck-us.net>
 <20131107192558.GA11453@breakpoint.cc>
 <4F47D5F8-F3C7-45CA-9D88-2D814BDC1BC7@antoniou-consulting.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4F47D5F8-F3C7-45CA-9D88-2D814BDC1BC7-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Alison Chaiken <Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Lubbe <jluebbe-H4yykcOXDpCzQB+pC5nmwQ@public.gmane.org>, Alexander Sverdlin <alexander.sverdlin-OYasijW0DpE@public.gmane.org>, Michael Stickel <ms-g5CePrrZ5ROELgA04lAiVw@public.gmane.org>, Dirk Behme <dirk.behme-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alan Tull <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Michael Bohan <mbohan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ionut Nicu <ioan.nicu.ext-OYasijW0DpE@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07.11.13, Pantelis Antoniou wrote:
> Hi Sebastian,
Hi Pantelis,

> FWIW DT has been ported to x86. And is present on arm/powerpc/mips/arc and possibly
> others.

Yes, I know. I am the one that did the work for CE4100, the first one
that boots with DT on x86.

> So what are we talking about again? If you care about the non-DT case, why
> don't you make a patch about how you could support Guenter's use case on
> the x86.

I am only saying that this "hot-plug a device at a non hot-plugagle bus at
runtime" is not limited to DT but this solution is. X86 + ACPI is not
the only limitation. ARM is (forced) going to ACPI as well as far I
know. And this solution is limited to DT. This is what I am pointing
out.

> His use case is not uncommon, believe it or not, and x86 would benefit from
> something this flexible.

I *think* a more flexible solution would be something like bus_type which is
exposed via configfs. It would be attached behind a certain device/bus where
the "physical" hotplug interface is. The user would then be able to read the
configuration based on whatever information he has and could then create
devices he likes at runtime. This wouldn't depend much on the firmware that is
used but would require a little more work I think.

> Regards
> 
> -- Pantelis

Sebastian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
