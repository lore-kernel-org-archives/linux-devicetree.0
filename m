From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [3/5] dtc: Cleanup yyerrorf() function
Date: Sat, 4 Oct 2008 12:56:41 +1000
Message-ID: <20081004025641.GF30184@yookeroo.seuss>
References: <20081002140427.GD11662@yookeroo.seuss>
	<20081002140512.GE11662@yookeroo.seuss>
	<20081002140556.GF11662@yookeroo.seuss>
	<20081002140652.GG11662@yookeroo.seuss> <E1KlqEb-0006Io-Sc@jdl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <E1KlqEb-0006Io-Sc-CYoMK+44s/E@public.gmane.org>
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

On Fri, Oct 03, 2008 at 02:22:41PM -0500, Jon Loeliger wrote:
> > Currently, we put the source file name into the yylloc variable, but
> > never use the stored value.  Instead the yyerrorf() function directly
> > accesses srcpos_file to get the input file name.
> > 
> > That works in practice, but is likely not to always be correct if we
> > ever re-enable the glr-parser option.  Even now, its correctness
> > relies on the exact point in time bison executes the semantic rules
> > w.r.t. to the lexing rules, which is probably correct but not
> > obviously correct, which is far from ideal.
> > 
> > So, this patch replaces yyerrorf() with a srcpos_error() function
> > which pulls the filename information out of the yylloc variable, which
> > bison is explicitly supposed to get right for us.
> > 
> > Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
> 
> This isn't how I'd like to see this work at all.
> 
> The original intent goes like this:
> 
> - As a file is referenced, it is put on a list (or array) of files.
>   This list is essentially write-only so that any file ever
>   referenced accumulates into this list.
> 
> - The source positions maintain a pointer (or index) into that
>   table of file names.

Ok, this is not a bad idea.  But there's no sign of this "original
intent" either in what we had before, or in what's there after your
new language series.  dtc_file structures are just allocated bare,
free()ed on dtc_file_close() and pointers to them are handed around
unsafely.

> - The table of files is *always* available, even long after
>   parsing has finished.

Again, not a bad idea - it certainly fixes the lifetime issue.  But
orthogonal certainly from this patch, and really from 4/5 too.

> - There is an entirely different stack of directories that
>   tracks where file references are resolved.

Again, orthogonal.  The stack could easily reference a table of files
rather than containing the file information directly.

> Thus, a routine like srcpos_error() should take a srcpos
> for its basis information.  Yes, that is the same type
> as the YYLTYPE during parsing, but my point is that the
> srcpos type is conceptually longer lasting than just parsing
> and will be available by later semantic processing passes too.

Huh!?  This makes no sense to me.  AFAICT the discussion above is
talking about the lifetime and allocation of dtc_file structures, or
something of similar intent.  Now you're talking about the srcpos
structures.  I don't see how either this patch of mine, or the next
makes the srcpos/YYLTYPE structure *not* potentially longer lasting.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
