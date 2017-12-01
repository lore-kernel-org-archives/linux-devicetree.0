From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH][RESEND] Documentation: binding: Update endianness usage
Date: Thu, 30 Nov 2017 20:15:30 -0600
Message-ID: <20171201021530.lqosfar34ozo3tvw@rob-hp-laptop>
References: <1511955071-8770-1-git-send-email-prabhakar.kushwaha@nxp.com>
 <20171130005108.GE22908@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171130005108.GE22908@dragon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Prabhakar Kushwaha <prabhakar.kushwaha-3arQi8VN3Tc@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 30, 2017 at 08:51:09AM +0800, Shawn Guo wrote:
> On Wed, Nov 29, 2017 at 05:01:11PM +0530, Prabhakar Kushwaha wrote:
> > IFC controller version < 2.0 support IFC register access as
> > big endian. These controller version also require IFC NOR signals to
> > be connected in reverse order with NOR flash.
> > 
> > IFC >= 2.0 is other way around.
> > 
> > So updating IFC binding to take care of both using endianness field.
> > 
> > Signed-off-by: Prabhakar Kushwaha <prabhakar.kushwaha-3arQi8VN3Tc@public.gmane.org>
> 
> I would suggest something like 'dt-bindings: ifc: ...' to be the prefix.

Yes

> Shawn
> 
> > ---
> >  Documentation/devicetree/bindings/memory-controllers/fsl/ifc.txt | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/memory-controllers/fsl/ifc.txt b/Documentation/devicetree/bindings/memory-controllers/fsl/ifc.txt
> > index 89427b0..824a2ca 100644
> > --- a/Documentation/devicetree/bindings/memory-controllers/fsl/ifc.txt
> > +++ b/Documentation/devicetree/bindings/memory-controllers/fsl/ifc.txt
> > @@ -18,8 +18,10 @@ Properties:
> >                interrupt (NAND_EVTER_STAT).  If there is only one,
> >                that interrupt reports both types of event.
> >  
> > -- little-endian : If this property is absent, the big-endian mode will
> > -                  be in use as default for registers.
> > +- little-endian or big-endin : It represents how IFC registers  to be accessed.

s/endin/endian/

> > +			It also represents connection between controller and
> > +			NOR flash. If this property is absent, the big-endian
> > +			mode will be in use as default.

How you wire up the NOR to the controller would be independent of the 
register endianness. Are you sure this is not just because the data 
register(s) is BE? 

> >  
> >  - ranges : Each range corresponds to a single chipselect, and covers
> >             the entire access window as configured.
> > -- 
> > 1.9.1
> > 
> > 
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
