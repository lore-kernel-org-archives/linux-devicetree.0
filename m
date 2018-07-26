From: "A.s. Dong" <aisheng.dong@nxp.com>
Subject: RE: [PATCH v7 3/6] dt-bindings: mailbox: imx-mu: add generic MU
 channel support
Date: Thu, 26 Jul 2018 13:34:34 +0000
Message-ID: <AM0PR04MB4211928BCBB743EBB93E285D802B0@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <20180726065331.6186-1-o.rempel@pengutronix.de>
 <20180726065331.6186-4-o.rempel@pengutronix.de>
 <CABb+yY0kVFvQRBrU4j9t=_JcSUkcXMMSK5u=XSufM6XcmKiv-g@mail.gmail.com>
 <AM0PR04MB42116C756EC78AD12EB254D6802B0@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <CABb+yY3OdXGair6hdLH_jb54O09y=rhUMfbG1-LSa=pHvDz+sQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CABb+yY3OdXGair6hdLH_jb54O09y=rhUMfbG1-LSa=pHvDz+sQ@mail.gmail.com>
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
> Sent: Thursday, July 26, 2018 8:27 PM
> To: A.s. Dong <aisheng.dong@nxp.com>
> Cc: Oleksij Rempel <o.rempel@pengutronix.de>; Shawn Guo
> <shawnguo@kernel.org>; Fabio Estevam <fabio.estevam@nxp.com>; Rob
> Herring <robh+dt@kernel.org>; Mark Rutland <mark.rutland@arm.com>;
> Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>; , Sascha Hauer
> <kernel@pengutronix.de>; , linux-arm-kernel@lists.infradead.org, linux-
> mediatek@lists.infradead.org, srv_heupstream <linux-arm-
> kernel@lists.infradead.org>; Devicetree List <devicetree@vger.kernel.org>;
> dl-linux-imx <linux-imx@nxp.com>
> Subject: Re: [PATCH v7 3/6] dt-bindings: mailbox: imx-mu: add generic MU
> channel support

[...]

> > And SCU firmware does use MU in above way specified by reference
> manual.
> > Even from HW point of view, it's still one channel only mailbox.
> > That's why we change the mbox-cells to 0 accordingly to avoid
> > confusing the multi channels users supported in this driver.
> >
> > As per Sasha's request, we're going to support both protocol (SCU and
> > generic M4) in one mailbox driver, that means we need deal with this two
> case property.
> >
> > If we use mbox-cells 1 case for SCU, then the using would be like:
> > mboxes = <&mailbox 0> which is mixed with the normal multi channel
> > users. And we also must state clearly in binding doc that for
> > mbox-cells
> >  1 case for SCU, the cell value must be 0 which is also confusing with
> > Multi channel users.
> >
> > How do you suggest for such case?
> >
> Let me read the spec and try to see/shine the light :)

Great, many thanks!

Regards
Dong Aisheng

> 
> Cheers!
