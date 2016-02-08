From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/3] mwifiex: register platform specific driver
Date: Mon, 8 Feb 2016 15:56:14 -0600
Message-ID: <20160208215614.GB9036@rob-hp-laptop>
References: <1454926528-17480-1-git-send-email-akarwar@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1454926528-17480-1-git-send-email-akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Amitkumar Karwar <akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nishant Sarmukadam <nishants-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, wnhuang-F7+t8E8rja9Wk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Xinming Hu <huxm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 08, 2016 at 02:15:26AM -0800, Amitkumar Karwar wrote:
> From: Xinming Hu <huxm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> 
> Platform device and driver provides easy way to
> interact with device-tree-enabled system.
> 
> This patch registers platform driver and reorganise
> existing device tree specific code.
> Corresponding device tree binding file is
> also created.

Wrap you lines at 72 columns.

> Signed-off-by: Xinming Hu <huxm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Amitkumar Karwar <akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> ---
> v3: Don't update adapter->dt_node if mwifiex_plt_dev is NULL 
> ---
>  Documentation/devicetree/bindings/mwifiex.txt      | 29 +++++++++++

This doesn't belong at top level of bindings. bindings/net/wireless/

Also, mwifiex is a linux driver name. Name it after the chips. 
marvell-sd8xxx?

>  drivers/net/wireless/marvell/mwifiex/Makefile      |  1 +
>  drivers/net/wireless/marvell/mwifiex/main.c        |  2 +
>  drivers/net/wireless/marvell/mwifiex/main.h        | 14 +++++
>  .../net/wireless/marvell/mwifiex/platform_drv.c    | 59 ++++++++++++++++++++++
>  drivers/net/wireless/marvell/mwifiex/sta_cmd.c     |  6 +--
>  drivers/net/wireless/marvell/mwifiex/sta_ioctl.c   |  2 +-
>  7 files changed, 109 insertions(+), 4 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mwifiex.txt
>  create mode 100644 drivers/net/wireless/marvell/mwifiex/platform_drv.c
> 
> diff --git a/Documentation/devicetree/bindings/mwifiex.txt b/Documentation/devicetree/bindings/mwifiex.txt
> new file mode 100644
> index 0000000..39b6a74
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mwifiex.txt
> @@ -0,0 +1,29 @@
> +mwifiex
> +------
> +
> +Required properties:
> +
> +  - name : must be "mwifiex"
> +  - compatible : must be "marvell,mwifiex"

The naming should be named after the actual chip.

> +
> +Optional properties:
> +
> +  - mwifiex,caldata* : A series of properties with marvell,caldata prefix,

mwifiex is not a vendor.

> +  		      represent Calibration data downloaded to the device during
> +		      initialization. This is an array of unsigned values.
> +
> +
> +Example:
> +
> +Tx power limit calibration data is configured in below example.
> +The calibration data is an array of unsigned values, the length
> +can vary between hw versions.
> +
> +mwifiex {

These chips are SDIO devices, right? This should be a child node of the 
SDIO controller.

> +	compatible = "marvell,mwifiex";
> +
> +	mwifiex,caldata_00_txpwrlimit_2g_cfg_set = /bits/ 8 <
> +0x01 0x00 0x06 0x00 0x08 0x02 0x89 0x01 ...>;
> +
> +};
> +
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
