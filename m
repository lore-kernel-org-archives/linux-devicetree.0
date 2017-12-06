From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 0/2] of: overlay: Fix of_overlay_apply() error path
Date: Wed, 6 Dec 2017 16:07:35 -0600
Message-ID: <20171206220735.ior2jbznzbeml5re@rob-hp-laptop>
References: <1512487623-30450-1-git-send-email-geert+renesas@glider.be>
 <48dd6ac2-6481-4164-6051-ec9fd98490fb@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <48dd6ac2-6481-4164-6051-ec9fd98490fb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Colin King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 05, 2017 at 09:40:33PM -0500, Frank Rowand wrote:
> On 12/05/17 10:27, Geert Uytterhoeven wrote:
> > 	Hi Pantelis, Rob, Frank,
> > 
> > Here's a replacement for commit bd80e2555c5c9d45 ("of: overlay: Fix
> > cleanup order in of_overlay_apply()"), which was applied by Rob, and
> > dropped later.
> > 
> > The first patch fixes the memory leak reported by Colin.
> > The second patch is a replacement for the bad dropped commit, and
> > depends on the first patch for proper cleanup.
> > 
> > All OF unittests pass.
> > 
> > Thanks!
> > 
> > Geert Uytterhoeven (2):
> >   of: overlay: Fix memory leak in of_overlay_apply() error path
> >   of: overlay: Fix (un)locking in of_overlay_apply()
> > 
> >  drivers/of/overlay.c | 31 +++++++++++++------------------
> >  1 file changed, 13 insertions(+), 18 deletions(-)
> > 
> 
> Thank you, the code is much improved by these patches.
> 
> Reviewed-by: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

Applied.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
