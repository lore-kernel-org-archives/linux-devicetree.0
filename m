From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 net-next 5/6] dt-bindings: net: dsa: Add
 lantiq,xrx200-gswip DT bindings
Date: Tue, 11 Sep 2018 08:06:39 -0500
Message-ID: <CAL_Jsq+uvEK+rUXY9g+PUGtLGZVpAH0ws5QFHJSKghkeKrTqrA@mail.gmail.com>
References: <20180909201647.32727-1-hauke@hauke-m.d> <20180909202027.411-1-hauke@hauke-m.de>
 <20180910220119.GA32582@bogus> <20180910220516.GA16024@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180910220516.GA16024@lunn.ch>
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Hauke Mehrtens <hauke@hauke-m.de>, David Miller <davem@davemloft.net>, netdev <netdev@vger.kernel.org>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Florian Fainelli <f.fainelli@gmail.com>, John Crispin <john@phrozen.org>, Linux-MIPS <linux-mips@linux-mips.org>, dev@kresin.me, "hauke.mehrtens" <hauke.mehrtens@intel.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Sep 10, 2018 at 5:05 PM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > > +See Documentation/devicetree/bindings/net/dsa/dsa.txt for a list of
> > > +additional required and optional properties.
> > > +
> > > +
>
> snip
>
> > > +   #address-cells = <1>;
> > > +   #size-cells = <0>;
> > > +   compatible = "lantiq,xrx200-gswip";
> > > +   reg = < 0xE108000 0x3000 /* switch */
> > > +           0xE10B100 0x70 /* mdio */
> > > +           0xE10B1D8 0x30 /* mii */
> > > +           >;
> > > +   dsa,member = <0 0>;
> >
> > Not documented.
>
> Hi Rob
>
> It is documented in Documentation/devicetree/bindings/net/dsa/dsa.txt
> referenced above.

Hum, okay. Not something I recall reviewing. Not that I tend to
remember, but 'dsa' is not a vendor and the property should be
'dsa-member'.

Rob
