From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 5/5] of/clock: eliminate function
	__of_clk_get_from_provider
Date: Tue, 15 Mar 2011 02:04:27 -0600
Message-ID: <20110315080427.GO23050@angua.secretlab.ca>
References: <1300108722-3254-1-git-send-email-shawn.guo@linaro.org>
	<1300108722-3254-6-git-send-email-shawn.guo@linaro.org>
	<20110315075405.GJ23050@angua.secretlab.ca>
	<20110315075916.GI11098@S2100-06.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110315075916.GI11098-+NayF8gZjK2ctlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 15, 2011 at 03:59:16PM +0800, Shawn Guo wrote:
> On Tue, Mar 15, 2011 at 01:54:05AM -0600, Grant Likely wrote:
> > On Mon, Mar 14, 2011 at 09:18:42PM +0800, Shawn Guo wrote:
> > > With the platform clock support, the 'struct clk' should have been
> > > associated with device_node->data.  So the use of function
> > > __of_clk_get_from_provider can be eliminated.
> > > 
> > > Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > > ---
> > >  drivers/of/clock.c |   23 ++---------------------
> > >  1 files changed, 2 insertions(+), 21 deletions(-)
> > > 
> > > diff --git a/drivers/of/clock.c b/drivers/of/clock.c
> > > index 7b5ea67..f124d0a 100644
> > > --- a/drivers/of/clock.c
> > > +++ b/drivers/of/clock.c
> > > @@ -71,24 +71,6 @@ void of_clk_del_provider(struct device_node *np,
> > >  	mutex_unlock(&of_clk_lock);
> > >  }
> > >  
> > > -static struct clk *__of_clk_get_from_provider(struct device_node *np, const char *clk_output)
> > > -{
> > > -	struct of_clk_provider *provider;
> > > -	struct clk *clk = NULL;
> > > -
> > > -	/* Check if we have such a provider in our array */
> > > -	mutex_lock(&of_clk_lock);
> > > -	list_for_each_entry(provider, &of_clk_providers, link) {
> > > -		if (provider->node == np)
> > > -			clk = provider->get(np, clk_output, provider->data);
> > > -		if (clk)
> > > -			break;
> > > -	}
> > > -	mutex_unlock(&of_clk_lock);
> > > -
> > > -	return clk;
> > > -}
> > > -
> > >  struct clk *of_clk_get(struct device *dev, const char *id)
> > >  {
> > >  	struct device_node *provnode;
> > > @@ -123,9 +105,8 @@ struct clk *of_clk_get(struct device *dev, const char *id)
> > >  			__func__, prop_name, dev->of_node->full_name);
> > >  		return NULL;
> > >  	}
> > > -	clk = __of_clk_get_from_provider(provnode, prop);
> > > -	if (clk)
> > > -		dev_dbg(dev, "Using clock from %s\n", provnode->full_name);
> > > +
> > > +	clk = provnode->data;
> > 
> > Where is the device_node->data pointer getting set?
> > 
> +#define ADD_CLK_LOOKUP()						\
> +	do {								\
> +		node->data = clk;					\
> 		^^^^^^^^^^^^^^^^^
> +									\
> +		cl->dev_id = dev_id;					\
> +		cl->clk = clk;						\
> +		clkdev_add(cl);						\
> +									\
> +		return 0;						\
> +									\
> +	out_kfree:							\
> +		kfree(cl);						\
> +		return ret;						\
> +	} while (0)

Yeah... don't do that!  :-)

g.
