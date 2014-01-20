From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC/PATCH 0/1] mtd: Add NAND ECC devicetree binding
Date: Mon, 20 Jan 2014 11:48:09 -0800
Message-ID: <20140120194809.GS8919@ld-irv-0074>
References: <1389960820-18696-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA66555@DBDE04.ent.ti.com>
 <20140117203347.GC3843@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140117203347.GC3843@localhost>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: "Gupta, Pekon" <pekon-l0cyMroinI0@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Seif Mazareeb <seif-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 17, 2014 at 05:33:48PM -0300, Ezequiel Garcia wrote:
> On Fri, Jan 17, 2014 at 05:58:13PM +0000, Gupta, Pekon wrote:
> > Hi Ezequiel,
> > 
> > >From: Ezequiel Garcia [mailto:ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org]
> > >
> > >This patch is our first proposal to address the need for a suitable ECC
> > >devicetree binding.
> > >
> > >NAND controllers have special ECC modes, raising per-driver ECC mode devicetree
> > >binding. See for instance the binding for OMAP:
> > >
> > > - ti,nand-ecc-opt: A string setting the ECC layout to use. One of:
> > >	"sw"		<deprecated> use "ham1" instead
> > >	"hw"		<deprecated> use "ham1" instead
> > >	"hw-romcode"	<deprecated> use "ham1" instead
> > >	"ham1"		1-bit Hamming ecc code
> > >	"bch4"		4-bit BCH ecc code
> > >	"bch8"		8-bit BCH ecc code
> > >
> > >Other drivers (such as pxa3xx-nand) have similar requirements, with special
> > >(controller-specific) ECC modes. Instead of adding a possibly different binding
> > >per compatible-string, let's add generic ECC strength and ECC step size.
> > >
> > >This properties should describe completely the ECC mode and let drivers choose
> > >the appropriate ECC mode.
> > >
> > Yes, this is good approach.
> > It was found earlier that generic NAND DT bindings are not much use to other
> > controllers as well, as different h/w engines have different interpretations.
> > Brian Norris had similar comments giving example of his hardware.
> > (hope following reference helps).
> > 
> > [1] http://lists.infradead.org/pipermail/linux-mtd/2013-September/048869.html
> > 
> 
> Yes, Brian suggested this ecc-strength/ecc-size approach on IRC.

And for the record, I also alluded to it in the last paragraph of the
email Pekon linked to:

  So I'm not convinced that extending this nand-ecc-mode property is
  correct at all. But if we do want to, perhaps we'd need to introduce
  additional orthogonal properties to specify strength and step size,
  rather than listing all combinations as separate values for
  nand-ecc-mode.

[IOW, nand-ecc-strength and nand-ecc-step-size]

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
