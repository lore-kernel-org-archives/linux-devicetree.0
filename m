From: David Gibson <dwg-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [Power.org:parch] cpu nodes and Power ISA categories
Date: Mon, 20 Sep 2010 12:01:05 +1000
Message-ID: <20100920020105.GE5045@yookeroo>
References: <9696D7A991D0824DBA8DFAC74A9C5FA306631B4F@az33exm25.fsl.freescale.net>
	<2A9CCDDDAE41C446A006170FF0C786313BEE192E14@express.ghs.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2A9CCDDDAE41C446A006170FF0C786313BEE192E14-W7/FcDFGA5PmPQGcmWacsw@public.gmane.org>
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

On Tue, Aug 24, 2010 at 06:25:21PM -0700, Dan Hettena wrote:
> As requested, here is a proposal for how cpu nodes could specify what Power ISA categories are implemented. Jimi doesn't like string lists and Ben doesn't like large numbers of Boolean properties, so I'm doing whatever happens to be most convenient for me right this second (always a great way to make difficult decisions).
> 
> In section 3.7.1 (General Properties of CPU nodes), add the following properties to the table in ePAPR 1.1:
> 
> (1)
> 
> Property Name: power-isa-impl-version
> Usage: O
> Value Type: <string>
> Definition: Specifies the architecture version number (e.g., "2.06") with which this cpu is compliant.
> 
> Note: The cpu must be fully compliant with all requirements of the
> indicated architecture version, except for any errata indicated by
> the power-isa-impl-errata property. A later architecture version may
> not be reported merely on account of the cpu having implemented
> additional features that were later incorporated into the
> architecture.

Rather than a separate property, I'd suggest here we define a
convention for strings which can go into the compatible property of
the cpu nodes.  So for example:
	cpu@0 {
		compatible = "ibm,POWER6", "powerpc,ISA-2.06";
		....
	};

(I'm not sure if that example is actually correct, but you get the idea).

> (2)
> 
> Property Name: power-isa-impl-categories
> Usage: O
> Value Type: <stringlist>
> Definition: Specifies all the implemented architectural categories,
> in their abbreviated form, as specified in Book I of the selected
> ISA version (e.g., "B","E","ECL","E.HV").

This sounds ok, but I'd suggest some minor changes to the naming.  It
seems to me to make sense to treat "powerpc" as a quasi-vendor, and I
think we want to avoid abbreviations in property name.  So perhaps:
	powerpc,implementation-categories = "E.HV";

I'm not really familiar with the Book I defined categories, so I can't
comment on the content encoding at this point.

> (3) For my amusement...
> 
> Property Name: power-isa-impl-errata
> Usage: O
> Value Type: <stringlist>
> Definition: Specifies a list of exceptions to the cpu's compliance
> with the architecture. Each exception consists of a pair of strings
> where the first string in the pair is the most general architectural
> category impacted by the exception and the second string is a name
> for the erratum. For example, a cpu node for an e500v1 core might
> include "ECL","fsl-icbtls-isync-itlb-miss" to indicate that
> undefined behavior can result if the execution of an icbtls
> instruction is not separated from a subsequent ITLB miss by an isync
> instruction. An OS may choose to avoid making use of a category if
> it does not have workarounds for all listed errata.

Interesting idea, not sure if it's practical or not.  I think we'd
need to pin down a bit more where the errata defintions would reside /
who'd be responsible for the official list of defined errata and so
forth.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
