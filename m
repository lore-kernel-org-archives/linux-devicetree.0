From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2 4/5] regulator: max14577: Add regulator driver for Maxim
 14577
Date: Thu, 21 Nov 2013 15:27:13 +0100
Message-ID: <1385044033.748.29.camel@AMDC1943>
References: <1384956732-19526-1-git-send-email-k.kozlowski@samsung.com>
 <1384956732-19526-5-git-send-email-k.kozlowski@samsung.com>
 <3176793.htnYthLYeH@amdc1032> <3987325.g4jkYp0g0H@amdc1032>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <3987325.g4jkYp0g0H@amdc1032>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: devicetree@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Samuel Ortiz <sameo@linux.intel.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee.jones@linaro.org>, Mark Brown <broonie@kernel.org>, Anton Vorontsov <anton@enomsg.org>, linux-doc@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <rob.herring@calxeda.com>, linux-kernel@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Rob Landley <rob@landley.net>, Grant Likely <grant.likely@linaro.org>, David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: devicetree@vger.kernel.org

On Wed, 2013-11-20 at 18:58 +0100, Bartlomiej Zolnierkiewicz wrote:
> Err..
> 
> > I'm missing something obvious "info" is redundant and can be removed
> > altogether.
> > 
> > Best regards,
> > --
> > Bartlomiej Zolnierkiewicz
> > Samsung R&D Institute Poland
> > Samsung Electronics
> > 
> > > +	for (i = 0; i < pdata->num_regulators; i++) {
> > > +		int id = pdata->regulators[i].id;
> > > +
> > > +		config.init_data = pdata->regulators[i].initdata;
> > > +		config.of_node = pdata->regulators[i].of_node;
> > > +
> > > +		info->regulators[i] = devm_regulator_register(&pdev->dev,
> > > +				&supported_regulators[id], &config);
> > > +		if (IS_ERR(info->regulators[i])) {
> 
> This code actually reads from "info" but it can be fixed trivially
> to not require "info".

You're right, it can be removed. The info was a left-over from 3.10
where there isn't devm_regulator_register(). Thanks for review.


Best regards,
Krzysztof
