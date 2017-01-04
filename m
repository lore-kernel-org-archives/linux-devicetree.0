From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v5 1/4] soc: zte: Add header for PM domains specifiers
Date: Wed, 4 Jan 2017 13:29:46 +0800
Message-ID: <20170104052945.GE20956@dragon>
References: <1483489157-10782-1-git-send-email-baoyou.xie@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1483489157-10782-1-git-send-email-baoyou.xie@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Baoyou Xie <baoyou.xie@linaro.org>
Cc: mark.rutland@arm.com, jun.nie@linaro.org, geert+renesas@glider.be, linus.walleij@linaro.org, f.fainelli@gmail.com, pankaj.dubey@samsung.com, krzk@kernel.org, chen.chaokai@zte.com.cn, wang.qiang01@zte.com.cn, linux@roeck-us.net, devicetree@vger.kernel.org, arnd@arndb.de, xie.baoyou@zte.com.cn, claudiu.manoil@nxp.com, robh+dt@kernel.org, mchehab@kernel.org, laurent.pinchart+renesas@ideasonboard.com, linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, yangbo.lu@nxp.com, akpm@linux-foundation.org, davem@davemloft.net
List-Id: devicetree@vger.kernel.org

On Wed, Jan 04, 2017 at 08:19:14AM +0800, Baoyou Xie wrote:
> This patch adds header with values used for ZTE 2967
> SoC's power domain driver.
> 
> Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
> Reviewed-by: Shawn Guo <shawn.guo@linaro.org>

The tags like Reviewed-by, Acked-by etc, can only be added into your
patch after people give it explicitly.  One of the examples is that Jun
Nie gave his Reviewed-by tag on your "[PATCH v2 2/2] soc: zte:
pm_domains: Add support for zx296718 board".

https://www.spinics.net/lists/arm-kernel/msg547282.html

I did not give my Reviewed-by tag on list, so you shouldn't add it here.
Actually, in case of this patch series, I will probably apply them
through ZTE -> arm-soc tree, when I feel it's ready.  So I'm do not even
need to give the Reviewed-by tag.

Shawn

> ---
>  include/dt-bindings/soc/zte,pm_domains.h | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 include/dt-bindings/soc/zte,pm_domains.h
> 
> diff --git a/include/dt-bindings/soc/zte,pm_domains.h b/include/dt-bindings/soc/zte,pm_domains.h
> new file mode 100644
> index 0000000..01e9abc
> --- /dev/null
> +++ b/include/dt-bindings/soc/zte,pm_domains.h
> @@ -0,0 +1,23 @@
> +/*
> + * Copyright (C) 2017 Linaro Ltd.
> + *
> + * Author: Baoyou Xie <baoyou.xie@linaro.org>
> + * License terms: GNU General Public License (GPL) version 2
> + */
> +#ifndef _DT_BINDINGS_SOC_ZTE_PM_DOMAINS_H
> +#define _DT_BINDINGS_SOC_ZTE_PM_DOMAINS_H
> +
> +#define DM_ZX296718_SAPPU	0
> +#define DM_ZX296718_VDE		1  /* g1v6 */
> +#define DM_ZX296718_VCE		2  /* h1v6 */
> +#define DM_ZX296718_HDE		3  /* g2v2 */
> +#define DM_ZX296718_VIU		4
> +#define DM_ZX296718_USB20	5
> +#define DM_ZX296718_USB21	6
> +#define DM_ZX296718_USB30	7
> +#define DM_ZX296718_HSIC	8
> +#define DM_ZX296718_GMAC	9
> +#define DM_ZX296718_TS		10
> +#define DM_ZX296718_VOU		11
> +
> +#endif /* _DT_BINDINGS_SOC_ZTE_PM_DOMAINS_H */
> -- 
> 2.7.4
> 
