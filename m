From: Julia Lawall <julia-dAYI7NvHqcQ@public.gmane.org>
Subject: Re: [PATCH 1/7] drivers/macintosh/via-pmu-led.c: Add of_node_put to
	avoid memory leak
Date: Tue, 31 Aug 2010 18:08:19 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.1008311807470.2668@ask.diku.dk>
References: <1283075566-27441-1-git-send-email-julia@diku.dk>
	<1283075566-27441-2-git-send-email-julia@diku.dk>
	<4C7D247F.4060500@bfs.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4C7D247F.4060500-fPG8STNUNVg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: walter harms <wharms-fPG8STNUNVg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 31 Aug 2010, walter harms wrote:

> 
> 
> Julia Lawall schrieb:
> > Add a call to of_node_put in the error handling code following a call to
> > of_find_node_by_path.
> > 
> > The semantic match that finds this problem is as follows:
> > (http://coccinelle.lip6.fr/)
> > 
> > // <smpl>
> > @r exists@
> > local idexpression x;
> > expression E,E1;
> > statement S;
> > @@
> > 
> > *x = 
> > (of_find_node_by_path
> > |of_find_node_by_name
> > |of_find_node_by_phandle
> > |of_get_parent
> > |of_get_next_parent
> > |of_get_next_child
> > |of_find_compatible_node
> > |of_match_node
> > )(...);
> > ...
> > if (x == NULL) S
> > <... when != x = E
> > *if (...) {
> >   ... when != of_node_put(x)
> >       when != if (...) { ... of_node_put(x); ... }
> > (
> >   return <+...x...+>;
> > |
> > *  return ...;
> > )
> > }
> > ...>
> > of_node_put(x);
> > // </smpl>
> > 
> > Signed-off-by: Julia Lawall <julia-dAYI7NvHqcQ@public.gmane.org>
> > 
> > ---
> >  drivers/macintosh/via-pmu-led.c |    4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/macintosh/via-pmu-led.c b/drivers/macintosh/via-pmu-led.c
> > index d242976..19c3718 100644
> > --- a/drivers/macintosh/via-pmu-led.c
> > +++ b/drivers/macintosh/via-pmu-led.c
> > @@ -92,8 +92,10 @@ static int __init via_pmu_led_init(void)
> >  	if (dt == NULL)
> >  		return -ENODEV;
> >  	model = of_get_property(dt, "model", NULL);
> > -	if (model == NULL)
> > +	if (model == NULL) {
> > +		of_node_put(dt);
> >  		return -ENODEV;
> > +	}
> >  	if (strncmp(model, "PowerBook", strlen("PowerBook")) != 0 &&
> >  	    strncmp(model, "iBook", strlen("iBook")) != 0 &&
> >  	    strcmp(model, "PowerMac7,2") != 0 &&
> > 
> 
> is there any rule that says when to use strncmp ? it seems perfecly valid to use strcpy here
> (what is done in the last cmp).

Perhaps there are some characters after eg PowerBook that one doesn't want 
to compare with?

julia
