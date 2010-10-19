From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] Implements new features for updating existing device
	tree nodes.
Date: Tue, 19 Oct 2010 12:02:43 +1100
Message-ID: <20101019010243.GF5512@yookeroo>
References: <AANLkTimx4z-YkH+PXcnKYJpq3MEd3oJZ+ow7mWJzn1BN@mail.gmail.com>
	<1287199277.4535.1423.camel@riker> <20101016064744.GD5036@yookeroo>
	<20101016081012.GH653@angua.secretlab.ca>
	<1287236747.4535.1424.camel@riker>
	<20101016183217.GA3774@angua.secretlab.ca>
	<20101018001135.GA4922@yookeroo>
	<20101018160115.GN19399@angua.secretlab.ca>
	<20101018124220.50a4c097@udp111988uds.am.freescale.net>
	<20101018195629.GB2259@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20101018195629.GB2259-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Oct 18, 2010 at 01:56:29PM -0600, Grant Likely wrote:
> On Mon, Oct 18, 2010 at 12:42:20PM -0500, Scott Wood wrote:
> > On Mon, 18 Oct 2010 10:01:15 -0600
> > Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
[snip]
> > Likewise with the extension of nodes being unordered in the output
> > tree (or allowing forward references) to disallowing any
> > situation where ordering of dts statements matters.  It seems to be
> > sticking with a certain design idea just for the sake of it (or
> > possibly for the convenience of the existing dtc implementation?), at
> > the cost of readability/intuitiveness.
> 
> The current structure of dtc is allowed to be quite simple because it
> builds up each top level tree in memory and then merge them wholesale.
> It doesn't have to merge at two levels (ie. merge each node as it is
> added, and then merge the trees again at the top level), and the
> parser doesn't need to have any context about the rest of the tree
> until the trees get merged.
> 
> It really does keep things simple without being too onerous on the
> user.  At the very least, I don't have any use cases that require the
> ability to reference the same node twice from within a single top
> level tree.

It does simplify the implementation a little, but that's not the real
reason for it.  The main reason is that:
	somebus {
		ethernet@100100 {
			reg = <0x100100>;
			...
		};
		ethernet@100100 {
			reg = <0x100200>;
			...
		};
	};

Is probably just a mistake, forgetting to adjust unit address when
they copy/pasted for the second ethernet.  But if we allowed
merging/overriding everywhere, not just at the top level it would be
silently accepted, clobbering most of the first ethernet node's info
with stuff intended for the second.

Allowing the extension only at the top level makes the user do
something explicit to signal that they intend to update/override
existing parts of the tree.

> > It's not an unbearable cost, but I wonder what we really gain from it.
> > 
> > > Though I'm not happy with it, I can live with only allowing removal of
> > > nodes at the top level.  In fact, that constraint also completely
> > > removes the need for a /replace-node/ keyword since the remove
> > > operation is performed at the top level where ordering is explicitly
> > > allowed.  So, instead of:
> > > 
> > > 	/{
> > > 		node { oldprop; };
> > > 	};
> > > 	/{
> > > 		/replace-node/ the-node { newprop; };
> > > 	};
> > > 
> > > do this instead:
> > > 
> > > 	/{
> > > 		node { oldprop; };
> > > 	};
> > > 	/remove-node/ &{/the-node};
> > > 	/{
> > > 		the-node { newprop; };
> > > 	};
> > > 
> > > It means only the /remove-node/ keyword needs to be defined.
> > 
> > What about property removal?  Or do you mean the only one related to
> > nodes?
> 
> Property removal will have its own syntax because it isn't the same
> thing, and properties live in a different namespace from nodes.  Also,
> the use case is simpler because 'extend' isn't assumed for properties
> like it is for nodes. Properties can either be replaced, or removed
> outright.  If we ever do have an extend syntax it will mostly likely
> just be another form of replace which a syntax to pull in parts of the
> old value (or parts of another properties value).

Right.  I think property value expressions are pretty much a
prerequisite for a sane implementation of this.

> So anyway, the property removal syntax will be implemented in a
> separate patch.

I'd actually prefer to see that patch come first, I have far less
doubts about how best to implement that than I do with the node
removing/replacing stuff.

Specifically, I'd happily ack a patch which implemented
	someprop = /undef-prop/;
immediately.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
