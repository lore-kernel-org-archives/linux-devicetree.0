From: Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
Subject: Re: [PATCH v2] of: Add more stubs for non-OF builds
Date: Sat, 20 Jul 2013 16:32:43 +0400
Message-ID: <20130720163243.5b921a1bd8301ad6eaaeeb05@mail.ru>
References: <1371566362-9334-1-git-send-email-shc_work@mail.ru>
 <20130720053111.CA86E3E16F4@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130720053111.CA86E3E16F4@localhost>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, 20 Jul 2013 06:31:11 +0100
Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:

> On Tue, 18 Jun 2013 18:39:22 +0400, Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org> wrote:
> > Patch adds of_get_next_child and of_get_next_available_child
> > stubs for non-OF builds.
> > 
> > Signed-off-by: Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
> > ---
> >  include/linux/of.h | 16 ++++++++++++++--
> >  1 file changed, 14 insertions(+), 2 deletions(-)
> > 
> > diff --git a/include/linux/of.h b/include/linux/of.h
> > index 1fd08ca..c086c1a 100644
> > --- a/include/linux/of.h
> > +++ b/include/linux/of.h
> > @@ -366,8 +366,17 @@ static inline bool of_have_populated_dt(void)
> >  	return false;
> >  }
> >  
> > -#define for_each_child_of_node(parent, child) \
> > -	while (0)
> > +static inline struct device_node *of_get_next_child(
> > +	const struct device_node *node, struct device_node *prev)
> > +{
> > +	return NULL;
> > +}
> > +
> > +static inline struct device_node *of_get_next_available_child(
> > +	const struct device_node *node, struct device_node *prev)
> > +{
> > +	return NULL;
> > +}
> >  
> >  static inline struct device_node *of_get_child_by_name(
> >  					const struct device_node *node,
> > @@ -376,6 +385,9 @@ static inline struct device_node *of_get_child_by_name(
> >  	return NULL;
> >  }
> >  
> > +#define for_each_child_of_node(parent, child) \
> > +	while (0)
> > +
> 
> Why is the for_each_child_of_node() getting moved?

Please forget this patch, this is no longer needed.
A move was to preserve the sort order for "OF" and "non-OF".
Thanks.

-- 
Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
