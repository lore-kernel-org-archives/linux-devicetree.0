From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH v6 0/5] add mailbox support for i.MX7D
Date: Mon, 23 Jul 2018 21:03:21 +0530
Message-ID: <CABb+yY1r=Sg64t3j45XXSJu-_HYx2Uya0WLDHP82stiQ4vnM5A@mail.gmail.com>
References: <20180722063923.30222-1-o.rempel@pengutronix.de>
 <AM0PR04MB4211B82FD69B41B27465F5E580570@AM0PR04MB4211.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <AM0PR04MB4211B82FD69B41B27465F5E580570@AM0PR04MB4211.eurprd04.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "A.s. Dong" <aisheng.dong@nxp.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, Oleksij Rempel <o.rempel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jul 22, 2018 at 4:14 PM, A.s. Dong <aisheng.dong@nxp.com> wrote:
> Hi Oleksij,
>
> Thanks for the work.
>
> Hi Jassi,
> Do you think if we can have your tag and let those patches go through
> Shawn's tree as the later QXP support patches depends on them?
>
Hmm...  I don't find the 5 patches in my mailbox. Are you sure I was CC'ed?

 Dong Aisheng (2):
   dt-bindings: mailbox: allow mbox-cells to be equal to 0
   dt-bindings: arm: fsl: add mu binding doc

 Oleksij Rempel (3):
   dt-bindings: mailbox: imx-mu: add generic MU channel support
   ARM: dts: imx7s: add i.MX7 messaging unit support
   mailbox: Add support for i.MX7D messaging unit
