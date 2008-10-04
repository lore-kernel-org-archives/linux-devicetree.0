From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] Enhance source position implementation.
Date: Sat, 4 Oct 2008 13:53:20 +1000
Message-ID: <20081004035320.GG30184@yookeroo.seuss>
References: <1223066853-5978-1-git-send-email-jdl@jdl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1223066853-5978-1-git-send-email-jdl-CYoMK+44s/E@public.gmane.org>
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
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 03, 2008 at 03:47:33PM -0500, Jon Loeliger wrote:
> Implemented some print and copy routines.
> Made empty srcpos objects that will be used later.
> Protected .h file from multiple #include's.
> Added srcpos_error() and srcpos_warn().
> 
> Signed-off-by: Jon Loeliger <jdl-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
> 
> This patch is a refactoring of the yyerror() and yyerrorf(()
> changes out of my proposed IR patch set back to the current
> master branch.  It should be pretty close to one Gibson's [3/5]
> patch where he was headed in the same direction.  This one
> anticipates srcpos_warn() too.
> 
> BTW, I realize my earlier reply to his [3/5] patch was sort
> of meant to be in response to his following patch as well.
> Oh well.
> 
> As he was also in favor of this change with his patch set,
> I'm just going to apply this one straight up.

Unfortunately, it differs from my 3/5 in exactly the aspects that
prompted me to refactor your srcpos stuff into my series in the first
place.

Your srcpos_empty variable and srcpos_copy() and srcpos_dump()
routines are not used here, which means they don't belong in this
patch - they belong in the patch that actually does something with
them.

In fact, srcpos_copy() isn't needed at all.  In your IR stuff, the
ir_srcpos has exactly the same lifetime as the surrounding ir
structure, if you make it an embedded structure rather than a pointer
srcpos_copy() disappears.

[snip]
>  extern int yylex(void);
> +extern void yyerror(char const *s);

This should be static, not extern, now.

[snip]
> diff --git a/srcpos.c b/srcpos.c
> index d5a4b2a..8bb0c02 100644
> --- a/srcpos.c
> +++ b/srcpos.c
> @@ -17,18 +17,40 @@
>   *                                                                   USA
>   */
>  
> +#define _GNU_SOURCE

Sigh.  asprintf() is really handy, but dtc is supposed to be portable.


Anyway, it's applied now, so I'll rebase my series on top of this.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
