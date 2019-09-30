From: Rob Herring <robh@kernel.org>
Subject: Re: [EXT] Re: [PATCH] devicetree: property-units: Add kohms unit
Date: Mon, 30 Sep 2019 17:48:38 -0500
Message-ID: <20190930224838.GA27522@bogus>
References: <20190917075850.40039-1-biwen.li@nxp.com>
 <CAMuHMdUWue6-51Za7vejk=QkhV80iBXdc1E+6aTmQsvpB5AP-A@mail.gmail.com>
 <DB7PR04MB4490DD5F5A87EB796DE2A7A28F8F0@DB7PR04MB4490.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <DB7PR04MB4490DD5F5A87EB796DE2A7A28F8F0@DB7PR04MB4490.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Biwen Li <biwen.li@nxp.com>
Cc: 'Geert Uytterhoeven' <geert@linux-m68k.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 17, 2019 at 08:25:55AM +0000, Biwen Li wrote:
> > 
> > Caution: EXT Email
> > 
> > Hi Biwen,
> > 
> > On Tue, Sep 17, 2019 at 10:09 AM Biwen Li <biwen.li@nxp.com> wrote:
> > > The patch adds kohms unit
> > >
> > > Signed-off-by: Biwen Li <biwen.li@nxp.com>
> > 
> > Thanks for your patch!
> > 
> > > --- a/Documentation/devicetree/bindings/property-units.txt
> > > +++ b/Documentation/devicetree/bindings/property-units.txt
> > > @@ -27,6 +27,7 @@ Electricity
> > >  -microamp      : microampere
> > >  -microamp-hours : microampere hour
> > >  -ohms          : ohm
> > > +-kohms         : kiloohm
> > >  -micro-ohms    : microohm
> > >  -microwatt-hours: microwatt hour
> > >  -microvolt     : microvolt
> > 
> > What's your rationale for adding "kohms"?
> > Do you need to specify resistance values that do not fit in 32-bit, and thus
> 32-bit is enough, I have three values, 60 kohm, 100 kohm and 500 kohm
> > cannot be specified using "ohms"?
> If replace with ohms, the value is as follows:
> 60000 ohm, 100000 ohm, 500000 ohm.
> It's so long for everyone.

It's not any longer, it's still 32-bits.

Please stick with '-ohms'.

Rob
