From: Flora Fu <flora.fu@mediatek.com>
Subject: Re: [PATCH 3/7] regulator: MT6397: Add support for MT6397 regulator
Date: Fri, 21 Nov 2014 15:09:31 +0800
Message-ID: <1416553771.19764.51.camel@mtksdaap41>
References: <1416210027-5562-1-git-send-email-flora.fu@mediatek.com>
 <1416210027-5562-4-git-send-email-flora.fu@mediatek.com>
 <20141117234012.GE22111@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20141117234012.GE22111@sirena.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Brown <broonie@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, Russell King <linux@arm.linux.org.uk>, Samuel Ortiz <sameo@linux.intel.com>, Grant Likely <grant.likely@linaro.org>, "Joe.C" <yingjoe.chen@mediatek.com>, devicetree@vger.kernel.org, Vladimir Murzin <vladimir.murzin@arm.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Eddie Huang <eddie.huang@mediatek.com>, linux-arm-kernel@lists.infradead.org, Dongdong Cheng <dongdong.cheng@mediatek.com>, srv_heupstream@mediatek.com, Liam Girdwood <lgirdwood@gmail.com>, Ashwin Chaugule <ashwin.chaugule@linaro.org>, Sascha Hauer <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Hi, Mark, 

On Mon, 2014-11-17 at 23:40 +0000, Mark Brown wrote:
> On Mon, Nov 17, 2014 at 03:40:23PM +0800, Flora Fu wrote:

> > +static int mt6397_buck_set_voltage_sel(struct regulator_dev *rdev, unsigned sel)
> > +{
> 
> 
> > +	vosel = info->buck_conf.vosel_reg;
> > +	voselon = info->buck_conf.voselon_reg;
> > +	vosel_mask = info->buck_conf.vosel_mask;
> 
> Please use the standard way of specifying data even if you can't use the
> standard function.
> 

Could you specify the standard way of specification data? Thanks. 

> > +
> > +	ret = regmap_update_bits(rdev->regmap, vosel, vosel_mask, sel);
> > +	if (ret != 0) {
> > +		dev_err(&rdev->dev, "Failed to update vosel: %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	ret = regmap_update_bits(rdev->regmap, voselon, vosel_mask, sel);
> > +	if (ret != 0) {
> > +		dev_err(&rdev->dev, "Failed to update vosel_on: %d\n", ret);
> > +		return ret;
> > +	}
> > +	return 0;
> 
> You should add comments here explaining what's going on - it's very
> strange to have to write the same value to two different registers and
> the names of the registers look suspiciously like this is something to do
> with a suspend mode...
> 

Yes, its is for suspend mode control usage.
For registers "vosel", "voselon", they is called register mode or
hardware control mode voltage settings. Register mode is a default mode
on the buck control. For quickly normal/sleep mode switch, hardware
control can be enabled by controlling buck output by a CTRL_PIN. In the
following diagram, there is a static settings on vosel_sleep for suspend
mode output. According to CTRL_PIN's level, Vout can have different
output (voselon or vosel_sleep). 

           +------------------------------------------------------+
           |    MT6397                                            |
           |                              -vosel     -            |
CTRL_PIN   |     +-----------------+                  \ + nivosel-|-Vout
-----------|-----| hardware control|---+  -voselon   -            |
           |     +-----------------+    \ -vosel_sleep -          |
           |                                                      |
           +------------------------------------------------------+

In the design, voltage change on bucks are set both on registers vosel
and voselon. I will add more comments on the function to clarify the
implementation. 

Thanks, 
Flora
