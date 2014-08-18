From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2 6/9] arm: mediatek: enable gpt6 on boot up to make
 arch timer working
Date: Mon, 18 Aug 2014 16:45:48 +0100
Message-ID: <20140818154548.GA3302@leverpostej>
References: <1408373917-10002-1-git-send-email-matthias.bgg@gmail.com>
 <1408373917-10002-7-git-send-email-matthias.bgg@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1408373917-10002-7-git-send-email-matthias.bgg@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: "thomas.petazzoni@free-electrons.com" <thomas.petazzoni@free-electrons.com>, "anders.berg@lsi.com" <anders.berg@lsi.com>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "arnd@arndb.de" <arnd@arndb.de>, Pawel Moll <Pawel.Moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "srv_yingjoe.chen@mediatek.com" <srv_yingjoe.chen@mediatek.com>, "heiko@sntech.de" <heiko@sntech.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stefan@agner.ch" <stefan@agner.ch>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "galak@codeaurora.org" <galak@codeaurora.org>, "olof@lixom.net" <olof@lixom.net>, "swarren@nvidia.com" <swarren@nvidia.com>, "maxime.ripard@free-electrons.com" <maxime.ripard@free-electrons.com>, sebastian.hesselbart
List-Id: devicetree@vger.kernel.org

Hi Matthias,

On Mon, Aug 18, 2014 at 03:58:34PM +0100, Matthias Brugger wrote:
> We enable GTP6 which ungates the arch timer clock. Apart we write the
> frequency with which the timer is running in the CNTFREQ register.

We don't seem to set CNTFRQ below. Does it happen to have a consistent
value on current versions of the bootloader?

> In the future this should be done in the bootloader.

Do we know how far in the future that's likely to be?

What's the plan for this code when such a bootloader becomes available?

Thanks,
Mark.

> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---
>  arch/arm/mach-mediatek/mediatek.c |   26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/arch/arm/mach-mediatek/mediatek.c b/arch/arm/mach-mediatek/mediatek.c
> index f2acf07..2989f18 100644
> --- a/arch/arm/mach-mediatek/mediatek.c
> +++ b/arch/arm/mach-mediatek/mediatek.c
> @@ -16,6 +16,31 @@
>   */
>  #include <linux/init.h>
>  #include <asm/mach/arch.h>
> +#include <linux/of.h>
> +#include <linux/clk-provider.h>
> +#include <linux/clocksource.h>
> +
> +#define TIMER_CTRL_OP_FREERUN	0x30
> +#define TIMER_CTRL_ENABLE	0x01
> +
> +#define GPT6_CON_MT65xx 0x10008060
> +
> +static void __init mediatek_timer_init(void)
> +{
> +	static void __iomem *gpt_base;
> +
> +	if (of_machine_is_compatible("mediatek,mt6589")) {
> +		/* turn on GPT6 which ungates arch timer clocks */
> +		gpt_base = ioremap(GPT6_CON_MT65xx, 0x04);
> +	}
> +
> +	/* enabel clock and set to free-run */
> +	if (gpt_base)
> +		writel(TIMER_CTRL_OP_FREERUN | TIMER_CTRL_ENABLE, gpt_base);
> +
> +	of_clk_init(NULL);
> +	clocksource_of_init();
> +};
>  
>  static const char * const mediatek_board_dt_compat[] = {
>  	"mediatek,mt6589",
> @@ -24,4 +49,5 @@ static const char * const mediatek_board_dt_compat[] = {
>  
>  DT_MACHINE_START(MEDIATEK_DT, "Mediatek Cortex-A7 (Device Tree)")
>  	.dt_compat	= mediatek_board_dt_compat,
> +	.init_time	= mediatek_timer_init,
>  MACHINE_END
> -- 
> 1.7.9.5
> 
> 
