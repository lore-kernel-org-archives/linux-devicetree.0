From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: mailbox: add binding doc for the ARM
 SMC/HVC mailbox
Date: Fri, 30 Aug 2019 10:32:24 +0100
Message-ID: <20190830093224.GB31297@bogus>
References: <1567004515-3567-1-git-send-email-peng.fan@nxp.com>
 <1567004515-3567-2-git-send-email-peng.fan@nxp.com>
 <CABb+yY2tRjazjaogpM7irqgTD+PdwsfqCxk5hP-_czrET3V5xQ@mail.gmail.com>
 <AM0PR04MB4481785CABB44A8C71CFB8D788BD0@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <CABb+yY2TREpO7+TFcGgsgQrkmMWwFAgtuJ4GnLPPQ+GEBuh07w@mail.gmail.com>
 <AM0PR04MB448161C632722DF10989008088BD0@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <CABb+yY2SrMF8e1iLyLqb-rJyBx4ajA0hZ6D=LFtuMNtXYjgccA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CABb+yY2SrMF8e1iLyLqb-rJyBx4ajA0hZ6D=LFtuMNtXYjgccA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Peng Fan <peng.fan@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "andre.przywara@arm.com" <andre.przywara@arm.com>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>, Sudeep Holla <sudeep.holla@arm.com>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 30, 2019 at 02:52:40AM -0500, Jassi Brar wrote:
> On Fri, Aug 30, 2019 at 2:37 AM Peng Fan <peng.fan@nxp.com> wrote:

[...]

> >
> > If I get your point correctly,
> > On UP, both could not be active. On SMP, tx/rx could be both active, anyway
> > this depends on secure firmware and Linux firmware design.
> >
> > Do you have any suggestions about arm,func-ids here?
> >
> I was thinking if this is just an instruction, why can't each channel
> be represented as a controller, i.e, have exactly one func-id per
> controller node. Define as many controllers as you need channels ?
>

I might have missed to follow this, but what's the advantage of doing so ?
Which can't single controller instance deal with all the channels ?

--
Regards,
Sudeep
