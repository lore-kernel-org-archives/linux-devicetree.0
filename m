From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: Re: [1/2] libfdt: Rework fdt_next_node()
Date: Fri, 06 Feb 2009 11:21:41 -0600
Message-ID: <E1LVUOb-0000PN-Jp@jdl.com>
References: <20090206024929.GC18397@yookeroo.seuss>
	<20090206030156.GG18397@yookeroo.seuss>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-reply-to: <20090206030156.GG18397-787xzQ0H9iRg7VrjXcPTGA@public.gmane.org> 
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

> Currently fdt_next_node() will find the next node in the blob
> regardless of whether it is above, below or at the same level in the
> tree as the starting node - the depth parameter is updated to indicate
> which is the case.  When a depth parameter is supplied, this patch
> makes it instead terminate immediately when it finds the END_NODE tag
> for a node at depth 0.  In this case it returns the offset immediately
> past the END_NODE tag.
> 
> This has a couple of advantages.  First, this slightly simplifies
> fdt_subnode_offset(), which no longer needs to explicitly check that
> fdt_next_node()'s iteration hasn't left the starting node.  Second,
> this allows fdt_next_node() to be used to implement
> _fdt_node_end_offset() considerably simplifying the latter function.
> 
> The other users of fdt_next_node() either don't need to iterate out of
> the starting node, or don't pass a depth parameter at all.  Any
> callers that really need to iterate out of the starting node, but keep
> tracking depth can do so by biasing the initial depth value.
> 
> This is a semantic change, but I think it's very unlikely to break any
> existing library users.
> 
> Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

Applied.

Thanks,
jdl
