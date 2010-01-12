From: "Yoder Stuart-B08248" <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: RFC: proposal to extend the open-pic interrupt specifier
	definition
Date: Tue, 12 Jan 2010 11:36:29 -0700
Message-ID: <9696D7A991D0824DBA8DFAC74A9C5FA305988778@az33exm25.fsl.freescale.net>
References: <9696D7A991D0824DBA8DFAC74A9C5FA30590506E@az33exm25.fsl.freescale.net>
	<50433.84.105.60.153.1263320254.squirrel@gate.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-class: urn:content-classes:message
In-Reply-To: <50433.84.105.60.153.1263320254.squirrel-JorI+TVEvZrY24RiXHRV3ti2O/JbrIOy@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Segher Boessenkool <segher-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, parch-QRwYI7m9GJLYtjvyW6yDsg@public.gmane.org
List-Id: devicetree@vger.kernel.org

 

> -----Original Message-----
> From: 
> devicetree-discuss-bounces+stuart.yoder=freescale.com-uLR06cmDAlY@public.gmane.org
labs.org [mailto:devicetree-discuss->
bounces+stuart.yoder=freescale.com-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org] On 
> Behalf Of Segher Boessenkool
> Sent: Tuesday, January 12, 2010 12:18 PM
> To: Yoder Stuart-B08248
> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; parch-QRwYI7m9GJLYtjvyW6yDsg@public.gmane.org
> Subject: Re: RFC: proposal to extend the open-pic interrupt 
> specifier definition
> 
> > The current open-pic binding defines that interrupt specifiers
> > have 2 cells-- an interrupt number and level/sense encoding.
> >
> > With chips like the P4080 this is no longer sufficient to
> > represent the various types of interrupt sources handled by
> > the interrupt controller.  A linear list of interrupt numbers
> > doesn't handle all interrupt types-- there are at least 4 different
> > kinds of interrupts on the P4080.
> >
> > We have a proposal to extend the open-pic binding in
> > a backwards compatible way to encode additional information
> > in the level/sense field.
> 
> Why can you not have a particular "compatible" for your device,
> i.e. have a new binding for it?  Changing the "base" binding is
> asking for trouble.
> 
> You can of course base your binding on the openpic one.

Sure we can do that, but it is nice to standardize if possible to
avoid gratuitous different solutions solving the same problem.

> > The advantage of the above approach is backwards compatibility.
> > Existing interrupt specifiers (and device trees) are valid with
> > this proposal.
> 
> Actually they're not, like BenH pointed out.

The proposal is backwards compatible.  An existing interrupt
specifier  (e.g. interrupts = <24 2>;) retains its exact
same meaning.  Old device trees do not need to change
to comply with the proposal.

I'm not directly familiar with the case Ben pointed out, but
it sounded like Apple used the 1st cell in some non-standard
way.

It is true that openpic drivers would need to change to handle
the new specifier-- minimally masking the level/sense field
to 2 bits.

Stuart
