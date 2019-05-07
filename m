From: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v2] arm64: allwinner: h6: orangepi-one-plus: Add Ethernet support
Date: Tue, 7 May 2019 18:28:16 +0530
Message-ID: <CAMty3ZB0+uAKzoi=LpbE0nty2BHxqwY=0Pm36uiNnjuc5TKCdg@mail.gmail.com>
References: <20190503115928.27662-1-jagan@amarulasolutions.com>
 <20190503144651.ttqfha656dykqjzo@flea> <CAMty3ZCQTiX5OvCG_uMRS02vFu0c1-bkcyauLD6oaFcd=y3RNA@mail.gmail.com>
 <20190507070617.h7loqiqvznqvvprq@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190507070617.h7loqiqvznqvvprq@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Trimarchi <michael@amarulasolutions.com>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-amarula <linux-amarula@amarulasolutions.com>, linux-sunxi <linux-sunxi@googlegroups.com>
List-Id: devicetree@vger.kernel.org

On Tue, May 7, 2019 at 12:36 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> On Mon, May 06, 2019 at 03:03:15PM +0530, Jagan Teki wrote:
> > On Fri, May 3, 2019 at 8:16 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> > >
> > > On Fri, May 03, 2019 at 05:29:28PM +0530, Jagan Teki wrote:
> > > > Add Ethernet support for orangepi-one-plus board,
> > > >
> > > > - Ethernet port connected via RTL8211E PHY
> > > > - PHY suppiled with
> > > >   GMAC-2V5, fixed regulator with GMAC_EN pin via PD6
> > > >   GMAC-3V, which is supplied by VCC3V3-MAC via aldo2
> > > > - RGMII-RESET pin connected via PD14
> > > >
> > > > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > >
> > > Your commit log should be improved. We can get those informations from
> > > the patch itself...
> >
> > Thought it was a clear commit log :)  will update anyway.
>
> Well, yes and no. The commit log is clear indeed, but it doesn't
> provide what it's supposed to provide.
>
> You shouldn't put *what* is being done by the patch. That's pretty
> easy to figure out by reading the patch itself. You have to explain
> why and how you did it, which is lacking in that case.

Make sense, will rework.
