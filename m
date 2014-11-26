From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH v4 6/7] ARM: mvebu: add PHY support to the dts for the
 USB controllers on Armada 375
Date: Tue, 25 Nov 2014 22:59:29 -0500
Message-ID: <20141126035929.GJ22670@titan.lakedaemon.net>
References: <1415879269-29711-1-git-send-email-gregory.clement@free-electrons.com>
 <1415879269-29711-7-git-send-email-gregory.clement@free-electrons.com>
 <20141122020811.GO22670@titan.lakedaemon.net>
 <5470556B.6080608@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5470556B.6080608-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Nov 22, 2014 at 10:20:43AM +0100, Gregory CLEMENT wrote:
> Hi Jason,
> 
> On 22/11/2014 03:08, Jason Cooper wrote:
> > On Thu, Nov 13, 2014 at 12:47:48PM +0100, Gregory CLEMENT wrote:
> >> Now that the USB cluster node has been added, use it as a PHY provider
> >> for the USB controller linked to it: the first EHCI and the xHCI.
> >>
> >> Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> >> ---
> >>  arch/arm/boot/dts/armada-375.dtsi | 5 +++++
> >>  1 file changed, 5 insertions(+)
> >>
> >> diff --git a/arch/arm/boot/dts/armada-375.dtsi b/arch/arm/boot/dts/armada-375.dtsi
> >> index 8f45cf5d2a50..f344ec420c95 100644
> >> --- a/arch/arm/boot/dts/armada-375.dtsi
> >> +++ b/arch/arm/boot/dts/armada-375.dtsi
> >> @@ -14,6 +14,7 @@
> >>  #include "skeleton.dtsi"
> >>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> >>  #include <dt-bindings/interrupt-controller/irq.h>
> >> +#include <dt-bindings/phy/phy.h>
> > 
> > Odd.  The previous patch in this series simply adds a line to phy.h,
> > however, I get the following error during 'make dtbs':
> > 
> > ########
> >   DTC     arch/arm/boot/dts/armada-375-db.dtb
> > In file included from arch/arm/boot/dts/armada-375-db.dts:17:0:arch/arm/boot/dts/armada-375.dtsi:17:33:
> > fatal error: dt-bindings/phy/phy.h: No such file or directory
> >  #include <dt-bindings/phy/phy.h>
> >                                  ^
> > compilation terminated.
> > scripts/Makefile.lib:282: recipe for target 'arch/arm/boot/dts/armada-37 5-db.dtb' failed
> > ########
> > 
> > mvebu/dt is based on v3.18-rc1.  Is there a missing dependency
> > somewhere?  Perhaps we should let Kishon take the whole series and
> > handle the (hopefully trivial) merge conflict?
> 
> Actually Kishon asked me to use the dt-bindings/phy/phy.h file which
> was introduced by the patch "phy: Add PHY header file for DT x Driver
> defines". So indeed I had to have a dependency on the phy_dt_header
> branch (which is based on v3.18-rc4 and have only this single commit).
> The git tree is located at
> git://git.kernel.org/pub/scm/linux/kernel/git/kishon/linux-phy.git
> 
> 
> Maybe we could add this branch in mvebu as a dependency as it is done
> on arm-soc. I suggest this because I would prefer that we continue to
> be the only ones to merge the device tree files in order to reduce the
> merge conflict.

Ok, I've applied patches 5 and 6 to mvebu/dt-usb_phy with a dependency
on tags/phy-dt-header.

Patches 1-4:

Acked-by: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
