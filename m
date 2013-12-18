From: "Yang, Wenyou" <Wenyou.Yang@atmel.com>
Subject: RE: [PATCH 2/3 v2] regulator: act8865: add device tree binding doc
Date: Wed, 18 Dec 2013 03:12:34 +0000
Message-ID: <B256D81BAE5131468A838E5D7A24364172F1838F@penmbx01>
References: <1387258597-21866-1-git-send-email-wenyou.yang@atmel.com>
 <1387258597-21866-3-git-send-email-wenyou.yang@atmel.com>
 <20131217124750.GX3185@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20131217124750.GX3185@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "vpalatin@chromium.org" <vpalatin@chromium.org>, "Ferre, Nicolas" <Nicolas.FERRE@atmel.com>, "plagnioj@jcrosoft.com" <plagnioj@jcrosoft.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Mark,

> -----Original Message-----
> From: Mark Brown [mailto:broonie@kernel.org]
> Sent: Tuesday, December 17, 2013 8:48 PM
> To: Yang, Wenyou
> Cc: lgirdwood@gmail.com; linux-kernel@vger.kernel.org;
> grant.likely@linaro.org; rob.herring@calxeda.com; linux-
> doc@vger.kernel.org; vpalatin@chromium.org; Ferre, Nicolas;
> plagnioj@jcrosoft.com; linux-arm-kernel@lists.infradead.org;
> devicetree@vger.kernel.org
> Subject: Re: [PATCH 2/3 v2] regulator: act8865: add device tree binding
> doc
> 
> On Tue, Dec 17, 2013 at 01:36:36PM +0800, Wenyou Yang wrote:
> 
> > +Required properties:
> > +- compatible: "active-semi,act8865"
> > +- reg: I2C slave address
> 
> This needs to also document the regulators property, for example all the
> regulator names.
Add all the regulator name:
The valid names for regulators are:
       DCDC_REG1, DCDC_REG2, DCDC_REG3, LDO_REG1, LDO_REG2, LDO_REG3, LDO_REG4.

Best Regards,
Wenyou Yang
