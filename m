From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH V3 09/10] dts: fsl: add imx7ulp evk support
Date: Thu, 1 Nov 2018 07:28:09 -0300
Message-ID: <CAOMZO5AZejEAHeB0hQ9T5U2ZJ7MXK=BYm8jY+yyZjbDHo4utGA@mail.gmail.com>
References: <1540996688-23681-1-git-send-email-aisheng.dong@nxp.com>
 <1540996688-23681-10-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1540996688-23681-10-git-send-email-aisheng.dong@nxp.com>
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

Hi Dong,

On Wed, Oct 31, 2018 at 11:46 AM A.s. Dong <aisheng.dong@nxp.com> wrote:

> +       reg_vsd_3v3: regulator-vsd-3v3 {
> +               compatible = "regulator-fixed";
> +               regulator-name = "VSD_3V3";
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_usdhc0_rst>;
> +               gpio = <&gpio_ptd 0 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;

You model this as a regulator...

> +&usdhc0 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_usdhc0>;
> +       cd-gpios = <&gpio_ptc 10 GPIO_ACTIVE_LOW>;
> +       vmmc-supply = <&reg_vsd_3v3>;

but as this pins controls the reset of the SD port it seems that using
mmc-pwrseq would be more appropriate.

This way you could pass 'reset-gpios' inside the pwrseq node, which
would describe the hardware more accurately.
