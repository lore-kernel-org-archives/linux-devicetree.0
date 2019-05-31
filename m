From: Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH v6 07/10] usb: roles: Add fwnode_usb_role_switch_get()
 function
Date: Fri, 31 May 2019 07:41:51 +0000
Message-ID: <OSBPR01MB2103D590654C4A7A49A3EF37B8190@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1559115828-19146-1-git-send-email-chunfeng.yun@mediatek.com>
 <1559115828-19146-8-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1559115828-19146-8-git-send-email-chunfeng.yun@mediatek.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, Yu Chen <chenyu56@huawei.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Badhri Jagan Sridharan <badhri@google.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, Min Guo <min.guo@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Li Jun <jun.li@nxp.com>
List-Id: devicetree@vger.kernel.org

Hi,

Thanks for the patch.

> Subject: [PATCH v6 07/10] usb: roles: Add fwnode_usb_role_switch_get()
> function
> 
> From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> 
> The fwnode_usb_role_switch_get() function is exactly the same as
> usb_role_switch_get(), except that it takes struct fwnode_handle as
> parameter instead of struct device.
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Tested-by: Biju Das <biju.das@bp.renesas.com>

> ---
> v6:
>   new patch
> ---
>  drivers/usb/roles/class.c | 20 ++++++++++++++++++++
> include/linux/usb/role.h  |  7 +++++++
>  2 files changed, 27 insertions(+)
> 
> diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c index
> f45d8df5cfb8..aab795b54c7f 100644
> --- a/drivers/usb/roles/class.c
> +++ b/drivers/usb/roles/class.c
> @@ -135,6 +135,26 @@ struct usb_role_switch *usb_role_switch_get(struct
> device *dev)  }  EXPORT_SYMBOL_GPL(usb_role_switch_get);
> 
> +/**
> + * fwnode_usb_role_switch_get - Find USB role switch linked with the
> +caller
> + * @fwnode: The caller device node
> + *
> + * This is similar to the usb_role_switch_get() function above, but it
> +searches
> + * the switch using fwnode instead of device entry.
> + */
> +struct usb_role_switch *fwnode_usb_role_switch_get(struct
> fwnode_handle
> +*fwnode) {
> +	struct usb_role_switch *sw;
> +
> +	sw = fwnode_connection_find_match(fwnode, "usb-role-switch",
> NULL,
> +					  usb_role_switch_match);
> +	if (!IS_ERR_OR_NULL(sw))
> +		WARN_ON(!try_module_get(sw->dev.parent->driver-
> >owner));
> +
> +	return sw;
> +}
> +EXPORT_SYMBOL_GPL(fwnode_usb_role_switch_get);
> +
>  /**
>   * usb_role_switch_put - Release handle to a switch
>   * @sw: USB Role Switch
> diff --git a/include/linux/usb/role.h b/include/linux/usb/role.h index
> da2b9641b877..2d77f97df72d 100644
> --- a/include/linux/usb/role.h
> +++ b/include/linux/usb/role.h
> @@ -47,6 +47,7 @@ struct usb_role_switch_desc {  int
> usb_role_switch_set_role(struct usb_role_switch *sw, enum usb_role role);
> enum usb_role usb_role_switch_get_role(struct usb_role_switch *sw);
> struct usb_role_switch *usb_role_switch_get(struct device *dev);
> +struct usb_role_switch *fwnode_usb_role_switch_get(struct
> fwnode_handle
> +*node);
>  void usb_role_switch_put(struct usb_role_switch *sw);
> 
>  struct usb_role_switch *
> @@ -70,6 +71,12 @@ static inline struct usb_role_switch
> *usb_role_switch_get(struct device *dev)
>  	return ERR_PTR(-ENODEV);
>  }
> 
> +static inline struct usb_role_switch *
> +fwnode_usb_role_switch_get(struct fwnode_handle *node) {
> +	return ERR_PTR(-ENODEV);
> +}
> +
>  static inline void usb_role_switch_put(struct usb_role_switch *sw) { }
> 
>  static inline struct usb_role_switch *
> --
> 2.21.0
