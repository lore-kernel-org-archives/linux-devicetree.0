From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH 5/5] of/address: restrict 'no-ranges' kludge to powerpc
Date: Fri, 11 Jun 2010 11:12:17 +1000
Message-ID: <1276218737.1962.78.camel@pasglop>
References: <20100608140917.25879.67745.stgit@angua>
	<20100608141018.25879.44413.stgit@angua>
	<1276152275.1962.61.camel@pasglop>
	<AANLkTikg1hLdV_OUjc3QIhFatP_iLfVClhzmyixmjje1@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <AANLkTikg1hLdV_OUjc3QIhFatP_iLfVClhzmyixmjje1-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2010-06-10 at 08:28 -0600, Grant Likely wrote:
> On Thu, Jun 10, 2010 at 12:44 AM, Benjamin Herrenschmidt
> <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wrote:
> > On Tue, 2010-06-08 at 08:10 -0600, Grant Likely wrote:
> >> Certain Apple machines don't use the ranges property correctly, but the
> >> workaround should not be applied on other architectures.  This patch
> >> disables the workaround for non-powerpc architectures.
> >
> > I'm half tempted to add it to the quirk list (which should really be
> > made generic) so I can disable it on more 'modern' powerpc as well.
> 
> In the mean time, are you okay with this version of the patch?

For the time being yes.

Cheers,
Ben.

> g.
> 
> >
> > Cheers,
> > Ben.
> >
> >> Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> >> CC: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
> >> CC: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
> >> CC: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> >> CC: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> >> ---
> >>  drivers/of/address.c |   11 ++++++++++-
> >>  1 files changed, 10 insertions(+), 1 deletions(-)
> >>
> >> diff --git a/drivers/of/address.c b/drivers/of/address.c
> >> index 0b04137..5c220c3 100644
> >> --- a/drivers/of/address.c
> >> +++ b/drivers/of/address.c
> >> @@ -346,12 +346,21 @@ static int of_translate_one(struct device_node *parent, struct of_bus *bus,
> >>        * a 1:1 translation at that level. It's up to the caller not to try
> >>        * to translate addresses that aren't supposed to be translated in
> >>        * the first place. --BenH.
> >> +      *
> >> +      * As far as we know, this damage only exists on Apple machines, so
> >> +      * This code is only enabled on powerpc. --gcl
> >>        */
> >>       ranges = of_get_property(parent, rprop, &rlen);
> >> +#if !defined(CONFIG_PPC)
> >> +     if (ranges == NULL) {
> >> +             pr_err("OF: no ranges; cannot translate\n");
> >> +             return 1;
> >> +     }
> >> +#endif /* !defined(CONFIG_PPC) */
> >>       if (ranges == NULL || rlen == 0) {
> >>               offset = of_read_number(addr, na);
> >>               memset(addr, 0, pna * 4);
> >> -             pr_debug("OF: no ranges, 1:1 translation\n");
> >> +             pr_debug("OF: empty ranges; 1:1 translation\n");
> >>               goto finish;
> >>       }
> >>
> >
> >
> >
> 
> 
> 
