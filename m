From: Shawn Guo <shawn.guo@freescale.com>
Subject: Re: [PATCH 1/2] arm/mx5: parse iomuxc pad configuratoin from device
	tree
Date: Wed, 27 Jul 2011 00:41:38 +0800
Message-ID: <20110726164137.GD19600@S2100-06.ap.freescale.net>
References: <1311606467-28985-1-git-send-email-shawn.guo@linaro.org>
	<1311606467-28985-2-git-send-email-shawn.guo@linaro.org>
	<20110726063914.GB20587@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20110726063914.GB20587@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: devicetree-discuss@lists.ozlabs.org, Shawn Guo <shawn.guo@linaro.org>, linux-arm-kernel@lists.infradead.org, patches@linaro.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 26, 2011 at 08:39:14AM +0200, Sascha Hauer wrote:
> On Mon, Jul 25, 2011 at 11:07:46PM +0800, Shawn Guo wrote:
> > It adds function mxc_iomuxc_dt_init() to parse iomuxc pad configuration
> > from device tree.
> > 
> > Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> > Cc: Grant Likely <grant.likely@secretlab.ca>
> > Cc: Sascha Hauer <s.hauer@pengutronix.de>
> > ---
> >  .../devicetree/bindings/arm/fsl/iomuxc.txt         |   47 +++++++++++++
> >  arch/arm/mach-mx5/Makefile                         |    2 +
> >  arch/arm/mach-mx5/iomuxc-dt.c                      |   72 ++++++++++++++++++++
> >  arch/arm/plat-mxc/include/mach/common.h            |    3 +
> >  4 files changed, 124 insertions(+), 0 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/arm/fsl/iomuxc.txt
> >  create mode 100644 arch/arm/mach-mx5/iomuxc-dt.c
> > 
> > + */
> > +
> > +#include <linux/of.h>
> > +#include <asm/io.h>
> 
> linux/io.h
> 
Ok.

> > +
> > +#define IOMUXC_CONFIG_SION	(1 << 4)
> > +
> > +void mxc_iomuxc_dt_init(const struct of_device_id *match)
> > +{
> > +	struct device_node *node = of_find_matching_node(NULL, match);
> > +	struct device_node *child;
> > +	void __iomem *base;
> > +	u32 reg[2], select_input[2];
> > +	u32 mux_mode, pad_ctl;
> > +
> > +	if (!node) {
> > +		pr_warn("%s: no iomuxc node found\n", __func__);
> > +		return;
> > +	}
> 
> Please remove this warning. Some boards may intentionally do the iomux
> setup in the bootloader and skip the iomux setup nodes in the device
> tree.
Ok.

Thanks for review, Sascha.

-- 
Regards,
Shawn
