From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Subject: Re: [PATCH v5 4/4] clk: bd71837: Add driver for BD71837 PMIC clock
Date: Tue, 26 Jun 2018 11:13:19 +0300
Message-ID: <20180626081319.GA2118@localhost.localdomain>
References: <cover.1528117485.git.matti.vaittinen@fi.rohmeurope.com>
 <d99c8762b0fbbcb18ec4f4d104191364c0ea798c.1528117485.git.matti.vaittinen@fi.rohmeurope.com>
 <152878945117.16708.12422348324182290971@swboyd.mtv.corp.google.com>
 <20180612082354.GG20078@localhost.localdomain>
 <152997029783.143105.16692843405899913246@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <152997029783.143105.16692843405899913246@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>, broonie@kernel.org, lee.jones@linaro.org, lgirdwood@gmail.com, mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mikko.mutanen@fi.rohmeurope.com, heikki.haikola@fi.rohmeurope.com
List-Id: devicetree@vger.kernel.org

Hello Stephen, Rob and all others

Thanks again Stephen. I appreciate your help. And just to help you
sorting your inbox a bit - I have written patch series v6 and v7 before
receiving these comments. I will write v8 after I get some further input
from you and Rob on how to solve the issue with having the clk stuff in
parent node and usage of devm_of_clk_add_hw_provider where DT node is
fetched from dev pointer. 

The v8 should then address rest of the issues - except the regmap wrappers
which I will send as separate patch. So I guess you can skip the v6 and v7
and just please check for the v8 when I get it done.

On Mon, Jun 25, 2018 at 04:44:57PM -0700, Stephen Boyd wrote:
> Quoting Matti Vaittinen (2018-06-12 01:23:54)
> > On Tue, Jun 12, 2018 at 12:44:11AM -0700, Stephen Boyd wrote:
> > > Quoting Matti Vaittinen (2018-06-04 06:19:13)
> > > Use u8 instead of uint8_t.
> > can you please educate me as to what is this reason?
> 
> This is kernel style to prefer the shorter types within the kernel code.
> Outside of the kernel proper, uint*_t types are used in the UAPI
> headers. You can look through the mailing list about this, but this is
> how I've known it to be for a while now.

