From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Subject: Re: [PATCH v5 4/4] clk: bd71837: Add driver for BD71837 PMIC clock
Date: Fri, 3 Aug 2018 11:09:14 +0300
Message-ID: <20180803080914.GA20907@localhost.localdomain>
References: <cover.1528117485.git.matti.vaittinen@fi.rohmeurope.com>
 <d99c8762b0fbbcb18ec4f4d104191364c0ea798c.1528117485.git.matti.vaittinen@fi.rohmeurope.com>
 <152878945117.16708.12422348324182290971@swboyd.mtv.corp.google.com>
 <20180612082354.GG20078@localhost.localdomain>
 <152997029783.143105.16692843405899913246@swboyd.mtv.corp.google.com>
 <20180626081319.GA2118@localhost.localdomain>
 <20180731073023.GA2956@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180731073023.GA2956@localhost.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, robh+dt@kernel.org
Cc: Matti Vaittinen <mazziesaccount@gmail.com>, broonie@kernel.org, lee.jones@linaro.org, lgirdwood@gmail.com, mark.rutland@arm.com, mturquette@baylibre.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mikko.mutanen@fi.rohmeurope.com, heikki.haikola@fi.rohmeurope.com
List-Id: devicetree@vger.kernel.org

On Tue, Jul 31, 2018 at 11:28:58AM +0300, Matti Vaittinen wrote:
> On Tue, Jun 26, 2018 at 11:13:19AM +0300, Matti Vaittinen wrote:
> > On Mon, Jun 25, 2018 at 04:44:57PM -0700, Stephen Boyd wrote:
> > > Quoting Matti Vaittinen (2018-06-12 01:23:54)
> > > > On Tue, Jun 12, 2018 at 12:44:11AM -0700, Stephen Boyd wrote:
> > > > > Quoting Matti Vaittinen (2018-06-04 06:19:13)

[snip]

> 
> > 3. Create devm_of_clk_add_hw_provider_w_node() which does something
> 

After giving this second thought - I think there is limited amount of
use cases where other than own or parent nodes should be used. Actually,
the MFD node being parent is pretty much only use case I can think of
where something else but own node should be used. Hence function like
suggested devm_of_clk_add_hw_provider_w_node might invite thinking of
clever hacks... So, perhaps introducing
devm_of_clk_add_hw_provider_parent() (see idea below) would be option to
consider? I feel the bd71837 driver is not only case where MFD is being
parent which has the clock stuff in DT.

static int __devm_of_clk_add_hw_provider(struct device *dev,
	struct clk_hw *(*get)(struct of_phandle_args *clkspec, void *data),
	struct device_node *of_node, void *data)
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

int devm_of_clk_add_hw_provider(struct device *dev,
	struct clk_hw *(*get)(struct of_phandle_args *clkspec, void *data),
	void *data)
{
	return __devm_of_clk_add_hw_provider(dev, get, dev->of_node, data);
}
EXPORT_SYMBOL_GPL(devm_of_clk_add_hw_provider);

int devm_of_clk_add_hw_provider_parent(struct device *dev,
	struct clk_hw *(*get)(struct of_phandle_args *clkspec, void *data),
	void *data)
{
	return __devm_of_clk_add_hw_provider(*dev, get, dev->parent->of_node,
					     data);
}
EXPORT_SYMBOL_GPL(devm_of_clk_add_hw_provider_parent);

> just a friendly reminder, what's your opinion on adding this kind of
> function (devm_of_clk_add_hw_provider_w_node)? or solutions 1/2? And are
> these options safe what comes to reference counting of of_nodes?

I thik the reference counting should not be a problem when use is
limited to (MFD) parent device nodes, right?

Best regards
    Matti Vaittinen
