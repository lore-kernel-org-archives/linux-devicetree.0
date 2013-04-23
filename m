From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [RFC PATCH v2 03/13] ARM: mach-at91: cpus/cpu node dts updates
Date: Tue, 23 Apr 2013 14:53:04 +0100
Message-ID: <20130423135304.GG22946@e102568-lin.cambridge.arm.com>
References: <1366644455-16550-1-git-send-email-lorenzo.pieralisi@arm.com>
 <1366644455-16550-4-git-send-email-lorenzo.pieralisi@arm.com>
 <51768892.7060807@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <51768892.7060807-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jon Medhurst <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Barry Song <baohua.song-kQvG35nSl+M@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Amit Kucheria <amit.kucheria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Vinayak Kale <vkale-qTEPVZfXA3Y@public.gmane.org>, Lennert Buytenhek <kernel-OLH4Qvv75CYX/NnBR394Jw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 23, 2013 at 02:11:46PM +0100, Rob Herring wrote:
> On 04/22/2013 10:27 AM, Lorenzo Pieralisi wrote:
> > This patch updates the in-kernel dts files according to the latest cpus
> > and cpu bindings updates for ARM.
> > 
> > Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/at91sam9260.dtsi | 2 +-
> >  arch/arm/boot/dts/at91sam9263.dtsi | 2 +-
> >  arch/arm/boot/dts/at91sam9g45.dtsi | 2 +-
> >  arch/arm/boot/dts/at91sam9n12.dtsi | 2 +-
> >  4 files changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/arm/boot/dts/at91sam9260.dtsi b/arch/arm/boot/dts/at91sam9260.dtsi
> > index cb7bcc5..2e9de85 100644
> > --- a/arch/arm/boot/dts/at91sam9260.dtsi
> > +++ b/arch/arm/boot/dts/at91sam9260.dtsi
> > @@ -33,7 +33,7 @@
> >  	};
> >  	cpus {
> >  		cpu@0 {
> > -			compatible = "arm,arm926ejs";
> > +			compatible = "arm,arm926";
> 
> I don't understand why you are doing this. If this does not match the
> documentation, fix the documentation. We can't continue on changing dts
> files without reqard to breaking compatibility.

IMHO compatibility is already broken. There are a number of dts in the
kernel missing cpus and cpu nodes, others with cpu nodes missing
device_type = "cpu", missing cpu nodes compatible properties and the list
goes on and on. Those files got merged in the kernel before bindings were
properly defined for ARM so at that point in time the only reference was the
ePAPR and still, it was not followed (eg my broken patch above fails to add
device_type = "cpu" to the cpu node, should I change the documentation (ePAPR)
to make the dts above compliant ? I do not think so, I reckon we should fix
all dts and force them to comply with the ePAPR and the in-kernel bindings).

If we do not set in stone the bindings and draw a line now, this stuff will
go wild, it is already in a state that I do not like much.

The reason we are patching the compatible property above is to avoid having
compatible properties containing suffixes for CPUs, we do not deem that
necessary, see:

http://lists.infradead.org/pipermail/linux-arm-kernel/2013-January/145305.html

That's just my opinion, open to change it to find a proper solution to this
issue as long as we make progress.

Thanks for the review,
Lorenzo

> 
> Rob
> 
> >  		};
> >  	};
> >  
> > diff --git a/arch/arm/boot/dts/at91sam9263.dtsi b/arch/arm/boot/dts/at91sam9263.dtsi
> > index 271d4de..25c4725 100644
> > --- a/arch/arm/boot/dts/at91sam9263.dtsi
> > +++ b/arch/arm/boot/dts/at91sam9263.dtsi
> > @@ -30,7 +30,7 @@
> >  	};
> >  	cpus {
> >  		cpu@0 {
> > -			compatible = "arm,arm926ejs";
> > +			compatible = "arm,arm926";
> >  		};
> >  	};
> >  
> > diff --git a/arch/arm/boot/dts/at91sam9g45.dtsi b/arch/arm/boot/dts/at91sam9g45.dtsi
> > index 6b1d4ca..cf647d1 100644
> > --- a/arch/arm/boot/dts/at91sam9g45.dtsi
> > +++ b/arch/arm/boot/dts/at91sam9g45.dtsi
> > @@ -36,7 +36,7 @@
> >  	};
> >  	cpus {
> >  		cpu@0 {
> > -			compatible = "arm,arm926ejs";
> > +			compatible = "arm,arm926";
> >  		};
> >  	};
> >  
> > diff --git a/arch/arm/boot/dts/at91sam9n12.dtsi b/arch/arm/boot/dts/at91sam9n12.dtsi
> > index 7750f98..d531ae3 100644
> > --- a/arch/arm/boot/dts/at91sam9n12.dtsi
> > +++ b/arch/arm/boot/dts/at91sam9n12.dtsi
> > @@ -32,7 +32,7 @@
> >  	};
> >  	cpus {
> >  		cpu@0 {
> > -			compatible = "arm,arm926ejs";
> > +			compatible = "arm,arm926";
> >  		};
> >  	};
> >  
> > 
> 
> 