Thanks. I have changed this from patch v6 onwards.
> > > > +
> > > > +       rval = devm_clk_hw_register(&pdev->dev, &c->hw);
> > > > +       if (rval) {
> > > > +               dev_err(&pdev->dev, "failed to register 32K clk");
> > > > +               goto err_out;
> > > > +       }
> > > > +
> > > > +       if (pdev->dev.parent->of_node) {
> > > > +               rval = of_clk_add_hw_provider(pdev->dev.parent->of_node,
> > > > +                                            of_clk_hw_simple_get,
> > > > +                                            &c->hw);
> > > > +               if (rval) {
> > > > +                       dev_err(&pdev->dev, "adding clk provider failed\n");
> > > > +                       goto err_out;
> > > 
> > > Just return rval instead of goto and then remove err_out label.
> > 
> > Is this 'hard requirement'? I prefer single point of exit from functions
> > (when easily doable) because I have done so many errors with locks /
> > resources being reserved when exiting from some error branch. For my
> > personal taste maintaining the one nice cleanup sequence is easier. But
> > if this is 'hard requirement' this can of course be changed.
> 
> There are no locks though. And this uses devm. So please remove the goto
> so my style alarms don't go off. Thanks!

I did rework this piece from patch v6 onwards so that there is no goto but
we still have single exit point. I hope that is Ok, so please re-check
this when you find the time.

> > > > +       rval = clk_hw_register_clkdev(&c->hw, init.name, NULL);
> > > 
> > > This leaks a clkdev lookup. Sad we don't have a devm version. Maybe it
> > > should be added. But I really doubt this chip will be used with clkdev
> > > lookups so please remove clkdev until you have a user who needs it.
> > 
> > Yep. It leaks. I tried to look for an example where the clkdev was
> > nicely freed at remove - but I didn't find any. Every example I spotted
> > did leak the clkdev in same way as this does :( And I agree, devm
> > variant for freeing would be nice - or freeing routines based on hw.
> > 
> > As the leaked clkdev can cause oops at module unload/reload/use your
> > suggestion about removing it for now makes sense. I'll drop it.
> 
> Ok! Sometimes drivers don't free them because they're lazy and don't
> expect to be unloaded or to fail. I guess you ran into those. I'm happy
> to apply patches to clean those up.

When I get the moment of "hmm, what should I do next" - I'll keep this
in mind... Unfortunately those moments have been pretty rare occasions
since I found my wife and got my kids - but OTOH, we have working
pension scheme in Finland - so I expect this to change during the next
30 years or so =] (Truth is that I'll keep this in mind but can't
promise anything more as promises might be empty).

> > > > +       if (rval) {
> > > > +               dev_err(&pdev->dev, "failed to register clkdev for bd71837");
> > > > +               goto err_clean_provider;
> > > > +       }
> > > > +
> > > > +       platform_set_drvdata(pdev, c);
> > > > +
> > > > +       return 0;
> > > > +
> > > > +err_clean_provider:
> > > > +       of_clk_del_provider(pdev->dev.parent->of_node);
> > > > +err_out:
> > > > +       return rval;
> > > > +}
> > > > +
> > > > +static int bd71837_clk_remove(struct platform_device *pdev)
> > > > +{
> > > > +       if (pdev->dev.parent->of_node)
> > > > +               of_clk_del_provider(pdev->dev.parent->of_node);
> > > 
> > > Use devm so this can go away. Or is devm not used because the parent
> > > of_node is the provider? That's annoying.
> > 
> > What would be the correct workaround for this?
> 
> Smash the clk driver into the overall PMIC node. That should work. Or
> possibly assign the same of_node to the child device when creating it?
> I'm not sure if that causes some sort of problem with DT code though, so
> it would be good to check with Rob H if that's a bad idea or not.

I'd rather keep the clk in own subdevice so that it can be used or not
used based on the clk Kconfig options. I also rather keep the clk codes
in clk folders. So I guess the use of devm is not correct justification
for bundling the MFD and clk. I basically see 3 ways:

1. Assign MFD node to subdevice node in MFD when creating the cells.
2. Assign parent->of_node to dev.of_node in clk subdevice.
3. Create devm_of_clk_add_hw_provider_w_node() which does something
like (not compiled pseudo) code below

int devm_of_clk_add_hw_provider_w_node(struct device *dev,
			struct clk_hw *(*get)(struct of_phandle_args *clkspec,
					      void *data),
			struct device_node *of_node,
			void *data)
{
	struct device_node **ptr;
	int ret;
	ptr = devres_alloc(devm_of_clk_release_provider, sizeof(*ptr),
			   GFP_KERNEL);
	if (!ptr)
		return -ENOMEM;

	*ptr = of_node;
	ret = of_clk_add_hw_provider(of_node, get, data);
	if (!ret)
		devres_add(dev, ptr);
	else
		devres_free(ptr);

	return ret;
}
EXPORT_SYMBOL_GPL(devm_of_clk_add_hw_provider_w_node);

int devm_of_clk_add_hw_provider(struct device *dev,
			struct clk_hw *(*get)(struct of_phandle_args *clkspec,
					      void *data),
			void *data)
{
	return devm_of_clk_add_hw_provider_w_node(dev, get, dev->of_node,
						  data);
}
EXPORT_SYMBOL_GPL(devm_of_clk_add_hw_provider);

To me the third option sounds like correct one - but you guys probably
have the idea how these subsystems should look like in the future - so I
trust on your judgement on this. So whatäs your take on this?

I'll also add Rob in the 'to' field of this email so maybe we get his opinion
on this.

Best Regards
    Matti Vaittinen
