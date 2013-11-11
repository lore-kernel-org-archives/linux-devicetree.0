From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: common location for devicetree files
Date: Mon, 11 Nov 2013 17:35:00 +0000
Message-ID: <20131111173500.GM21201@e106331-lin.cambridge.arm.com>
References: <1438803E-C904-428B-B042-891978BC15DF@codeaurora.org>
 <20131108165255.GA32668@titan.lakedaemon.net>
 <5957C301-9698-45B0-BFED-749DE79D0A74@codeaurora.org>
 <20131108181351.GF10335@titan.lakedaemon.net>
 <2274FB81-099B-4206-8332-70E9824FFF2F@codeaurora.org>
 <20131108183240.GH10335@titan.lakedaemon.net>
 <528104AD.9030102@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <528104AD.9030102@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Jason Cooper <jason@lakedaemon.net>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org list" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 11, 2013 at 04:24:13PM +0000, Stephen Warren wrote:
> On 11/08/2013 11:32 AM, Jason Cooper wrote:
> > On Fri, Nov 08, 2013 at 12:17:30PM -0600, Kumar Gala wrote:
> > ...
> >> I get the point, just not sure how else to sort the 800+ .dts{i} files
> >> that we have in the kernel tree right now.
> > 
> > Well, to start with, all #include'd files could go into a
> > arch/dts/include directory.  That would clean things up a bit.
> > 
> > We could also consider separating the dts files by ISA.  All armv7 in
> > one directory, armv8, armv5te, powerpc, mips, etc.
> 
> It's quite likely people will want to share some significant *.dtsi
> across multiple architectures.

At the moment we have some duplication of Versatile Express dtsi files
across the arm{,64}/boot/dts/ folders that could be shared. We already
share similar dtsi files between dts for ARMv7 and ARMv8 boards in
Pawel's external arm-dts repo [1].

Sharing across ISAs is important to me at least.

Mark.

[1] http://linux-arm.org/git?p=arm-dts.git;a=tree;f=versatile_express;h=7559c30fa94c471ff2a08c7936c5c01139d16f33;hb=18db2060268ae5b2b8616ba87376d73e338d4ca2

> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
