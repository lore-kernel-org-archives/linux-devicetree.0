From: Rob Herring <robh@kernel.org>
Subject: Re: [v4 4/6] dt-bindings: phy: Document the Synopsys MIPI DPHY Rx bindings
Date: Wed, 10 Jul 2019 07:50:30 -0600
Message-ID: <CAL_JsqJVfcrQBOgMK_iNYOZpEMfWcjS=_j++LPyu7bnLinMpfw@mail.gmail.com>
References: <1560280855-18085-1-git-send-email-luis.oliveira@synopsys.com>
 <1560280855-18085-5-git-send-email-luis.oliveira@synopsys.com>
 <20190709142000.GA995@bogus> <MN2PR12MB371024C55C5B48A91EECE7A0CBF10@MN2PR12MB3710.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <MN2PR12MB371024C55C5B48A91EECE7A0CBF10@MN2PR12MB3710.namprd12.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Luis de Oliveira <Luis.Oliveira@synopsys.com>
Cc: "mchehab@kernel.org" <mchehab@kernel.org>, "davem@davemloft.net" <davem@davemloft.net>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "Jonathan.Cameron@huawei.com" <Jonathan.Cameron@huawei.com>, "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>, "paulmck@linux.ibm.com" <paulmck@linux.ibm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "kishon@ti.com" <kishon@ti.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Joao.Pinto@synopsys.com" <Joao.Pinto@synopsys.com>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 9, 2019 at 10:29 AM Luis de Oliveira
<Luis.Oliveira@synopsys.com> wrote:
>
> From: Rob Herring <robh@kernel.org>
> Date: Tue, Jul 09, 2019 at 15:20:00
>
> > On Tue, Jun 11, 2019 at 09:20:53PM +0200, Luis Oliveira wrote:
> > > Add device-tree bindings documentation for SNPS DesignWare MIPI D-PHY in
> > > RX mode.
> > >
> > > Signed-off-by: Luis Oliveira <luis.oliveira@synopsys.com>
> > > ---
> > > Changelog
> > > v3-v4
> > > - @Laurent I know I told you I could remove the snps,dphy-frequency on V3 but
> > >   it is really useful for me here. I removed all other the proprietary
> > >   properties except this one. Do you still think it must be removed?
> > > - Frequency units @Rob
> >
> > Frequency units means append '-khz' to the property name. That also
> > makes the 'frequency' part redundant, so maybe name it more around what
> > the frequency is. The frequency for what?
> >
> > Rob
> >
>
> This is the D-PHY high speed frequency configuration that corresponds to
> the high speed data transfer of the bus.
> Basically is the transmission speed per lane.
> Do you think I can use "link-frequencies" (present in
> video-interfaces.txt) with one frequency?

Seems reasonable.

Rob
