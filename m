From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] Implements new features for updating existing device
	tree nodes.
Date: Mon, 18 Oct 2010 13:56:29 -0600
Message-ID: <20101018195629.GB2259@angua.secretlab.ca>
References: <20101016010732.4855.52273.stgit@riker>
	<AANLkTimx4z-YkH+PXcnKYJpq3MEd3oJZ+ow7mWJzn1BN@mail.gmail.com>
	<1287199277.4535.1423.camel@riker> <20101016064744.GD5036@yookeroo>
	<20101016081012.GH653@angua.secretlab.ca>
	<1287236747.4535.1424.camel@riker>
	<20101016183217.GA3774@angua.secretlab.ca>
	<20101018001135.GA4922@yookeroo>
	<20101018160115.GN19399@angua.secretlab.ca>
	<20101018124220.50a4c097@udp111988uds.am.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20101018124220.50a4c097-N/eSCTBpGwP7j4BuCOFQISmX4OfbXNuMKnGXBo5VDl8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Oct 18, 2010 at 12:42:20PM -0500, Scott Wood wrote:
> On Mon, 18 Oct 2010 10:01:15 -0600
> Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> 
> > On Mon, Oct 18, 2010 at 11:11:35AM +1100, David Gibson wrote:
> > > On Sat, Oct 16, 2010 at 12:32:17PM -0600, Grant Likely wrote:
> > > > Plus I want the ability to logically group related changes.  ie.
> > > > delete a device and add a device to the same bus at the same time.
> > > > Or delete a phy node, add a replacement phy node at a different
> > > > address, and update the ethernet phy-device phandle in the same
> > > > block.
> > > 
> > > Hrm, I really don't think this is a good argument.  You're conflating
> > > the grouping of logically related changes with the tree structure
> > > which I think is a mistake.  Putting the changes in the same file
> > > and/or adjusting your spacing and comments to show the logical
> > > grouping seems less likely to cause other problems.
> 
> Shouldn't the tree structure, if practical, represent the logical
> structure?  The actual operations (as the user intends them) are on
> particular properties or subnodes, not on top-level trees.
> 
> Likewise with the extension of nodes being unordered in the output
> tree (or allowing forward references) to disallowing any
> situation where ordering of dts statements matters.  It seems to be
> sticking with a certain design idea just for the sake of it (or
> possibly for the convenience of the existing dtc implementation?), at
> the cost of readability/intuitiveness.

The current structure of dtc is allowed to be quite simple because it
builds up each top level tree in memory and then merge them wholesale.
It doesn't have to merge at two levels (ie. merge each node as it is
added, and then merge the trees again at the top level), and the
parser doesn't need to have any context about the rest of the tree
until the trees get merged.

It really does keep things simple without being too onerous on the
user.  At the very least, I don't have any use cases that require the
ability to reference the same node twice from within a single top
level tree.

> It's not an unbearable cost, but I wonder what we really gain from it.
> 
> > Though I'm not happy with it, I can live with only allowing removal of
> > nodes at the top level.  In fact, that constraint also completely
> > removes the need for a /replace-node/ keyword since the remove
> > operation is performed at the top level where ordering is explicitly
> > allowed.  So, instead of:
> > 
> > 	/{
> > 		node { oldprop; };
> > 	};
> > 	/{
> > 		/replace-node/ the-node { newprop; };
> > 	};
> > 
> > do this instead:
> > 
> > 	/{
> > 		node { oldprop; };
> > 	};
> > 	/remove-node/ &{/the-node};
> > 	/{
> > 		the-node { newprop; };
> > 	};
> > 
> > It means only the /remove-node/ keyword needs to be defined.
> 
> What about property removal?  Or do you mean the only one related to
> nodes?

Property removal will have its own syntax because it isn't the same
thing, and properties live in a different namespace from nodes.  Also,
the use case is simpler because 'extend' isn't assumed for properties
like it is for nodes. Properties can either be replaced, or removed
outright.  If we ever do have an extend syntax it will mostly likely
just be another form of replace which a syntax to pull in parts of the
old value (or parts of another properties value).

So anyway, the property removal syntax will be implemented in a
separate patch.

g.
