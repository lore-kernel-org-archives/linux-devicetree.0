From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH 3/4] arm64: dts: marvell: Clean up armada-7040-db
Date: Thu, 24 Mar 2016 13:59:31 +0000
Message-ID: <20160324135931.GE26573@io.lakedaemon.net>
References: <1458771861-12392-1-git-send-email-afaerber@suse.de>
 <1458771861-12392-4-git-send-email-afaerber@suse.de>
 <20160324091832.0060c907@free-electrons.com>
 <87oaa4npbk.fsf@free-electrons.com>
 <20160324114037.1204b46e@free-electrons.com>
 <20160324133723.GB15624@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160324133723.GB15624@lunn.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 24, 2016 at 02:37:23PM +0100, Andrew Lunn wrote:
> > > I agree that converting the Marvell Armada 32-bits SoCs would produce a
> > > lot of churn. But if some binding are common there is no file at all are
> > > in common, so we could use this solution for the 64 bits SoCs only.
> > 
> > Yes, we could. I'm fine with it. I was merely pointing out that it is
> > moving away from our 32 bits way of doing things.
> 
> Sebastian spent a while converting dove and kirkwood to this
> scheme. Most boards have i2c, nand, eth, and mdio properties
> represented link this.
> 
> There are no many 64 bit boards, so now is the time to make the
> change...

Agreed.

thx,

Jason.
