From: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Subject: Re: Devicetree Workshop Follow Up: Adding hierarchy to
 arch/arm/boot/dts
Date: Mon, 30 Oct 2017 17:09:17 +0000
Message-ID: <20171030170917.GC27404@n2100.armlinux.org.uk>
References: <20171030164626.GA14993@tyrael.ni.corp.natinst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171030164626.GA14993-KFgJe6S/L2nknyRNNOXSQ2IaLvZF3x2V0E9HWUfgJXw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Oct 30, 2017 at 09:46:26AM -0700, Moritz Fischer wrote:
> Hi all,
> 
> as discussed in Prague last week, here's my follow up.
> A bit of background again as refresher: Some time ago I submitted a
> patchset adding dts for some of upcoming boards ([1]).
> Arguments brought up against merging it were that we have too many Zynq
> based boards already in tree.
> 
> During the Devicetree Workshop we had a brief discussion and most people
> in the room seemed to be ok with adding the boards, someone suggested
> (Arnd?) to add vendor subdirectories like in arm64, i.e. something
> like:
> 
> arch/arm/boot/dts/xilinx/ni/<board>
> 
> where Xilinx would be the SoC vendor and NI the integrator.

I utterly hate deep levels of directories, but I think the ARM64
solution where we /generally/ have one level of additional
directories under dts is a good compromise.  With 1640 files in
arch/arm/boot/dts, it does need splitting up.

I'm not sure that splitting it by "integrator" is a good idea
for a single level of directory - using the SoC, SoC group, or
SoC manufacturer is better.  It needs to be a balance between
number of subdirectories and number of files in the subdirectory,
so using guidance and not setting it as a hard and fast rule
makes sense too.  What is right for one SoC group may not be
right for another group of SoCs.

What I think we should avoid is having to needlessly descend into
all of the subdirectories, so it needs to be based around the
Kconfig symbols we're already using.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 8.8Mbps down 630kbps up
According to speedtest.net: 8.21Mbps down 510kbps up
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
