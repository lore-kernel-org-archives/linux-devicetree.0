From: Stefano Stabellini <sstabellini-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [Xen-devel] Duplicated memory node in the Device-Tree (WAS [XEN]
 Re: Duplicated memory nodes cause the BUG())
Date: Tue, 25 Jul 2017 11:11:51 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1707251109430.22381@sstabellini-ThinkPad-X260>
References: <835d808c-9d5e-2dc0-6cf9-8fbecdc49914@epam.com> <6d1fb061-03b0-3b58-e70a-3c0e0777d8d7@arm.com> <c77f71a3-edd9-3700-001b-feee05165454@epam.com> <7c1c8267-a065-f8ee-7e20-147d722c59be@arm.com> <b454b264-1f04-7446-fe0b-fafa82954353@epam.com>
 <eb0fbb83-a6de-d06e-f230-d06c615b0f88@citrix.com> <6e9456a3-7f0f-72e5-b4be-2bd51939d850@epam.com> <alpine.DEB.2.10.1707251045140.22381@sstabellini-ThinkPad-X260> <041fe162-8944-5c1b-364a-940d21a3c69e@arm.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <041fe162-8944-5c1b-364a-940d21a3c69e-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Julien Grall <julien.grall-5wv7dgnIgG8@public.gmane.org>
Cc: Stefano Stabellini <sstabellini-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andrii Anisov <andrii_anisov-uRwfk40T5oI@public.gmane.org>, Andrew Cooper <andrew.cooper3-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, xen-devel <xen-devel-GuqFBffKawtpuQazS67q72D2FQJk+8+b@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wei Liu <wei.liu2-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Tim Deegan <tim-LM2mM/qkH7s@public.gmane.org>, Ian Jackson <ian.jackson-mvvWK6WmYclDPfheJLI6IQ@public.gmane.org>, George Dunlap <george.dunlap-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Jan Beulich <JBeulich-IBi9RG/b67k@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 25 Jul 2017, Julien Grall wrote:
> On 25/07/17 18:52, Stefano Stabellini wrote:
> > On Tue, 25 Jul 2017, Andrii Anisov wrote:
> > > Hello Andrew,
> > > 
> > > 
> > > On 25.07.17 19:23, Andrew Cooper wrote:
> > > > As a general rule, Xen needs to be able to tolerate and cope with any
> > > > quantity of crap described by the firmware.  On the x86 side, we have
> > > > large quantities of workarounds for buggy ACPI/MP/SMBIOS tables.
> > > That approach somehow covered with early mentioned options:
> > > 
> > > On 25.07.17 15:24, Andrii Anisov wrote:
> > > > * ignore next duplicating (overlapping) memory node in favor of one
> > > > already
> > > > in a memory banks list
> > > > * merge duplicating (overlapping), even neighboring, memory banks
> > > 
> > > On 25.07.17 19:23, Andrew Cooper wrote:
> > > > It might be the case that the best Xen can do is give up, but it should
> > > > do so with a clear error message identifying what the firmware has done
> > > > which is sufficiently crazy to prevent further booting.
> > > We have one more option to choose for the case:
> > > 
> > > * BUG() with clear notification at the moment we are trying to add
> > > overlapping
> > > memory bank
> > > 
> > > So what to choose?
> > 
> > Certainly we need to print a clear warning.
> 
> +1 here.
> 
> > Then, we can decide whether we prefer to crash (as we do today), or
> > work-around the broken device-tree. I think it would be more beneficial
> > to Xen users if we tried to continue anyway, and probably the best way
> > to do that would be by merging the overlapping memory regions.
> > I fully understand that this is not required by the spec, but lots of
> > hardware (x86 and ARM) get released every day with some sort of broken
> > spec compliance. It's our job to decide on a case by case basis whether
> > it makes sense for us to support these platforms anyway.
> > 
> > In this case, the cost of supporting the Renesas R-Car Gen3 seems pretty
> > limited to me. Of course, I would have to see the patch, but if we can
> > make this work with limited amount of changes, very maintainable, I
> > would take them. Otherwise, screw it :-)
> 
> I tend to disagree here. This is the first board were the bug occurs and the
> Device-Tree is replaceable.
> 
> Furthermore, if you look at the wikipage for Renesas R-Car on Xen (see [1]), a
> specific DT for Xen is provided.
> 
> So I can't see any reason to implement that in Xen at the moment.

That's true. It does not make sense to do this until we get rid of the
Xen specific R-Car device tree on the wiki.


> [1]
> https://wiki.xenproject.org/wiki/Xen_ARM_with_Virtualization_Extensions/Salvator-X

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
