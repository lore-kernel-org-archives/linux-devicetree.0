From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] dtc: Dynamic symbols & fixup support (v2)
Date: Fri, 15 Nov 2013 16:01:31 +0900
Message-ID: <20131115070131.78139C40785@trevor.secretlab.ca>
References: <1383073266-12017-1-git-send-email-panto@antoniou-consulting.com > <20131111175604.ECF33C4233A@trevor.secretlab.ca> < DABC2A65-BC07-4481-B80C-A62777BD8732@antoniou-consulting.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <DABC2A65-BC07-4481-B80C-A62777BD8732-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Pantelis-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 12 Nov 2013 11:20:04 +0100, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org> wrote:
> Hi Grant,
> 
> On Nov 11, 2013, at 6:56 PM, Grant Likely wrote:
> 
> > On Tue, 29 Oct 2013 21:01:06 +0200, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org> wrote:
> >> Enable the generation of symbol & fixup information for
> >> usage with dynamic DT loading.
> >> 
> >> Passing the -@ option generates a __symbols__ node at the
> >> root node of the resulting blob for any node labels used.
> >> 
> >> When using the /plugin/ tag all unresolved label references
> >> be tracked in the __fixups__ node, while all local phandle
> >> references will the tracked in the __local_fixups__ node.
> >> 
> >> This is sufficient to implement a dynamic DT object loader.
> >> 
> >> Changes since v1:
> >> 
> >> * Forward ported to 1.4 version
> >> * Added manual entries for the -@ option
> >> 
> >> Signed-off-by: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
> > 
> > Hi Pantelis,
> > 
> > This looks pretty good on first look. Comments below.
> > 
> >> ---
> >> Documentation/dt-object-internal.txt | 295 +++++++++++++++++++++++++++++++++++
> >> Documentation/manual.txt             |  10 ++
> 
> [snip]
> 
> >> +-----------------------------------------
> >> +
> >> +Since the device tree is used for booting a number of very different hardware
> >> +platforms it is imperative that we tread very carefully.
> >> +
> >> +2.a) No changes to the Device Tree binary format. We cannot modify the tree
> >> +format at all and all the information we require should be encoded using device
> >> +tree itself. We can add nodes that can be safely ignored by both bootloaders and
> >> +the kernel.
> > 
> > Not /entirely/ true. It would be completely fine to bump up the binary
> > format version for the overlays since they will never be loaded
> > standalone. If there are specific things that you would like to have in
> > the marshalled format then go ahead and propose them. Then the overlay
> > would use the new protocol version, but the base tree would use the
> > existing one.
> 
> OK, I see. I am very hesitant to bump the format version, because both the
> base DTS and the overlay need to be compiled with symbol support.
> We can bump the version format for the overlay fragment, but bumping the
> version for the base DTS will affect bootloaders badly.

Hmmm, I missed that detail. Why does the base tree require symbol
support? It looked to me like the overlay had all the resolution
information needed.

g.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
