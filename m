From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH v4 04/13] usb: typec: add fwnode to tcpc
Date: Thu, 29 Mar 2018 15:57:45 +0300
Message-ID: <20180329125745.GA19020@kuha.fi.intel.com>
References: <1522253178-32414-1-git-send-email-jun.li@nxp.com>
 <1522253178-32414-5-git-send-email-jun.li@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <1522253178-32414-5-git-send-email-jun.li@nxp.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Li Jun <jun.li@nxp.com>
Cc: devel@driverdev.osuosl.org, peter.chen@nxp.com, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, a.hajda@samsung.com, robh+dt@kernel.org, linux-imx@nxp.com, linux@roeck-us.net, shufan_lee@richtek.com
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, Mar 29, 2018 at 12:06:09AM +0800, Li Jun wrote:
> Add fwnode handle to get the fwnode so we can get typec configs
> it contains.
> 
> Suggested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---
>  drivers/staging/typec/tcpci.c | 14 +++++++-------
>  drivers/usb/typec/tcpm.c      |  1 +
>  include/linux/usb/tcpm.h      |  2 ++
>  3 files changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/typec/tcpci.c b/drivers/staging/typec/tcpci.c
> index ed76327..4f7ad10 100644
> --- a/drivers/staging/typec/tcpci.c
> +++ b/drivers/staging/typec/tcpci.c
> @@ -10,6 +10,7 @@
>  #include <linux/module.h>
>  #include <linux/i2c.h>
>  #include <linux/interrupt.h>
> +#include <linux/property.h>
>  #include <linux/regmap.h>
>  #include <linux/usb/pd.h>
>  #include <linux/usb/tcpm.h>
> @@ -463,17 +464,16 @@ static const struct regmap_config tcpci_regmap_config = {
>  	.max_register = 0x7F, /* 0x80 .. 0xFF are vendor defined */
>  };
>  
> -static const struct tcpc_config tcpci_tcpc_config = {
> -	.type = TYPEC_PORT_DFP,
> -	.default_role = TYPEC_SINK,
> -};
> -
>  static int tcpci_parse_config(struct tcpci *tcpci)
>  {
>  	tcpci->controls_vbus = true; /* XXX */
>  
> -	/* TODO: Populate struct tcpc_config from ACPI/device-tree */
> -	tcpci->tcpc.config = &tcpci_tcpc_config;

That will break bisectablitity. tcpm.c is still accessing the config
at this point.

Just leave those untouched in here, and clean-up in separate patch
that comes after the patch that prepares tcpm.c.


Thanks,

-- 
heikki
