From: David Gibson <dwg-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [Power.org:parch] ePAPR 1.1 to do list
Date: Tue, 31 Aug 2010 11:00:10 +1000
Message-ID: <20100831010010.GE5210@yookeroo>
References: <9696D7A991D0824DBA8DFAC74A9C5FA306688C2F@az33exm25.fsl.freescale.net>
	<20100830173314.446aae02@schlenkerla.am.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20100830173314.446aae02-1MYqz8GpK7RekFaExTCHk1jVikpgYyvb5NbjCUgZEJk@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Yoder Stuart-B08248 <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, parch-QRwYI7m9GJLYtjvyW6yDsg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Aug 30, 2010 at 05:33:14PM -0500, Scott Wood wrote:
> On Mon, 30 Aug 2010 14:34:44 -0700
> Yoder Stuart-B08248 <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> 
> > I've consolidated what I am aware of with respect to errors found in
> > 1.0,
> > clarifications needed, and new mechanisms to go into ePAPR 1.1 into
> > a single list.
> > 
> > Let me know if you are aware of anything else.
> 
> 2.2.1.1 should perhaps have a stronger connection between unit addresses
> and reg -- if you don't have the latter, you can't have the former.
> This is required for bindings to work on real Open Firmware.  David
> Gibson just posted a patch to dtc yesterday that verifies this.

Unsurprisingly, I also think this would be a good idea.

> Disambiguation without reg can still be achieved by appending numbers
> to the node names, without @.

And since this is already a standard practice in a bunch of 4xx device
trees, we should at least include mention of it as a programmer's note
in ePAPR.

> One use case to consider is nodes that have no reg, but do have
> ranges, such as the somewhat misnamed "soc" nodes.  The unit address
> mechanism has similar advantages here as with reg (a standardized way
> to disambiguate based on child-bus address, and ability to omit the unit
> address to get the first one).  We could make the rule be "first reg
> address, if no reg then first ranges child-bus address, if no reg or
> ranges then no unit address".
> 
> Such unit addresses may not work on true OF as is, but bindings should
> not require the use of unit addresses -- and if people using real OF
> find them useful, it doesn't seem like it would be unreasonable to
> modify OF to support ranges-based unit addresses in the absence of reg.

Yeah, the ranges-based unit address convention is already used in some
fsl trees.  Some IBM firmware people (with something that has both
real OF and ePAPR aspects) came up with an interesting approach to
this one.  On a bus bridge with no-MMIO they created a dummy 'reg'
property with zero length (at the same address as the first 'ranges'
entry, IIRC).  This had the advantage of Just Working with the
existing internal OF code, and doesn't appear to confuse anything, so
far.

Not sure which way is the better option for estabishing a firm
convention.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
