From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC] add alias support to fdt_path_offset
Date: Tue, 5 Aug 2008 14:13:06 +1000
Message-ID: <20080805041306.GC16526@yookeroo.seuss>
References: <Pine.LNX.4.64.0808041722001.328@blarg.am.freescale.net>
	<20080805035844.GB16526@yookeroo.seuss>
	<20080804.220226.-1219852411.imp@bsdimp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20080804.220226.-1219852411.imp-uzTCJ5RojNnQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: "M. Warner Losh" <imp-uzTCJ5RojNnQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, gvb.uboot-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Aug 04, 2008 at 10:02:26PM -0600, M. Warner Losh wrote:
> In message: <20080805035844.GB16526-787xzQ0H9iRg7VrjXcPTGA@public.gmane.org>
>             David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> writes:
> : On Mon, Aug 04, 2008 at 05:25:17PM -0500, Kumar Gala wrote:
> : > Here's my attempt at adding alias support to fdt_path_offset()
> : > 
> : > I don't care for the path_buf[256], but not sure how else to do
> : > that.
> : 
> : That's because you haven't thought hard enough, we can do better than
> : this.  Patches coming..
> 
> Hmmm, PATH_MAX...

No.  We can do better than that, too.  Though admittedly it will be
slightly more work than I first thought.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
