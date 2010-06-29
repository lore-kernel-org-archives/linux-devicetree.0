From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] of/fdt: Add unflatten_partial_device_tree
Date: Tue, 29 Jun 2010 11:22:07 +1000
Message-ID: <20100629012207.GG13509@yookeroo>
References: <1277747279-9236-1-git-send-email-stephen.neuendorffer@xilinx.com>
	<1277747279-9236-2-git-send-email-stephen.neuendorffer@xilinx.com>
	<aa5152a0-4931-479a-bc89-78ac4922c7f1@SG2EHSMHS006.ehs.local>
	<AANLkTilXgArDaFjv0RiTMeQBdU3bma4sTtLLbwN8lI4O@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <AANLkTilXgArDaFjv0RiTMeQBdU3bma4sTtLLbwN8lI4O-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 28, 2010 at 04:18:27PM -0700, Grant Likely wrote:
> On Mon, Jun 28, 2010 at 10:47 AM, Stephen Neuendorffer
> <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
> > This code allows a user to parse a partial device tree blob, which is
> > structurally independent of any toplevel blob.
> > Previously, this code assumed that the blob comes from initial_boot_params.
> > Now, unflatten_partial_device_tree can take a blob from an arbitrary position,
> > and the location of the blob gets passed around to the various support functions.
> > Some of the functions are still tied to the initial_boot_params blob, although
> > perhaps they should get abstracted as well?
> 
> At the very least, all the references in drivers/of should probably be
> abstracted.  I'm not to worried about the stuff in arch/* unless the
> functions there are also needed for partial tree parsing.
> 
> The code in unflatten_partial_device_tree is also (as you know) a
> blatant copy and paste from unflatten_device_tree.  The two functions
> should be consolidated.
> 
> Another question is what to do with the unflattened tree once it is
> unflattened.  Some of the existing code expects the node to be part of
> the global tree.  Those could either be refactored, or the new partial
> tree could be grafted into the global tree.  Grafting will have the
> least impact, but it probably isn't a good idea in the long term.
> Grafting together unrelated trees seems messy to me.

I think I must have missed an earlier discussion.  What's the use case
for multiple fdt blobs?

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
