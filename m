From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: Re: Some slightly random musings on device tree expression syntax
Date: Mon, 12 Mar 2012 08:53:05 -0500
Message-ID: <E1S75gQ-0005WK-0D@jdl.com>
References: <4F580005.403@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <4F580005.403-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> I was thinking some more about how to expand the device tree syntax to
> allow expressions.

Excellent!

> I wondered if we should use a concept/syntax more
> inspired by template processors. Playing with jinja2 and gpp led me
> towards (...) being an inline expression syntax that can calculate
> integers or strings and get replaced by the string representation of the
> expression, and ! at the start of a line introducing a statement
> context. So, below are my somewhat wandering thoughts on the matter.
> However, the idea still raises a lot of questions that'd need to be
> resolved.
> 
> I note a few things:
> 
> * Using the (...) syntax to indicate which parts of the file should be
> evaluated and the substituted solves the issue that David had with Jon's
> proposal re: how do you know when a node name is literal text vs.
> concatenated to some expression.

So the M4 solution then.

> * As an aside, I wonder if we couldn't transparently allow <1 2 3> or
> <1, 2, 3> for cell list syntax, thus not requiring the brackets in
> previously proposed <(1 + 0) (1 + 1) (4 - 1)> syntax, but rather <1 + 0,
> 1 + 1, 4 - 1>?

That's the sort of direction I advocated earlier.

jdl
