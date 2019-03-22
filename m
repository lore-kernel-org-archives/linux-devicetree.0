From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2 1/3] arm64: dts: imx: Add i.mx8mm dtsi support
Date: Fri, 22 Mar 2019 10:13:32 +0800
Message-ID: <20190322021331.GX12513@dragon>
References: <1552369779-7614-1-git-send-email-ping.bai@nxp.com>
 <20190321082253.GD12513@dragon>
 <VI1PR0402MB351954C0C30D3AD28C77A77187430@VI1PR0402MB3519.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <VI1PR0402MB351954C0C30D3AD28C77A77187430@VI1PR0402MB3519.eurprd04.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jacky Bai <ping.bai@nxp.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, Aisheng Dong <aisheng.dong@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 22, 2019 at 01:55:45AM +0000, Jacky Bai wrote:
> > > +			gpc: gpc@303a0000 {
> > 
> > interrupt-controller for node name?
> >
> 
> For the i.MX8MM and future i.MX8M serious, it is not very necessary to use GPC as a interrupt controller
> in linux kernel side. For system suspend, ATF can config the GPC IMRs based on IRQ enable status in GICv3.
> For cpuidle support, GICv3 has per-CPU core wakeup signals connected to the GPC logic, so GICv3 has the ability
> to wake up the corresponding CPU core if the IRQ is routed to that CPU core. Additionally, I am thinking to
> config the GPC as a secure resource in the future.
> 
> Maybe, we can remove the GPC node for now. If necessary, we can add it back again?

Sounds good to me.

Shawn
