From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC V2 PATCH 10/12] arm64: dts: msm8994 issolate non standard bootloader/LK entries
Date: Fri, 21 Oct 2016 22:25:21 +0200
Message-ID: <3979420.yzJRfAtfpN@wuerfel>
References: <1475375919-618-1-git-send-email-jmcnicol@redhat.com> <20161021194437.GA7509@tuxbot> <20161021200409.GN26139@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20161021200409.GN26139@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, Rob Herring <robh+dt@kernel.org>, Jeremy McNicoll <jmcnicol@redhat.com>, git@kchr.de, Jeremy McNicoll <jeremymc@redhat.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-soc@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Friday, October 21, 2016 1:04:09 PM CEST Stephen Boyd wrote:
> On 10/21, Bjorn Andersson wrote:
> > On Wed 19 Oct 20:17 PDT 2016, Andy Gross wrote:
> > 
> > > On Wed, Oct 19, 2016 at 08:07:25PM -0500, Rob Herring wrote:
> > [..]
> > > > Makes sense to me for things like Nexus phones here. What about DB410
> > > > for example? Is there hope for a fix there? My bootloader is only a
> > > > couple of months old and needs the properties still.
> > > 
> > > There won't be a fix for the 410c.  We barely got them to respin to use PSCI.
> > > Stephen can correct me if I am wrong on this.
> > > 
> > > If this is fixed, it would be 8996+.  If..........
> > > 
> > > So this means introducing the msm-id's for the boards that currently require it,
> > > and for the boards that will require it in the future.  And this would stay in
> > > effect until the bootloader is able to parse the compatible strings or figure
> > > this out without the msm-ids.
> > > 
> > 
> > But if the bootloader at any point in the future would support picking a
> > dtb by compatible strings instead of {msm,board,pmic}-id we wouldn't we
> > just be back to the ridiculous compatible strings that tipped over into
> > acceptance to these ids in the first place.
> > 
> > Or do we expect the boot loader to do a deep scan of the dtb to match on
> > multiple nodes from the tree?
> 
> I'm pushing the bootloader team to do the deep scan of the dtb to
> match up board compatible and pmic compatible strings so that we
> don't have to keep these numbers around. Basically put what
> dtbtool is doing into the bootloader so we don't have to post
> process the dtb anymore. We're currently discussing how to
> implement it and how to move the internal codebase to the new
> scheme.
> 
> At least for 96boards I think we can update the lk bootloaders on
> there to adopt this code. For other platforms like nexus though I
> don't see a way we can update those bootloaders, and those
> bootloaders require these properties exist in the dtbs, so we
> should just throw the numbers into the dts files there and be
> done with post processing. For bootloaders that require the QCDT
> header, we'll have to keep running dtbtool there to generate the
> header. Having the ids in the dts file or not doesn't really
> matter there.

I think part of the problem here is the way that the bootloader
expects multiple dtbs to be appended to the kernel binary, and
then pick one of them based on its contents. That doesn't really
change at all when changing the parser from looking at nonstandard
properties to looking at the compatible strings.

It still breaks the last-resort workaround for broken bootloaders
that we have in the form of appending the DT to the kernel
with CONFIG_ARM_APPENDED_DTB.

I think a better long-term strategy would be to make the bootloader
load the dtb separately from the kernel and finding the right file
using some information outside of the dtb. Ideally this is done
by storing all files on a file system that can also be mounted
to /boot, but there are probably other options that work equally well.

	Arnd 
