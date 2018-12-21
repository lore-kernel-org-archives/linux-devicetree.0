From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: imx8mq: add GPC power domains
Date: Fri, 21 Dec 2018 09:20:56 -0200
Message-ID: <CAOMZO5Ac0_1QgOUOaVsEUwwZpMUROs-rQPKfasQGCk=MaApWmg@mail.gmail.com>
References: <20181214105510.1174-1-l.stach@pengutronix.de>
 <20181214105510.1174-2-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181214105510.1174-2-l.stach@pengutronix.de>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, patchwork-lst@pengutronix.de, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Lucas,

On Fri, Dec 14, 2018 at 8:56 AM Lucas Stach <l.stach@pengutronix.de> wrote:

> +                                       pgc_pcie2: pgc-power-domain@10 {
> +                                               #power-domain-cells = <0>;
> +                                               reg = <IMX8M_POWER_DOMAIN_PCIE2>;

The address after the @ is in hex, so this one should be @a.
