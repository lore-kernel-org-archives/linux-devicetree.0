From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Proposal: new device-tree syntax and semantics for extending
	information from included dts files
Date: Thu, 14 Oct 2010 15:00:39 +1100
Message-ID: <20101014040039.GI4456@yookeroo>
References: <1286920561.4535.1315.camel@riker>
	<20101013231747.GD15286@angua.secretlab.ca>
	<20101014003833.GB4456@yookeroo>
	<20101014014036.GE15286@angua.secretlab.ca>
	<1287025692.4535.1348.camel@riker>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1287025692.4535.1348.camel@riker>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: John Bonesio <bones-RkXMcIGFT/TR7s880joybQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Oct 13, 2010 at 08:08:12PM -0700, John Bonesio wrote:
> On Wed, 2010-10-13 at 19:40 -0600, Grant Likely wrote:
> > On Thu, Oct 14, 2010 at 11:38:33AM +1100, David Gibson wrote:
> > > On Wed, Oct 13, 2010 at 05:17:47PM -0600, Grant Likely wrote:
> > > > On Tue, Oct 12, 2010 at 02:56:01PM -0700, John Bonesio wrote:
[snip]
> > > > > 	B) /replace/
> > > > 
> > > > /replace-node/ perhaps?
> > > 
> > > There is no need for this.  It's equivalent to a /remove/ then an
> > > /extend/, which is barely more verbose.
> > 
> > Need to flush this out.  What would this look like then?  This?
> > 
> > &some-node {
> > 	node-to-remove /remove/;
> > 
> > 	node-to-replace /remove/;
> > 	node-to-replace { prop = "blah"; };
> > };
> > 
> > I don't like this one because it implies ordering between the first
> > and second 'node-to-replace' definitions, and to this point the syntax
> > has not imposed any order assumptions.
> > 
> > Perhaps this:
> > 
> > &some-node {
> > 	node-to-remove /remove/;
> > 	node-to-replace /remove/ { prop = "blah"; };
> > };
> 
> I think this is going to be really confusing. A person looking at this
> for the first time will be wondering, "Why are we removing property,
> 'prop'. I thought we needed that one?"
> 
> I believe that if we want to be able to replace nodes, we should stick
> with the /replace/ syntax.
> 
> The dts syntax is meant for humans to read, otherwise, we'd just encode
> the bits in the dtb file by hand. The new syntax and semantics doesn't

Well, it's meant for programmers (specifically, C programmers) to read..

> have to be reduced to provide only one way to do each thing. I believe
> we should optimize for human readability.

It's because of readability that I want to get rid of duplicate syntax
with identical semantics.  That leads readers to go "what's the
difference" when there is none.

> My vote is to go ahead with the 3 methods of modifying existing nodes
> which is /extend/, /replace/, and /remove/. Use of the /extend/ syntax,
> while optional as this is the default, should still be allowed in the
> case where most of the updates are using the other methods and for
> clarity, the writer wants to make /extend/ explicit.

Nack.  Any new syntax we're stuck with more-or-less forever.  I know
you and others want these features, but adding new syntax without more
than half a day's attempt to reach consensus is not wise.

[snip]
> > &some-node {
> > 	/remove-prop/ property-to-remove;
> > 	property-to-replace = "new value";
> > 	property-to-replace-with-empty-prop;
> > 
> > 	/remove-node/ node-to-remove;
> > 	/remove-node/ node-to-replace { prop = "blah"; };
> > };
> > 
> > And the following construct would be forbidden:
> > 
> > 	/remove-prop/ property-to-remove = "new value;
> 
> Do we need to be able to set a property with an empty value?

Yes, absolutely.  Empty valued properties (which are distinct from
non-existent properties) are used routinely in real trees.

> I'm wondering if we have /remove-node/ and /remove-property/ if it
> will lead people to make errors by accidentally using the wrong
> syntax for the node or property.

You mean this?
	/remove-node/ some-property;

Not that likely an error, IMO.  And more to the point it will just
generate a syntax error for which we can easily provide an error
message pointing directly at the mistake.  It's not mistakes which
lead the compiler to reject the input which are scary, it's the ones
which will silently produce a valid tree that's not the one you
expected.

> If we're not going to use
> 	property-to-remove = /undefined/;
> 
> then I'd prefer if we used /remove/ for both nodes and properties.
> 
> I'm not sure about having the keyword in front for properties and
> afterwards for nodes. I think we want the syntactic rules to be very
> simple and easy to remember.

Um.. I don't think that was ever suggested.  Although if using an
explicit preceding /remove/ for nodes and '= /undefined/' for props
that's kind of the same thing but the other way around.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
