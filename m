From: Ran Wang <ran.wang_1@nxp.com>
Subject: RE: [PATCH v4 1/3] PM: wakeup: Add routine to help fetch wakeup
 source object.
Date: Tue, 4 Jun 2019 07:06:34 +0000
Message-ID: <AM5PR0402MB286535CF9B49BCF651C2322BF1150@AM5PR0402MB2865.eurprd04.prod.outlook.com>
References: <20190520095238.29210-1-ran.wang_1@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190520095238.29210-1-ran.wang_1@nxp.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ran Wang <ran.wang_1@nxp.com>, Leo Li <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pavel Machek <pavel@ucw.cz>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Len Brown <len.brown@intel.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Sirs,
    Could anyone please comment this patch set or tell me if I have missed
maintainer in mail list? I'd like to let review process move forward.
    Thank you.

Regards, 
Ran

On Monday, May 20, 2019 17:53 Ran Wang wrote:
> 
> Some user might want to go through all registered wakeup sources and doing
> things accordingly. For example, SoC PM driver might need to do HW
> programming to prevent powering down specific IP which wakeup source
> depending on. And is user's responsibility to identify if this wakeup source he is
> interested in.
> 
> Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
> ---
> Change in v4:
> 	- None.
> 
> Change in v3:
> 	- Adjust indentation of *attached_dev;.
> 
> Change in v2:
> 	- None.
> 
>  drivers/base/power/wakeup.c |   18 ++++++++++++++++++
>  include/linux/pm_wakeup.h   |    3 +++
>  2 files changed, 21 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/base/power/wakeup.c b/drivers/base/power/wakeup.c index
> 5b2b6a0..6904485 100644
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
> @@ -226,6 +227,22 @@ void wakeup_source_unregister(struct wakeup_source
> *ws)
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
> +
> +	if (ws)
> +		return list_next_or_null_rcu(ws_head, &ws->entry,
> +				struct wakeup_source, entry);
> +	else
> +		return list_entry_rcu(ws_head->next,
> +				struct wakeup_source, entry);
> +}
> +EXPORT_SYMBOL_GPL(wakeup_source_get_next);
> 
>  /**
>   * device_wakeup_attach - Attach a wakeup source object to a device object.
> @@ -242,6 +259,7 @@ static int device_wakeup_attach(struct device *dev,
> struct wakeup_source *ws)
>  		return -EEXIST;
>  	}
>  	dev->power.wakeup = ws;
> +	ws->attached_dev = dev;
>  	if (dev->power.wakeirq)
>  		device_wakeup_attach_irq(dev, dev->power.wakeirq);
>  	spin_unlock_irq(&dev->power.lock);
> diff --git a/include/linux/pm_wakeup.h b/include/linux/pm_wakeup.h index
> 0ff134d..913b2fb 100644
> --- a/include/linux/pm_wakeup.h
> +++ b/include/linux/pm_wakeup.h
> @@ -50,6 +50,7 @@
>   * @wakeup_count: Number of times the wakeup source might abort suspend.
>   * @active: Status of the wakeup source.
>   * @has_timeout: The wakeup source has been activated with a timeout.
> + * @attached_dev: The device it attached to
>   */
>  struct wakeup_source {
>  	const char 		*name;
> @@ -70,6 +71,7 @@ struct wakeup_source {
>  	unsigned long		wakeup_count;
>  	bool			active:1;
>  	bool			autosleep_enabled:1;
> +	struct device		*attached_dev;
>  };
> 
>  #ifdef CONFIG_PM_SLEEP
> @@ -101,6 +103,7 @@ static inline void device_set_wakeup_path(struct device
> *dev)  extern void wakeup_source_remove(struct wakeup_source *ws);  extern
> struct wakeup_source *wakeup_source_register(const char *name);  extern
> void wakeup_source_unregister(struct wakeup_source *ws);
> +extern struct wakeup_source *wakeup_source_get_next(struct
> +wakeup_source *ws);
>  extern int device_wakeup_enable(struct device *dev);  extern int
> device_wakeup_disable(struct device *dev);  extern void
> device_set_wakeup_capable(struct device *dev, bool capable);
> --
> 1.7.1
