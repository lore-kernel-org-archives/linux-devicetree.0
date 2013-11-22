From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v3 4/5] regulator: max14577: Add regulator driver for Maxim
 14577
Date: Fri, 22 Nov 2013 10:23:56 +0100
Message-ID: <1385112236.29083.3.camel@AMDC1943>
References: <1385109972-28059-1-git-send-email-k.kozlowski@samsung.com>
 <1385109972-28059-5-git-send-email-k.kozlowski@samsung.com>
 <20131122091639.GG23067@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20131122091639.GG23067@lee--X1>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Anton Vorontsov <anton@enomsg.org>, David Woodhouse <dwmw2@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>
List-Id: devicetree@vger.kernel.org

On Fri, 2013-11-22 at 09:16 +0000, Lee Jones wrote:
(...)
> On Fri, 22 Nov 2013, Krzysztof Kozlowski wrote:
> > --- a/include/linux/mfd/max14577.h
> > +++ b/include/linux/mfd/max14577.h
> > @@ -63,7 +63,6 @@ struct max14577_platform_data {
> >  
> >  	int (*set_gpio_pogo_cb) (int new_dev);
> >  
> > -	int num_regulators;
> 
> This doesn't belong in this patch.

Right, thank you.

Krzysztof Kozlowski
