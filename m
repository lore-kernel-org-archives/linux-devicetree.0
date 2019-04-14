From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] ARM: dts: bugfix tqma7 soft reset issue
Date: Sun, 14 Apr 2019 12:32:54 -0300
Message-ID: <CAOMZO5DLiY_Y7xi6c6G=PsBJMdCf5jSxE12qz7Qt8bYoxhxoTQ@mail.gmail.com>
References: <20190414120629.8912-1-bruno.thomsen@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190414120629.8912-1-bruno.thomsen@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bruno Thomsen <bruno.thomsen@gmail.com>
Cc: Markus Niebel <markus.niebel@tq-group.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, laa@kamstrup.com, Sascha Hauer <s.hauer@pengutronix.de>, clemens.ml@gmx.net, ksc@kamstrup.com, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Bruno,

On Sun, Apr 14, 2019 at 9:06 AM Bruno Thomsen <bruno.thomsen@gmail.com> wrote:

>  &wdog1 {
> +       /*
> +        * Errata e10574:
> +        * WDOG reset needs to run with WDOG_RESET_B signal enabled.
> +        * X1-51 (WDOG1#) signal needs carrier board handling to reset
> +        * TQMa7 on X1-22 (RESET_IN#).
> +        */
> +       fsl,ext-reset-output;
>         status = "okay";

You should also add a pinctrl entry for the watchdog pin.

Please check arch/arm/boot/dts/imx7s-warp.dts for an example.
