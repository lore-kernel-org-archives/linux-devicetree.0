From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 2/4 v1] net: dsa: Add bindings for Realtek SMI DSAs
Date: Tue, 17 Jul 2018 00:31:02 +0200
Message-ID: <20180716223102.GB968@lunn.ch>
References: <20180714094556.30791-1-linus.walleij@linaro.org>
 <20180714094556.30791-2-linus.walleij@linaro.org>
 <20180716204535.GA22125@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180716204535.GA22125@rob-hp-laptop>
Sender: netdev-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, openwrt-devel@lists.openwrt.org, LEDE Development List <lede-dev@lists.infradead.org>, Antti =?iso-8859-1?Q?Sepp=E4l=E4?= <a.seppala@gmail.com>, Roman Yeryomin <roman@advem.lv>, Colin Leitner <colin.leitner@googlemail.com>, Gabor Juhos <juhosg@openwrt.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

> > +Realtek SMI-based Switches
> > +==========================
> > +
> > +The SMI "Simple Management Interface" is a two-wire protocol using
> 
> At least for some other Realtek chips, the documentation I find says the 
> S stands for Serial. And Wikipedia says SMI is the same thing as MDIO.
> 
> Just want to make sure we don't define GPIOs directly when there should 
> be a layer of abstraction like mdio-gpio.

Hi Rob

There was a bit of discussion about this with the RFC patches. The bit
stream protocol used here is not that used by SMI in MDIO. It is
something proprietary to Realtek. I don't expect we will be re-using
the code with other vendors. The only real reason to abstract this out
is if there happens to be other Realtek switches which uses the same
SMI bitstream, but have completely different registers, meaning a
separate DSA driver would be needed. The SMI code is well structured,
so it should not be too hard to turn it into a library which drivers
can share.

So i personally don't see a problem with this.

   Andrew
