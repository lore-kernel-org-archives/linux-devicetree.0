From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v4] of: introduce helper to manage boolean
Date: Thu, 15 Mar 2012 15:18:43 +0100
Message-ID: <20120315141843.GQ18320@game.jcrosoft.org>
References: <1331660903-10193-1-git-send-email-plagnioj@jcrosoft.com>
 <20120315095454.9294E3E08CB@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120315095454.9294E3E08CB@localhost>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 03:54 Thu 15 Mar     , Grant Likely wrote:
> On Tue, 13 Mar 2012 18:48:23 +0100, Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org> wrote:
> > of_property_read_bool
> > 
> > Search for a property in a device node.
> > Returns true if the property exist false otherwise.
> > 
> > Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
> > Acked-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> > Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> 
> One comment below; but otherwise:
> 
> Acked-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> 
> Feel free to merge via whatever tree needs it.
> 
> g.
> 
> > Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> > ---
> > v4:
> > 
> > 	send the right version
> > 
> > 	include Grant comment
> > 
> > 	Grant can I get the go please?
> > 
> > Best Regards,
> > J.
> >  include/linux/of.h |   16 ++++++++++++++++
> >  1 files changed, 16 insertions(+), 0 deletions(-)
> > 
> > diff --git a/include/linux/of.h b/include/linux/of.h
> > index a75a831..a992cdf 100644
> > --- a/include/linux/of.h
> > +++ b/include/linux/of.h
> > @@ -342,6 +342,22 @@ static inline int of_machine_is_compatible(const char *compat)
> >  #define of_match_node(_matches, _node)	NULL
> >  #endif /* CONFIG_OF */
> >  
> > +/**
> > + * of_property_read_bool - Findfrom a property
> > + * @np:		device node from which the property value is to be read.
> > + * @propname:	name of the property to be searched.
> > + *
> > + * Search for a property in a device node.
> > + * Returns true if the property exist false otherwise.
> > + */
> > +static inline bool of_property_read_bool(const struct device_node *np,
> > +					 const char *propname)
> > +{
> > +	struct property *prop = of_find_property(np, propname, NULL);
> > +
> > +	return prop ? true : false;
> > +}
> 
> Could simply be:
> {
> 	return of_find_property(...) != NULL;
ok fine no preference sned the pull to Arnd with the reset of the DT for at91

please check the USB too I gusee they can go too  but maybe  for the atmel
high-speed device you will have some comment

Best Regards,
J.
