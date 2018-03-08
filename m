From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v4 2/2] ARM: dts: imx: Add basic dts support for imx6sll
 EVK board
Date: Thu, 8 Mar 2018 12:35:52 -0300
Message-ID: <CAOMZO5AgPAgUZfd3NWa5QvyF3DcmeB06pms16aZ34sk6894TWw@mail.gmail.com>
References: <1520503424-22985-1-git-send-email-ping.bai@nxp.com>
 <1520503424-22985-2-git-send-email-ping.bai@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1520503424-22985-2-git-send-email-ping.bai@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bai Ping <ping.bai@nxp.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Jacky Bai <jacky.baip@gmail.com>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 8, 2018 at 7:03 AM, Bai Ping <ping.bai@nxp.com> wrote:

> +&iomuxc {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_hog0>, <&pinctrl_hog1>;
> +
> +       pinctrl_hog0: hog0grp {
> +               pinmux = <
> +                       MX6SLL_PAD_KEY_ROW7__GPIO4_IO07
> +                       MX6SLL_PAD_GPIO4_IO22__GPIO4_IO22
> +                       MX6SLL_PAD_KEY_COL3__GPIO3_IO30
> +                       MX6SLL_PAD_KEY_COL4__GPIO4_IO00
> +                       MX6SLL_PAD_KEY_COL5__GPIO4_IO02
> +               >;
> +               slew-rate = <0x1>;
> +               drive-strength = <0x3>;
> +               fsl,pin-speed = <0x1>;
> +               bias-pull-up = <0x1>;
> +               input-schmitt-enable;
> +       };

Please use the old style for pinctrl.
