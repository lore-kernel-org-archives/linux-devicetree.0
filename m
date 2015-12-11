From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v2 1/3] reset: Add shared
 reset_control_[de]assert variants
Date: Fri, 11 Dec 2015 18:10:25 +0100
Message-ID: <1449853825.3419.50.camel@pengutronix.de>
References: <1449848520-27379-1-git-send-email-hdegoede@redhat.com>
Reply-To: p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDUKXHHSSIJBBEEHVSZQKGQEVG5BC6Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1449848520-27379-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Josh Triplett <josh-iaAMLnmF4UmaiuxdJuQwMA@public.gmane.org>, Rashika Kheria <rashika.kheria-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Hans,

thanks for moving this forward.

Am Freitag, den 11.12.2015, 16:41 +0100 schrieb Hans de Goede:
> Add reset_control_deassert_shared / reset_control_assert_shared
> functions which are intended for use by drivers for hw blocks which
> (may) share a reset line with another driver / hw block.
> 
> Unlike the regular reset_control_[de]assert functions these functions
> keep track of how often deassert_shared / assert_shared have been called
> and keep the line deasserted as long as deassert has been called more
> times than assert.
>
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
> Changes in v2:
> -This is a new patch in v2 of this patch-set
> ---
>  drivers/reset/core.c             | 121 ++++++++++++++++++++++++++++++++++++---
>  include/linux/reset-controller.h |   2 +
>  include/linux/reset.h            |   2 +
>  3 files changed, 116 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/reset/core.c b/drivers/reset/core.c
> index 9ab9290..8c3436c 100644
> --- a/drivers/reset/core.c
> +++ b/drivers/reset/core.c
> @@ -22,16 +22,29 @@ static DEFINE_MUTEX(reset_controller_list_mutex);
>  static LIST_HEAD(reset_controller_list);
>  
>  /**
> + * struct reset_line - a reset line
> + * @list:         list entry for the reset controllers reset line list
> + * @id:           ID of the reset line in the reset controller device
> + * @refcnt:       Number of reset_control structs referencing this device
> + * @deassert_cnt: Number of times this reset line has been deasserted
> + */
> +struct reset_line {
> +	struct list_head list;
> +	unsigned int id;
> +	unsigned int refcnt;
> +	unsigned int deassert_cnt;
> +};

I'd move rcdev into reset_line, too. That way the description is
complete, and we don't duplicate rcdev when there are multiple
reset_controls pointing here.

