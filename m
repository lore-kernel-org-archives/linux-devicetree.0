From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH V6 1/2] dt-bindings: mailbox: add binding doc for the ARM
 SMC/HVC mailbox
Date: Wed, 18 Sep 2019 08:34:41 -0500
Message-ID: <CABb+yY09pPqM-47zNFVGMNM9wrDF9iiVuqKTXrEd4-PdOxBPrQ@mail.gmail.com>
References: <1568626884-5189-1-git-send-email-peng.fan@nxp.com>
 <1568626884-5189-2-git-send-email-peng.fan@nxp.com> <20190917183115.3e40180f@donnerap.cambridge.arm.com>
 <CABb+yY2CP1i9fZMoPua=-mLCUpYrcO28xF5UXDeRD2XTYe7mEg@mail.gmail.com> <AM0PR04MB44811AE46803D10FD8A5B8B0888E0@AM0PR04MB4481.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AM0PR04MB44811AE46803D10FD8A5B8B0888E0@AM0PR04MB4481.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peng Fan <peng.fan@nxp.com>
Cc: Andre Przywara <andre.przywara@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "sudeep.holla@arm.com" <sudeep.holla@arm.com>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 18, 2019 at 3:53 AM Peng Fan <peng.fan@nxp.com> wrote:

> > >
> > > > +
> > > > +  "#mbox-cells":
> > > > +    const: 1
> > >
> > > Why is this "1"? What is this number used for? It used to be the channel ID,
> > but since you are describing a single channel controller only, this should be 0
> > now.
> > >
> > Yes. I overlooked it and actually queued the patch for pull request.
>
> In Documentation/devicetree/bindings/mailbox/mailbox.txt
> #mbox-cells: Must be at least 1.
>
> So I use 1 here, 0 not work. Because of_mbox_index_xlate expect at least 1 here.
> So I need modify Documentation/devicetree/bindings/mailbox/mailbox.txt
> and add xlate for smc mailbox?
>
No, you just can not use the generic xlate() provided by the api.
Please implement your own xlate() that requires no argument.

Cheers!
