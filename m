From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] Implements new features for updating existing device
	tree nodes.
Date: Mon, 18 Oct 2010 10:01:15 -0600
Message-ID: <20101018160115.GN19399@angua.secretlab.ca>
References: <20101016010732.4855.52273.stgit@riker>
	<AANLkTimx4z-YkH+PXcnKYJpq3MEd3oJZ+ow7mWJzn1BN@mail.gmail.com>
	<1287199277.4535.1423.camel@riker> <20101016064744.GD5036@yookeroo>
	<20101016081012.GH653@angua.secretlab.ca>
	<1287236747.4535.1424.camel@riker>
	<20101016183217.GA3774@angua.secretlab.ca>
	<20101018001135.GA4922@yookeroo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20101018001135.GA4922@yookeroo>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Oct 18, 2010 at 11:11:35AM +1100, David Gibson wrote:
> On Sat, Oct 16, 2010 at 12:32:17PM -0600, Grant Likely wrote:
> > On Sat, Oct 16, 2010 at 06:45:47AM -0700, John Bonesio wrote:
> > > On Sat, 2010-10-16 at 02:10 -0600, Grant Likely wrote:
> > > > On Sat, Oct 16, 2010 at 05:47:44PM +1100, David Gibson wrote:
> > > > > On Fri, Oct 15, 2010 at 08:21:17PM -0700, John Bonesio wrote:
> [snip]
> > > > For example; I could have a labelled spi bus node with child nodes for
> > > > each of the spi devices.  I want to be able to remove/replace the
> > > > child nodes without having to label them first.
> > > > 
> > > > g.
> > > 
> > > Why not just add the label to the node you need first?
> > 
> > That may not be possible and/or desirable.  For instance, when the
> > tree is extracted from /proc.  Or if the base tree in stored in the
> > kernel source and an external tool is modifying it for a specific
> > purpose (when unable to patch the kernel tree).  Or for generated
> > device trees from the Xilinx toolchain for FPGAs.  Modifying the
> > source data isn't always an option.
> 
> You can apply your overlays by path in this case..

Right, but my argument is that in this case it is a useful syntax to
be able to delve deep into the tree, or deeper off of a label and
delete nodes within it.  And it is actually a really simple thing to
implement cleanly (as shown in the patch I posted).

> 
> > Plus I want the ability to logically group related changes.  ie.
> > delete a device and add a device to the same bus at the same time.
> > Or delete a phy node, add a replacement phy node at a different
> > address, and update the ethernet phy-device phandle in the same
> > block.
> 
> Hrm, I really don't think this is a good argument.  You're conflating
> the grouping of logically related changes with the tree structure
> which I think is a mistake.  Putting the changes in the same file
> and/or adjusting your spacing and comments to show the logical
> grouping seems less likely to cause other problems.

Though I'm not happy with it, I can live with only allowing removal of
nodes at the top level.  In fact, that constraint also completely
removes the need for a /replace-node/ keyword since the remove
operation is performed at the top level where ordering is explicitly
allowed.  So, instead of:

	/{
		node { oldprop; };
	};
	/{
		/replace-node/ the-node { newprop; };
	};

do this instead:

	/{
		node { oldprop; };
	};
	/remove-node/ &{/the-node};
	/{
		the-node { newprop; };
	};

It means only the /remove-node/ keyword needs to be defined.  However,
it does mean that the syntax for full path references must be defined
immediately before it is useful.

g.
