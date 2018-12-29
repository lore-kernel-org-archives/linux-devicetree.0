From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Subject: Re: [PATCH v4] dt-bindings: net: dsa: ksz9477: add sample of switch
 bindings managed in i2c mode
Date: Sat, 29 Dec 2018 08:26:56 +0100
Message-ID: <CAMhs-H-=Www=A5GMqknboxDH-xYrDJvyX--=yRZ3qaQtkTBdLA@mail.gmail.com>
References: <20181219194626.25732-1-sergio.paracuellos@gmail.com>
 <20181229000337.GA23263@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20181229000337.GA23263@bogus>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Rob Herring <robh@kernel.org>
Cc: Woojung.Huh@microchip.com, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, vivien.didelot@savoirfairelinux.com, netdev@vger.kernel.org, driverdev-devel@linuxdriverproject.org, UNGLinuxDriver@microchip.com, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, David Miller <davem@davemloft.net>
List-Id: devicetree@vger.kernel.org

On Sat, Dec 29, 2018 at 1:03 AM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Dec 19, 2018 at 08:46:26PM +0100, Sergio Paracuellos wrote:
> > Add device-tree binding example of the ksz9477 switch managed in i2c mode.
> >
> > Cc: devicetree@vger.kernel.org
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > ---
> > Changes v4:
> >     - Use one tab formatting properly the binding sample.
> >
> > Changes v3:
> >     - No changes. Just resent patches together.
> >
> > Changes v2:
> >     - Use generic name for label of the switch and make sure reg and @X
> >       have the same value.
> >  .../devicetree/bindings/net/dsa/ksz.txt       | 51 +++++++++++++++++++
> >  1 file changed, 51 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/net/dsa/ksz.txt b/Documentation/devicetree/bindings/net/dsa/ksz.txt
> > index 0f407fb371ce..2f276aa42f0b 100644
> > --- a/Documentation/devicetree/bindings/net/dsa/ksz.txt
> > +++ b/Documentation/devicetree/bindings/net/dsa/ksz.txt
> > @@ -74,3 +74,54 @@ Ethernet switch connected via SPI to the host, CPU port wired to eth0:
> >                                                               };
> >                                               };
> >                               };
> > +
> > +Ethernet switch connected via I2C to the host, CPU port wired to eth0:
> > +
> > +     eth0: ethernet@10001000 {
> > +             fixed-link {
> > +                     speed = <1000>;
> > +                     full-duplex;
> > +             };
> > +     };
> > +
> > +     i2c0: i2c@f8008000 {
> > +             switch: ksz9897@5f {
> > +                     compatible = "microchip,ksz9897";
> > +                     reg = <5f>;
> > +
>
> I should have said this earlier, but this example doesn't really show
> anything other than differences in reg and bus-specific properties which
> are pretty well understood. So I don't really think it is worth adding
> the example.

Fair enough. No problem at all for me. Thanks for let me know.

>
> > +                     ports {
> > +                             #address-cells = <1>;
> > +                             #size-cells = <0>;
> > +
> > +                             port@0 {
> > +                                     reg = <0>;
> > +                                     label = "lan1";
> > +                             };
> > +                             port@1 {
> > +                                     reg = <1>;
> > +                                     label = "lan2";
> > +                             };
> > +                             port@2 {
> > +                                     reg = <2>;
> > +                                     label = "lan3";
> > +                             };
> > +                             port@3 {
> > +                                     reg = <3>;
> > +                                     label = "lan4";
> > +                             };
> > +                             port@4 {
> > +                                     reg = <4>;
> > +                                     label = "lan5";
> > +                             };
> > +                             port@6 {
> > +                                     reg = <6>;
> > +                                     label = "cpu";
> > +                                     ethernet = <&eth0>;
> > +                                     fixed-link {
> > +                                             speed = <1000>;
> > +                                             full-duplex;
> > +                                     };
> > +                             };
> > +                     };
> > +             };
> > +     };
> > --
> > 2.19.1
> >

Best regards,
    Sergio Paracuellos
