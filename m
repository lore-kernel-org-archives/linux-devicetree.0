From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Subject: Re: [PATCH v5 4/4] clk: bd71837: Add driver for BD71837 PMIC clock
Date: Tue, 31 Jul 2018 11:28:58 +0300
Message-ID: <20180731073023.GA2956@localhost.localdomain>
References: <cover.1528117485.git.matti.vaittinen@fi.rohmeurope.com>
 <d99c8762b0fbbcb18ec4f4d104191364c0ea798c.1528117485.git.matti.vaittinen@fi.rohmeurope.com>
 <152878945117.16708.12422348324182290971@swboyd.mtv.corp.google.com>
 <20180612082354.GG20078@localhost.localdomain>
 <152997029783.143105.16692843405899913246@swboyd.mtv.corp.google.com>
 <20180626081319.GA2118@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180626081319.GA2118@localhost.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, robh+dt@kernel.org
Cc: Matti Vaittinen <mazziesaccount@gmail.com>, broonie@kernel.org, lee.jones@linaro.org, lgirdwood@gmail.com, mark.rutland@arm.com, mturquette@baylibre.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mikko.mutanen@fi.rohmeurope.com, heikki.haikola@fi.rohmeurope.com
List-Id: devicetree@vger.kernel.org

On Tue, Jun 26, 2018 at 11:13:19AM +0300, Matti Vaittinen wrote:
> On Mon, Jun 25, 2018 at 04:44:57PM -0700, Stephen Boyd wrote:
> > Quoting Matti Vaittinen (2018-06-12 01:23:54)
> > > On Tue, Jun 12, 2018 at 12:44:11AM -0700, Stephen Boyd wrote:
> > > > Quoting Matti Vaittinen (2018-06-04 06:19:13)

[snip]

> > > > > +       if (rval) {
> > > > > +               dev_err(&pdev->dev, "failed to register clkdev for bd71837");
> > > > > +               goto err_clean_provider;
> > > > > +       }
> > > > > +
> > > > > +       platform_set_drvdata(pdev, c);
> > > > > +
> > > > > +       return 0;
> > > > > +
> > > > > +err_clean_provider:
> > > > > +       of_clk_del_provider(pdev->dev.parent->of_node);
> > > > > +err_out:
> > > > > +       return rval;
> > > > > +}
> > > > > +
> > > > > +static int bd71837_clk_remove(struct platform_device *pdev)
> > > > > +{
> > > > > +       if (pdev->dev.parent->of_node)
> > > > > +               of_clk_del_provider(pdev->dev.parent->of_node);
> > > > 
> > > > Use devm so this can go away. Or is devm not used because the parent
> > > > of_node is the provider? That's annoying.
> > > 
> > > What would be the correct workaround for this?
> > 
> > Smash the clk driver into the overall PMIC node. That should work. Or
> > possibly assign the same of_node to the child device when creating it?
> > I'm not sure if that causes some sort of problem with DT code though, so
> > it would be good to check with Rob H if that's a bad idea or not.
> 
> 1. Assign MFD node to subdevice node in MFD when creating the cells.
> 2. Assign parent->of_node to dev.of_node in clk subdevice.
> 3. Create devm_of_clk_add_hw_provider_w_node() which does something
> like (not compiled pseudo) code below
> 
> int devm_of_clk_add_hw_provider_w_node(struct device *dev,
> 			struct clk_hw *(*get)(struct of_phandle_args *clkspec,
> 					      void *data),
> 			struct device_node *of_node,
> 			void *data)
> {
> 	struct device_node **ptr;
> 	int ret;
> 	ptr = devres_alloc(devm_of_clk_release_provider, sizeof(*ptr),
> 			   GFP_KERNEL);
> 	if (!ptr)
> 		return -ENOMEM;
> 
> 	*ptr = of_node;
> 	ret = of_clk_add_hw_provider(of_node, get, data);
> 	if (!ret)
> 		devres_add(dev, ptr);
> 	else
> 		devres_free(ptr);
> 
> 	return ret;
> }
> EXPORT_SYMBOL_GPL(devm_of_clk_add_hw_provider_w_node);
> 
> int devm_of_clk_add_hw_provider(struct device *dev,
> 			struct clk_hw *(*get)(struct of_phandle_args *clkspec,
> 					      void *data),
> 			void *data)
> {
> 	return devm_of_clk_add_hw_provider_w_node(dev, get, dev->of_node,
> 						  data);
> }
> EXPORT_SYMBOL_GPL(devm_of_clk_add_hw_provider);

just a friendly reminder, what's your opinion on adding this kind of
function (devm_of_clk_add_hw_provider_w_node)? or solutions 1/2? And are these options safe what comes to
reference counting of of_nodes?

Best regards
	Matti Vaittinen
