From: David Gibson <dwg-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [Power.org:parch] cpu nodes and Power ISA categories
Date: Tue, 21 Sep 2010 12:57:59 +1000
Message-ID: <20100921025759.GF15500@yookeroo>
References: <9696D7A991D0824DBA8DFAC74A9C5FA306631B4F@az33exm25.fsl.freescale.net>
	<2A9CCDDDAE41C446A006170FF0C786313BEE192E14@express.ghs.com>
	<20100920020105.GE5045@yookeroo>
	<2A9CCDDDAE41C446A006170FF0C786313BEEEB5479@express.ghs.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2A9CCDDDAE41C446A006170FF0C786313BEEEB5479-W7/FcDFGA5PmPQGcmWacsw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Dan Hettena <danh-5j0BnJlmnLM@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "parch-QRwYI7m9GJLYtjvyW6yDsg@public.gmane.org" <parch-QRwYI7m9GJLYtjvyW6yDsg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Sep 19, 2010 at 11:35:40PM -0700, Dan Hettena wrote:
> > > In section 3.7.1 (General Properties of CPU nodes), add the following
> > properties to the table in ePAPR 1.1:
> > >
> > > (1)
> > >
> > > Property Name: power-isa-impl-version
> > > Usage: O
> > > Value Type: <string>
> > > Definition: Specifies the architecture version number (e.g., "2.06")
> > with which this cpu is compliant.
> > ...
> > Rather than a separate property, I'd suggest here we define a
> > convention for strings which can go into the compatible property of
> > the cpu nodes.  So for example:
> > 	cpu@0 {
> > 		compatible = "ibm,POWER6", "powerpc,ISA-2.06";
> > 		....
> > 	};
> > 
> > (I'm not sure if that example is actually correct, but you get the idea).
> 
> That would be fine if powerpc were changed to power.

Um.. why?  I thought the name of the actual architecture was "PowerPC"
and that "power" was just an IBM brand name (where POWER3 and later in
the line are PowerPC architecture compliant).

> > > (2)
> > >
> > > Property Name: power-isa-impl-categories
> > > Usage: O
> > > Value Type: <stringlist>
> > > Definition: Specifies all the implemented architectural categories,
> > > in their abbreviated form, as specified in Book I of the selected
> > > ISA version (e.g., "B","E","ECL","E.HV").
> > 
> > This sounds ok, but I'd suggest some minor changes to the naming.  It
> > seems to me to make sense to treat "powerpc" as a quasi-vendor, and I
> > think we want to avoid abbreviations in property name.  So perhaps:
> > 	powerpc,implementation-categories = "E.HV";
> > 
> > I'm not really familiar with the Book I defined categories, so I can't
> > comment on the content encoding at this point.
> 
> Again, change powerpc to power and I'm happy.
> 
> > > (3) For my amusement...
> > >
> > > Property Name: power-isa-impl-errata
> > > Usage: O
> > > Value Type: <stringlist>
> > > Definition: Specifies a list of exceptions to the cpu's compliance
> > > with the architecture. Each exception consists of a pair of strings
> > > where the first string in the pair is the most general architectural
> > > category impacted by the exception and the second string is a name
> > > for the erratum. For example, a cpu node for an e500v1 core might
> > > include "ECL","fsl-icbtls-isync-itlb-miss" to indicate that
> > > undefined behavior can result if the execution of an icbtls
> > > instruction is not separated from a subsequent ITLB miss by an isync
> > > instruction. An OS may choose to avoid making use of a category if
> > > it does not have workarounds for all listed errata.
> > 
> > Interesting idea, not sure if it's practical or not.  I think we'd
> > need to pin down a bit more where the errata defintions would reside /
> > who'd be responsible for the official list of defined errata and so
> > forth.
> 
> I doubt it's practical. The biggest problem I see is that device
> trees ship (or at least always ought to ship) with hardware, and
> hardware tends to ship before all errata are known.

Yeah.  Well.. almost never would the *board* errata all be known.  The
cpu errata might, if plenty of other boards have been made with it
first.  But still.

> There is a general problem here though: Devices often fail to comply
> fully with the specifications implied by their "compatible"
> properties, so a generic driver for a device might not work unless
> there's some way to tell it what functionality of the device to
> avoid.
> 
> As to your question, the provider of the device (and thus the device
> tree node) would have to be responsible for specifying the errata,
> and I imagine there would be various pressures not to do that. Not
> everyone even makes their errata public.

Uh, sorry.  I didn't mean who decides what errata a particular device
advertises.  I mean who manages the database of what each errata
string means.

> I suspect the only real solution to this problem is the one we're
> used to: If the generic driver can't work with the device because
> the device is broken, then use a driver more specific to the device
> that knows how to get it to behave.

Indeed.  Or the theoretically similar approach of having a general
driver occasionally check for more specific compatible strings in
order to switch workarounds on or off.

It's ugly, but I think inevitable, and at least pretty flexible.  I
think we can only reasonably aim for "best effort" in providing
complete and correct information in the device tree.  Code workarounds
for the odd mis-specified thing is unavoidable, alas, we just want to
make them as infrequent as we can within the bounds of reasonable
effort.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
