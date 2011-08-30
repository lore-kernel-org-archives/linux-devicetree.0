From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC PATCH] dtc: Add support for named constants
Date: Tue, 30 Aug 2011 14:23:16 +1000
Message-ID: <20110830042316.GH4254@yookeroo.fritz.box>
References: <1314139400-31984-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1314139400-31984-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Arnaud Lacombe <lacombar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 23, 2011 at 04:43:20PM -0600, Stephen Warren wrote:
> You may define constants as follows:
> 
> /define/ $TWO 2;
> /define/ $FOUR 4;
> /define/ $OTHER $FOUR;
> 
> And properties may use these values as follows:
> 
> foo = <1 $TWO 3 $FOUR 5>;
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Note 1: This is against dtc in the Linux kernel. Should this patch be
> against upstream dtc, then back-ported to the kernel?

Yes, it should.  It's not even really a backport to the kernel, we
can just drop a new upstream version in there.

> Note 2: I'd prefer the syntax of /define/ to be:
> 
> /define/ TWO 2;

Oh goodness, yes.  The dollar signs are revolting.

> but I assume that'd cause the lexing for DT_DEFINEREF to conflict with
> that for DT_LABEL?

Nope, the final colon should distinguish DT_LABEL.  In dts-v1 C-like
identifiers should be lexically distinct in most contexts.  This is
not by accident.  They could be confused with node or property names,
but that shouldn't cause trouble.

> Note 3: The define syntax only handles integers. Should it be string-
> based instead?
> 
> Note 4: I'm not sure what to do about re-generating the lex/yacc results;
> my local tools aren't the versions used previously, and so introduce some
> changes not related to mine.

This problem will go away when you work against upstream dtc; it has
bison flex as a build dependency.  We only worry about pre-generating
the lex and yacc output when we import into the kernel.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
