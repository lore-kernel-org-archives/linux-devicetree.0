From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE: [PATCH V4 2/4] firmware: imx: enable imx scu general irq function
Date: Fri, 15 Mar 2019 11:05:22 +0000
Message-ID: <AM0PR04MB421142B1C681A0F4F991C7CB80440@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1550740354-2701-1-git-send-email-Anson.Huang@nxp.com>
 <1550740354-2701-2-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1550740354-2701-2-git-send-email-Anson.Huang@nxp.com>
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
To: Anson Huang <anson.huang@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "a.zummo@towertech.it" <a.zummo@towertech.it>, "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, Daniel Baluta <daniel.baluta@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

> From: Anson Huang
> 
> The System Controller Firmware (SCFW) controls RTC, thermal and WDOG etc.,
> these resources' interrupt function are managed by SCU. When any IRQ
> pending, SCU will notify Linux via MU general interrupt channel #3, and Linux
> kernel needs to call SCU APIs to get IRQ status and notify each module to
> handle the interrupt.
> 
> Since there is no data transmission for SCU IRQ notification, so doorbell mode
> is used for this MU channel, and SCU driver will use notifier mechanism to
> broadcast to every module which registers the SCU block notifier.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> Changes since V3:
> 	- use alias to get general MU interrupt channel id and then get resource
> ID,
> 	  this is to support different MU instance;
> 	- add return value check for imx_scu_enable_general_irq_channel().
> ---
>  drivers/firmware/imx/imx-scu.c   | 116
> +++++++++++++++++++++++++++++++++++++++

Generally I would suggest to put scu irq support into another separate file under
The same folder to make code clean from function point of view.

>  include/linux/firmware/imx/sci.h |   3 +
>  2 files changed, 119 insertions(+)
> 
> diff --git a/drivers/firmware/imx/imx-scu.c b/drivers/firmware/imx/imx-scu.c
> index 2bb1a19..1dcd7b3 100644
> --- a/drivers/firmware/imx/imx-scu.c
> +++ b/drivers/firmware/imx/imx-scu.c
> @@ -7,6 +7,7 @@
>   *
>   */
> 
> +#include <dt-bindings/firmware/imx/rsrc.h>
>  #include <linux/err.h>
>  #include <linux/firmware/imx/types.h>
>  #include <linux/firmware/imx/ipc.h>
> @@ -21,6 +22,8 @@
> 
>  #define SCU_MU_CHAN_NUM		8
>  #define MAX_RX_TIMEOUT		(msecs_to_jiffies(30))
> +#define IMX_SC_IRQ_FUNC_STATUS	2
> +#define IMX_SC_IRQ_NUM_GROUP	6
> 
>  struct imx_sc_chan {
>  	struct imx_sc_ipc *sc_ipc;
> @@ -41,6 +44,7 @@ struct imx_sc_ipc {
>  	u32 *msg;
>  	u8 rx_size;
>  	u8 count;
> +	u32 mu_resource_id;

I feel it a bit strange to put this mu id in struct imx_sc_ipc.

>  };
> 
>  /*
> @@ -77,7 +81,23 @@ static int imx_sc_linux_errmap[IMX_SC_ERR_LAST] = {
>  	-EIO,	 /* IMX_SC_ERR_FAIL */
>  };
> 
> +struct imx_sc_msg_irq_get_status {
> +	struct imx_sc_rpc_msg hdr;
> +	union {
> +		struct {
> +			u16 resource;
> +			u8 group;
> +			u8 reserved;
> +		} __packed req;
> +		struct {
> +			u32 status;
> +		} __packed resp;

No packed needed for this one

> +	} data;
> +};
> +
>  static struct imx_sc_ipc *imx_sc_ipc_handle;
> +static struct work_struct imx_sc_general_irq_work; static
> +BLOCKING_NOTIFIER_HEAD(imx_scu_notifier_chain);

Imx_scu_irq_xxx

