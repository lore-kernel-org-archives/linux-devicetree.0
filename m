From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: net: dsa: ksz9477: add sample of switch
 bindings managed in i2c mode
Date: Sun, 16 Dec 2018 09:32:18 +0100
Message-ID: <CAMhs-H-F_tFWeWo_=b5uGuUVGDmn+rGJ3Xt-Jf9LMHKWczr9rw@mail.gmail.com>
References: <20181216075741.13827-1-sergio.paracuellos@gmail.com>
 <20181216075741.13827-2-sergio.paracuellos@gmail.com>
 <20181216081817.GC18287@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20181216081817.GC18287@lunn.ch>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: andrew@lunn.ch
Cc: Woojung.Huh@microchip.com, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, f.fainelli@gmail.com, vivien.didelot@savoirfairelinux.com, netdev@vger.kernel.org, driverdev-devel@linuxdriverproject.org, UNGLinuxDriver@microchip.com, davem@davemloft.net
List-Id: devicetree@vger.kernel.org

On Sun, Dec 16, 2018 at 9:18 AM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Sun, Dec 16, 2018 at 08:57:41AM +0100, Sergio Paracuellos wrote:
> > Add device-tree binding example of the ksz9477 switch managed in i2c mode.
> >
> > Cc: devicetree@vger.kernel.org
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > ---
> >  .../devicetree/bindings/net/dsa/ksz.txt       | 50 +++++++++++++++++++
> >  1 file changed, 50 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/net/dsa/ksz.txt b/Documentation/devicetree/bindings/net/dsa/ksz.txt
> > index 0f407fb371ce..9e715358cebb 100644
> > --- a/Documentation/devicetree/bindings/net/dsa/ksz.txt
> > +++ b/Documentation/devicetree/bindings/net/dsa/ksz.txt
> > @@ -74,3 +74,53 @@ Ethernet switch connected via SPI to the host, CPU port wired to eth0:
> >                                                               };
> >                                               };
> >                               };
> > +
> > +Ethernet switch connected via I2C to the host, CPU port wired to eth0:
> > +
> > +                             eth0: ethernet@10001000 {
> > +                                             fixed-link {
> > +                                                             speed = <1000>;
> > +                                                             full-duplex;
> > +                                             };
> > +                             };
> > +
> > +                             i2c0: i2c@f8008000 {
> > +                                             ksz9897: ksz9897@0 {
>
> Hi Sergio
>

Hi Andrew,

Thanks for such a fast review :-)

> You should use a generic name here. Plus the @X needs to be the same as the reg value.
> So switch: ksz9897@5f.

Ok, I'll change this. Copy paste is bad friend sometimes.

>
>    Andrew

Best regards,
    Sergio Paracuellos
