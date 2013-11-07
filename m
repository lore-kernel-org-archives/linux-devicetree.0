From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH 0/3 - V2] Introducing Device Tree Overlays
Date: Thu, 7 Nov 2013 14:51:30 -0800
Message-ID: <20131107225130.GB24450@roeck-us.net>
References: <1383676898-29819-1-git-send-email-panto@antoniou-consulting.com>
 <20131106190152.GA8662@breakpoint.cc>
 <20131106193041.GA26796@roeck-us.net>
 <20131106203821.GC8662@breakpoint.cc>
 <20131106211754.GA29300@roeck-us.net>
 <20131107192558.GA11453@breakpoint.cc>
 <4F47D5F8-F3C7-45CA-9D88-2D814BDC1BC7@antoniou-consulting.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4F47D5F8-F3C7-45CA-9D88-2D814BDC1BC7-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Cc: Sebastian Andrzej Siewior <sebastian-E0PNVn5OA6ohrxcnuTQ+TQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Alison Chaiken <Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Lubbe <jluebbe-H4yykcOXDpCzQB+pC5nmwQ@public.gmane.org>, Alexander Sverdlin <alexander.sverdlin-OYasijW0DpE@public.gmane.org>, Michael Stickel <ms-g5CePrrZ5ROELgA04lAiVw@public.gmane.org>, Dirk Behme <dirk.behme-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alan Tull <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Michael Bohan <mbohan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ionut Nicu <ioan.nicu.ext-OYasijW0DpE@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 07, 2013 at 10:06:31PM +0200, Pantelis Antoniou wrote:
> Hi Sebastian,
>=20
> On Nov 7, 2013, at 9:25 PM, Sebastian Andrzej Siewior wrote:
>=20
> > On 06.11.13, Guenter Roeck wrote:
> > |=E2=80=A6
> > thanks for the explanation.
> >=20
> >> We use DT overlays to describe the hardware on those boards and, i=
f necessary,
> >> its configuration. For example, if there is a PCIe switch, the ove=
rlay would
> >> describe its memory and bus number configuration.
> >=20
> > So have your "fix" configuration and a few overlays you switch at
> > runtime. The problem you have is that you want to switch a specific=
 part
> > if your configuration at runtime. I assume you run DT on ARM. What

powerpc

> > happens if you swtich from ARM to x86 and you "keep" your FPGA
> > configuration requirement? You can't use both, DT and ACPI, right? =
So
> > what happens then?
> >=20
>=20
> FWIW DT has been ported to x86. And is present on arm/powerpc/mips/ar=
c and possibly
> others.
>=20
> So what are we talking about again? If you care about the non-DT case=
, why
> don't you make a patch about how you could support Guenter's use case=
 on
> the x86.
>=20
> His use case is not uncommon, believe it or not, and x86 would benefi=
t from
> something this flexible.
>=20
Together with the work Thierry has done a couple of years ago, using DT
to augment ACPI data on x86 platforms, I don't really see a major probl=
em
with using DT overlays on x86. Sure, it will require some work, and the
resulting patches may not be accepted for upstream integration,
but the concept is already there, and we plan to make good use of it.

Guenter
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
