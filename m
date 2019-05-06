From: Peng Fan <peng.fan@nxp.com>
Subject: RE: [PATCH 2/4] nvmem: imx: add i.MX8 nvmem driver
Date: Mon, 6 May 2019 08:45:27 +0000
Message-ID: <AM0PR04MB44819A6FA84A71ED01CC9C4E88300@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <20190505134130.28071-1-peng.fan@nxp.com>
 <20190505134130.28071-2-peng.fan@nxp.com>
 <AM0PR04MB421139D3806F75ED9426C8DB80300@AM0PR04MB4211.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <AM0PR04MB421139D3806F75ED9426C8DB80300@AM0PR04MB4211.eurprd04.prod.outlook.com>
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
To: Aisheng Dong <aisheng.dong@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "srinivas.kandagatla@linaro.org" <srinivas.kandagatla@linaro.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "van.freenix@gmail.com" <van.freenix@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Aisheng,

> Subject: RE: [PATCH 2/4] nvmem: imx: add i.MX8 nvmem driver
> 
> > From: Peng Fan
> > Sent: Sunday, May 5, 2019 9:28 PM
> > Subject: [PATCH 2/4] nvmem: imx: add i.MX8 nvmem driver
> >
> > This patch adds i.MX8 nvmem ocotp driver to access fuse via RPC to
> > i.MX8 system controller.
> >
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> 
> Only a few minor comments.
> Otherwise, this patch looks good to me.
> 
> First, the patch title probably better to be:
> nvmem: imx: add i.MX8 SCU based ocotp driver support

Fix in V2.

> 
> > Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > Cc: Shawn Guo <shawnguo@kernel.org>
> > Cc: Sascha Hauer <s.hauer@pengutronix.de>
> > Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> > Cc: Fabio Estevam <festevam@gmail.com>
> > Cc: NXP Linux Team <linux-imx@nxp.com>
> > Cc: linux-arm-kernel@lists.infradead.org
> > ---
> >  drivers/nvmem/Kconfig         |   7 +++
> >  drivers/nvmem/Makefile        |   2 +
> >  drivers/nvmem/imx-ocotp-scu.c | 135
> > ++++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 144 insertions(+)
> >  create mode 100644 drivers/nvmem/imx-ocotp-scu.c
> >
> > diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig index
> > 530d570724c9..0e705c04bd8c 100644
> > --- a/drivers/nvmem/Kconfig
> > +++ b/drivers/nvmem/Kconfig
> > @@ -36,6 +36,13 @@ config NVMEM_IMX_OCOTP
> >  	  This driver can also be built as a module. If so, the module
> >  	  will be called nvmem-imx-ocotp.
> >
> > +config NVMEM_IMX_OCOTP_SCU
> > +	tristate "i.MX8 On-Chip OTP Controller support"
> 
> i.MX8 SCU On-Chip OTP Controller support
Fix in V2
> 
> > +	depends on IMX_SCU
> > +	help
> > +	  This is a driver for the On-Chip OTP Controller (OCOTP)
> 
> SCU On-Chip OTP
Fix in V2.
> 
> > +	  available on i.MX8 SoCs.
> > +
[.....]

> > +
> > +static int imx_scu_ocotp_read(void *context, unsigned int offset,
> > +			      void *val, size_t bytes)
> > +{
> > +	struct ocotp_priv *priv = context;
> > +	u32 count, index, num_bytes;
> > +	u8 *buf, *p;
> 
> It seems buf has never been used as u8.
> So probably a better way is:
> U32 *buf;
> Void *p.
> Then we can save all the explicit conversion of u32.

Fix in V2.

> 
> > +	int i, ret;
> > +
> > +	index = offset >> 2;
> > +	num_bytes = round_up((offset % 4) + bytes, 4);
> > +	count = num_bytes >> 2;
> > +
> > +	if (count > (priv->data->nregs - index))
> > +		count = priv->data->nregs - index;
> > +
> > +	p = kzalloc(num_bytes, GFP_KERNEL);
> > +	if (!p)
> > +		return -ENOMEM;
> > +
> > +	buf = p;
> > +
> > +	for (i = index; i < (index + count); i++) {
> > +		if (priv->data->devtype == IMX8QXP) {
> > +			if ((i > 271) && (i < 544)) {
> > +				*(u32 *)buf = 0;
> > +				buf += 4;
> > +				continue;
> > +			}
> > +		}
> > +
> > +		ret = imx_sc_misc_otp_fuse_read(priv->nvmem_ipc, i,
> > +						(u32 *)buf);
> 
> Is this API already in kernel?

Ah. I forgot to post out that API in this patchset. Will add that in V2.

[....]
> > +
> > +MODULE_AUTHOR("Peng Fan <peng.fan@nxp.com>");
> > +MODULE_DESCRIPTION("i.MX8QM OCOTP fuse box driver");
> 
> i.MX8 SCU OCOTP fuse box driver

Fix in V2.

Thanks,
Peng.

> 
> Regards
> Dong Aisheng
> 
> > +MODULE_LICENSE("GPL v2");
> > --
> > 2.16.4
