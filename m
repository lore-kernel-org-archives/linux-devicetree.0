From: James Liao <jamesjj.liao@mediatek.com>
Subject: Re: [PATCH v6 7/9] clk: mediatek: Add subsystem clocks of MT8173
Date: Thu, 6 Aug 2015 16:23:51 +0800
Message-ID: <1438849431.27884.9.camel@mtksdaap41>
References: <1438676218-11310-1-git-send-email-jamesjj.liao@mediatek.com>
	 <1438676218-11310-8-git-send-email-jamesjj.liao@mediatek.com>
	 <20150805064605.GZ18700@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150805064605.GZ18700@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Heiko Stubner <heiko@sntech.de>, devicetree@vger.kernel.org, srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org, Daniel Kurtz <djkurtz@chromium.org>, Ricky Liang <jcliang@chromium.org>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Sascha,

On Wed, 2015-08-05 at 08:46 +0200, Sascha Hauer wrote:
> On Tue, Aug 04, 2015 at 04:16:56PM +0800, James Liao wrote:
> >  static const struct mtk_fixed_clk fixed_clks[] __initconst = {
> >  	FIXED_CLK(CLK_TOP_CLKPH_MCK_O, "clkph_mck_o", "clk26m", 400 * MHZ),
> >  	FIXED_CLK(CLK_TOP_USB_SYSPLL_125M, "usb_syspll_125m", "clk26m", 125 * MHZ),
> > +	FIXED_CLK(CLK_TOP_DSI0_DIG, "dsi0_dig", "clk26m", 130 * MHZ),
> > +	FIXED_CLK(CLK_TOP_DSI1_DIG, "dsi1_dig", "clk26m", 130 * MHZ),
> > +	FIXED_CLK(CLK_TOP_LVDS_PXL, "lvds_pxl", "lvdspll", 148.5 * MHZ),
> > +	FIXED_CLK(CLK_TOP_LVDS_CTS, "lvds_cts", "lvdspll", 51.975 * MHZ),
> 
> I would expect 51975 * KHZ here to avoid fractional numbers. Probably
> gcc calculates that during compile time so this will work as expected,
> still I'm not sure this is good style to use fractional numbers here.

As I know all constants will be calculated in compile time, so there
should be no difference between 51.975 * MHZ and 51975 * KHz. 

> Anyway, on my system lvdspll is running at 150MHz. Are you sure there is
> a clock derived from this running at 148.5MHz? Is it really correct to
> use a fixed clock here or should it rather be lvdspll directly?

Here is the clock hierarchy between lvdspll and lvds_pxl:

            --------       AD_VPLL_DPIX_CK  --------   lvds_pxl  -----
           |        |--------------------->|        |---------->|
           |        |                      | cksys  |           |
LVDSPLL -->| LVDSTX |                      | buffer |           | MMSYS
           |        | AD_LVDSTX_CLKDIG_CTS | test   |  lvds_cts |
           |        |--------------------->|        |---------->|
            --------                        --------             -----

Some clocks and blocks are not modeled into CCF. But we prefer to enable
lvdspll before enabling lvds_pxl. So I modeled lvds_pxl (and lvds_cts)
as a fixed-rate clock with a source from lvdspll.

The frequency of these fixed-rate clocks (such as 148.5 MHz) are typical
rate. In fact, we don't care about the actual rate of these clocks. We
just care about the enable / disable sequence of them.


Best regards,

James
