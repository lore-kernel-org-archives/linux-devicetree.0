From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 6/7] ARM: dts: imx7ulp: add imx7ulp USBOTG1 support
Date: Wed, 1 May 2019 13:38:09 -0500
Message-ID: <CAL_JsqLPK8kuYTT7ekZbAzywp2kr9xKA0_X3BAqVn5hShbPM+w@mail.gmail.com>
References: <20190428024847.5046-1-peter.chen@nxp.com>
 <20190428024847.5046-7-peter.chen@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190428024847.5046-7-peter.chen@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Peter Chen <peter.chen@nxp.com>
Cc: Aisheng Dong <aisheng.dong@nxp.com>, "balbi@kernel.org" <balbi@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Sat, Apr 27, 2019 at 9:51 PM Peter Chen <peter.chen@nxp.com> wrote:
>
> Add imx7ulp USBOTG1 support.
>
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> ---
>  arch/arm/boot/dts/imx7ulp.dtsi | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/arch/arm/boot/dts/imx7ulp.dtsi b/arch/arm/boot/dts/imx7ulp.dtsi
> index fca6e50f37c8..e2944f98eac6 100644
> --- a/arch/arm/boot/dts/imx7ulp.dtsi
> +++ b/arch/arm/boot/dts/imx7ulp.dtsi
> @@ -30,6 +30,7 @@
>                 serial1 = &lpuart5;
>                 serial2 = &lpuart6;
>                 serial3 = &lpuart7;
> +               usbphy0 = &usbphy1;

Drop this. You shouldn't need an alias.

>         };
>
>         cpus {
> @@ -133,6 +134,35 @@
>                         clock-names = "ipg", "per";
>                 };
>
> +               usbotg1: usb@40330000 {
> +                       compatible = "fsl,imx7ulp-usb", "fsl,imx6ul-usb",
> +                               "fsl,imx27-usb";
> +                       reg = <0x40330000 0x200>;
> +                       interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&pcc2 IMX7ULP_CLK_USB0>;
> +                       fsl,usbphy = <&usbphy1>;

Don't use this for new users. Use the phy binding instead.

> +                       fsl,usbmisc = <&usbmisc1 0>;
> +                       ahb-burst-config = <0x0>;
> +                       tx-burst-size-dword = <0x8>;
> +                       rx-burst-size-dword = <0x8>;
> +                       status = "disabled";
> +               };
> +
> +               usbmisc1: usbmisc@40330200 {
> +                       #index-cells = <1>;
> +                       compatible = "fsl,imx7ulp-usbmisc", "fsl,imx7d-usbmisc",
> +                               "fsl,imx6q-usbmisc";
> +                       reg = <0x40330200 0x200>;
> +               };
> +
> +               usbphy1: usbphy@0x40350000 {
> +                       compatible = "fsl,imx7ulp-usbphy",
> +                               "fsl,imx6ul-usbphy", "fsl,imx23-usbphy";
> +                       reg = <0x40350000 0x1000>;
> +                       interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&pcc2 IMX7ULP_CLK_USB_PHY>;
> +               };
> +
>                 usdhc0: mmc@40370000 {
>                         compatible = "fsl,imx7ulp-usdhc", "fsl,imx6sx-usdhc";
>                         reg = <0x40370000 0x10000>;
> --
> 2.14.1
>
