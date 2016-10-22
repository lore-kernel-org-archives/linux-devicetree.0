From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [RFC V2 PATCH 10/12] arm64: dts: msm8994 issolate non standard
 bootloader/LK entries
Date: Fri, 21 Oct 2016 17:07:33 -0700
Message-ID: <20161022000733.GO26139@codeaurora.org>
References: <1475375919-618-1-git-send-email-jmcnicol@redhat.com>
 <20161021194437.GA7509@tuxbot>
 <20161021200409.GN26139@codeaurora.org>
 <3979420.yzJRfAtfpN@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <3979420.yzJRfAtfpN@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jeremy McNicoll <jmcnicol-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, git-LJ92rlH3Dns@public.gmane.org, Jeremy McNicoll <jeremymc-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10/21, Arnd Bergmann wrote:
> On Friday, October 21, 2016 1:04:09 PM CEST Stephen Boyd wrote:
> > I'm pushing the bootloader team to do the deep scan of the dtb to
> > match up board compatible and pmic compatible strings so that we
> > don't have to keep these numbers around. Basically put what
> > dtbtool is doing into the bootloader so we don't have to post
> > process the dtb anymore. We're currently discussing how to
> > implement it and how to move the internal codebase to the new
> > scheme.
> > 
> > At least for 96boards I think we can update the lk bootloaders on
> > there to adopt this code. For other platforms like nexus though I
> > don't see a way we can update those bootloaders, and those
> > bootloaders require these properties exist in the dtbs, so we
> > should just throw the numbers into the dts files there and be
> > done with post processing. For bootloaders that require the QCDT
> > header, we'll have to keep running dtbtool there to generate the
> > header. Having the ids in the dts file or not doesn't really
> > matter there.
> 
> I think part of the problem here is the way that the bootloader
> expects multiple dtbs to be appended to the kernel binary, and
> then pick one of them based on its contents. That doesn't really
> change at all when changing the parser from looking at nonstandard
> properties to looking at the compatible strings.
> 
> It still breaks the last-resort workaround for broken bootloaders
> that we have in the form of appending the DT to the kernel
> with CONFIG_ARM_APPENDED_DTB.

That can be "fixed" by having the bootloader use the single
appended DTB regardless of the properties existing or not. That's
a few lines of code to count the number of appended blobs and
then special case there being one.

> 
> I think a better long-term strategy would be to make the bootloader
> load the dtb separately from the kernel and finding the right file
> using some information outside of the dtb.

Can you please explain why that's a better long term strategy? So
far I've had a hard time selling this internally so I could use
the help to come up with a laundry list of reasons why this is a
better design than what we have today.

> Ideally this is done
> by storing all files on a file system that can also be mounted
> to /boot, but there are probably other options that work equally well.
> 

Some bootloaders *cough* LK *cough* aren't always able to read
filesystems. All they can do is read raw data from partitions.
That's probably why nobody has thought about reading files from
some place like /boot (which doesn't even exist in android)
because these bootloaders don't have filesystem support.

If the bootloader supports filesystems, then it would work to
encode the qcom,{msm-id,board-id,pmic-id} properties into some
long filename and then have the bootloader pick the right file
based on that. Fuzzy matching would be interesting, but it should
still work.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
