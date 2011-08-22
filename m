From: Julia Lawall <julia-dAYI7NvHqcQ@public.gmane.org>
Subject: Re: [PATCH 2/2] arch/powerpc/platforms/powermac/setup.c: add missing
	of_node_put
Date: Mon, 22 Aug 2011 14:31:46 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.1108221430320.10948@ask.diku.dk>
References: <1313943001-12884-2-git-send-email-julia@diku.dk>
	<4E522AD0.7030907@bfs.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4E522AD0.7030907-fPG8STNUNVg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: walter harms <wharms-fPG8STNUNVg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 22 Aug 2011, walter harms wrote:

> 
> 
> Am 21.08.2011 18:10, schrieb Julia Lawall:
> > From: Julia Lawall <julia-dAYI7NvHqcQ@public.gmane.org>
> > 
> > np is initialized to the result of calling a function that calls
> > of_node_get, so of_node_put should be called before the pointer is dropped.
> > 
> > The semantic match that finds this problem is as follows:
> > (http://coccinelle.lip6.fr/)
> > 
> > // <smpl>
> > @@
> > expression e,e1,e2;
> > @@
> > 
> > * e = \(of_find_node_by_type\|of_find_node_by_name\)(...)
> >   ... when != of_node_put(e)
> >       when != true e == NULL
> >       when != e2 = e
> >   e = e1
> > // </smpl>
> > 
> > Signed-off-by: Julia Lawall <julia-dAYI7NvHqcQ@public.gmane.org>
> > 
> > ---
> >  arch/powerpc/platforms/powermac/setup.c |    8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/powerpc/platforms/powermac/setup.c b/arch/powerpc/platforms/powermac/setup.c
> > index 96580b1..970ea1d 100644
> > --- a/arch/powerpc/platforms/powermac/setup.c
> > +++ b/arch/powerpc/platforms/powermac/setup.c
> > @@ -494,11 +494,15 @@ static int __init pmac_declare_of_platform_devices(void)
> >  		return -1;
> >  
> >  	np = of_find_node_by_name(NULL, "valkyrie");
> > -	if (np)
> > +	if (np) {
> >  		of_platform_device_create(np, "valkyrie", NULL);
> > +		of_node_put(np);
> > +	}
> >  	np = of_find_node_by_name(NULL, "platinum");
> > -	if (np)
> > +	if (np) {
> >  		of_platform_device_create(np, "platinum", NULL);
> > +		of_node_put(np);
> > +	}
> >          np = of_find_node_by_type(NULL, "smu");
> >          if (np) {
> >  		of_platform_device_create(np, "smu", NULL);
> > 
> 
> 
> hi,
> it seems save to call of_node_put(np) with np==NULL, i assume the same is true
> for of_platform_device_create().
> 
> so the code collapses to:
> 
> _test_node(char *name)
> {
>  struct device_node *np;
>  np = of_find_node_by_name(NULL, name);
>  of_platform_device_create(np, name, NULL);
>  of_node_put(np);
>  return NULL?:0:1;
> }
> 
> maybe there is already something like find_node() ?

of_platform_device_create is not much used, and one might want to use it 
with other functions than of_find_node_by_name, as indeed is done here.  
Is the problem just a missing else between the calls?  Is it certain that 
all of the cases are disjoint?

julia