> 
>  static inline int imx_sc_to_linux_errno(int errno)  { @@ -194,9 +214,90 @@
> int imx_scu_call_rpc(struct imx_sc_ipc *sc_ipc, void *msg, bool have_resp)  }
> EXPORT_SYMBOL(imx_scu_call_rpc);
> 
> +int imx_scu_register_notifier(struct notifier_block *nb) {
> +	return blocking_notifier_chain_register(&imx_scu_notifier_chain, nb);
> +} EXPORT_SYMBOL(imx_scu_register_notifier);
> +
> +int imx_scu_unregister_notifier(struct notifier_block *nb) {
> +	return blocking_notifier_chain_unregister(&imx_scu_notifier_chain,
> +nb); } EXPORT_SYMBOL(imx_scu_unregister_notifier);
> +
> +static int imx_scu_notifier_call_chain(unsigned long status, u8 *group)
> +{
> +	return blocking_notifier_call_chain(&imx_scu_notifier_chain,
> +					    status, (void *)group);
> +}
> +
> +static void imx_scu_general_irq_work_handler(struct work_struct *work)
> +{
> +	struct imx_sc_msg_irq_get_status msg;
> +	struct imx_sc_rpc_msg *hdr = &msg.hdr;
> +	u32 irq_status;
> +	int ret;
> +	u8 i;
> +
> +	for (i = 0; i < IMX_SC_IRQ_NUM_GROUP; i++) {

Do we need to support all irq group?

> +		hdr->ver = IMX_SC_RPC_VERSION;
> +		hdr->svc = IMX_SC_RPC_SVC_IRQ;
> +		hdr->func = IMX_SC_IRQ_FUNC_STATUS;
> +		hdr->size = 2;
> +
> +		msg.data.req.resource = imx_sc_ipc_handle->mu_resource_id;
> +		msg.data.req.group = i;
> +
> +		ret = imx_scu_call_rpc(imx_sc_ipc_handle, &msg, true);
> +		if (ret) {
> +			pr_err("get irq status failed, ret %d\n", ret);

Can the error output more useful information?

> +			return;
> +		}
> +
> +		irq_status = msg.data.resp.status;
> +		if (!irq_status)
> +			continue;
> +
> +		imx_scu_notifier_call_chain(irq_status, &i);
> +	}
> +}
> +
> +static void imx_scu_rxdb_callback(struct mbox_client *c, void *msg) {

Imx_scu_irq_callback

> +	schedule_work(&imx_sc_general_irq_work);
> +}
> +
> +static int imx_scu_enable_general_irq_channel(struct device *dev) {
> +	struct mbox_client *cl;
> +	struct mbox_chan *ch;
> +	int ret = 0;
> +
> +	cl = devm_kzalloc(dev, sizeof(*cl), GFP_KERNEL);
> +	if (!cl)
> +		return -ENOMEM;
> +
> +	cl->dev = dev;
> +	cl->rx_callback = imx_scu_rxdb_callback;
> +
> +	/* SCU general IRQ uses general interrupt channel 3 */
> +	ch = mbox_request_channel_byname(cl, "gip3");
> +	if (IS_ERR(ch)) {
> +		ret = PTR_ERR(ch);
> +		dev_err(dev, "failed to request mbox chan gip3, ret %d\n", ret);
> +		return ret;
> +	}
> +
> +	INIT_WORK(&imx_sc_general_irq_work,
> imx_scu_general_irq_work_handler);
> +
> +	return ret;
> +}
> +
>  static int imx_scu_probe(struct platform_device *pdev)  {
>  	struct device *dev = &pdev->dev;
> +	struct of_phandle_args spec;
>  	struct imx_sc_ipc *sc_ipc;
>  	struct imx_sc_chan *sc_chan;
>  	struct mbox_client *cl;
> @@ -246,6 +347,21 @@ static int imx_scu_probe(struct platform_device
> *pdev)
> 
>  	imx_sc_ipc_handle = sc_ipc;
> 
> +	ret = imx_scu_enable_general_irq_channel(dev);
> +	if (ret)
> +		dev_warn(dev,
> +			"failed to enable general irq channel: %d\n", ret);
> +

It does not make sense to parse again if failed. Pls put them into one function.

> +	if (!of_parse_phandle_with_args(dev->of_node, "mboxes",
> +				       "#mbox-cells", 0, &spec))
> +		i = of_alias_get_id(spec.np, "mu");

This needs a binding doc for mailbox (mu).

> +
> +	/* use mu1 as general mu irq channel if failed */
> +	if (i < 0)
> +		i = 1;
> +
> +	imx_sc_ipc_handle->mu_resource_id = IMX_SC_R_MU_0A + i;
> +
>  	dev_info(dev, "NXP i.MX SCU Initialized\n");
> 
>  	return devm_of_platform_populate(dev); diff --git
> a/include/linux/firmware/imx/sci.h b/include/linux/firmware/imx/sci.h
> index ebc5509..9d608db 100644
> --- a/include/linux/firmware/imx/sci.h
> +++ b/include/linux/firmware/imx/sci.h
> @@ -15,4 +15,7 @@
> 
>  #include <linux/firmware/imx/svc/misc.h>  #include
> <linux/firmware/imx/svc/pm.h>
> +
> +int imx_scu_register_notifier(struct notifier_block *nb); int
> +imx_scu_unregister_notifier(struct notifier_block *nb);

imx_scu_irq_xxx

Regards
Dong Aisheng

>  #endif /* _SC_SCI_H */
> --
> 2.7.4
