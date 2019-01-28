From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v5 3/3] reset: imx7: Add support for i.MX8MQ IP block
 variant
Date: Mon, 28 Jan 2019 11:55:08 +0100
Message-ID: <1548672908.6421.1.camel@pengutronix.de>
References: <20190122021043.25449-1-andrew.smirnov@gmail.com>
         <20190122021043.25449-4-andrew.smirnov@gmail.com>
         <1548240560.3904.6.camel@pengutronix.de>
         <CAHQ1cqFx3b2fTy8YbpwC0fGJYpO4BLO4FW9q-Z2Np1tVktrKpg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHQ1cqFx3b2fTy8YbpwC0fGJYpO4BLO4FW9q-Z2Np1tVktrKpg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Fabio Estevam <fabio.estevam@nxp.com>, Chris Healy <cphealy@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, Leonard Crestez <leonard.crestez@nxp.com>, "A.s. Dong" <aisheng.dong@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>, Rob Herring <robh@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Andrey,

On Thu, 2019-01-24 at 16:21 -0800, Andrey Smirnov wrote:
> > Thank you, applied all three to reset/next with a small whitespace
> > alignment fix.
> > 
> 
> Thanks again for applying this stuff. If that's not too much to ask,
> would you mind creating an immutable branch, so I could start sending
> patches that depend on "dt-bindings/reset/imx8mq-reset.h" to i.MX tree
> without waiting for it to trickle down? If not, no worries, I'll wait.

Here is an immutable branch containing just the header/dt-binding patch:

  git://git.pengutronix.de/pza/linux reset/imx8mq

regards
Philipp
