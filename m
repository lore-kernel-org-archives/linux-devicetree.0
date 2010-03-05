From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: dtc: Enable more warnings
Date: Sat, 6 Mar 2010 09:52:12 +1100
Message-ID: <20100305225212.GB17068@yookeroo>
References: <20100303052630.GQ23435@yookeroo> <20100304001218.GC4488@yookeroo>
	<E1NnfLy-00073h-8R@jdl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <E1NnfLy-00073h-8R-CYoMK+44s/E@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 05, 2010 at 03:46:38PM -0600, Jon Loeliger wrote:
> > This patch turns on a bunch of extra gcc warnings, most of which are
> > probably a good idea.  Of the new warnings -Wnested-externs and
> > -Wstrict-prototypes need no code changes, we're already warning-clean.
> > The remaining one, -Wmissing-prototypes requires trivial changes in
> > some of the tests (making functions local).
> > 
> > This patch also rearranges the warnings flags into a separate make
> > variable for convenience, and turns on -Werror, to really encourage
> > people to keep the code warning-clean.
> > 
> > Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
> 
> Well, I'd like to apply this patch.  But doing so appears
> to be very effective.  So much so that the "make check"
> now fails:

Ugh.  That's the -Wextra.  Somehow I managed to add the -Wextra and
thought (to my surprise) that it didn't add any extra warnings over
the ones we already had.  I was wrong, obviously.  I'm not sure quite
how I managed to miss that.  I'll resend.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
