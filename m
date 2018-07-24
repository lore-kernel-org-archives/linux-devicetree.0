From: "A.s. Dong" <aisheng.dong@nxp.com>
Subject: RE: [PATCH v6 0/5] add mailbox support for i.MX7D
Date: Tue, 24 Jul 2018 02:18:08 +0000
Message-ID: <AM0PR04MB4211369B01049E4D1E365E2180550@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <20180722063923.30222-1-o.rempel@pengutronix.de>
 <AM0PR04MB4211B82FD69B41B27465F5E580570@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <CABb+yY1r=Sg64t3j45XXSJu-_HYx2Uya0WLDHP82stiQ4vnM5A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CABb+yY1r=Sg64t3j45XXSJu-_HYx2Uya0WLDHP82stiQ4vnM5A@mail.gmail.com>
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
To: Jassi Brar <jassisinghbrar@gmail.com>, Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, Rob Herring <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

> -----Original Message-----
> From: Jassi Brar [mailto:jassisinghbrar@gmail.com]
> Sent: Monday, July 23, 2018 11:33 PM
> To: A.s. Dong <aisheng.dong@nxp.com>
> Cc: Oleksij Rempel <o.rempel@pengutronix.de>; kernel@pengutronix.de;
> linux-arm-kernel@lists.infradead.org; devicetree@vger.kernel.org; dl-linux-
> imx <linux-imx@nxp.com>; Shawn Guo <shawnguo@kernel.org>; Fabio
> Estevam <fabio.estevam@nxp.com>; Rob Herring <robh+dt@kernel.org>;
> Mark Rutland <mark.rutland@arm.com>; Vladimir Zapolskiy
> <vladimir_zapolskiy@mentor.com>
> Subject: Re: [PATCH v6 0/5] add mailbox support for i.MX7D
> 
> On Sun, Jul 22, 2018 at 4:14 PM, A.s. Dong <aisheng.dong@nxp.com> wrote:
> > Hi Oleksij,
> >
> > Thanks for the work.
> >
> > Hi Jassi,
> > Do you think if we can have your tag and let those patches go through
> > Shawn's tree as the later QXP support patches depends on them?
> >
> Hmm...  I don't find the 5 patches in my mailbox. Are you sure I was CC'ed?

I guess you are missed to be CC'ed.

Oleksij,
As there're some new review comments and may need a small change,
please do not miss to CC Jassi (Mailbox Maintainer) in the next version
of your patch series.

Regards
Dong Aisheng

> 
>  Dong Aisheng (2):
>    dt-bindings: mailbox: allow mbox-cells to be equal to 0
>    dt-bindings: arm: fsl: add mu binding doc
> 
>  Oleksij Rempel (3):
>    dt-bindings: mailbox: imx-mu: add generic MU channel support
>    ARM: dts: imx7s: add i.MX7 messaging unit support
>    mailbox: Add support for i.MX7D messaging unit
