From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 4/4] ARM: dts: imx7d: sbc imx7: add uart5
Date: Mon, 10 Dec 2018 09:43:12 -0200
Message-ID: <CAOMZO5At5oSv0MCpsuYj4nEd26Y4h9hj-shadq3477fNz8A+HA@mail.gmail.com>
References: <20181204110741.6943-1-hohatzel@jusst.de>
 <20181204110741.6943-5-hohatzel@jusst.de>
 <20181206031520.GE3987@dragon> <58a84012-73b8-1679-0c5b-981fd2a0acd6@jusst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <58a84012-73b8-1679-0c5b-981fd2a0acd6@jusst.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: hohatzel@jusst.de
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, jscheel@jusst.de, NXP Linux Team <linux-imx@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Hans,

On Mon, Dec 10, 2018 at 8:52 AM Hans Ole Hatzel <hohatzel@jusst.de> wrote:

> imx7d-pico.dts does this the same way. Is that good enough of a reason?
> If so, should it be included in the commit message?

The UART clock parent initialization has been removed from the imx7d
clock driver since commit (in linux-next):

commit ea662d2f804ad13c3c92c75c7dc1abad30e31c31
Author: Anson Huang <anson.huang@nxp.com>
Date:   Fri Oct 19 01:05:36 2018 +0000

    clk: imx7d: remove UART1 clock setting

    There are clock assignments in all i.MX7D dtb files for UART1,
    below is the example in imx7d-sdb.dts, so setting UART1 clock
    in clock driver is NOT necessary, actually, module clocks setting
    should be done in module driver.

    &uart1 {
        pinctrl-names = "default";
        pinctrl-0 = <&pinctrl_uart1>;
        assigned-clocks = <&clks IMX7D_UART1_ROOT_SRC>;
        assigned-clock-parents = <&clks IMX7D_PLL_SYS_MAIN_240M_CLK>;
        status = "okay";
    };

    Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
    Signed-off-by: Stephen Boyd <sboyd@kernel.org>

So the UART clock parent should be set in the device tree.
