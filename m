From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: dtc: Enable more warnings
Date: Thu, 4 Mar 2010 11:11:48 +1100
Message-ID: <20100304001148.GB4488@yookeroo>
References: <20100303052630.GQ23435@yookeroo>
 <E1NmpN2-0001Bf-Oe@jdl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <E1NmpN2-0001Bf-Oe-CYoMK+44s/E@public.gmane.org>
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

On Wed, Mar 03, 2010 at 08:16:16AM -0600, Jon Loeliger wrote:
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
> This patch didn't apply due to something wrong here:
> 
> > Index: dtc/Makefile
> > ===================================================================
> > --- dtc.orig/Makefile	2010-03-03 16:10:27.235986452 +1100
> > +++ dtc/Makefile	2010-03-03 16:22:17.439987248 +1100
> > @@ -16,7 +16,9 @@ LOCAL_VERSION =
> >  CONFIG_LOCALVERSION =
> >  
> >  CPPFLAGS = -I libfdt
> > -CFLAGS = -Wall -g -Os -fPIC -Wpointer-arith -Wcast-qual
> > +WARNINGS = -Werror -Wall  -Wpointer-arith -Wcast-qual -Wnested-externs \
> > +	-Wstrict-prototypes -Wmissing-prototypes
> > +CFLAGS = -g -Os -fPIC -Werror $(WARNINGS)
> >  
> >  CPPFLAGS += -std=c99 -D_XOPEN_SOURCE -D_BSD_SOURCE
> >  CFLAGS += -Werror
> 
> 
> I think it is the extra CPPFLAGS line?  I dont seem to have that.

Drat, sorry.  I forgot I had an extra patch interposed in my series.
Resending.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
