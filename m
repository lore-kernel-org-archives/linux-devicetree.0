From: Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH v4 4/6] usb: roles: add API to get usb_role_switch by node
Date: Fri, 26 Apr 2019 07:02:24 +0000
Message-ID: <OSBPR01MB210350ED8C36423BBF4A8FDFB83E0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1556261237-13823-1-git-send-email-chunfeng.yun@mediatek.com>
 <1556261237-13823-5-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1556261237-13823-5-git-send-email-chunfeng.yun@mediatek.com>
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
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Badhri Jagan Sridharan <badhri@google.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, Min Guo <min.guo@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Li Jun <jun.li@nxp.com>
List-Id: devicetree@vger.kernel.org

Hi Chunfeng Yun,

Thanks for the patch.

> Subject: [PATCH v4 4/6] usb: roles: add API to get usb_role_switch by node
> 
> Add fwnode_usb_role_switch_get() to make easier to get usb_role_switch
> by fwnode which register it.
> It's useful when there is not device_connection registered between two
> drivers and only knows the fwnode which register usb_role_switch.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
Tested-by: Biju Das <biju.das@bp.renesas.com>
> ---
> v4 changes:
>   1. use switch_fwnode_match() to find fwnode suggested by Heikki
>   2. this patch now depends on [1]
> 
>  [1] [v6,08/13] usb: roles: Introduce stubs for the exiting functions in role.h
>     https://patchwork.kernel.org/patch/10909971/
> 
> v3 changes:
>   1. use fwnodes instead of node suggested by Andy
>   2. rebuild the API suggested by Heikki
> 
> v2 no changes
> ---
>  drivers/usb/roles/class.c | 25 +++++++++++++++++++++++++
> include/linux/usb/role.h  |  8 ++++++++
>  2 files changed, 33 insertions(+)
> 
> diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c index
> f45d8df5cfb8..994fcb979795 100644
> --- a/drivers/usb/roles/class.c
> +++ b/drivers/usb/roles/class.c
> @@ -12,6 +12,7 @@
>  #include <linux/device.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> +#include <linux/of.h>

Is it required?

>  #include <linux/slab.h>
> 
>  static struct class *role_class;
> @@ -135,6 +136,30 @@ struct usb_role_switch *usb_role_switch_get(struct
> device *dev)  }  EXPORT_SYMBOL_GPL(usb_role_switch_get);
> 
> +/**
> + * fwnode_usb_role_switch_get - Find USB role switch by it's parent
> +fwnode
> + * @fwnode: The fwnode that register USB role switch
> + *
> + * Finds and returns role switch registered by @fwnode. The reference
> +count
> + * for the found switch is incremented.
> + */
> +struct usb_role_switch *
> +fwnode_usb_role_switch_get(struct fwnode_handle *fwnode) {
> +	struct usb_role_switch *sw;
> +	struct device *dev;
> +
> +	dev = class_find_device(role_class, NULL, fwnode,
> switch_fwnode_match);
> +	if (!dev)
> +		return ERR_PTR(-EPROBE_DEFER);
> +
> +	sw = to_role_switch(dev);
> +	WARN_ON(!try_module_get(sw->dev.parent->driver->owner));
> +
> +	return sw;
> +}
> +EXPORT_SYMBOL_GPL(fwnode_usb_role_switch_get);
> +
>  /**
>   * usb_role_switch_put - Release handle to a switch
>   * @sw: USB Role Switch
> diff --git a/include/linux/usb/role.h b/include/linux/usb/role.h index
> da2b9641b877..35d460f9ec40 100644
> --- a/include/linux/usb/role.h
> +++ b/include/linux/usb/role.h
> @@ -48,6 +48,8 @@ int usb_role_switch_set_role(struct usb_role_switch
> *sw, enum usb_role role);  enum usb_role usb_role_switch_get_role(struct
> usb_role_switch *sw);  struct usb_role_switch *c(struct
> device *dev);  void usb_role_switch_put(struct usb_role_switch *sw);
> +struct usb_role_switch *
> +fwnode_usb_role_switch_get(struct fwnode_handle *fwnode);

>  struct usb_role_switch *
>  usb_role_switch_register(struct device *parent, @@ -72,6 +74,12 @@ static
> inline struct usb_role_switch *usb_role_switch_get(struct device *dev)
> 
>  static inline void usb_role_switch_put(struct usb_role_switch *sw) { }
> 
> +static inline struct usb_role_switch *
> +fwnode_usb_role_switch_get(struct fwnode_handle *fwnode) {
> +	return ERR_PTR(-ENODEV);
> +}
> +

>  static inline struct usb_role_switch *
>  usb_role_switch_register(struct device *parent,
>  			 const struct usb_role_switch_desc *desc)
> --
> 2.21.0
