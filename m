From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH v7 3/6] dt-bindings: mailbox: imx-mu: add generic MU
 channel support
Date: Thu, 26 Jul 2018 16:58:27 +0530
Message-ID: <CABb+yY2sU322YVWLee+Bg8ytd6AA78aLJLWki+pg5PP1Hq8sWg@mail.gmail.com>
References: <20180726065331.6186-1-o.rempel@pengutronix.de>
 <20180726065331.6186-4-o.rempel@pengutronix.de>
 <CABb+yY0kVFvQRBrU4j9t=_JcSUkcXMMSK5u=XSufM6XcmKiv-g@mail.gmail.com>
 <ddd25683-d7a6-e900-461f-9bbac3100579@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <ddd25683-d7a6-e900-461f-9bbac3100579@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, "A.s. Dong" <aisheng.dong@nxp.com>, Devicetree List <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, ", linux-arm-kernel"@lists.infradead.org, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, ",
 Sascha Hauer" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, ", linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 srv_heupstream" <linux-mediatek@lists.infradead.org>, Shawn Guo <shawnguo@kernel.org>srv_heupstream <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 26, 2018 at 4:27 PM, Oleksij Rempel <o.rempel@pengutronix.de> wrote:
>
>
> On 26.07.2018 11:49, Jassi Brar wrote:
>> On Thu, Jul 26, 2018 at 12:23 PM, Oleksij Rempel
>> <o.rempel@pengutronix.de> wrote:
>>
>>> Each MU has four pairs of rx/tx data register with four rx/tx interrupts
>>> which can also be used as a separate channel.
>>>
>> So the hardware actually supports 4 channels.
>>
>>> -- #mbox-cells:  Must be 0. Number of cells in a mailbox
>>> +- #mbox-cells:  Must be:
>>> +               0 - for single channel mode. i.MX8* SCU protocol specific.
>>> +               1 - for multichannel (generic) mode.
>>> +
>> No, please.
>> DT bindings should reflect the real hardware, and not the software
>> mode we want the driver to work in.
>> Please define mbox-cells=1  and have the i.MX8* platform always ask
>> for channel-0.
>
> We spend already some week to publicly talk about this..
>
You should have kept me in the loop.
I know, I am not that important, but for the sake of the protocol you
should have CC'ed the mailbox maintainer :)

> The problem is, imx8 has multiple MUs
>
You mean multiple instances of the MU. Some have 4 channels, some 1.
Is that correct?

>, only some of them communicate
> directly with SCU.
>
OK

> SCU has some well defined protocol and
> MU should be used and configured in some SCU specific way. From NXP
> perspective, SCU firmware should not be replaceable and from Linux side
> seen as part of the HW.
>
Sure. But the behaviour (protocol) should be implemented in the client
driver, not the controller driver.
