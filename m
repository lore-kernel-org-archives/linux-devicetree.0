From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] Fix an overflow case in fdt_offset_ptr() detected by
	GCC 4.3.
Date: Tue, 30 Sep 2008 11:15:25 +1000
Message-ID: <20080930011525.GB6189@yookeroo.seuss>
References: <1222358537.25112.7.camel@ld0161-tx32> <E1KkQ3b-0000uT-6H@jdl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <E1KkQ3b-0000uT-6H-CYoMK+44s/E@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, Stephen Papacharalambous <SteveP-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 29, 2008 at 04:13:27PM -0500, Jon Loeliger wrote:
> > 
> > Using Gcc 4.3 detected this problem:
> > 
> >     ../dtc/libfdt/fdt.c: In function 'fdt_next_tag':
> >     ../dtc/libfdt/fdt.c:82: error: assuming signed overflow does not
> >     occur when assuming that (X + c) < X is always false
> > 
> > To fix the problem, treat the offset as an unsigned int.
> > 
> > The problem report and proposed fix were provided
> > by Steve Papacharalambous <stevep-KZfg59tc24xl57MIdRCFDg@public.gmane.org>.
> > 
> > Signed-off-by: Jon Loeliger <jdl-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> 
> Applied.

Uh.. Jon.. did you see my reply to this.  I'm not at all convinced
this patches a real problem.  I suspect it's just replacing a problem
that gcc could detect with a similar one that gcc can't (and for which
we already had a test to deal with, anyway).

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
