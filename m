From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Subnodes of vendor-added nodes
Date: Tue, 20 Sep 2011 14:58:16 +1000
Message-ID: <20110920045816.GK29197@yookeroo.fritz.box>
References: <20110920043735.GA25354@dvomlehn-lnx2.corp.sa.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110920043735.GA25354-ZEW99E7oL/EiWxQNNj96ibh/4TqKg8J2XqFh9Ls21Oc@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David VomLehn <dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Cc: Device Tree Mailing List <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 19, 2011 at 09:37:35PM -0700, David VomLehn wrote:
> I know the device tree has a protocol for vendors to extend the types of nodes without
> causing namespace collisions, e.g. acme,explosives. Do subnodes and properties of the
> extended nodes also need the leading <vendor> and comma?

If the subnodes and properties in question have the semantics of
existing nodes or properties, just in the context of the new vendor
node, then no, you can use the existing names.

If they're newly defined nodes and properties with their own new
semantics, then, yes, they should have the vendor prefix.

There is some grey area here.  IBM, for example, it its OF
implementations has heaps of "ibm,XXX" properties for things which
were not defined at the time the old OF working group stopped doing
much of anything.  Some of these are truly vendor specific and deserve
the prefix, others are actually pretty general in concept and it would
have been nice in some ways to define new general bindings for them
without the vendor prefixes.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
