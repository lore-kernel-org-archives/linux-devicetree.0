From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH 6/6] MAINTAINERS: Add linux-actions mailing list for
 Actions Semi
Date: Tue, 01 Jan 2019 08:56:49 -0800
Message-ID: <a935ceb348e5b4efb754484da745425afa1e7713.camel@perches.com>
References: <20181231185517.18517-1-manivannan.sadhasivam@linaro.org>
         <20181231185517.18517-7-manivannan.sadhasivam@linaro.org>
         <2a7f53c58896e2a9c3115a8630040b98497e5877.camel@perches.com>
         <20190101032622.GC2736@Mani-XPS-13-9360>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190101032622.GC2736@Mani-XPS-13-9360>
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: sboyd@kernel.org, mturquette@baylibre.com, afaerber@suse.de, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 2019-01-01 at 08:56 +0530, Manivannan Sadhasivam wrote:
> Hi Joe,

Hi Manivannan.

> On Mon, Dec 31, 2018 at 11:12:18AM -0800, Joe Perches wrote:
> > On Tue, 2019-01-01 at 00:25 +0530, Manivannan Sadhasivam wrote:
> > > Add the linux-actions mailing list for Actions Semi SoC architecture.
> > 
> > Unrelated to adding this L: entry
> > 
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > []
> > > @@ -1240,6 +1240,7 @@ ARM/ACTIONS SEMI ARCHITECTURE
> > >  M:	Andreas Färber <afaerber@suse.de>
> > >  R:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > >  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> > > +L:	linux-actions@lists.infradead.org (moderated for non-subscribers)
> > >  S:	Maintained
> > >  N:	owl
> > 
> > The N: entry matches too many non-owl entries like:
> > 
> > Documentation/parport-lowlevel.txt
> > drivers/misc/ibmasm/lowlevel.c
> > drivers/misc/ibmasm/lowlevel.h
> > fs/udf/lowlevel.c
> > net/ipv6/ip6_flowlabel.c
> > sound/soc/samsung/lowland.c
> > 
> > Maybe there should be two entries
> > 
> > N:	/owl
> > N:	-owl
> > 
> 
> Thanks for letting us know. Yes, we need to change it. How about below?
> 
> N: owl-
> N: -owl
> 
> Will do it as a follow-up patch if agreed!

from MAINTAINERS:

	   scripts/get_maintainer.pl has different behavior for files that
	   match F: pattern and matches of N: patterns.  By default,
	   get_maintainer will not look at git log history when an F: pattern
	   match occurs.  When an N: match occurs, git log history is used
	   to also notify the people that have git commit signatures.

F: entries are preferred to N: entries because the
get_maintainer.pl script does not assume that the
N: entries are exclusively maintained.  Maybe use a
more comprehensive F: list like:

F:	Documentation/devicetree/bindings/*/*owl-*
F:	arch/arm/boot/dts/owl-*
F:	drivers/*/owl-*
F:	drivers/*/*-owl*
F:	drivers/*/*/owl-*
F:	drivers/*/*/*-owl*
F:	include/dt-bindings/power/owl-*
F:	include/linux/soc/actions/owl-sps.h
