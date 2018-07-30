From: "A.s. Dong" <aisheng.dong@nxp.com>
Subject: RE: [PATCH v7 3/6] dt-bindings: mailbox: imx-mu: add generic MU
 channel support
Date: Mon, 30 Jul 2018 08:42:43 +0000
Message-ID: <AM0PR04MB421141B2B51449EC39504941802F0@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <20180726065331.6186-1-o.rempel@pengutronix.de>
 <20180726065331.6186-4-o.rempel@pengutronix.de>
 <CABb+yY0kVFvQRBrU4j9t=_JcSUkcXMMSK5u=XSufM6XcmKiv-g@mail.gmail.com>
 <AM0PR04MB42116C756EC78AD12EB254D6802B0@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <CABb+yY0yn9os6nqH8eUfAr3Q3ev4=TfpTp=5ZDBR7FN67eb-wg@mail.gmail.com>
 <VI1PR04MB4222672B8F7B6AF2B11A4442802A0@VI1PR04MB4222.eurprd04.prod.outlook.com>
 <CABb+yY1EkHk85H72xYoYA3JbQL03+-o3UcRVdA_Zub-Q+D=OHw@mail.gmail.com>
 <VI1PR04MB422216469EE5F3ED8E53A4F1802A0@VI1PR04MB4222.eurprd04.prod.outlook.com>
 <CABb+yY0SfdFr8TMOMosTVb5+LFWqB8nQkKj3ze8usi-s7Cko4g@mail.gmail.com>
 <VI1PR04MB4222B4877B341C0FA07A6A8D802A0@VI1PR04MB4222.eurprd04.prod.outlook.com>
 <CABb+yY1MSSQKZ6BOQXC-x=qy4VZ5HqDBjmh_BJTXSkAm3+P8mA@mail.gmail.com>
 <bf7aca98-7ec8-bcf3-b1a8-d86a7cf28d31@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <bf7aca98-7ec8-bcf3-b1a8-d86a7cf28d31@pengutronix.de>
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
To: Oleksij Rempel <o.rempel@pengutronix.de>, Jassi Brar <jassisinghbrar@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Devicetree List <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "\", linux-arm-kernel\"@lists.infradead.org" <",
 linux-arm-kernel"@lists.infradead.org>, srv_heupstream <linux-arm-kernel@lists.infradead.org>, ",
 Sascha Hauer" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, Shawn Guo <shawnguo@kernel.org>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Hi Oleksij,

> -----Original Message-----
> From: Oleksij Rempel [mailto:o.rempel@pengutronix.de]
> Sent: Monday, July 30, 2018 3:36 PM
> To: Jassi Brar <jassisinghbrar@gmail.com>; A.s. Dong
> <aisheng.dong@nxp.com>
> Cc: , Sascha Hauer <kernel@pengutronix.de>; Shawn Guo
> <shawnguo@kernel.org>; Fabio Estevam <fabio.estevam@nxp.com>; Rob
> Herring <robh+dt@kernel.org>; Mark Rutland <mark.rutland@arm.com>;
> Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>; ", linux-arm-
> kernel"@lists.infradead.org; linux-mediatek@lists.infradead.org;
> srv_heupstream <linux-arm-kernel@lists.infradead.org>; Devicetree List
> <devicetree@vger.kernel.org>; dl-linux-imx <linux-imx@nxp.com>
> Subject: Re: [PATCH v7 3/6] dt-bindings: mailbox: imx-mu: add generic MU
> channel support
> 
> Hi Aishen, Jassie,
> 
> i'm lost in this discussion. Please, as soon as I need to add some changes to
> my patches, notify me. Preferably on top for email.
> 

I just send you an email of Jassie's early suggestion.

According to the suggestion, the binding needs to be changed into 8 separate
TX/RX channels. You can quickly start from there.

Regards
Dong Aisheng
