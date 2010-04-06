From: "Yoder Stuart-B08248" <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: new device tree binding review process idea
Date: Tue, 6 Apr 2010 08:04:05 -0700
Message-ID: <9696D7A991D0824DBA8DFAC74A9C5FA305CAFB62@az33exm25.fsl.freescale.net>
References: <fa686aa41003252213w3f403d42pea3c8c88adbf5832@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-class: urn:content-classes:message
In-Reply-To: <fa686aa41003252213w3f403d42pea3c8c88adbf5832-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


> Device tree 'bindings' document how individual devices are described
> in the device tree.  For any given device, the binding says what
> properties and nodes a device driver needs to use the device.
> 
> This page documents the process for writing and reviewing new
> bindings.  New bindings are written for new devices that cannot be
> handled by existing bindings.
> 
> == Creating a new draft binding ==
> * New draft bindings shall be written in plain-text format using the
> Mediawiki markup language, ideally as a new page in this wiki.

I think the review and approval process looks good, no issues
with it.

I do question whether we want bindings created in Mediawiki markup
languages vs just plain text.

I've created a couple of example bindings based on the ePAPR
ns16550 binding (using a binding template we have been using
internally at Freescale for a couple of years):

Plain text: http://fdt.secretlab.ca/Compatible%3Dsry,ns16550-v1

Mediawiki: http://fdt.secretlab.ca/Compatible%3Dsry,ns16550-v2

You could get a lot more fancy than that and use tables or
something, but the more Mediawiki-ized the text gets the harder
it to review the source text on a mailing list.

Another thing to consider is whether eventually we want to 
maintain approved bindings in git.  It would be convenient
to do a git clone of a device-tree-bindings.git repo, be able to
grep it, etc.  Say you want to find all bindings that use
a certain property.   I'm not sure how good the Mediawiki
search is.

So, my vote would be to require a plain text format/template
that should be used with no Mediawiki markup.  The binding
would be posted on the wiki between <pre></pre> tags.

The plain text will give some flexibility in how the binding
could be used in other contexts.

> * Authors and reviews should work toward a consensus on the binding.
> * When consensus is reached, ask one of the device tree binding
> maintainers mark the binding as 'approved'.
> * '''(TBD: who are the maintainers going to be?  How does someone
> contact the maintainers)'''

To start with I think each company should designate a maintainer
for company-specific bindings.

Stuart Yoder
