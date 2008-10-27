From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: libfdt: Property iteration
Date: Mon, 27 Oct 2008 17:14:41 -0500
Message-ID: <20081027221441.GA8763@ld0162-tx32.am.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
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

A while back when discussing property iterators
(http://ozlabs.org/pipermail/linuxppc-dev/2008-January/049891.html), you
said that you'd prefer not to expose property offsets, because more
common uses would be affected by changing offsets.  I'm looking again at
this, and was wondering what alternative and would-be-broken use cases
you were thinking of?

We could operate on property indices or names at an efficiency cost. 
Most nodes should be small enough that the cost isn't too much, but I'd
like to know which use cases really need it.  The ones I'd use it for
involve reading from one tree and adding to another, so moving offsets
aren't an issue.

Even in a use case where one makes in-place changes while iterating over
properties, changes to the property currently being iterated over should
only move later properties -- the next call to fdt_next_prop would be
based on the start of the property that was modified, which did not
change.

-Scott
