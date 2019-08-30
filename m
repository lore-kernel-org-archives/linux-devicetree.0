From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: mailbox: add binding doc for the ARM
 SMC/HVC mailbox
Date: Fri, 30 Aug 2019 11:51:59 -0500
Message-ID: <CABb+yY1cpGVHvHz4MCwpmVXSYayWt3HWMLJKZTrCb_LXroBc_Q@mail.gmail.com>
References: <1567004515-3567-1-git-send-email-peng.fan@nxp.com>
 <1567004515-3567-2-git-send-email-peng.fan@nxp.com> <CABb+yY2tRjazjaogpM7irqgTD+PdwsfqCxk5hP-_czrET3V5xQ@mail.gmail.com>
 <AM0PR04MB4481785CABB44A8C71CFB8D788BD0@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <CABb+yY2TREpO7+TFcGgsgQrkmMWwFAgtuJ4GnLPPQ+GEBuh07w@mail.gmail.com>
 <AM0PR04MB448161C632722DF10989008088BD0@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <CABb+yY2SrMF8e1iLyLqb-rJyBx4ajA0hZ6D=LFtuMNtXYjgccA@mail.gmail.com> <20190830093224.GB31297@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190830093224.GB31297@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Peng Fan <peng.fan@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "andre.przywara@arm.com" <andre.przywara@arm.com>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 30, 2019 at 4:32 AM Sudeep Holla <sudeep.holla@arm.com> wrote:
>
> On Fri, Aug 30, 2019 at 02:52:40AM -0500, Jassi Brar wrote:
> > On Fri, Aug 30, 2019 at 2:37 AM Peng Fan <peng.fan@nxp.com> wrote:
>
> [...]
>
> > >
> > > If I get your point correctly,
> > > On UP, both could not be active. On SMP, tx/rx could be both active, anyway
> > > this depends on secure firmware and Linux firmware design.
> > >
> > > Do you have any suggestions about arm,func-ids here?
> > >
> > I was thinking if this is just an instruction, why can't each channel
> > be represented as a controller, i.e, have exactly one func-id per
> > controller node. Define as many controllers as you need channels ?
> >
>
> I might have missed to follow this, but what's the advantage of doing so ?
> Which can't single controller instance deal with all the channels ?
>
There are many advantages ...
1) Design reflects the reality - two smc/hvc instructions have nothing
tying them together.
2) Driver code becomes simpler - don't have to pre-populate channels,
deducting from the size of func-ids array.
3) Driver becomes more flexible - We can have channels that pass
func-id runtime and channels that pass via DT (if we must have the
option of DT property).

-jassi
