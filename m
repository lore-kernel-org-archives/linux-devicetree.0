From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: [PATCH v9 1/8] ARM: aurora-l2: add prefix to MAX_RANGE_SIZE
Date: Tue, 27 Aug 2019 10:13:36 +0100
Message-ID: <20190827091336.GI13294@shell.armlinux.org.uk>
References: <20190712034904.5747-1-chris.packham@alliedtelesis.co.nz>
 <20190712034904.5747-2-chris.packham@alliedtelesis.co.nz>
 <20190823104621.GY13294@shell.armlinux.org.uk>
 <20190823105020.GZ13294@shell.armlinux.org.uk>
 <836653f04f526333e8dbd45361329731f8dfe2ea.camel@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <836653f04f526333e8dbd45361329731f8dfe2ea.camel@alliedtelesis.co.nz>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "jlu@pengutronix.de" <jlu@pengutronix.de>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "james.morse@arm.com" <james.morse@arm.com>, "gregory.clement@free-electrons.com" <gregory.clement@free-electrons.com>, "bp@alien8.de" <bp@alien8.de>, "mchehab@kernel.org" <mchehab@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "patches@armlinux.org.uk" <patches@armlinux.org.uk>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 26, 2019 at 12:46:44AM +0000, Chris Packham wrote:
> Hi Russell,
> 
> On Fri, 2019-08-23 at 11:50 +0100, Russell King - ARM Linux admin
> wrote:
> > On Fri, Aug 23, 2019 at 11:46:21AM +0100, Russell King - ARM Linux
> > admin wrote:
> > > I can't apply this series - this file does not exist in my tree,
> > > and
> > > from what git tells me, it never has existed.  Maybe it's in
> > > someone
> > > elses tree?
> > 
> > I think the file is in my tree, just as arch/arm/mm/cache-aurora-l2.h
> > which is where it has been since it was originally submitted in 2012.
> 
> Sorry there is a missing patch that moves it next to the
> hardware/cache-*.h. I can send the missing patch or I can re-send the
> whole series. If I do send the whole series do you want me to rebase it
> against a particular tag/tree?

Just send the single patch to the patch tracker - having it against
5.3-rc is fine (I don't think anything has changed for a long time
with that file.)

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
