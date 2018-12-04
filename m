From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/3] soc: imx: gpcv2: add support for i.MX8MQ SoC
Date: Tue, 4 Dec 2018 16:00:29 -0600
Message-ID: <20181204220028.GA22718@bogus>
References: <20181116154927.16152-1-l.stach@pengutronix.de>
 <20181116154927.16152-3-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20181116154927.16152-3-l.stach@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lucas Stach <l.stach@pengutronix.de>
Cc: devicetree@vger.kernel.org, Anson Huang <anson.huang@nxp.com>, patchwork-lst@pengutronix.de, NXP Linux Team <linux-imx@nxp.com>, kernel@pengutronix.de, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Nov 16, 2018 at 04:49:27PM +0100, Lucas Stach wrote:
> The GPCv2 on the Freescale i.MX8MQ SoC works in the same way as the
> GPCv2 on the i.MX7, but only controls more power domains with a
> different mapping.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  .../bindings/power/fsl,imx-gpcv2.txt          |   7 +-

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/soc/imx/Kconfig                       |   6 +-
>  drivers/soc/imx/Makefile                      |   2 +-
>  drivers/soc/imx/gpcv2.c                       | 208 +++++++++++++++++-
>  include/dt-bindings/power/imx8mq-power.h      |  21 ++
>  5 files changed, 237 insertions(+), 7 deletions(-)
>  create mode 100644 include/dt-bindings/power/imx8mq-power.h
