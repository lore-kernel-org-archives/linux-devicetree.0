From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [RFC V2 PATCH 10/12] arm64: dts: msm8994 issolate non standard
 bootloader/LK entries
Date: Fri, 21 Oct 2016 17:36:10 -0700
Message-ID: <20161022003610.GP26139@codeaurora.org>
References: <1475375919-618-1-git-send-email-jmcnicol@redhat.com>
 <2149904.D2eaQZN3bA@wuerfel>
 <17447be1-4357-0eca-a242-69576d3e2799@redhat.com>
 <4976066.k14mpQt0HJ@wuerfel>
 <20161019214643.GC3145@hector.attlocal.net>
 <CAL_Jsq+wjnEByg2vgx-P+bLJaQm+s=UX7nj=KwviagnQDG_3hQ@mail.gmail.com>
 <20161020031712.GD3145@hector.attlocal.net>
 <20161021194437.GA7509@tuxbot>
 <20161021200409.GN26139@codeaurora.org>
 <20161021224244.GC7509@tuxbot>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161021224244.GC7509@tuxbot>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Jeremy McNicoll <jmcnicol-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, git-LJ92rlH3Dns@public.gmane.org, Jeremy McNicoll <jeremymc-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10/21, Bjorn Andersson wrote:
> On Fri 21 Oct 13:04 PDT 2016, Stephen Boyd wrote:
> 
> > On 10/21, Bjorn Andersson wrote:
> > > On Wed 19 Oct 20:17 PDT 2016, Andy Gross wrote:
> > > 
> > > > On Wed, Oct 19, 2016 at 08:07:25PM -0500, Rob Herring wrote:
> > > [..]
> > > > > Makes sense to me for things like Nexus phones here. What about DB410
> > > > > for example? Is there hope for a fix there? My bootloader is only a
> > > > > couple of months old and needs the properties still.
> > > > 
> > > > There won't be a fix for the 410c.  We barely got them to respin to use PSCI.
> > > > Stephen can correct me if I am wrong on this.
> > > > 
> > > > If this is fixed, it would be 8996+.  If..........
> > > > 
> > > > So this means introducing the msm-id's for the boards that currently require it,
> > > > and for the boards that will require it in the future.  And this would stay in
> > > > effect until the bootloader is able to parse the compatible strings or figure
> > > > this out without the msm-ids.
> > > > 
> > > 
> > > But if the bootloader at any point in the future would support picking a
> > > dtb by compatible strings instead of {msm,board,pmic}-id we wouldn't we
> > > just be back to the ridiculous compatible strings that tipped over into
> > > acceptance to these ids in the first place.
> > > 
> > > Or do we expect the boot loader to do a deep scan of the dtb to match on
> > > multiple nodes from the tree?
> > 
> > I'm pushing the bootloader team to do the deep scan of the dtb to
> > match up board compatible and pmic compatible strings so that we
> > don't have to keep these numbers around. Basically put what
> > dtbtool is doing into the bootloader so we don't have to post
> > process the dtb anymore. We're currently discussing how to
> > implement it and how to move the internal codebase to the new
> > scheme.
> > 
> 
> Based on the variations described in your "Document qcom board
> compatible format" patch you would need to scan the DTB for:

I think you're looking at an outdated doc?

> 
> * SoC, Platform type and Version
>   All part of /compatible, so that's simple
> 
> * Memory size
>   Look at second cell of /memory/reg ? Or just reject this variable?

We dropped this one. I don't know if we'll have users so we
punted.

> 
> * PMIC
>   Find the qcom,spmi-pmic-arb and iterate over each child and match the
>   compatible of with some predefined list. We need to add all version
>   variations of these in the compatibles to make this work as well.

We find it based on aliases. usid0,2,4,6 are found from the
aliases node and then we look at the pmic compatible string. I've
been trying to keep people honest there and have them put the
actual compatible string for the pmic in the pmic node.

> 
> * Main storage technology
>   Look for an active node compatible with qcom,ufshc and if not found
>   fall back to expecting this was a eMMC only DTB?
> 
> * Display panel
>   Find the qcom,mdss compatible, follow the qcom,mdp5 compatible child
>   to extract ports/port@0 to get the of_graph handle to some connector
>   node, then in ../port@1 we can find a phandle to the panel which we
>   can find and then match against a predefined set of compatibles.

We punted on these ones too. I don't know if we care. The panel
sounds especially painful.

> 
> > At least for 96boards I think we can update the lk bootloaders on
> > there to adopt this code. For other platforms like nexus though I
> > don't see a way we can update those bootloaders, and those
> > bootloaders require these properties exist in the dtbs, so we
> > should just throw the numbers into the dts files there and be
> > done with post processing. For bootloaders that require the QCDT
> > header, we'll have to keep running dtbtool there to generate the
> > header. Having the ids in the dts file or not doesn't really
> > matter there.
> > 
> 
> At the time we introduced the Xperia Z1 (Honami) our boot loader only
> supported QCDT, so I experimented with a version of dtbTool that kept a
> compatible to id table mapping hardcoded (very much like your existing
> dtbTool). And as expected it turns into an unmaintainable mess to track
> this information on the side.
> 

I think msm-id and pmic-ids are fairly simple. The problems
really come from the slight board variants and how to handle
those. The scheme we have today with dtbtool attempts to keep
things simple but it may need to be more complicated on Honami. I
don't really have a problem continuing to update the tool with
new SoC and PMIC models, but I don't see much point in it now
(see below).

> 
> I'm sorry, but to me that just sounds like a lot of work to find an
> alternative to the functional and pragmatic solution that exists today,
> just for the sake of hiding these non-standard ids in an even more
> non-standard way.
> 

I agree. This has all been a lot of effort to figure out some
alternative to having the numbers in the dts files. I won't argue
that the numbers are pretty, or that they don't duplicate
information that's already there in some other form of board/pmic
compatible strings, but the truth is we have bootloaders that are
looking inside the dtbs for these magic numbers now. The approach
that Nexus devices take has been pushed as the only method of dtb
picking inside the company so QCDT support is going away soon.

So going through the work to post process and then add in the
properties that could have been added in the dts in the first
place seems like a big waste of time. I'd rather we just leave
the numbers there and everything just works. We do have the
possibility of two different dtbs aliasing on the qcom,board-id
property, but I'd rather just let that problem happen and rely on
users to only append dtbs with different ids to their kernel.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
