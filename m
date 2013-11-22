From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v3 1/5] mfd: max14577: Add max14577 MFD driver core
Date: Fri, 22 Nov 2013 10:58:12 +0100
Message-ID: <1385114292.29083.8.camel@AMDC1943>
References: <1385109972-28059-1-git-send-email-k.kozlowski@samsung.com>
 <1385109972-28059-2-git-send-email-k.kozlowski@samsung.com>
 <20131122093118.GH23067@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20131122093118.GH23067@lee--X1>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Anton Vorontsov <anton@enomsg.org>, David Woodhouse <dwmw2@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>
List-Id: devicetree@vger.kernel.org



On Fri, 2013-11-22 at 09:31 +0000, Lee Jones wrote:
(...)
> > +static struct mfd_cell max14577_devs[] = {
> > +	{ .name = "max14577-muic", },
> > +	{ .name = "max14577-regulator", },
> > +	{ .name = "max14577-charger", },
> > +};
> 
> If these all support device tree, shouldn't you be populating
> max14577_devs[x].of_compatible too? That way the MFD core will
> automatically setup your dev.of_node pointers for you?

Only the regulator driver uses bindings from DT and it searches for
"regulators" node in parent's node:
	np = of_get_child_by_name(max14577->dev->of_node, "regulators");
I can add of_compatible but I think this won't be reflected in actual
DTS.

> <snip>
> 
> > +	max14577->vendor_id = (reg_data & 0x7);
> > +	max14577->device_id = ((reg_data & 0xF8) >> 0x3);
> 
> I'm not too keen on these magic numbers, can you create #defines for
> them please? If there are any other interesting address, it might be
> worth creating some for those too.

OK, I'll define these.

Best regards,
Krzysztof
