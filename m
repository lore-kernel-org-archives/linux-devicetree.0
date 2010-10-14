From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Proposal: new device-tree syntax and semantics for
	extendinginformation from included dts files
Date: Thu, 14 Oct 2010 11:45:50 +1100
Message-ID: <20101014004550.GC4456@yookeroo>
References: <1286920561.4535.1315.camel@riker>
	<20101013231747.GD15286@angua.secretlab.ca>
	<d223e561-ed6e-44c2-8a99-8959e85ae022@VA3EHSMHS031.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <d223e561-ed6e-44c2-8a99-8959e85ae022-+Ck8Kgl/v0/nHLUNXTEFU7jjLBE8jN/0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, John Bonesio <bones-RkXMcIGFT/TR7s880joybQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 13, 2010 at 04:41:59PM -0700, Stephen Neuendorffer wrote:
[snip]
> > I'm not thrilled with the example because it still shows the empty
> > braces which could be construed as the node still being present.  How
> > about this syntax instead:
> > 	serial@2800 /remove-node/;
> > 
> > I also wonder if it would be better to have the directives before the
> > node name.  ie:
> > 	/extend/ node1 { ... };
> > 	/replace/ node1 { ... };
> > 	/remove/ node1;
> 
> Or better yet, outside of the braces?
> 
> 		/ {
> 		soc: soc5200@f0000000 {
> 				#address-cells = <1>;
> 				#size-cells = <1>;
>  				compatible = "fsl,mpc5200b-immr";
>  				...
> 
>  				serial@2600 {		// PSC4
>  					compatible =
> "fsl,mpc5200b-psc-uart","fsl,mpc5200-psc-uart";
> 					reg = <0x2600 0x100>;
> 					interrupts = <2 11 0>;
>  				};
> 
> 				serial@2800 {		// PSC5
>  					compatible =
> "fsl,mpc5200b-psc-uart","fsl,mpc5200-psc-uart";
>  					reg = <0x2800 0x100>;
>  					interrupts = <2 12 0>;
>  				};
>             };
>             /remove/ {
>  				serial@2600 { };		// PSC4
> 
>  				serial@2800 { };		// PSC5
>  		};

Um.. no.  That makes even less sense in the conceptual framework of a
stack of overlays.

> I agree the empty braces are wierd....  And perhaps ambiguous (does this
> mean remove the node, or remove the empty set of properties from the
> node)?

Yes.

> When I've done this in the past, it seemed to make the most sense if
> remove always applied to a specific, named node (and sub-children) or
> property.
> Is removing an entire node even interesting? (is there an interesting
> ambiguity in .dts between
> an empty node and a non-existent one?)

Well, the difference is well defined in both dts and the output dtb
format.  Whether device tree users are likely to care is another
question, but I think the answer is still yes, at least in some cases.

> Personally, I hope to avoid replace and remove, since it is difficult to
> tell if
> assumptions about which nodes may be present in an included file if
> parts of the tree
> start getting removed.

Hrm, that's a point.  We may want to make a distinction between the
operations "delete and give an error if it wasn't there before" and
"delete if present".

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
