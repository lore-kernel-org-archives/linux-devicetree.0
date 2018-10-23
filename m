From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH V2 7/8] dts: fsl: add imx7ulp evk support
Date: Tue, 23 Oct 2018 09:28:44 -0300
Message-ID: <CAOMZO5C3Fv+s-bLeHGZ6LEB=ZqRxf=gXuzbtwfNS=PvQeVJ1Ag@mail.gmail.com>
References: <1540295058-26090-1-git-send-email-aisheng.dong@nxp.com>
 <1540295058-26090-8-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1540295058-26090-8-git-send-email-aisheng.dong@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Dong Aisheng <aisheng.dong@nxp.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Dong Aisheng <dongas86@gmail.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 23, 2018 at 8:56 AM A.s. Dong <aisheng.dong@nxp.com> wrote:

> +/ {
> +       model = "NXP i.MX7ULP EVK";
> +       compatible = "fsl,imx7ulp-evk", "fsl,imx7ulp", "Generic DT based system";

This "Generic DT based system" should be removed.

> +       chosen {
> +               stdout-path = &lpuart4;
> +       };
> +
> +       memory@60000000 {

       device_type = "memory";
> +               reg = <0x60000000 0x40000000>;
> +       };

> +&iomuxc1 {
> +       pinctrl_lpuart4: lpuart4grp {
> +               pinmux = <
> +                       IMX7ULP_PAD_PTC3__LPUART4_RX
> +                       IMX7ULP_PAD_PTC2__LPUART4_TX
> +               >;
> +               bias-pull-up;

Please change the mx7ulp pinctrl driver to accept the "old" notation
and change the dts to use:

IMX7ULP_PAD_PTC3__LPUART4_RX 0x3

This way we use the same method for all i.MX devices.
