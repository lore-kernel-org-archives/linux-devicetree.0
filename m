From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v6 2/2] mtd: nand: add sunxi NFC dt bindings doc
Date: Tue, 21 Oct 2014 14:53:44 +0200
Message-ID: <20141021145344.575b19e6@bbrezillon>
References: <1413805520-14947-1-git-send-email-boris.brezillon@free-electrons.com>
	<1413805520-14947-3-git-send-email-boris.brezillon@free-electrons.com>
	<20141021024134.GC1193@ld-irv-0074>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBCIPJ6FA2QLBBX5OTGRAKGQEIXXY4RI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20141021024134.GC1193@ld-irv-0074>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yassin Jaffer <yassinjaffer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Brian,

On Mon, 20 Oct 2014 19:41:34 -0700
Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Hi Boris,
> 
> On Mon, Oct 20, 2014 at 01:45:20PM +0200, Boris Brezillon wrote:
> > Add the sunxi NAND Flash Controller dt bindings documentation.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > ---
> >  .../devicetree/bindings/mtd/sunxi-nand.txt         | 45 ++++++++++++++++++++++
> >  1 file changed, 45 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mtd/sunxi-nand.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/mtd/sunxi-nand.txt b/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
> > new file mode 100644
> > index 0000000..0273adb
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
> > @@ -0,0 +1,45 @@
> > +Allwinner NAND Flash Controller (NFC)
> > +
> > +Required properties:
> > +- compatible : "allwinner,sun4i-a10-nand".
> > +- reg : shall contain registers location and length for data and reg.
> > +- interrupts : shall define the nand controller interrupt.
> > +- #address-cells: shall be set to 1. Encode the nand CS.
> > +- #size-cells : shall be set to 0.
> > +- clocks : shall reference nand controller clocks.
> > +- clock-names : nand controller internal clock names. Shall contain :
> > +    * "ahb" : AHB gating clock
> > +    * "mod" : nand controller clock
> > +
> > +Optional children nodes:
> > +Children nodes represent the available nand chips.
> > +
> > +Optional properties:
> > +- allwinner,rb : shall contain the native Ready/Busy ids.
> > + or
> > +- rb-gpios : shall contain the gpios used as R/B pins.
> 
> I think you're relying on a named GPIO in your driver ("nand-rb"). That
> should be documented here.

Actually that's the name I assign to the pin when requesting it, this
has nothing to do with a specific property containing pin names for
specific gpio retrieval (as done for clocks with clock-names).

> 
> > +- nand-ecc-mode : one of the supported ECC modes ("hw", "hw_syndrome", "soft",
> > +  "soft_bch" or "none")
> 
> I think you're utilizing an undocumented 'nand-name' property for this
> node in your driver too. Please document it. (That also goes for any
> other undocumented properties I may have missed.)

I'll drop this nand-name property and let the NAND core code choose a
name for the MTD device according to the discovered NAND chip.

Thanks,

Boris



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
