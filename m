From: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: Devicetree Workshop Follow Up: Adding hierarchy to
 arch/arm/boot/dts
Date: Mon, 30 Oct 2017 13:51:45 -0700
Message-ID: <20171030205145.5igci4hkbhrnkd4s@us-sjc-wireless-10-16-34-58.amer.corp.natinst.com>
References: <20171030164626.GA14993@tyrael.ni.corp.natinst.com>
 <20171030170917.GC27404@n2100.armlinux.org.uk>
 <20171030181409.6mvjud3yq3kiidfv@us-sjc-wireless-10-16-34-58.amer.corp.natinst.com>
 <CAL_Jsq+VkULu=1q6aPT9GKQhR2b1V1ATWB5yA6EWAr69xY1_8Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+VkULu=1q6aPT9GKQhR2b1V1ATWB5yA6EWAr69xY1_8Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Mon, Oct 30, 2017 at 07:51:26PM +0000, Rob Herring wrote:
> On Mon, Oct 30, 2017 at 1:14 PM, Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> > Hi Russell,
> >
> > On Mon, Oct 30, 2017 at 05:09:17PM +0000, Russell King - ARM Linux wrote:
> >> On Mon, Oct 30, 2017 at 09:46:26AM -0700, Moritz Fischer wrote:
> >> > Hi all,
> >> >
> >> > as discussed in Prague last week, here's my follow up.
> >> > A bit of background again as refresher: Some time ago I submitted a
> >> > patchset adding dts for some of upcoming boards ([1]).
> >> > Arguments brought up against merging it were that we have too many Zynq
> >> > based boards already in tree.
> 
> First I've seen this. Are the revX versions long lived? I could see
> some pushback on having multiple revisions, but adding the board
> itself seems silly.

Well, RevC were shipped to customer X and are deployed in the field,
revD has some fixes, customers have them, RevE might have some more
fixes, meanwhile I need to support all of them. Note how I did not send
a Rev1, which is the one no customer will ever get hands on.

> 
> >> > During the Devicetree Workshop we had a brief discussion and most people
> >> > in the room seemed to be ok with adding the boards, someone suggested
> >> > (Arnd?) to add vendor subdirectories like in arm64, i.e. something
> >> > like:
> >> >
> >> > arch/arm/boot/dts/xilinx/ni/<board>
> >> >
> >> > where Xilinx would be the SoC vendor and NI the integrator.
> >>
> >> I utterly hate deep levels of directories, but I think the ARM64
> >> solution where we /generally/ have one level of additional
> >> directories under dts is a good compromise.  With 1640 files in
> >> arch/arm/boot/dts, it does need splitting up.
> 
> Agreed.
> 
> >> I'm not sure that splitting it by "integrator" is a good idea
> >> for a single level of directory - using the SoC, SoC group, or
> >> SoC manufacturer is better.  It needs to be a balance between
> >> number of subdirectories and number of files in the subdirectory,
> >> so using guidance and not setting it as a hard and fast rule
> >> makes sense too.  What is right for one SoC group may not be
> >> right for another group of SoCs.
> >
> > Ok so in our case that would be:
> >
> > arch/arm/boot/dts/zynq-*.dts -> arch/arm/boot/dts/xilinx
> 
> Yes. I would like the rule to be "use the SoC vendor prefix".
> Unfortunately, we haven't quite followed that for arm64 with things
> like exynos and freescale.

Ok, let's do this then.
> 
> > or:
> >
> > arch/arm/boot/dts/zynq-*.dts -> arch/arm/boot/dts/zynq
> 
> No.
> 
> >>
> >> What I think we should avoid is having to needlessly descend into
> >> all of the subdirectories, so it needs to be based around the
> >> Kconfig symbols we're already using.
> >
> > So as example only add the arch/arm/boot/dts/xilinx subdirectory based on
> > CONFIG_ARCH_ZYNQ?
> 
> No. Look at arch/arm64/boot/dts/Makefile and you will see why that doesn't work.

Ok, will take a look.
> 
> If this can be entirely scripted, I would suggest writing the script
> and we provide the script to Linus to run just before an -rc1 (or
> arm-soc folks can run it as long as all dts changes go thru their
> tree). Also, pay attention that we don't break the
> devicetree-rebasing.git tree.

Alright, let me see if I can make this work,
> 
> Rob

Thanks for your feedback,

Moritz
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
