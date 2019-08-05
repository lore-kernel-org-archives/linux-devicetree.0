From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: [PATCH v5 1/3] PM: wakeup: Add routine to help fetch wakeup
 source object.
Date: Mon, 05 Aug 2019 11:59:09 +0200
Message-ID: <4158639.B12JYek7R7@kreacher>
References: <20190724074722.12270-1-ran.wang_1@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190724074722.12270-1-ran.wang_1@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ran Wang <ran.wang_1@nxp.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Li Biwen <biwen.li@nxp.com>, Len Brown <len.brown@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pavel Machek <pavel@ucw.cz>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wednesday, July 24, 2019 9:47:20 AM CEST Ran Wang wrote:
> Some user might want to go through all registered wakeup sources
> and doing things accordingly. For example, SoC PM driver might need to
> do HW programming to prevent powering down specific IP which wakeup
> source depending on. So add this API to help walk through all registered
> wakeup source objects on that list and return them one by one.
> 
> Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
> ---
> Change in v5:
> 	- Update commit message, add decription of walk through all wakeup
> 	source objects.
> 	- Add SCU protection in function wakeup_source_get_next().
> 	- Rename wakeup_source member 'attached_dev' to 'dev' and move it up
> 	(before wakeirq).
> 
> Change in v4:
> 	- None.
> 
> Change in v3:
> 	- Adjust indentation of *attached_dev;.
> 
> Change in v2:
> 	- None.
> 
>  drivers/base/power/wakeup.c | 24 ++++++++++++++++++++++++
>  include/linux/pm_wakeup.h   |  3 +++
>  2 files changed, 27 insertions(+)
> 
> diff --git a/drivers/base/power/wakeup.c b/drivers/base/power/wakeup.c
> index ee31d4f..2fba891 100644
> --- a/drivers/base/power/wakeup.c
> +++ b/drivers/base/power/wakeup.c
> @@ -14,6 +14,7 @@
>  #include <linux/suspend.h>
>  #include <linux/seq_file.h>
>  #include <linux/debugfs.h>
> +#include <linux/of_device.h>
>  #include <linux/pm_wakeirq.h>
>  #include <trace/events/power.h>
>  
> @@ -226,6 +227,28 @@ void wakeup_source_unregister(struct wakeup_source *ws)
>  	}
>  }
>  EXPORT_SYMBOL_GPL(wakeup_source_unregister);
> +/**
> + * wakeup_source_get_next - Get next wakeup source from the list
> + * @ws: Previous wakeup source object, null means caller want first one.
> + */
> +struct wakeup_source *wakeup_source_get_next(struct wakeup_source *ws)
> +{
> +	struct list_head *ws_head = &wakeup_sources;
> +	struct wakeup_source *next_ws = NULL;
> +	int idx;
> +
> +	idx = srcu_read_lock(&wakeup_srcu);
> +	if (ws)
> +		next_ws = list_next_or_null_rcu(ws_head, &ws->entry,
> +				struct wakeup_source, entry);
> +	else
> +		next_ws = list_entry_rcu(ws_head->next,
> +				struct wakeup_source, entry);
> +	srcu_read_unlock(&wakeup_srcu, idx);
> +

This is incorrect.

The SRCU cannot be unlocked until the caller of this is done
with the object returned by it, or that object can be freed
while it is still being accessed.

Besides, this patch conflicts with some general wakeup sources
changes in the works, so it needs to be deferred and rebased on
top of those changes.

> +	return next_ws;
> +}
> +EXPORT_SYMBOL_GPL(wakeup_source_get_next);
>  
>  /**
>   * device_wakeup_attach - Attach a wakeup source object to a device object.
> @@ -242,6 +265,7 @@ static int device_wakeup_attach(struct device *dev, struct wakeup_source *ws)
>  		return -EEXIST;
>  	}
>  	dev->power.wakeup = ws;
> +	ws->dev = dev;
>  	if (dev->power.wakeirq)
>  		device_wakeup_attach_irq(dev, dev->power.wakeirq);
>  	spin_unlock_irq(&dev->power.lock);
> diff --git a/include/linux/pm_wakeup.h b/include/linux/pm_wakeup.h
> index 9102760..fc23c1a 100644
> --- a/include/linux/pm_wakeup.h
> +++ b/include/linux/pm_wakeup.h
> @@ -23,6 +23,7 @@ struct wake_irq;
>   * @name: Name of the wakeup source
>   * @entry: Wakeup source list entry
>   * @lock: Wakeup source lock
> + * @dev: The device it attached to
>   * @wakeirq: Optional device specific wakeirq
>   * @timer: Wakeup timer list
>   * @timer_expires: Wakeup timer expiration
> @@ -42,6 +43,7 @@ struct wakeup_source {
>  	const char 		*name;
>  	struct list_head	entry;
>  	spinlock_t		lock;
> +	struct device		*dev;
>  	struct wake_irq		*wakeirq;
>  	struct timer_list	timer;
>  	unsigned long		timer_expires;
> @@ -88,6 +90,7 @@ extern void wakeup_source_add(struct wakeup_source *ws);
>  extern void wakeup_source_remove(struct wakeup_source *ws);
>  extern struct wakeup_source *wakeup_source_register(const char *name);
>  extern void wakeup_source_unregister(struct wakeup_source *ws);
> +extern struct wakeup_source *wakeup_source_get_next(struct wakeup_source *ws);
>  extern int device_wakeup_enable(struct device *dev);
>  extern int device_wakeup_disable(struct device *dev);
>  extern void device_set_wakeup_capable(struct device *dev, bool capable);
> 
