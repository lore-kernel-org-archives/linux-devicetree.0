From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2] ARM: dts: imx6sx: fix irq for pcie bridge
Date: Tue, 19 Jun 2018 14:43:34 +0800
Message-ID: <20180619064333.GE16091@dragon>
References: <20180615074129.16931-1-o.rempel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180615074129.16931-1-o.rempel@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, kernel@pengutronix.de, Fabio Estevam <fabio.estevam@nxp.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 15, 2018 at 09:41:29AM +0200, Oleksij Rempel wrote:
> Use the correct IRQ line for the MSI controller in the PCIe host
> controller. Apparently a different IRQ line is used compared to other
> i.MX6 variants. Without this change MSI IRQs aren't properly propagated
> to the upstream interrupt controller.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

Added the following Fixes tag and applied as a fix.

 Fixes: b1d17f68e5c5 ("ARM: dts: imx: add initial imx6sx device tree source")

Shawn