> +/**
>   * struct reset_control - a reset control
>   * @rcdev: a pointer to the reset controller device
>   *         this reset control belongs to
> - * @id: ID of the reset controller in the reset
> - *      controller device
> + * @line:  reset line for this reset control
>   */
>  struct reset_control {
>  	struct reset_controller_dev *rcdev;
> +	struct reset_line *line;
>  	struct device *dev;
> -	unsigned int id;
>  };
>  
>  /**
[...]
> @@ -119,13 +134,55 @@ EXPORT_SYMBOL_GPL(reset_control_assert);
>  int reset_control_deassert(struct reset_control *rstc)
>  {

Maybe WARN_ON(rstc->line->refcnt > 1) ?

>  	if (rstc->rcdev->ops->deassert)
> -		return rstc->rcdev->ops->deassert(rstc->rcdev, rstc->id);
> +		return rstc->rcdev->ops->deassert(rstc->rcdev, rstc->line->id);
>  
>  	return -ENOTSUPP;
>  }
>  EXPORT_SYMBOL_GPL(reset_control_deassert);
>  
>  /**
> + * reset_control_assert_shared - asserts a shared reset line
> + * @rstc: reset controller
> + *
> + * Assert a shared reset line, this functions decreases the deassert count
> + * of the line by one and asserts it if, and only if, the deassert count
> + * reaches 0.

"After calling this function the shared reset line may be asserted, or
 it may still be deasserted, as long as other users keep it so."

> + */
> +int reset_control_assert_shared(struct reset_control *rstc)
> +{
> +	if (!rstc->rcdev->ops->assert)
> +		return -ENOTSUPP;

WARN_ON(rstc->line->deassert_cnt == 0)

Actually, what to do in this case? Assume ops->assert was called, or do
it again to be sure? Certainly we don't want to wrap deassert_cnt, or
the next deassert_shared will do nothing.

> +	rstc->line->deassert_cnt--;
> +	if (rstc->line->deassert_cnt)

deassert_cnt isn't protected by any lock.

> +		return 0;
> +
> +	return rstc->rcdev->ops->assert(rstc->rcdev, rstc->line->id);
> +}
> +EXPORT_SYMBOL_GPL(reset_control_assert_shared);
> +
> +/**
> + * reset_control_deassert_shared - deasserts a shared reset line
> + * @rstc: reset controller
> + *
> + * Assert a shared reset line, this functions increases the deassert count

Deassert

> + * of the line by one and deasserts the reset line (if it was not already
> + * deasserted).

"After calling this function, the shared reset line is guaranteed to be
 deasserted."

> + */
> +int reset_control_deassert_shared(struct reset_control *rstc)
> +{
> +	if (!rstc->rcdev->ops->deassert)
> +		return -ENOTSUPP;
> +
> +	rstc->line->deassert_cnt++;
> +	if (rstc->line->deassert_cnt != 1)
> +		return 0;
> +
> +	return rstc->rcdev->ops->deassert(rstc->rcdev, rstc->line->id);
> +}
> +EXPORT_SYMBOL_GPL(reset_control_deassert_shared);
> +
> +/**
>   * reset_control_status - returns a negative errno if not supported, a
>   * positive value if the reset line is asserted, or zero if the reset
>   * line is not asserted.
> @@ -134,12 +191,47 @@ EXPORT_SYMBOL_GPL(reset_control_deassert);
>  int reset_control_status(struct reset_control *rstc)
>  {
>  	if (rstc->rcdev->ops->status)
> -		return rstc->rcdev->ops->status(rstc->rcdev, rstc->id);
> +		return rstc->rcdev->ops->status(rstc->rcdev, rstc->line->id);
>  
>  	return -ENOTSUPP;
>  }
>  EXPORT_SYMBOL_GPL(reset_control_status);
>  
> +static struct reset_line *reset_line_get(struct reset_controller_dev *rcdev,
> +					 unsigned int index)
> +{
> +	struct reset_line *line;

lockdep_assert_held here and in reset_line_put would document that these
functions are called under reset_(controller_)list_mutex.

> +	list_for_each_entry(line, &rcdev->reset_line_head, list) {
> +		if (line->id == index) {
> +			line->refcnt++;
> +			return line;
> +		}
> +	}
> +
> +	line = kzalloc(sizeof(*line), GFP_KERNEL);
> +	if (!line)
> +		return NULL;
> +
> +	list_add(&line->list, &rcdev->reset_line_head);
> +	line->id = index;
> +	line->refcnt = 1;
> +
> +	return line;
> +}
> +
> +static void reset_line_put(struct reset_line *line)
> +{
> +	if (!line)
> +		return;
> +
> +	if (--line->refcnt)
> +		return;
> +
> +	list_del(&line->list);
> +	kfree(line);
> +}
> +
>  /**
>   * of_reset_control_get_by_index - Lookup and obtain a reference to a reset
>   * controller by index.
> @@ -155,6 +247,7 @@ struct reset_control *of_reset_control_get_by_index(struct device_node *node,
>  {
>  	struct reset_control *rstc = ERR_PTR(-EPROBE_DEFER);
>  	struct reset_controller_dev *r, *rcdev;
> +	struct reset_line *line;
>  	struct of_phandle_args args;
>  	int rstc_id;
>  	int ret;
> @@ -186,16 +279,22 @@ struct reset_control *of_reset_control_get_by_index(struct device_node *node,
>  	}
>  
>  	try_module_get(rcdev->owner);
> +
> +	/* reset_controller_list_mutex also protects the reset_line list */

Let's rename it to reset_list_mutex, then.

> +	line = reset_line_get(rcdev, rstc_id);
> +
>  	mutex_unlock(&reset_controller_list_mutex);
>  
>  	rstc = kzalloc(sizeof(*rstc), GFP_KERNEL);
> -	if (!rstc) {
> +	if (!line || !rstc) {
> +		kfree(rstc);
> +		reset_line_put(line);
>  		module_put(rcdev->owner);
>  		return ERR_PTR(-ENOMEM);
>  	}
>  
>  	rstc->rcdev = rcdev;
> -	rstc->id = rstc_id;
> +	rstc->line = line;
>  
>  	return rstc;
>  }
> @@ -259,6 +358,10 @@ void reset_control_put(struct reset_control *rstc)
>  	if (IS_ERR(rstc))
>  		return;
>  
> +	mutex_lock(&reset_controller_list_mutex);
> +	reset_line_put(rstc->line);
> +	mutex_unlock(&reset_controller_list_mutex);
> +
>  	module_put(rstc->rcdev->owner);
>  	kfree(rstc);
>  }
> diff --git a/include/linux/reset-controller.h b/include/linux/reset-controller.h
> index ce6b962..7f2cbd1 100644
> --- a/include/linux/reset-controller.h
> +++ b/include/linux/reset-controller.h
> @@ -31,6 +31,7 @@ struct of_phandle_args;
>   * @ops: a pointer to device specific struct reset_control_ops
>   * @owner: kernel module of the reset controller driver
>   * @list: internal list of reset controller devices
> + * @reset_line_head: head of internal list of reset lines

"list of requested reset lines" or "list of reset lines in use" to make
clear the list only contains entries for the requested controls?

>   * @of_node: corresponding device tree node as phandle target
>   * @of_reset_n_cells: number of cells in reset line specifiers
>   * @of_xlate: translation function to translate from specifier as found in the
[...]

best regards
Philipp
