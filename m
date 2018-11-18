From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 2/7] dt-bindings: net: phy: add bindings for the IC Plus
 Corp. IP101A/G PHYs
Date: Sun, 18 Nov 2018 18:29:21 +0100
Message-ID: <CAFBinCCHp_gqmh4zXQLb2FDJrgzBEqoFZ+BrcWH0UcoOrwN+3A@mail.gmail.com>
References: <20181117182007.14791-1-martin.blumenstingl@googlemail.com>
 <20181117182007.14791-3-martin.blumenstingl@googlemail.com> <20181118170331.GB5591@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181118170331.GB5591@lunn.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: andrew@lunn.ch
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, f.fainelli@gmail.com, mark.rutland@arm.com, robh+dt@kernel.org, davem@davemloft.net, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Andrew,

On Sun, Nov 18, 2018 at 6:03 PM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Sat, Nov 17, 2018 at 07:20:02PM +0100, Martin Blumenstingl wrote:
> > The IP101A and IP101G series both have various models. Depending on the
> > board implementation we need a special property for the IP101GR (32-pin
> > LQFP package) PHY:
> > pin 21 ("RXER/INTR_32") outputs the "receive error" signal by default
> > (LOW means "normal operation", HIGH means that there's either a decoding
> > error of the received signal or that the PHY is receiving LPI). This pin
> > can also be switched to INTR32 mode, where the interrupt signal is
> > routed to this pin. The other PHYs don't need this special handling
> > because they have more pins available so the interrupt function gets a
> > dedicated pin.
> >
> > This adds two properties to either select the "receive error" or
> > "interrupt" function of pin 21. Not specifying any function means that
> > the default set by the bootloader is used. This is required because the
> > IP101GR cannot be differentiated between other IP101 PHYs as the PHY
> > identification registers on all of these is 0x02430c54.
>
> Hi Martin
>
> Not being able to identify the device is a real problem here.
indeed, even some extra "custom version" register would have helped

> I did wonder about adding a property which tells you if this is the R
> variant, but the binding you suggests seems equally good.
I decided against that because I *believe* (I have no evidence though)
that the IP101G could have the same problem in theory.
according to the datasheet I have the IP101G is a "Dice" (which I'm
interpreting as "raw die, no package")
<some company> could make a multi-chip package with the IP101G and
only route the RXER/INTR_32 to the outside
due to lack of evidence I decided not to document this in the
dt-bindings themselves, but if you want I can add this theory to the
patch description

apart from that: thank you for reviewing this series!


Regards
Martin
