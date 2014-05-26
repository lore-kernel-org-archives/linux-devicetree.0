From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH v4 2/8] OF: Introduce DT overlay support.
Date: Mon, 26 May 2014 11:48:24 +0100
Message-ID: <20140526104824.63F13C42129@trevor.secretlab.ca>
References: <1396615441-29630-1-git-send-email-pantelis.antoniou@konsulko.com>
	<1396615441-29630-3-git-send-email-pantelis.antoniou@konsulko.com>
	<20140514100856.5198DC4153D@trevor.secretlab.ca>
	<E204285C-D6CD-4518-A94F-26BF0570C1B1@konsulko.com>
	<CAMuHMdUWfQ=2xPhNsS36mT6nv-CfR3_1exZ+5qYgdkjbBntrWg@mail.gmail.com>
	<20140516105814.3EA3FC403C2@trevor.secretlab.ca>
	<CAMuHMdWw39n8O0fFWECR6v6GaEJ3aB5S3ront4eDdXwxNO6Fgw@mail.gmail.com>
	<20140520055026.E3A98C412DA@trevor.secretlab.ca>
	<CAMuHMdXjWENrq0MW-DU2x7WnaCsWyipN4DO=y0ZTL+3G_fPYGg@mail.gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdXjWENrq0MW-DU2x7WnaCsWyipN4DO=y0ZTL+3G_fPYGg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Alison Chaiken <Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Lubbe <jluebbe-H4yykcOXDpCzQB+pC5nmwQ@public.gmane.org>, Alexander Sverdlin <alexander.sverdlin-OYasijW0DpE@public.gmane.org>, Michael Stickel <ms-g5CePrrZ5ROELgA04lAiVw@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Dirk Behme <dirk.behme-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alan Tull <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Michael Bohan <mbohan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ionut Nicu <ioan.nicu.ext-OYasijW0DpE@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pete Popov <pete.popov-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Dan Malek <dan.malek>
List-Id: devicetree@vger.kernel.org

On Tue, 20 May 2014 09:38:49 +0200, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org> wrote:
> Hi Grant,
> 
> On Tue, May 20, 2014 at 7:50 AM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> >> Why has the overlay system been designed for plugging and unpluging whole
> >> overlays?
> >> That means the kernel has to remember the full stack, causing issues with
> >> e.g. kexec.
> >
> > Mostly so that drivers don't see any difference in the livetree data
> > structure. It also means that userspace sees a single representation of
> > the hardware at any given time.
> 
> Sorry, I don't follow the argument about the "single representation of the
> hardware".

Er, s/of the hardware/of the tree/. Right now the overlay design
modifies the live tree which at the same time modifies the tree
representation in /sys/firmware/devicetree. If the design was changed to
keep the overlay logically separate, then I would think we want to
expose that information to usespace also. In fact, I think we would need
to for usecases like kexec.

> 
> >> Why not allowing the addition of removal of subtrees of the full device
> >> tree?
> >
> > Overlays is more than just a subtree. A single overlay can make
> > manipulations of multiple subtrees that should be handled as logically
> > atomic.
> 
> Sure, it's more complicated due to the atomicity of multiple changes.
> 
> >> This is similar to other hotpluggable subsystems (which are not necessarily
> >> DT-based), like PCI Express. That way the kernel can pass a
> >> DT-representation of the actual current device tree to a kexec'ed kernel.
> >
> > I'm not following you argument. Hardware hotplug systems like PCIe don't
> > manipulate the firmware data. The kernel detects the new device and
> > populates the Linux device model directly. Firmware provided data (ACPI
> > or FDT) isn't involved.
> 
> I mean the kernel doesn't remember the exact order in a stack, to reverse
> operations. E.g. I can add hotplug a PCIe bridge with multiple devices
> behind it, and unplug a single device later. It's still one subtree, though.

The problem comes when one overlay adds a node or configuration that is
depended on by the second overlay, but there isn't a direct reference by
the second overlay into the first.

g.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
