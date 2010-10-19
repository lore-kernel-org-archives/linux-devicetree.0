From: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 2/2] Allow nodes at the root to be specified by path as
	well as by label.
Date: Tue, 19 Oct 2010 09:05:55 -0700
Message-ID: <1287504355.4535.1465.camel@riker>
References: <20101018202353.24286.74857.stgit@riker>
	<20101018202540.24286.12690.stgit@riker>
	<20101019021411.GA24726@yookeroo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20101019021411.GA24726@yookeroo>
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

On Tue, 2010-10-19 at 13:14 +1100, David Gibson wrote:
> On Mon, Oct 18, 2010 at 01:25:50PM -0700, John Bonesio wrote:
> > Changes to allow us to specify a node by it's path. A path can be used in
> > place of a label.
> > 
> > This is particularly useful when overriding existing nodes.
> > This way we don't have to label every possible node in a device tree we know
> > is a base device tree for a class of systems, and we know the tree will be
> > modified for the specific systems.
> 
> Nack.  This patch is pointless, the DT_REF lexing will already resolve
> paths in the form &{/some/path} and I see no reason that won't work
> for tree merging as well.  Oh, and bare &/path/to/node is a bad idea
> anyway, more about that later.
> 

I believe a patch is still necessary. I just tried dtc from git without
changes. I didn't work.

It also looks to me like get_node_by_label() will not resolve nodes that
are specified by path.

Perhaps I'm just doing something wrong.

- John
