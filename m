From: "Liviu Dudau" <liviu-I3yL/QOVVjH10XsdtD+oqA@public.gmane.org>
Subject: Re: [PATCH v5 2/4] arm64: dts: APM X-Gene PCIe device tree nodes
Date: Thu, 17 Apr 2014 01:20:42 +0100
Message-ID: <20140417002041.GE4858@bart>
References: <1395270762-6055-1-git-send-email-tinamdar@apm.com>
 <1395270762-6055-3-git-send-email-tinamdar@apm.com>
 <CAL_Jsq+XxAtUeNKFi0hH=ehb_fhFvkM0U1Zm_j1LdtQZbvSzfA@mail.gmail.com>
 <20140416170545.GD4858@bart>
 <20140416212104.GA3469@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140416212104.GA3469-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tanmay Inamdar <tinamdar-qTEPVZfXA3Y@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "patches-qTEPVZfXA3Y@public.gmane.org" <patches-qTEPVZfXA3Y@public.gmane.org>, "jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 16, 2014 at 03:21:04PM -0600, Jason Gunthorpe wrote:
> On Wed, Apr 16, 2014 at 06:05:45PM +0100, Liviu Dudau wrote:
> 
> > I have found out that we cannot pasd the config ranges from the DT into the
> > pci_host_bridge structure as the PCI framework doesn't have a resource type
> > for config resources. Leaving the translation between range flags and
> > resource type as is (filtered through the IORESOURCE_TYPE_BITS) will lead
> > to a resource type of value zero, which is not recognised by any resource
> > handling API so bridge configuration and bus scanning will barf.
> > 
> > I'm looking for suggestions here, as Jason Gunthorpe suggested that we
> > should be able to parse config ranges if they conform to the ECAM part
> > of the PCI standard.
> 
> The thinking here is the ranges should be well defined and general, it
> isn't a dumping ground for driver specific stuff.
> 
> No spec says you can put config space into the ranges at all, nobody
> should be doing that today, obviously some cases were missed during
> review..

ePAPR documents allows that when ss == 00.

> 
> The comment about ECAM was intended as a general guidance on what
> config space in ranges could/should be used for.
> 
> Right now config space shouldn't propagate out side any driver, so you
> can probably just filter it in your generic code, and make it very hard
> and obviously wrong for a driver to parse ranges for config space, so
> we don't get more usages.

OK, this goes slightly against your email from 26th March:

"When we talked about this earlier on the DT bindings list the
consensus seemed to be that configuration MMIO ranges should only be
used if the underlying memory was exactly ECAM, and was not to be used
for random configuration related register blocks.

The rational being that generic code, upon seeing that ranges entry,
could just go ahead and assume ECAM mapping."

What I'm saying is that the only code that will see this ranges entry will
be the parsing code as if we try to create a resource out of the range
and add it to the host bridge structure (not driver) we will confuse the
rest of the pci_host_bridge API. So we cannot do any ECAM accesses (yet?).


Best regards,
Liviu

> 
> Jason
> --
> To unsubscribe from this list: send the line "unsubscribe linux-pci" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

-- 
-------------------
   .oooO
   (   )
    \ (  Oooo.
     \_) (   )
          ) /
         (_/

 One small step
   for me ...

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
