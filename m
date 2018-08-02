From: "A.s. Dong" <aisheng.dong@nxp.com>
Subject: RE: [PATCH v8 2/4] dt-bindings: mailbox: imx-mu: add generic MU
 channel support
Date: Thu, 2 Aug 2018 03:37:51 +0000
Message-ID: <AM0PR04MB4211B13F6E19F029AC818E0B802C0@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <20180731141146.10788-1-o.rempel@pengutronix.de>
 <20180731141146.10788-3-o.rempel@pengutronix.de>
 <CABb+yY1ZusgN4UVxmUgXZS9ObGdLwFAL4XkW7F1yVb6Gq=9XPA@mail.gmail.com>
 <AM0PR04MB4211B20B99E087177D0C06D8802D0@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <CABb+yY304PeP_G9NiRW+pkXod+bUnYdKaYxOgH7XjsGEqQ5TVg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CABb+yY304PeP_G9NiRW+pkXod+bUnYdKaYxOgH7XjsGEqQ5TVg@mail.gmail.com>
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
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Devicetree List <devicetree@vger.kernel.org>, Oleksij Rempel <o.rempel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, ",
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 srv_heupstream" <linux-arm-kernel@lists.infradead.org>, ",
 Sascha Hauer" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

> -----Original Message-----
> From: Jassi Brar [mailto:jassisinghbrar@gmail.com]
> Sent: Wednesday, August 1, 2018 5:58 PM
> To: A.s. Dong <aisheng.dong@nxp.com>
> Cc: Oleksij Rempel <o.rempel@pengutronix.de>; Shawn Guo
> <shawnguo@kernel.org>; Fabio Estevam <fabio.estevam@nxp.com>; Rob
> Herring <robh+dt@kernel.org>; Mark Rutland <mark.rutland@arm.com>;
> Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>; , Sascha Hauer
> <kernel@pengutronix.de>; , linux-arm-kernel@lists.infradead.org, linux-
> mediatek@lists.infradead.org, srv_heupstream <linux-arm-
> kernel@lists.infradead.org>; Devicetree List <devicetree@vger.kernel.org>;
> dl-linux-imx <linux-imx@nxp.com>
> Subject: Re: [PATCH v8 2/4] dt-bindings: mailbox: imx-mu: add generic MU
> channel support
> 
> On Wed, Aug 1, 2018 at 2:28 PM, A.s. Dong <aisheng.dong@nxp.com> wrote:
> > Hi Jassi,
> >
> >> > +               The doorbell channels should be used with shared
> >> > + memory and
> >> protocol
> >> > +               level acknowledgment if needed.
> >> > +
> >> I would avoid this. People might get notions that they have to use
> >> shmem with doorbell -- a trivial protocol might mean doing some fixed
> >> action (like
> >> reset) whenever the doorbell rings.
> >>
> >
> > That's right.
> > i.MX8 using the general purpose interrupt for peripherals. No shmem
> needed.
> > e.g. RTC, Watchdog and ON/OFF interrupt.
> >
> > BTW, this means the peripheral will use mailbox doorbell channels to
> > handle Interrupts. Is there such user case in kernel we can refer to?
> >
> I don't find any publicly in kernel.
> It should be simple though. Acquire the RX channel, and populate the
> rx_callback() with the "interrupt" handler.

Got it.
Thanks

Regards
Dong Aisheng
