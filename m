From: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH v2 3/5] arm64: dts: meson: g12a: add mdio multiplexer
Date: Mon, 20 May 2019 23:51:09 +0200
Message-ID: <97cde329c44eade402deb517211a15fd70103f01.camel@baylibre.com>
References: <20190520131401.11804-1-jbrunet@baylibre.com>
         <20190520131401.11804-4-jbrunet@baylibre.com>
         <CAFBinCA_XE86eqCMpEFc3xMZDH8J7wVQPRj7bFZyqDxQx-w-qw@mail.gmail.com>
         <20190520190533.GF22024@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190520190533.GF22024@lunn.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, f.fainelli@gmail.com, hkallweit1@gmail.com
List-Id: devicetree@vger.kernel.org

On Mon, 2019-05-20 at 21:05 +0200, Andrew Lunn wrote:
> > > +                               int_mdio: mdio@1 {
> > > +                                       reg = <1>;
> > > +                                       #address-cells = <1>;
> > > +                                       #size-cells = <0>;
> > > +
> > > +                                       internal_ephy: ethernet_phy@8 {
> > > +                                               compatible = "ethernet-phy-id0180.3301",
> > > +                                                            "ethernet-phy-ieee802.3-c22";
> > Based on your comment on v1 of this patch [0] the Ethernet PHY ID is
> > defined by this "mdio-multiplexer" (write arbitrary value to a
> > register then that's the PHY ID which will show up on the bus)
> > I'm fine with explicitly listing the ID which the PHY driver binds to
> > because I don't know a better way.

... 

> 
> Does reading the ID registers give the correct ID, once you have poked
> registers in the mdio-multiplexer? If so, you don't need this
> compatible string.

Hi Andrew,

In 5.1 the mdio-mux set a wrong simply because I got it wrong. I pushed a
fix for that, and maybe it has already hit mainline.

As I pointed to Martin on v1, this situation just shows that this setting is
weaker than the usual phy setup.

I do understand why we don't want to put the PHY id in DT. If the PHY fitted on
the board changes, we want to pick it up. This particular phy is embedded in
SoC, we know it won't change for this SoC, whatever the mdio-mux sets.

So yes it should (soon) work as usual, setting this id is not strictly
necessary but it nicely reflect that this particular phy is integrated in
the SoC and we know which driver to use. 

So, if this is ok with you, I'd prefer to keep this particular id around.

> 
> If the read is giving the wrong ID, then yes, you do want this. But
> then please add a comment in the DT blob. This is very unusual, so
> should have some explanation why it is needed.

Sure, can add a comment. I suggest to do it in follow-up. At least it keeps
things aligned between the gxl, which has been like this for quite a while now,
and g12a.


> 
> Thanks
> 	Andrew
