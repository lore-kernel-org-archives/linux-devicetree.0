From: =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <michal.vokac@ysoft.com>
Subject: [RFC] Configure i.MX6 RGMII pad group control registers from device
 tree
Date: Mon, 11 Jun 2018 14:36:22 +0200
Message-ID: <f5a01de5-fc81-52c1-c2ea-edb77ecff076@ysoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
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
To: linux-arm-kernel@lists.infradead.org
Cc: Fabio Estevam <fabio.estevam@nxp.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>
List-Id: devicetree@vger.kernel.org

Ahoj,

To configure individual pad's characteristics on i.MX6 SoC a
fsl,pins = <PIN_FUNC_ID CONFIG> property can be used. Is there any convenient
way to configure the pad group control registers?

The issue is that some bits (DDR_SEL and ODT) in the individual RGMII pad
control registers are read-only. To tweak those parameters (signal voltage and
termination resistors) one need to write to the pad group control registers for
the whole RGMII pad group. Namely IOMUXC_SW_PAD_CTL_GRP_DDR_TYPE_RGMII and
IOMUXC_SW_PAD_CTL_GRP_RGMII_TERM. The group registers in general are not
accessible from the list in arch/arm/boot/dts/imx6dl-pinfunc.h.

I could not find any other way to change the group registers than hacking-in
some lines into the imx6q_init_machine(void) function in
arch/arm/mach-imx/mach-imx6q.c source. As I work towards upstreaming my board
this should be done from my device tree or solved in some universal way.

Any hints will be much appreciated.
Michal
