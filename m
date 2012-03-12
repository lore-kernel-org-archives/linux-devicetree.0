From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Some slightly random musings on device tree expression syntax
Date: Tue, 13 Mar 2012 10:57:43 +1100
Message-ID: <20120312235743.GE24916@truffala.fritz.box>
References: <4F580005.403@wwwdotorg.org>
 <E1S75gQ-0005WK-0D@jdl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <E1S75gQ-0005WK-0D-CYoMK+44s/E@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 12, 2012 at 08:53:05AM -0500, Jon Loeliger wrote:
> > I was thinking some more about how to expand the device tree syntax to
> > allow expressions.
> 
> Excellent!
> 
> > I wondered if we should use a concept/syntax more
> > inspired by template processors. Playing with jinja2 and gpp led me
> > towards (...) being an inline expression syntax that can calculate
> > integers or strings and get replaced by the string representation of the
> > expression, and ! at the start of a line introducing a statement
> > context. So, below are my somewhat wandering thoughts on the matter.
> > However, the idea still raises a lot of questions that'd need to be
> > resolved.
> > 
> > I note a few things:
> > 
> > * Using the (...) syntax to indicate which parts of the file should be
> > evaluated and the substituted solves the issue that David had with Jon's
> > proposal re: how do you know when a node name is literal text vs.
> > concatenated to some expression.
> 
> So the M4 solution then.

Erm.. use of (...) to disambiguate expressions seems an independent
matter from whether we use m4 or a macro preprocessor versus
in-dtc-proper expression evaluation.

> > * As an aside, I wonder if we couldn't transparently allow <1 2 3> or
> > <1, 2, 3> for cell list syntax, thus not requiring the brackets in
> > previously proposed <(1 + 0) (1 + 1) (4 - 1)> syntax, but rather <1 + 0,
> > 1 + 1, 4 - 1>?
> 
> That's the sort of direction I advocated earlier.

Hrm.  I don't think this is a good idea.  Having two different cell
list formats seems to me to encourage confusions for minimal benefit.
I think (...) will generally delimit expressions more readably anyway.
Especially since it would match using that syntax to distinguish
expressions in other places, like node or property names.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
