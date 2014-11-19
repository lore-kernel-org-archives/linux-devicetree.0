From: Gyungoh Yoo <gyungoh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RESUBMIT PATCH v7 7/9] regulator: sky81452: Modify Device Tree
 structure
Date: Wed, 19 Nov 2014 16:39:54 +0900
Message-ID: <20141119073954.GA3665@jack-ThinkPad-T520>
References: <1416213190-20935-1-git-send-email-jack.yoo@skyworksinc.com>
 <1416213190-20935-8-git-send-email-jack.yoo@skyworksinc.com>
 <20141117141836.GA2722@sirena.org.uk>
 <20141118080451.GA3319@jack-ThinkPad-T520>
 <20141118112056.GA14734@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20141118112056.GA14734-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jack.yoo-tjhQNA90jdKqndwCJWfcng@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, florian.vaussard-p8DiymsW2f8@public.gmane.org, trivial-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 18, 2014 at 11:20:56AM +0000, Mark Brown wrote:
> On Tue, Nov 18, 2014 at 05:04:51PM +0900, Gyungoh Yoo wrote:
> > On Mon, Nov 17, 2014 at 02:18:36PM +0000, Mark Brown wrote:
> 
> > > Don't open code this, use regulators_node and of_match as previously
> > > advised.
> 
> > I think I had a misunderstanding.
> > But I have no idea about regulators_node and of_match.
> > Could you let me know more about them?
> 
> They are fields in regulator_desc, there are documentation and examples
> in current mainline - take a look at that and ask questions if it is
> unclear.

Okay. Thank you.
If of_match and regulators_node are assigned, don't I need to
call of_regulator_match()? Does regulator_register() call it internally?
So can I write code like below?

static const struct regulator_desc sky81452_reg = {
	.name = "LOUT",
	.of_match = of_match_ptr("lout"),
	.regulators_node = of_match_ptr("regulator"),
	.ops = &sky81452_reg_ops,
	...
};

static int sky81452_reg_probe(struct platform_device *pdev)
{
	struct device *dev = &pdev->dev;
	const struct regulator_init_data *init_data = dev_get_platdata(dev);
	struct regulator_config config = { };
	struct regulator_dev *rdev;

	config.dev = dev->parent;
	config.init_data = init_data;
	config.of_node = dev->of_node;
	config.regmap = dev_get_drvdata(dev->parent);

	rdev = devm_regulator_register(dev, &sky81452_reg, &config);
	if (IS_ERR(rdev)) {
		dev_err(dev, "failed to register. err=%ld\n", PTR_ERR(rdev));
		return PTR_ERR(rdev);
	}

	platform_set_drvdata(pdev, rdev);

	return 0;
}
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
