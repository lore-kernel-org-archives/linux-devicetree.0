From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2 1/5] mfd: max14577: Add max14577 MFD driver core
Date: Thu, 21 Nov 2013 14:34:18 +0100
Message-ID: <1385040858.748.27.camel@AMDC1943>
References: <1384956732-19526-1-git-send-email-k.kozlowski@samsung.com>
 <1384956732-19526-2-git-send-email-k.kozlowski@samsung.com>
 <20131121103408.GA22536@lee--X1> <1385034199.748.21.camel@AMDC1943>
 <20131121122011.GD23067@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-reply-to: <20131121122011.GD23067@lee--X1>
Sender: linux-doc-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Anton Vorontsov <anton@enomsg.org>, David Woodhouse <dwmw2@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>
List-Id: devicetree@vger.kernel.org


On Thu, 2013-11-21 at 12:20 +0000, Lee Jones wrote:
(...)
> > > > +struct max14577_regulator_platform_data {
> > > > +	int id;
> > > > +	struct regulator_init_data *initdata;
> > > > +	struct device_node *of_node;
> > > 
> > > Do you ever set this? What's the point of it is it's set in the device?
> > 
> > Do you mean the whole struct max14577_regulator_platform_data or only
> > some member of it (of_node?)?
> 
> Initially only the of_node. Usually MFD children are able to call back
> into their parent to fetch these details. Also mfd_add_device() goes
> out of its way to fill in the child's own of_node.

The of_node is needed for regulator driver. It is passed in struct regulator_config
to devm_regulator_register():
	config.of_node = pdata->regulators[i].of_node;
	info->regulators[i] = devm_regulator_register(&pdev->dev,
	                              &supported_regulators[id], &config);


Best regards,
Krzysztof

