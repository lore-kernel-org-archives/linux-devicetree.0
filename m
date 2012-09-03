From: Dong Aisheng <b29396-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v4 1/7] mfd: add syscon driver based on regmap
Date: Mon, 3 Sep 2012 10:31:03 +0800
Message-ID: <20120903023102.GA11891@shlinux2.ap.freescale.net>
References: <1346237818-9498-1-git-send-email-b29396@freescale.com>
 <1346237818-9498-2-git-send-email-b29396@freescale.com>
 <20120831012626.GA7726@r65073-Latitude-D630>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120831012626.GA7726@r65073-Latitude-D630>
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
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Zhao Richard-B20223 <B20223-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org" <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org" <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "lrg-l0cyMroinI0@public.gmane.org" <lrg-l0cyMroinI0@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 31, 2012 at 09:26:29AM +0800, Shawn Guo wrote:
> On Wed, Aug 29, 2012 at 06:56:52PM +0800, Dong Aisheng wrote:
> > +config MFD_SYSCON
> > +        bool "System Controller Register R/W Based on Regmap"
> 
> If the driver only compiles and works for device tree probe, we should
> have the following?
> 
> 	depends on OF
> 
Correct.
For currently it only supports dt.

> > +        select REGMAP_MMIO
> > +        help
> > +	  Select this option to enable accessing system control registers
> > +	  via regmap.
> > +
> 
> <snip>
> 
> > +struct regmap *syscon_node_to_regmap(struct device_node *np)
> > +{
> > +	struct syscon *syscon;
> > +	struct device *dev;
> > +
> > +	dev = driver_find_device(&syscon_driver.driver, NULL, np,
> > +				 syscon_match);
> > +	of_node_put(np);
> 
> This looks a little unnatural to me.  Function syscon_node_to_regmap
> becomes an API visible to clients, who might never know that np will
> be put inside the API.  I'm saying the client may also call of_node_put
> to put the node they get.
We probably could add a comment here for the API to avoid this happen.

> 
> I think of_node_put should be moved out from here and put into
> syscon_node_to_regmap and syscon_regmap_lookup_by_compatible.
> 
I guess no, if you want to move of_node_put into syscon_regmap_lookup_by_phandle,
then syscon_regmap_lookup_by_phandle has the same issue.
Actually i had considered your concern when writing this API...
The original purpose of doing like that is saving some duplicated 'of_node_put'
and make the API easy to use.
I searched the kernel dt code and found it existed some similar cases.
e.g: of_irq_find_parent, of_get_next_parent
So it looks to me that it may be usually to do like that for the cases that
the conversion from a node to other thing since the client may only care
about the things converted. For our case, it's regmap.
So i can't think it make too much sense for all client driver have to write
duplicated and meaningless 'of_node_put' code.

Regards
Dong Aisheng

> > +
> > +	if (!dev)
> > +		return ERR_PTR(-EPROBE_DEFER);
> > +
> > +	syscon = dev_get_drvdata(dev);
> > +
> > +	return syscon->regmap;
> > +}
> > +EXPORT_SYMBOL_GPL(syscon_node_to_regmap);
> > +
> > +struct regmap *syscon_regmap_lookup_by_compatible(const char *s)
> > +{
> > +	struct device_node *syscon_np;
> > +
> > +	syscon_np = of_find_compatible_node(NULL, NULL, s);
> > +	if (!syscon_np)
> > +		return ERR_PTR(-ENODEV);
> > +
> > +	return syscon_node_to_regmap(syscon_np);
> > +}
> > +EXPORT_SYMBOL_GPL(syscon_regmap_lookup_by_compatible);
> > +
> > +struct regmap *syscon_regmap_lookup_by_phandle(struct device_node *np,
> > +					const char *property)
> > +{
> > +	struct device_node *syscon_np;
> > +
> > +	syscon_np = of_parse_phandle(np, property, 0);
> > +	if (!syscon_np)
> > +		return ERR_PTR(-ENODEV);
> > +
> > +	return syscon_node_to_regmap(syscon_np);
> > +}
> > +EXPORT_SYMBOL_GPL(syscon_regmap_lookup_by_phandle);
