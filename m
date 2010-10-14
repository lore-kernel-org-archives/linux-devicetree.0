From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Proposal: new device-tree syntax and semantics for extending
	information from included dts files
Date: Wed, 13 Oct 2010 21:37:58 -0600
Message-ID: <20101014033758.GJ15286@angua.secretlab.ca>
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
> The dts syntax is meant for humans to read, otherwise, we'd just encode
> the bits in the dtb file by hand. The new syntax and semantics doesn't
> have to be reduced to provide only one way to do each thing. I believe
> we should optimize for human readability.
> 
> My vote is to go ahead with the 3 methods of modifying existing nodes
> which is /extend/, /replace/, and /remove/. Use of the /extend/ syntax,
> while optional as this is the default, should still be allowed in the
> case where most of the updates are using the other methods and for
> clarity, the writer wants to make /extend/ explicit.
> 
> So the syntax would be:
> &some-node {
> 	node-to-remove /remove/;
> 	node-to-replace /replace/ { prop = "blah"; };
> }
> 
> or even
> 
> &node-to-remove /remove/;
> &node-to-replace /replace/ { prop = "blah"; };
> // assumes &node-to-remove and &node-to-replace are labels

I suppose by making /replace/ and /extend/ explicit would provide a
mechanism for dtc to throw a warning/error if the node it is supposed
to be replacing doesn't exist.  I'm not yet convinced it is a necessary
use case though.

> > &some-node {
> > 	property-to-remove /remove-prop/;
> > 	property-to-replace = "new value";
> > 	property-to-replace-with-empty-prop;
> > 
> > 	node-to-remove /remove-node/;
> > 	node-to-replace /remove-node/ { prop = "blah"; };
> > };
> > 
> > Or perhaps with the keyword preceding:
> > 
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

Yes.  They are used all the time.  Best example I can think of in this
case is if a board wanted to replace a detailed 'ranges' property with
an empty one to enable full address range translation.

> I'm wondering if we have /remove-node/ and /remove-property/ if it
> will lead people to make errors by accidentally using the wrong
> syntax for the node or property.

The problem is that it is legal (though rare) for a child node to have
the same name as a property in a single node.  There needs to be a
difference in the grammer to show which type the operation is intended
to be performed on.  I like encoding 'node' and 'property' into the
keyword because then it is blatantly obvious what is intended.  If a
user uses /remove-node/ on a property, or /remove-property/ on a node,
then dtc won't find the target and it can righteously pitch a fit.  :-)

Also, if someone does use the wrong keyword, anyone familiar with the
english language can probably guess that /remove-property/ won't work
on nodes and visa versa.

> 
> If we're not going to use
> 	property-to-remove = /undefined/;
> 
> then I'd prefer if we used /remove/ for both nodes and properties.
> 
> I'm not sure about having the keyword in front for properties and
> afterwards for nodes. I think we want the syntactic rules to be very
> simple and easy to remember.

Yeah, I'm not sure which is best either.  I need to mull over it some
more.  I agree that the rules need to be simple and easy to remember.

g.
