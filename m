From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v7 1/2] mtd: arasan: Add device tree binding
 documentation
Date: Tue, 10 Jan 2017 09:06:21 +0100
Message-ID: <20170110090621.09d08cfa@bbrezillon>
References: <1483930734-10309-1-git-send-email-punnaia@xilinx.com>
        <20170110053605.yqclykdgi3tgndnp@rob-hp-laptop>
        <03CA77BA8AF6F1469AEDFBDA1322A7B76424ECD2@XAP-PVEXMBX02.xlnx.xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <03CA77BA8AF6F1469AEDFBDA1322A7B76424ECD2-4lKfpRxZ5ekkx2a1wsGfbYg+Gb3gawCHQz34XiSyOiE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org" <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "richard-/L3Ra7n9ekc@public.gmane.org" <richard-/L3Ra7n9ekc@public.gmane.org>, "cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org" <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michal Simek <michals-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "kalluripunnaiahchoudary-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <kalluripunnaiahchoudary-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "kpc528-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <kpc528-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Punnaiah,

On Tue, 10 Jan 2017 06:03:25 +0000
Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:

> Hi Rob,
>     
>    Thanks for the review.
> 
> > -----Original Message-----
> > From: Rob Herring [mailto:robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org]
> > Sent: Tuesday, January 10, 2017 11:06 AM
> > To: Punnaiah Choudary Kalluri <punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> > Cc: dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org; computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org;
> > boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org; marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org;
> > richard-/L3Ra7n9ekc@public.gmane.org; cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org; mark.rutland-5wv7dgnIgG8@public.gmane.org; linux-
> > kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org;
> > devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Michal Simek <michals-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>;
> > kalluripunnaiahchoudary-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org; kpc528-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org; Punnaiah
> > Choudary Kalluri <punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> > Subject: Re: [PATCH v7 1/2] mtd: arasan: Add device tree binding
> > documentation
> > 
> > On Mon, Jan 09, 2017 at 08:28:53AM +0530, Punnaiah Choudary Kalluri wrote:  
> > > This patch adds the dts binding document for arasan nand flash
> > > controller.
> > >
> > > Signed-off-by: Punnaiah Choudary Kalluri <punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> > > ---
> > > Changes in v7:
> > > - Corrected the acronyms those should be in caps
> > > changes in v6:
> > > - Removed num-cs property
> > > - Separated nandchip from nand controller
> > > changes in v5:
> > > - None
> > > Changes in v4:
> > > - Added num-cs property
> > > - Added clock support
> > > Changes in v3:
> > > - None
> > > Changes in v2:
> > > - None
> > > ---
> > >  .../devicetree/bindings/mtd/arasan_nfc.txt         | 38  
> > ++++++++++++++++++++++  
> > >  1 file changed, 38 insertions(+)
> > >  create mode 100644  
> > Documentation/devicetree/bindings/mtd/arasan_nfc.txt  
> > >
> > > diff --git a/Documentation/devicetree/bindings/mtd/arasan_nfc.txt  
> > b/Documentation/devicetree/bindings/mtd/arasan_nfc.txt  
> > > new file mode 100644
> > > index 0000000..f20adfc
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/mtd/arasan_nfc.txt
> > > @@ -0,0 +1,38 @@
> > > +Arasan NAND Flash Controller with ONFI 3.1 support
> > > +
> > > +Required properties:
> > > +- compatible: Should be "arasan,nfc-v3p10"  
> > 
> > Needs a note that it must also have an SoC specific compatible string.
> >   
>   Sorry, I couldn't understand this comment. Could you elaborate it?

Arasan is an IP vendor, and those IPs are usually embedded in specific
SoCs. I guess Rob was suggesting to define something like:

  compatible = "<soc-vendor>,<ip-revision>", "arasan,<ip-revision>";

This way you can differentiate minor changes/tweaks between each SoC
(each SoC vendor usually enable/disable specific features based on
their needs).

> 
> > > +- reg: Memory map for module access
> > > +- interrupt-parent: Interrupt controller the interrupt is routed through
> > > +- interrupts: Should contain the interrupt for the device
> > > +- clock-name: List of input clocks - "clk_sys", "clk_flash"  
> > 
> > clk_ is redundant.
> >   
>   
>  I have defined these clock names as per the controller data sheet.
>  So, I feel it is fine to have them in sync with the datasheet.
>   Please let me know if you still want me to change this.

We already know this is a clock, hence the unneeded clk_ prefix. Please
drop it.

Thanks,

Boris
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
