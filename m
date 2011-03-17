From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH V4 1/5] arm/dt: add basic mx51 device tree support
Date: Thu, 17 Mar 2011 11:17:13 -0600
Message-ID: <20110317171713.GI9597@angua.secretlab.ca>
References: <1299733185-2172-1-git-send-email-jason.hui@linaro.org>
	<1299733185-2172-2-git-send-email-jason.hui@linaro.org>
	<20110315070342.GB23050@angua.secretlab.ca>
	<20110317015435.GF11658@S2100-06.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110317015435.GF11658-+NayF8gZjK2ctlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 17, 2011 at 09:54:35AM +0800, Shawn Guo wrote:
> On Tue, Mar 15, 2011 at 01:03:42AM -0600, Grant Likely wrote:
> > > +#ifdef CONFIG_OF
> > > +static struct clk *mx5_dt_clk_get(struct device_node *np,
> > > +					const char *output_id, void *data)
> > > +{
> > > +	return data;
> > > +}
> > > +
> > > +static __init void mx5_dt_scan_clks(void)
> > > +{
> > > +	struct device_node *node;
> > > +	struct clk *clk;
> > > +	const char *id;
> > > +	int rc;
> > > +
> > > +	for_each_compatible_node(node, NULL, "clock") {
> > > +		id = of_get_property(node, "clock-outputs", NULL);
> > > +		if (!id)
> > > +			continue;
> > > +
> > > +		clk = clk_get_sys(id, NULL);
> > > +		if (IS_ERR(clk))
> > > +			continue;
> > > +
> > > +		rc = of_clk_add_provider(node, mx5_dt_clk_get, clk);
> > > +		if (rc)
> > > +			pr_err("error adding fixed clk %s\n", node->name);
> > > +	}
> > > +}
> > > +
> > > +void __init mx5_clk_dt_init(void)
> > > +{
> > > +	mx5_dt_scan_clks();
> > > +}
> > > +#endif
> > 
> > Nitpick: Would it make sense for these 3 functions to be in a separate .c file?
> > 
> Sorry for that I'm late on this.  It will not make much sense to do
> so if considering that dynamic dt clock codes have to be put in
> clock-mx51-mx53.c anyway, since they are referring to existing
> enable/disable/get_rate/set_rate/... functions.

Okay.

g.
