From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v4 2/8] OF: Introduce DT overlay support.
Date: Tue, 27 May 2014 08:21:15 -0700
Message-ID: <20140527152115.GA30180@roeck-us.net>
References: <CAMuHMdXjWENrq0MW-DU2x7WnaCsWyipN4DO=y0ZTL+3G_fPYGg@mail.gmail.com>
 <20140526104824.63F13C42129@trevor.secretlab.ca>
 <CAMuHMdUGdjVKBR5rRzZ274rf7p8XfztNRWEojH1RrZV8c_V1uA@mail.gmail.com>
 <20140526112348.907B7C421A5@trevor.secretlab.ca>
 <A6195DFD-0447-4444-AC09-501C43F09924@konsulko.com>
 <20140526213303.C1C73C40E11@trevor.secretlab.ca>
 <20140526223630.GA32691@earth.universe>
 <5383D174.8070304@roeck-us.net>
 <20140527121236.3B818C40A5A@trevor.secretlab.ca>
 <9CF30A1A-5EB6-401E-A0D5-453CB99B4A83@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <9CF30A1A-5EB6-401E-A0D5-453CB99B4A83-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Alison Chaiken <Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Lubbe <jluebbe-H4yykcOXDpCzQB+pC5nmwQ@public.gmane.org>, Alexander Sverdlin <alexander.sverdlin-OYasijW0DpE@public.gmane.org>, Michael Stickel <ms-g5CePrrZ5ROELgA04lAiVw@public.gmane.org>, Dirk Behme <dirk.behme-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alan Tull <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Michael Bohan <mbohan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ionut Nicu <ioan.nicu.ext-OYasijW0DpE@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pete Popov <pete.popov@ko>
List-Id: devicetree@vger.kernel.org

On Tue, May 27, 2014 at 03:24:35PM +0300, Pantelis Antoniou wrote:
> Hi Grant,
> 
> On May 27, 2014, at 3:12 PM, Grant Likely wrote:
> 
> > On Mon, 26 May 2014 16:42:44 -0700, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org> wrote:
> >> On 05/26/2014 03:36 PM, Sebastian Reichel wrote:
> >>> Hi,
> >>> 
> >>> On Mon, May 26, 2014 at 10:33:03PM +0100, Grant Likely wrote:
> >>>> After thinking about it more, I think it is very likely that removing
> >>>> all the overlays is the correct thing to do in the kexec use-case. When
> >>>> kexec-ing, it makes sense that we'd want the exact same behaviour from
> >>>> the kexec'ed kernel. That means we want the device drivers to do the
> >>>> same thing including loading whatever overlays they depend on.
> >>>> 
> >>>> If the flattened tree was left applied, then the behaviour becomes
> >>>> different.
> >>>> 
> >>>> I say always remove the overlays unless explicitly told not to, but I'm
> >>>> struggling to come up with use cases where keeping them applied is
> >>>> desirable.
> >>> 
> >>> I would assume, that I want them applied in most cases. DT describes
> >>> the hardware. If I kexec into a new kernel I change software, not
> >>> hardware.
> >>> 
> >>> Maybe I'm missing the main purpose of the feature. I currently see
> >>> two useful usecases for DT overlays:
> >>> 
> >>> 1. The dtb the kernel is booted with cannot be changed for some
> >>>    reason, but the board has additional hardware attached (e.g.
> >>>    the user added a sensor on the i2c bus)
> >>> 2. The hardware is changed on the fly (e.g. the user flashed the
> >>>    FPGA part of a zynq processor), sensors on i2c bus, ...
> >>> 
> >>> In both cases the kernel should be booted with the additional
> >>> overlay information IMHO. Though for the second case it should
> >>> be possible to remove the "programmed" hardware information
> >>> somehow.
> >>> 
> >> 
> >> 3. Some hot-plug device or card is inserted or removed.
> >> 
> >> I would argue that the kernel should _not_ be booted with the overlay in place.
> >> Otherwise the code handling overlays would have to have special handling
> >> for the restart case, which is much more complex than just to re-insert
> >> the overlay when it is determined that the device or card is still there.
> > 
> > Exactly.
> > 
> 
> Looks like we are levitating to the 'remove overlays on kexec' approach.
> Is that correct?
> 

Let's just assume for a minute that this is not the case, and that loaded
overlays are passed on.

This would be an interesting challenge for the overlay manager, as it would
have to handle a number of startup conditions. After all, it can not take
it as granted that the hardware state did not change after it was stopped
in the old kernel, and before it was started in the new kernel.
- overlay loaded, but hardware/device no longer present
  -> unload overlay
- overlay loaded, but different hardware present
  -> unload old overlay, load new one
- overlay not loaded, hardware present
  -> load overlay
- overlay loaded and matches hardware
  -> do nothing

In comparison, its task would be quite straightforward if loaded overlays
are not passed on to the new kernel.
- If hardware is present, load overlay

Ultimately, I seem to be missing something, as I don't really see the benefit
of passing on the loaded overlay(s) to the new kernel. Activation time, maybe,
for the most common case (overlay loaded and matches hardware) ?

Concern though is the other cases, with a mismatch between HW and loaded
overlays. I am not sure if it is even possible to ensure that there are
no race conditions if the devicetree is outdated at system startup. Sure,
that is unlikely to happen in 'normal' operating conditions, but that only
means that it _will_ happen a few hours after the first customer starts
playing with the system.

Guenter
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
