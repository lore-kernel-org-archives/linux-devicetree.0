From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE: [PATCH V2 0/2] clk: imx: scu: add parsing clocks from device tree
 support
Date: Fri, 3 May 2019 00:52:17 +0000
Message-ID: <AM0PR04MB4211508CC25111598527757A80350@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1556645270-20648-1-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1556645270-20648-1-git-send-email-aisheng.dong@nxp.com>
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
To: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "sboyd@kernel.org" <sboyd@kernel.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

Do you have a chance to help look at this?

Regards
Dong Aisheng

> From: Aisheng Dong
> Sent: Wednesday, May 1, 2019 1:35 AM
> 
> This is a follow up of the patch thread.
> https://www.spinics.net/lists/devicetree/msg283675.html
> 
> This patch series is a preparation for the MX8 Architecture improvement.
> As for IMX SCU based platforms like MX8QM and MX8QXP, they are comprised
> of a couple of SS(Subsystems) while most of them within the same SS can be
> shared. e.g. Clocks, Devices and etc.
> 
> However, current device tree is heavily depends on Clocks IDs defined which
> cause some troubles in writing the common <soc>-ss-xx.dtsi file.
> 
> This patch series adds a new binding to support parsing clocks from device tree
> which can fully decouple the dependency of Clock IDs in device tree and make
> us be able to write a fully generic clock driver for SCU based SoCs.
> And it can make the driver much easily to be maintained in the future and
> avoid writing a lot of duplicated codes.
> 
> ChangeLog:
> v1->v2:
>  * SCU clock changed to one cell clock binding inspired by arm,scpi.txt
>    Documentation/devicetree/bindings/arm/arm,scpi.txt
>  * Add required power domain property
>  * Dropped PATCH 3&4 first, will send the updated version accordingly
>    after the binding is finally determined,
> 
> Dong Aisheng (2):
>   dt-bindings: firmware: imx-scu: new binding to parse clocks from
>     device tree
>   dt-bindings: clock: imx-lpcg: add support to parse clocks from device
>     tree
> 
>  .../devicetree/bindings/arm/freescale/fsl,scu.txt  | 45
> ++++++++++++++++++----
>  .../devicetree/bindings/clock/imx8qxp-lpcg.txt     | 34 +++++++++++++---
>  include/dt-bindings/firmware/imx/rsrc.h            | 17 ++++++++
>  3 files changed, 82 insertions(+), 14 deletions(-)
> 
> --
> 2.7.4
