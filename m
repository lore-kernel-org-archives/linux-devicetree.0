From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: [PATCH v9 1/8] ARM: aurora-l2: add prefix to MAX_RANGE_SIZE
Date: Tue, 27 Aug 2019 22:15:57 +0100
Message-ID: <20190827211557.GP13294@shell.armlinux.org.uk>
References: <20190712034904.5747-1-chris.packham@alliedtelesis.co.nz>
 <20190712034904.5747-2-chris.packham@alliedtelesis.co.nz>
 <20190823104621.GY13294@shell.armlinux.org.uk>
 <20190823105020.GZ13294@shell.armlinux.org.uk>
 <836653f04f526333e8dbd45361329731f8dfe2ea.camel@alliedtelesis.co.nz>
 <20190827091336.GI13294@shell.armlinux.org.uk>
 <b1e2e5b325b3c4453e2ed63c17e1e11d6b24f099.camel@alliedtelesis.co.nz>
 <20190827210713.GO13294@shell.armlinux.org.uk>
 <0e9c7c7cb17b6fdea8d49b06925badb0b3d2ff8b.camel@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <0e9c7c7cb17b6fdea8d49b06925badb0b3d2ff8b.camel@alliedtelesis.co.nz>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "james.morse@arm.com" <james.morse@arm.com>, "mchehab@kernel.org" <mchehab@kernel.org>, "gregory.clement@free-electrons.com" <gregory.clement@free-electrons.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "jlu@pengutronix.de" <jlu@pengutronix.de>, "bp@alien8.de" <bp@alien8.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "patches@armlinux.org.uk" <patches@armlinux.org.uk>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 27, 2019 at 09:13:11PM +0000, Chris Packham wrote:
> On Tue, 2019-08-27 at 22:07 +0100, Russell King - ARM Linux admin
> wrote:
> > On Tue, Aug 27, 2019 at 08:56:05PM +0000, Chris Packham wrote:
> > > On Tue, 2019-08-27 at 10:13 +0100, Russell King - ARM Linux admin
> > > wrote:
> > > > Just send the single patch to the patch tracker - having it against
> > > > 5.3-rc is fine (I don't think anything has changed for a long time
> > > > with that file.)
> > > 
> > > Done 
> > > https://www.armlinux.org.uk/developer/patches/viewpatch.php?id=8902/1
> > > 
> > > I'm still not entirely sure what to put for the KernelVersion tag. In
> > > hindsight think I misinterpreted your comment above and set it to 5.3rc
> > > (where you meant a series based on 5.3-rcX should apply cleanly). It
> > > probably should have been next or master because it's way past the
> > > merge window for 5.3.
> > 
> > Think about it as "which kernel version was _this_ patch generated
> > against" - it's a guide for me to know which kernel version it
> > should be applied to.  The nearest Linus release (rc or final) is
> > generally sufficient.
> > 
> > If it doesn't apply to my current base, then I might check out that
> > version, apply it there, and then merge it in, resolving any
> > conflicts during the merge.
> > 
> > It started off with a different purpose: when we had the older
> > development system, such as the 2.x series kernels, we would have
> > even x being the current stable kernels, and concurrently we'd
> > also have x+1 as the development series.  When someone sent me a
> > patch back then, it was important to know which kernel series it
> > was meant for.
> > 
> > I decided not to get rid of it because it provides useful
> > information when patches don't apply, and gives more options
> > than me just discarding the patch with a comment saying it
> > doesn't apply.
> > 
> 
> Thanks for the info. So 5.3-rc is not as wrong as I thought it was.
> 
> One could even summarize the above as.
> 
>   git format-patch --add-header \
>       "KernelVersion: $(git describe --abbrev=0 HEAD)"

Yep, I should probably update the patch system help with that, and
actually strip out everything about the old diff and patch way of
working.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
