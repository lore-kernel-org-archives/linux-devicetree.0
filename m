From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 3/5] arm64: dts: meson: g12a: add mdio multiplexer
Date: Mon, 20 May 2019 21:05:33 +0200
Message-ID: <20190520190533.GF22024@lunn.ch>
References: <20190520131401.11804-1-jbrunet@baylibre.com>
 <20190520131401.11804-4-jbrunet@baylibre.com>
 <CAFBinCA_XE86eqCMpEFc3xMZDH8J7wVQPRj7bFZyqDxQx-w-qw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAFBinCA_XE86eqCMpEFc3xMZDH8J7wVQPRj7bFZyqDxQx-w-qw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, f.fainelli@gmail.com, hkallweit1@gmail.com
List-Id: devicetree@vger.kernel.org

> > +                               int_mdio: mdio@1 {
> > +                                       reg = <1>;
> > +                                       #address-cells = <1>;
> > +                                       #size-cells = <0>;
> > +
> > +                                       internal_ephy: ethernet_phy@8 {
> > +                                               compatible = "ethernet-phy-id0180.3301",
> > +                                                            "ethernet-phy-ieee802.3-c22";
> Based on your comment on v1 of this patch [0] the Ethernet PHY ID is
> defined by this "mdio-multiplexer" (write arbitrary value to a
> register then that's the PHY ID which will show up on the bus)
> I'm fine with explicitly listing the ID which the PHY driver binds to
> because I don't know a better way.

Does reading the ID registers give the correct ID, once you have poked
registers in the mdio-multiplexer? If so, you don't need this
compatible string.

If the read is giving the wrong ID, then yes, you do want this. But
then please add a comment in the DT blob. This is very unusual, so
should have some explanation why it is needed.

Thanks
	Andrew
