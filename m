From: Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH v6 06/10] device connection: Add
 fwnode_connection_find_match()
Date: Fri, 31 May 2019 07:40:52 +0000
Message-ID: <OSBPR01MB2103EAE24D36E23BFE8A76A5B8190@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1559115828-19146-1-git-send-email-chunfeng.yun@mediatek.com>
 <1559115828-19146-7-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1559115828-19146-7-git-send-email-chunfeng.yun@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, Li Jun <jun.li@nxp.com>, Badhri Jagan Sridharan <badhri@google.com>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Min Guo <min.guo@mediatek.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, Linus Walleij <linus.walleij@linaro.org>, Yu Chen <chenyu56@huawei.com>
List-Id: devicetree@vger.kernel.org

Hi,

Thanks for the patch

> Subject: [PATCH v6 06/10] device connection: Add
> fwnode_connection_find_match()
>=20
> From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>=20
> The fwnode_connection_find_match() function is exactly the same as
> device_connection_find_match(), except it takes struct fwnode_handle as
> parameter instead of struct device.
> That allows locating device connections before the device entries have be=
en
> created.
>=20
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Tested-by: Biju Das <biju.das@bp.renesas.com>
> ---
> v6:
>   new patch
> ---
>  drivers/base/devcon.c  | 33 +++++++++++++++++++++++++--------
> include/linux/device.h | 10 +++++++---
>  2 files changed, 32 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/base/devcon.c b/drivers/base/devcon.c index
> 04db9ae235e4..8311b70bbca2 100644
> --- a/drivers/base/devcon.c
> +++ b/drivers/base/devcon.c
> @@ -12,9 +12,6 @@
>  static DEFINE_MUTEX(devcon_lock);
>  static LIST_HEAD(devcon_list);
>=20
> -typedef void *(*devcon_match_fn_t)(struct device_connection *con, int
> ep,
> -				   void *data);
> -
>  static void *
>  fwnode_graph_devcon_match(struct fwnode_handle *fwnode, const char
> *con_id,
>  			  void *data, devcon_match_fn_t match) @@ -38,6
> +35,28 @@ fwnode_graph_devcon_match(struct fwnode_handle *fwnode,
> const char *con_id,
>  	return NULL;
>  }
>=20
> +/**
> + * fwnode_connection_find_match - Find connection from a device node
> + * @fwnode: Device node with the connection
> + * @con_id: Identifier for the connection
> + * @data: Data for the match function
> + * @match: Function to check and convert the connection description
> + *
> + * Find a connection with unique identifier @con_id between @fwnode and
> +another
> + * device node. @match will be used to convert the connection
> +description to
> + * data the caller is expecting to be returned.
> + */
> +void *fwnode_connection_find_match(struct fwnode_handle *fwnode,
> +				   const char *con_id, void *data,
> +				   devcon_match_fn_t match)
> +{
> +	if (!fwnode || !match)
> +		return NULL;
> +
> +	return fwnode_graph_devcon_match(fwnode, con_id, data, match);
> }
> +EXPORT_SYMBOL_GPL(fwnode_connection_find_match);
> +
>  /**
>   * device_connection_find_match - Find physical connection to a device
>   * @dev: Device with the connection
> @@ -61,11 +80,9 @@ void *device_connection_find_match(struct device
> *dev, const char *con_id,
>  	if (!match)
>  		return NULL;
>=20
> -	if (fwnode) {
> -		ret =3D fwnode_graph_devcon_match(fwnode, con_id, data,
> match);
> -		if (ret)
> -			return ret;
> -	}
> +	ret =3D fwnode_connection_find_match(fwnode, con_id, data,
> match);
> +	if (ret)
> +		return ret;
>=20
>  	mutex_lock(&devcon_lock);
>=20
> diff --git a/include/linux/device.h b/include/linux/device.h index
> e85264fb6616..9445f068602f 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -772,10 +772,14 @@ struct device_connection {
>  	struct list_head	list;
>  };
>=20
> +typedef void *(*devcon_match_fn_t)(struct device_connection *con, int
> ep,
> +				   void *data);
> +
> +void *fwnode_connection_find_match(struct fwnode_handle *fwnode,
> +				   const char *con_id, void *data,
> +				   devcon_match_fn_t match);
>  void *device_connection_find_match(struct device *dev, const char
> *con_id,
> -				void *data,
> -				void *(*match)(struct device_connection
> *con,
> -					       int ep, void *data));
> +				   void *data, devcon_match_fn_t match);
>=20
>  struct device *device_connection_find(struct device *dev, const char
> *con_id);
>=20
> --
> 2.21.0
