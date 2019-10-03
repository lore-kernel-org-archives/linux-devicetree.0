From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [RFC][PATCH 2/3] usb: roles: Add usb role switch notifier.
Date: Thu, 3 Oct 2019 11:25:16 +0200
Message-ID: <2e369349-41f6-bd15-2829-fa886f209b39@redhat.com>
References: <20191002231617.3670-1-john.stultz@linaro.org>
 <20191002231617.3670-3-john.stultz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191002231617.3670-3-john.stultz@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: John Stultz <john.stultz@linaro.org>, lkml <linux-kernel@vger.kernel.org>
Cc: Yu Chen <chenyu56@huawei.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Felipe Balbi <balbi@kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Jun Li <lijun.kernel@gmail.com>, Valentin Schneider <valentin.schneider@arm.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi John,

On 03-10-2019 01:16, John Stultz wrote:
> From: Yu Chen <chenyu56@huawei.com>
>=20
> This patch adds notifier for drivers want to be informed of the usb role
> switch.

I do not see any patches in this series actually using this new
notifier.

Maybe it is best to drop this patch until we actually have in-kernel
users of this new API show up ?

Regards,

Hans


>=20
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
> Cc: Yu Chen <chenyu56@huawei.com>
> Cc: Felipe Balbi <balbi@kernel.org>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
> Cc: Jun Li <lijun.kernel@gmail.com>
> Cc: Valentin Schneider <valentin.schneider@arm.com>
> Cc: linux-usb@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Suggested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Yu Chen <chenyu56@huawei.com>
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
>   drivers/usb/roles/class.c | 35 ++++++++++++++++++++++++++++++++++-
>   include/linux/usb/role.h  | 16 ++++++++++++++++
>   2 files changed, 50 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
> index 94b4e7db2b94..418e762d5d72 100644
> --- a/drivers/usb/roles/class.c
> +++ b/drivers/usb/roles/class.c
> @@ -20,6 +20,7 @@ struct usb_role_switch {
>   =09struct device dev;
>   =09struct mutex lock; /* device lock*/
>   =09enum usb_role role;
> +=09struct blocking_notifier_head nh;
>  =20
>   =09/* From descriptor */
>   =09struct device *usb2_port;
> @@ -49,8 +50,10 @@ int usb_role_switch_set_role(struct usb_role_switch *s=
w, enum usb_role role)
>   =09mutex_lock(&sw->lock);
>  =20
>   =09ret =3D sw->set(sw->dev.parent, role);
> -=09if (!ret)
> +=09if (!ret) {
>   =09=09sw->role =3D role;
> +=09=09blocking_notifier_call_chain(&sw->nh, role, NULL);
> +=09}
>  =20
>   =09mutex_unlock(&sw->lock);
>  =20
> @@ -58,6 +61,35 @@ int usb_role_switch_set_role(struct usb_role_switch *s=
w, enum usb_role role)
>   }
>   EXPORT_SYMBOL_GPL(usb_role_switch_set_role);
>  =20
> +int usb_role_switch_register_notifier(struct usb_role_switch *sw,
> +=09=09=09=09      struct notifier_block *nb)
> +{
> +=09int ret =3D blocking_notifier_chain_register(&sw->nh, nb);
> +=09enum usb_role role;
> +
> +=09if (ret)
> +=09=09return ret;
> +
> +=09/* Initialize the notifier that was just registered */
> +=09mutex_lock(&sw->lock);
> +=09if (sw->get)
> +=09=09role =3D sw->get(sw->dev.parent);
> +=09else
> +=09=09role =3D sw->role;
> +=09blocking_notifier_call_chain(&sw->nh, role, NULL);
> +=09mutex_unlock(&sw->lock);
> +
> +=09return 0;
> +}
> +EXPORT_SYMBOL_GPL(usb_role_switch_register_notifier);
> +
> +int usb_role_switch_unregister_notifier(struct usb_role_switch *sw,
> +=09=09=09=09=09struct notifier_block *nb)
> +{
> +=09return blocking_notifier_chain_unregister(&sw->nh, nb);
> +}
> +EXPORT_SYMBOL_GPL(usb_role_switch_unregister_notifier);
> +
>   /**
>    * usb_role_switch_get_role - Get the USB role for a switch
>    * @sw: USB role switch
> @@ -296,6 +328,7 @@ usb_role_switch_register(struct device *parent,
>   =09=09return ERR_PTR(-ENOMEM);
>  =20
>   =09mutex_init(&sw->lock);
> +=09BLOCKING_INIT_NOTIFIER_HEAD(&sw->nh);
>  =20
>   =09sw->allow_userspace_control =3D desc->allow_userspace_control;
>   =09sw->usb2_port =3D desc->usb2_port;
> diff --git a/include/linux/usb/role.h b/include/linux/usb/role.h
> index 2d77f97df72d..8dbf7940b7da 100644
> --- a/include/linux/usb/role.h
> +++ b/include/linux/usb/role.h
> @@ -54,6 +54,10 @@ struct usb_role_switch *
>   usb_role_switch_register(struct device *parent,
>   =09=09=09 const struct usb_role_switch_desc *desc);
>   void usb_role_switch_unregister(struct usb_role_switch *sw);
> +int usb_role_switch_register_notifier(struct usb_role_switch *sw,
> +=09=09=09=09      struct notifier_block *nb);
> +int usb_role_switch_unregister_notifier(struct usb_role_switch *sw,
> +=09=09=09=09=09struct notifier_block *nb);
>   #else
>   static inline int usb_role_switch_set_role(struct usb_role_switch *sw,
>   =09=09enum usb_role role)
> @@ -87,6 +91,18 @@ usb_role_switch_register(struct device *parent,
>   }
>  =20
>   static inline void usb_role_switch_unregister(struct usb_role_switch *s=
w) { }
> +
> +static int usb_role_switch_register_notifier(struct usb_role_switch *sw,
> +=09=09=09=09=09     struct notifier_block *nb)
> +{
> +=09return -ENODEV;
> +}
> +
> +static int usb_role_switch_unregister_notifier(struct usb_role_switch *s=
w,
> +=09=09=09=09=09       struct notifier_block *nb)
> +{
> +=09return -ENODEV;
> +}
>   #endif
>  =20
>   #endif /* __LINUX_USB_ROLE_H */
>=20
