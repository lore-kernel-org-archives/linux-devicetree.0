From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH v8 2/4] dt-bindings: mailbox: imx-mu: add generic MU
 channel support
Date: Wed, 1 Aug 2018 15:28:02 +0530
Message-ID: <CABb+yY304PeP_G9NiRW+pkXod+bUnYdKaYxOgH7XjsGEqQ5TVg@mail.gmail.com>
References: <20180731141146.10788-1-o.rempel@pengutronix.de>
 <20180731141146.10788-3-o.rempel@pengutronix.de>
 <CABb+yY1ZusgN4UVxmUgXZS9ObGdLwFAL4XkW7F1yVb6Gq=9XPA@mail.gmail.com>
 <AM0PR04MB4211B20B99E087177D0C06D8802D0@AM0PR04MB4211.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <AM0PR04MB4211B20B99E087177D0C06D8802D0@AM0PR04MB4211.eurprd04.prod.outlook.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Devicetree List <devicetree@vger.kernel.org>, Oleksij Rempel <o.rempel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, ",
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 srv_heupstream" <linux-arm-kernel@lists.infradead.org>, ",
 Sascha Hauer" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 1, 2018 at 2:28 PM, A.s. Dong <aisheng.dong@nxp.com> wrote:
> Hi Jassi,
>
>> > +               The doorbell channels should be used with shared memory and
>> protocol
>> > +               level acknowledgment if needed.
>> > +
>> I would avoid this. People might get notions that they have to use shmem
>> with doorbell -- a trivial protocol might mean doing some fixed action (like
>> reset) whenever the doorbell rings.
>>
>
> That's right.
> i.MX8 using the general purpose interrupt for peripherals. No shmem needed.
> e.g. RTC, Watchdog and ON/OFF interrupt.
>
> BTW, this means the peripheral will use mailbox doorbell channels to handle
> Interrupts. Is there such user case in kernel we can refer to?
>
I don't find any publicly in kernel.
It should be simple though. Acquire the RX channel, and populate the
rx_callback() with the "interrupt" handler.
