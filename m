From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH v4] regulator: pfuze100: add pfuze100 regulator driver
Date: Mon, 22 Jul 2013 20:46:49 +0800
Message-ID: <20130722124647.GK20271@S2101-09.ap.freescale.net>
References: <1374398247-11384-1-git-send-email-b38343@freescale.com>
 <20130722091058.GI20271@S2101-09.ap.freescale.net>
 <20130722103935.GA14838@Robin-OptiPlex-780>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130722103935.GA14838@Robin-OptiPlex-780>
Sender: linux-doc-owner@vger.kernel.org
To: Robin Gong <b38343@freescale.com>
Cc: broonie@kernel.org, grant.likely@linaro.org, rob.herring@calxeda.com, rob@landley.net, lgirdwood@gmail.com, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 22, 2013 at 06:39:36PM +0800, Robin Gong wrote:
> > > +static int pfuze_parse_regulators_dt(struct pfuze_chip *chip)
> > > +{
> > > +	struct device *dev = chip->dev;
> > > +	struct device_node *parent;
> > > +	int ret;
> > > +
> > > +	of_node_get(dev->parent->of_node);
> > > +	parent = of_find_node_by_name(dev->parent->of_node, "regulators");
> > > +	if (!parent) {
> > > +		dev_err(dev, "regulators node not found\n");
> > > +		return -EINVAL;
> > 
> > So you leave dev->parent->of_node unbalanced.
> > 
> Seems of_find_node_by_name will of_node_put the parent node.

Ah, yes.  I missed that.

Shawn

