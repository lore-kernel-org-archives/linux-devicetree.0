From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 2/6] clk: meson: add a driver for the Meson8/8b/8m2 DDR
 clock controller
Date: Tue, 1 Oct 2019 20:53:59 +0200
Message-ID: <CAFBinCCED4YWYkdtrfrC80C8WLE=fyMJdjTa3wFNMJgC1OsoOA@mail.gmail.com>
References: <20190921151835.770263-1-martin.blumenstingl@googlemail.com>
 <20190921151835.770263-3-martin.blumenstingl@googlemail.com>
 <1jftkcr3uy.fsf@starbuckisacylon.baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1jftkcr3uy.fsf@starbuckisacylon.baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Jerome,

thank you for taking the time to go through this!

On Tue, Oct 1, 2019 at 3:29 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
[...]
> > +#include <linux/platform_device.h>
> > +#include <linux/mfd/syscon.h>
>
> syscon is not used in the driver
oops, good catch - thank you

[...]
> > +static struct clk_hw_onecell_data meson8_ddr_clk_hw_onecell_data = {
> > +     .hws = {
> > +             [DDR_CLKID_DDR_PLL_DCO]         = &meson8_ddr_pll_dco.hw,
> > +             [DDR_CLKID_DDR_PLL]             = &meson8_ddr_pll.hw,
>
> I wonder if onecell is not overkill for this driver. We won't expose the
> DCO, so only the post divider remains
>
> Do you expect this provider to have more than one leaf clock ?
> If not, maybe you could use of_clk_hw_simple_get() instead ?
there's some more clock bits in DDR_CLK_CNTL - the public A311D
datasheet has a description for these bits but I'm not sure they do
the same on Meson8/Meson8b/Meson8m2
all I know is that some magic bytes are written to DDR_CLK_CNTL in the
old u-boot code

that's why I don't want to make any assumptions and play safe here (by
using a onecell clock provider)

> > +     },
> > +     .num = 2,
> > +};
> > +
> > +static struct clk_regmap *const meson8_ddr_clk_regmaps[] = {
> > +     &meson8_ddr_pll_dco,
> > +     &meson8_ddr_pll,
> > +};
> > +
> > +static const struct regmap_config meson8_ddr_clkc_regmap_config = {
> > +     .reg_bits = 8,
> > +     .val_bits = 32,
> > +     .reg_stride = 4,
> > +     .fast_io = true,
>
> I think fast_io will default to true with memory based register.
> Setting the max_register would be nice
good point - I'll take care of this when sending v2


Martin
