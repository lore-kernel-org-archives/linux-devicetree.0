From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: mailbox: add binding doc for the ARM
 SMC/HVC mailbox
Date: Fri, 30 Aug 2019 10:30:05 +0100
Message-ID: <20190830093005.GA31297@bogus>
References: <1567004515-3567-1-git-send-email-peng.fan@nxp.com>
 <1567004515-3567-2-git-send-email-peng.fan@nxp.com>
 <CABb+yY2tRjazjaogpM7irqgTD+PdwsfqCxk5hP-_czrET3V5xQ@mail.gmail.com>
 <AM0PR04MB4481785CABB44A8C71CFB8D788BD0@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <CABb+yY2TREpO7+TFcGgsgQrkmMWwFAgtuJ4GnLPPQ+GEBuh07w@mail.gmail.com>
 <AM0PR04MB448161C632722DF10989008088BD0@AM0PR04MB4481.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <AM0PR04MB448161C632722DF10989008088BD0@AM0PR04MB4481.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peng Fan <peng.fan@nxp.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "andre.przywara@arm.com" <andre.przywara@arm.com>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>, Sudeep Holla <sudeep.holla@arm.com>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 30, 2019 at 07:37:41AM +0000, Peng Fan wrote:
> Hi Jassi,
> > > I think there could be channel for TEE, and channel for Linux.
> > > For virtualization case, there could be dedicated channel for each VM.
> > >
> > I am talking from Linux pov. Functions 0xfe and 0xff above, can't both be
> > active at the same time, right?
>
> If I get your point correctly,
> On UP, both could not be active. On SMP, tx/rx could be both active, anyway
> this depends on secure firmware and Linux firmware design.
>

Just to confirm, we can't have SMC/HVC based Rx channel as there's no
*architectural* way to achieve it. So it can be based on some interrupt
from secure side and hence will be a *different* type of channel/controller.

Sorry to make this point repeatedly, but juts to be absolutely clear:
as it stands, SMC/HVC can be used only for Tx today.

--
Regards,
Sudeep
