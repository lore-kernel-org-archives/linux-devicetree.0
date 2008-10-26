From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: generating a phandle w/libfdt?
Date: Mon, 27 Oct 2008 10:44:41 +1100
Message-ID: <20081026234441.GC22339@yookeroo.seuss>
References: <4BE3ADDA-362B-43AE-8D05-11260B94CD13@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4BE3ADDA-362B-43AE-8D05-11260B94CD13-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 24, 2008 at 08:11:33AM -0500, Kumar Gala wrote:
> In some work I'm doing I noticed we don't have any APIs to generate a  
> phandle via libfdt.
>
> was wondering if anyone had ideas on this.
>
> In first thought it seems we have to scan through the whole blob looking 
> for the largest phandle id and than +1 it to generate the next "valid" 
> id.  Any other ideas on how to do this more efficiently?

I don't think it can be done more efficiently, without assuming things
about how any existing phandles are allocated, which I don't think is
wise.

Heck, even that's more efficient (theoretically, anyway) than the
method used internally in dtc.  There, we have a "next phandle"
counter which starts at one.  When we want to allocate a phandle we
try counter values, testing them with find_node_by_phandle() one by
one until we reach an unused one.  Of course, because all the phandles
are usually allocated by dtc, in practice that usually only results in
one pass through the tree, although it can be many in principle.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
