From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: Add ZII support for ZII i.MX7 RMU2 board
Date: Sun, 16 Jun 2019 20:30:56 -0300
Message-ID: <CAOMZO5Dpu_HLNWfCzx=hJTwbEJoGnY2KsXQM2JTqv34anfzGag@mail.gmail.com>
References: <20190614080317.16850-1-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190614080317.16850-1-andrew.smirnov@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh@kernel.org>, Liang Pan <Liang.Pan@zii.aero>, linux-kernel <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Chris Healy <cphealy@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Bob Langer <Bob.Langer@zii.aero>, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

Hi Andrey,

On Fri, Jun 14, 2019 at 5:03 AM Andrey Smirnov <andrew.smirnov@gmail.com> wrote:

> +       mdio {
> +               fec1_phy: phy@0 {
> +                       pinctrl-names = "default";
> +                       pinctrl-0 = <&pinctrl_enet1_phy_reset>,
> +                                   <&pinctrl_enet1_phy_interrupt>;
> +                       reg = <0>;
> +                       interrupt-parent = <&gpio1>;
> +                       interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
> +                       reset-gpio = <&gpio5 11 GPIO_ACTIVE_LOW>;

According to Documentation/devicetree/bindings/net/mdio.txt this
should be reset-gpios instead.
