From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH v2 4/6] usb: roles: add API to get usb_role_switch by node
Date: Fri, 15 Mar 2019 10:18:35 +0200
Message-ID: <20190315081835.GD7752@kuha.fi.intel.com>
References: <1552635513-2378-1-git-send-email-chunfeng.yun@mediatek.com>
 <1552635513-2378-5-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1552635513-2378-5-git-send-email-chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, Li Jun <jun.li@nxp.com>, Badhri Jagan Sridharan <badhri@google.com>, Hans de Goede <hdegoede@redhat.com>, Min Guo <min.guo@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 15, 2019 at 03:38:31PM +0800, Chunfeng Yun wrote:
> Add usb_role_switch_get_by_node() to make easier to get
> usb_role_switch by node which register it.
> It's useful when there is not device_connection registered
> between two drivers and only knows the node which register
> usb_role_switch.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  drivers/usb/roles/class.c | 30 ++++++++++++++++++++++++++++++
>  include/linux/usb/role.h  |  1 +
>  2 files changed, 31 insertions(+)
> 
> diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
> index 99116af07f1d..284b19856dc4 100644
> --- a/drivers/usb/roles/class.c
> +++ b/drivers/usb/roles/class.c
> @@ -11,6 +11,7 @@
>  #include <linux/device.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> +#include <linux/of.h>
>  #include <linux/slab.h>
>  
>  static struct class *role_class;
> @@ -121,6 +122,35 @@ struct usb_role_switch *usb_role_switch_get(struct device *dev)
>  }
>  EXPORT_SYMBOL_GPL(usb_role_switch_get);
>  
> +static int __switch_match_node(struct device *dev, const void *node)
> +{
> +	return dev->parent->of_node == (const struct device_node *)node;
> +}

Andy already pointed out that you need to use fwnodes.

Rule of thumb: You always use fwnodes. Only if there is something that
can't be done with fwnodes you use DT or ACPI nodes directly.

In this case there is absolutely nothing that would prevent you from
using fwnodes.


thanks,

-- 
heikki
