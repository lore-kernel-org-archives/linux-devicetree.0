From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH v7 1/6] dt-bindings: mailbox: allow mbox-cells to be equal
 to 0
Date: Thu, 26 Jul 2018 15:11:39 +0530
Message-ID: <CABb+yY2+WwxHBtQfU3TJTErpfzfkNH8iwwYyXbmWAQy8UsqLRQ@mail.gmail.com>
References: <20180726065331.6186-1-o.rempel@pengutronix.de> <20180726065331.6186-2-o.rempel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180726065331.6186-2-o.rempel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "A.s. Dong" <aisheng.dong@nxp.com>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, Sudeep Holla <sudeep.holla@arm.com>, Devicetree List <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ", Sascha Hauer" <kernel@pengutronix.de>, ", linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, srv_heupstream" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 26, 2018 at 12:23 PM, Oleksij Rempel
<o.rempel@pengutronix.de> wrote:
> From: Dong Aisheng <aisheng.dong@nxp.com>
>
> Mailbox devices may have only one channel which means the mbox-cells
> at least 1 does not make sense for this type devices. Let's remove
> that limitation to allow the mbox-cells to be equal to 0.
>
OK

But please realise that you'll have to write more code -- implement
your own of_xlate() callback.
Most developers would prefer to call the only channel as channel
number 0, and use the common of_xlate implementation.

-jassi
