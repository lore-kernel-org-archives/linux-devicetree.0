From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/2][UPDATE] of: base: add support to get the number of
 cache levels
Date: Thu, 12 Jan 2017 07:24:53 -0600
Message-ID: <CAL_Jsq+wawaXeFPnmYw++YMiMzMm+9nSn498Dj7KsGzkfndfog@mail.gmail.com>
References: <1484048479-19767-1-git-send-email-sudeep.holla@arm.com>
 <1484049616-22388-1-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1484049616-22388-1-git-send-email-sudeep.holla@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Tan Xiaojun <tanxiaojun@huawei.com>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 10, 2017 at 6:00 AM, Sudeep Holla <sudeep.holla@arm.com> wrote:
> It is useful to have helper function just to get the number of cache
> levels for a given logical cpu. This patch adds the support for the
> same.
>
> It will be used on ARM64 platform where the device tree provides the
> information for the additional non-architected/transparent/external
> last level caches that are not integrated with the processors.
>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  drivers/of/base.c  | 23 +++++++++++++++++++++++
>  include/linux/of.h |  1 +
>  2 files changed, 24 insertions(+)
>
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index d4bea3c797d6..80e557eca858 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -25,6 +25,7 @@
>  #include <linux/cpu.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/of_device.h>
>  #include <linux/of_graph.h>
>  #include <linux/spinlock.h>
>  #include <linux/slab.h>
> @@ -2268,6 +2269,28 @@ struct device_node *of_find_next_cache_node(const struct device_node *np)
>  }
>
>  /**
> + * of_count_cache_levels - Find the total number of cache levels for the
> + *                        given logical cpu
> + *
> + * @cpu: cpu number(logical index) for which cache levels is being counted
> + *
> + * Returns the total number of cache levels for the given logical cpu
> + */
> +int of_count_cache_levels(unsigned int cpu)
> +{
> +       int level = 0;
> +       struct device_node *np = of_cpu_device_node_get(cpu);
> +
> +       while (np) {
> +               level++;

This will return 1 if you have a cpu node and no cache nodes. Are you
assuming the cpu has a cache?

Perhaps you should just find the last level cache node and then just
read "cache-level".

Rob
