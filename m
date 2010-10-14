From: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: RE: Proposal: new device-tree syntax and semantics for
	extendinginformation from included dts files
Date: Thu, 14 Oct 2010 09:38:44 -0700
Message-ID: <21eeaef0-fc78-47c9-b1c5-bfefaa55fb85@SG2EHSMHS003.ehs.local>
References: <1286920561.4535.1315.camel@riker>
	<20101013231747.GD15286@angua.secretlab.ca>
	<d223e561-ed6e-44c2-8a99-8959e85ae022@VA3EHSMHS031.ehs.local>
	<20101014004550.GC4456@yookeroo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Class: urn:content-classes:message
In-Reply-To: <20101014004550.GC4456@yookeroo>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, John Bonesio <bones-RkXMcIGFT/TR7s880joybQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: David Gibson [mailto:david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org]
> Sent: Wednesday, October 13, 2010 5:46 PM
> To: Stephen Neuendorffer
> Cc: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org; John Bonesio;
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> Subject: Re: Proposal: new device-tree syntax and semantics for
extendinginformation from included dts
> files
> 
> On Wed, Oct 13, 2010 at 04:41:59PM -0700, Stephen Neuendorffer wrote:
> [snip]
> > > I'm not thrilled with the example because it still shows the empty
> > > braces which could be construed as the node still being present.
How
> > > about this syntax instead:
> > > 	serial@2800 /remove-node/;
> > >
> > > I also wonder if it would be better to have the directives before
the
> > > node name.  ie:
> > > 	/extend/ node1 { ... };
> > > 	/replace/ node1 { ... };
> > > 	/remove/ node1;
> >
> > Or better yet, outside of the braces?
> >
> > 		/ {
> > 		soc: soc5200@f0000000 {
> > 				#address-cells = <1>;
> > 				#size-cells = <1>;
> >  				compatible = "fsl,mpc5200b-immr";
> >  				...
> >
> >  				serial@2600 {		// PSC4
> >  					compatible =
> > "fsl,mpc5200b-psc-uart","fsl,mpc5200-psc-uart";
> > 					reg = <0x2600 0x100>;
> > 					interrupts = <2 11 0>;
> >  				};
> >
> > 				serial@2800 {		// PSC5
> >  					compatible =
> > "fsl,mpc5200b-psc-uart","fsl,mpc5200-psc-uart";
> >  					reg = <0x2800 0x100>;
> >  					interrupts = <2 12 0>;
> >  				};
> >             };
> >             /remove/ {
> >  				serial@2600 { };		// PSC4
> >
> >  				serial@2800 { };		// PSC5
> >  		};
> 
> Um.. no.  That makes even less sense in the conceptual framework of a
> stack of overlays.

Why exactly?  Instead of being a stack of overlays, it seems to me like
a stack of trees with operators..
The point is exactly that operators make most sense at the stack of
trees level and not
at the individual node level.

Steve

This email and any attachments are intended for the sole use of the named recipient(s) and contain(s) confidential information that may be proprietary, privileged or copyrighted under applicable law. If you are not the intended recipient, do not read, copy, or forward this email message or any attachments. Delete this email message and any attachments immediately.
