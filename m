From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v3 2/5] extcon: max14577: Add extcon-max14577 driver to
 support MUIC device
Date: Fri, 22 Nov 2013 12:34:25 +0100
Message-ID: <1385120065.6030.0.camel@AMDC1943>
References: <1385109972-28059-1-git-send-email-k.kozlowski@samsung.com>
 <1385109972-28059-3-git-send-email-k.kozlowski@samsung.com>
 <20131122103533.GI14725@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-reply-to: <20131122103533.GI14725@sirena.org.uk>
Sender: linux-doc-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Anton Vorontsov <anton@enomsg.org>, David Woodhouse <dwmw2@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>
List-Id: devicetree@vger.kernel.org

On Fri, 2013-11-22 at 10:35 +0000, Mark Brown wrote:
> On Fri, Nov 22, 2013 at 09:46:09AM +0100, Krzysztof Kozlowski wrote:
> 
> > +#define	DELAY_MS_DEFAULT		17000		/* unit: millisecond */
> 
> This delay is sufficiently large that the delayed work using it probably
> ought to use the power efficient workqueues instead of just a regular
> schedule_delayed_work().  This will mean that instead of being scheduled
> on the core which scheduled it the work can run on any CPU, avoiding the
> need to power up a currently idle CPU just to run the work.

I'll fix this. Thanks for review of the patches.

Best regards,
Krzysztof


