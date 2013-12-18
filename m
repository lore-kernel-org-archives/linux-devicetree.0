From: "Yang, Wenyou" <Wenyou.Yang@atmel.com>
Subject: RE: [PATCH 3/3 v2] ARM: dts: sama5d3xcm: add the regulator device
 node
Date: Wed, 18 Dec 2013 03:15:10 +0000
Message-ID: <B256D81BAE5131468A838E5D7A24364172F1839C@penmbx01>
References: <1387258597-21866-1-git-send-email-wenyou.yang@atmel.com>
 <1387258597-21866-4-git-send-email-wenyou.yang@atmel.com>
 <20131217123818.GV3185@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20131217123818.GV3185@sirena.org.uk>
Content-Language: en-US
Sender: linux-doc-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "vpalatin@chromium.org" <vpalatin@chromium.org>, "Ferre, Nicolas" <Nicolas.FERRE@atmel.com>, "plagnioj@jcrosoft.com" <plagnioj@jcrosoft.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Mark,

> -----Original Message-----
> From: Mark Brown [mailto:broonie@kernel.org]
> Sent: Tuesday, December 17, 2013 8:38 PM
> To: Yang, Wenyou
> Cc: lgirdwood@gmail.com; linux-kernel@vger.kernel.org;
> grant.likely@linaro.org; rob.herring@calxeda.com; linux-
> doc@vger.kernel.org; vpalatin@chromium.org; Ferre, Nicolas;
> plagnioj@jcrosoft.com; linux-arm-kernel@lists.infradead.org;
> devicetree@vger.kernel.org
> Subject: Re: [PATCH 3/3 v2] ARM: dts: sama5d3xcm: add the regulator
> device node
> 
> On Tue, Dec 17, 2013 at 01:36:37PM +0800, Wenyou Yang wrote:
> 
> > +						vcc_1v8_reg: DCDC_REG1 {
> > +							regulator-name = "DCDC_REG1";
> 
> The whole point of naming the regulators is to help users read kernel
> diagnostic output so the should normally be named after the supply in
> the schematic.  If you're using the name of the supply on the PMIC you
> can just omit it since that's the default anyway and it's not adding
> extra information.  Use something like VCC_1V8.
Thanks a lot.
Change regulator-name with VCC_1V8, VCC_1V2 ... which named after the supply in the schematic.


Best Regards,
Wenyou Yang
