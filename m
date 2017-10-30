From: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: Devicetree Workshop Follow Up: Adding hierarchy to
 arch/arm/boot/dts
Date: Mon, 30 Oct 2017 11:14:09 -0700
Message-ID: <20171030181409.6mvjud3yq3kiidfv@us-sjc-wireless-10-16-34-58.amer.corp.natinst.com>
References: <20171030164626.GA14993@tyrael.ni.corp.natinst.com>
 <20171030170917.GC27404@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171030170917.GC27404-l+eeeJia6m9URfEZ8mYm6t73F7V6hmMc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Russell,

On Mon, Oct 30, 2017 at 05:09:17PM +0000, Russell King - ARM Linux wrote:
> On Mon, Oct 30, 2017 at 09:46:26AM -0700, Moritz Fischer wrote:
> > Hi all,
> > 
> > as discussed in Prague last week, here's my follow up.
> > A bit of background again as refresher: Some time ago I submitted a
> > patchset adding dts for some of upcoming boards ([1]).
> > Arguments brought up against merging it were that we have too many Zynq
> > based boards already in tree.
> > 
> > During the Devicetree Workshop we had a brief discussion and most people
> > in the room seemed to be ok with adding the boards, someone suggested
> > (Arnd?) to add vendor subdirectories like in arm64, i.e. something
> > like:
> > 
> > arch/arm/boot/dts/xilinx/ni/<board>
> > 
> > where Xilinx would be the SoC vendor and NI the integrator.
> 
> I utterly hate deep levels of directories, but I think the ARM64
> solution where we /generally/ have one level of additional
> directories under dts is a good compromise.  With 1640 files in
> arch/arm/boot/dts, it does need splitting up.
> 
> I'm not sure that splitting it by "integrator" is a good idea
> for a single level of directory - using the SoC, SoC group, or
> SoC manufacturer is better.  It needs to be a balance between
> number of subdirectories and number of files in the subdirectory,
> so using guidance and not setting it as a hard and fast rule
> makes sense too.  What is right for one SoC group may not be
> right for another group of SoCs.

Ok so in our case that would be:

arch/arm/boot/dts/zynq-*.dts -> arch/arm/boot/dts/xilinx

or: 

arch/arm/boot/dts/zynq-*.dts -> arch/arm/boot/dts/zynq
> 
> What I think we should avoid is having to needlessly descend into
> all of the subdirectories, so it needs to be based around the
> Kconfig symbols we're already using.

So as example only add the arch/arm/boot/dts/xilinx subdirectory based on
CONFIG_ARCH_ZYNQ?

> 
> -- 
> RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
> FTTC broadband for 0.8mile line in suburbia: sync at 8.8Mbps down 630kbps up
> According to speedtest.net: 8.21Mbps down 510kbps up

Cheers,

Moritz
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
