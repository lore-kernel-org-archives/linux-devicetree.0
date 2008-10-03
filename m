From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: Re: [3/5] dtc: Cleanup yyerrorf() function
Date: Fri, 03 Oct 2008 14:22:41 -0500
Message-ID: <E1KlqEb-0006Io-Sc@jdl.com>
References: <20081002140427.GD11662@yookeroo.seuss>
	<20081002140512.GE11662@yookeroo.seuss>
	<20081002140556.GF11662@yookeroo.seuss>
	<20081002140652.GG11662@yookeroo.seuss>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-reply-to: <20081002140652.GG11662-787xzQ0H9iRg7VrjXcPTGA@public.gmane.org> 
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

> Currently, we put the source file name into the yylloc variable, but
> never use the stored value.  Instead the yyerrorf() function directly
> accesses srcpos_file to get the input file name.
> 
> That works in practice, but is likely not to always be correct if we
> ever re-enable the glr-parser option.  Even now, its correctness
> relies on the exact point in time bison executes the semantic rules
> w.r.t. to the lexing rules, which is probably correct but not
> obviously correct, which is far from ideal.
> 
> So, this patch replaces yyerrorf() with a srcpos_error() function
> which pulls the filename information out of the yylloc variable, which
> bison is explicitly supposed to get right for us.
> 
> Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

This isn't how I'd like to see this work at all.

The original intent goes like this:

- As a file is referenced, it is put on a list (or array) of files.
  This list is essentially write-only so that any file ever
  referenced accumulates into this list.

- The source positions maintain a pointer (or index) into that
  table of file names.

- The table of files is *always* available, even long after
  parsing has finished.

- There is an entirely different stack of directories that
  tracks where file references are resolved.

Thus, a routine like srcpos_error() should take a srcpos
for its basis information.  Yes, that is the same type
as the YYLTYPE during parsing, but my point is that the
srcpos type is conceptually longer lasting than just parsing
and will be available by later semantic processing passes too.

Thanks,
jdl
