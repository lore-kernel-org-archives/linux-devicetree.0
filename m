From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH v7 4/4] ARM: init: add support for reserved memory defined
 by device tree
Date: Thu, 29 Aug 2013 23:49:12 +0100
Message-ID: <20130829224912.7B2933E1222@localhost>
References: <1377527959-5080-1-git-send-email-m.szyprowski@samsung.com>
 <1377527959-5080-5-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1377527959-5080-5-git-send-email-m.szyprowski@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, linaro-mm-sig@lists.linaro.org, devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Laura Abbott <lauraa@codeaurora.org>, Pawel Moll <pawel.moll@arm.com>, Arnd Bergmann <arnd@arndb.de>, Stephen Warren <swarren@wwwdotorg.org>, Tomasz Figa <t.figa@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michal Nazarewicz <mina86@mina86.com>, Marc <marc.ceeeee@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kumar Gala <galak@codeaurora.org>, Olof Johansson <olof@lixom.net>, Ian Campbell <ian.campbell@citrix.com>, Nishanth Peethambaran <nishanth.p@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: devicetree@vger.kernel.org

On Mon, 26 Aug 2013 16:39:19 +0200, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> Enable reserved memory initialization from device tree.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> Acked-by: Michal Nazarewicz <mina86@mina86.com>
> Acked-by: Tomasz Figa <t.figa@samsung.com>
> ---
>  arch/arm/mm/init.c |    3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm/mm/init.c b/arch/arm/mm/init.c
> index 15225d8..6a2fe44 100644
> --- a/arch/arm/mm/init.c
> +++ b/arch/arm/mm/init.c
> @@ -17,6 +17,7 @@
>  #include <linux/nodemask.h>
>  #include <linux/initrd.h>
>  #include <linux/of_fdt.h>
> +#include <linux/of_reserved_mem.h>
>  #include <linux/highmem.h>
>  #include <linux/gfp.h>
>  #include <linux/memblock.h>
> @@ -377,6 +378,8 @@ void __init arm_memblock_init(struct meminfo *mi, struct machine_desc *mdesc)
>  	if (mdesc->reserve)
>  		mdesc->reserve();
>  
> +	early_init_dt_scan_reserved_mem();
> +

Don't forget ARM64.

g.
