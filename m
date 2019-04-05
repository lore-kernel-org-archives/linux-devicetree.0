From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] arm64: dts: imx: add Zii Ultra board support
Date: Fri, 5 Apr 2019 11:08:34 -0300
Message-ID: <CAOMZO5CNi_Jd3Cah7poxAt8PuRdP=QT7cfkQUPqS1U9+j7tPMw@mail.gmail.com>
References: <20190403164555.13941-1-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190403164555.13941-1-l.stach@pengutronix.de>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Andrey Smirnov <andrew.smirnov@gmail.com>, Shawn Guo <shawnguo@kernel.org>, patchwork-lst@pengutronix.de, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Chris Healy <cphealy@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Lucas,

On Wed, Apr 3, 2019 at 1:45 PM Lucas Stach <l.stach@pengutronix.de> wrote:
>
> The Zii Ultra design, also known as RDU3, is the i.MX8M based successor
> to the the i.MX6 based RDU2. This adds the basic board support for all
> components which are supported by the upstream kernel at this time.
>
> The board comes in 2 different versions, called RMB3 and Zest, which
> are derived from the same design, but have different layouts and a
> few small differences in the populated components.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

I got the following build error after applying this patch against linux-next:

  DTC     arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb
Error: arch/arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi:438.1-7
Label or path pcie0 not found
Error: arch/arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi:445.1-7
Label or path pcie1 not found
FATAL ERROR: Syntax error parsing input tree

We need Andrey's "[PATCH v4 4/5] arm64: dts: imx8mq: Add nodes for
PCIe IP blocks" applied first.

> +       eeti_touch: eeti_i2c@2a {

touchscreen@2a

Reviewed-by: Fabio Estevam <festevam@gmail.com>

Thanks
