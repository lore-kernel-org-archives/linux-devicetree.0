From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/4 v1] net: dsa: Add bindings for Realtek SMI DSAs
Date: Fri, 20 Jul 2018 10:17:56 -0600
Message-ID: <20180720161756.GA32587@rob-hp-laptop>
References: <20180714094556.30791-1-linus.walleij@linaro.org>
 <20180714094556.30791-2-linus.walleij@linaro.org>
 <20180716204535.GA22125@rob-hp-laptop>
 <CACRpkdb1ykS=3kiuQzaa6TpEPNB=C6xuusuez6JOCHb-E27Uqg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdb1ykS=3kiuQzaa6TpEPNB=C6xuusuez6JOCHb-E27Uqg@mail.gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Florian Fainelli <f.fainelli@gmail.com>, netdev <netdev@vger.kernel.org>, OpenWrt Development List <openwrt-devel@lists.openwrt.org>, LEDE Development List <lede-dev@lists.infradead.org>, Antti =?iso-8859-1?Q?Sepp=E4l=E4?= <a.seppala@gmail.com>, Roman Yeryomin <roman@advem.lv>, Colin Leitner <colin.leitner@googlemail.com>, Gabor Juhos <juhosg@openwrt.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 17, 2018 at 08:55:51AM +0200, Linus Walleij wrote:
> On Mon, Jul 16, 2018 at 10:45 PM Rob Herring <robh@kernel.org> wrote:
> > On Sat, Jul 14, 2018 at 11:45:54AM +0200, Linus Walleij wrote:
> 
> > > +The SMI "Simple Management Interface" is a two-wire protocol using
> >
> > At least for some other Realtek chips, the documentation I find says the
> > S stands for Serial. And Wikipedia says SMI is the same thing as MDIO.
> 
> The only datasheet we have mentions both:
> http://realtek.info/pdf/rtl8366_8369_datasheet_1-1.pdf
> calling it serial management interface when talking to an EEPROM
> calling it systems management interface when talking to a
> PHY.
> 
> (BTW that datsheet has no relation to this driver, that is for
> ASICs 8366 and 8369 which of course have nothing to do with
> RTL8366RB "revision B" that we are running here, which adds
> even more to the confusion.)
> 
> Sadly it would not surprise me if Realtek doesn't even know
> which one it is themselves, given the state of the code and
> documentation that came out of the company.
> 
> I just have to pick something. I can rename it the
> "S Management Interface" if you prefer, OpenWRT called it
> Systems Management Interface.
> 
> > Just want to make sure we don't define GPIOs directly when there should
> > be a layer of abstraction like mdio-gpio.
> 
> OK let's look at it we read a single register with each protocol:
> 
> 1. MDIO: drivers/net/phy/mdio-bitbang.c
>   send_bit is setting data and cycling clock 1-0 (falling edge)
>   begins transactions by sending 32 1:s (well 33 for safe measure)
>   then sends a start bit 01
>   then sends the opcode 10 (read)
>   then sends the PHY address (5 bits)
>   then sends the register address (5 bits)
>   turn around (switch MDIO to input)
>   read 16 bit register value
>   read stop bit
> 
> 2. SMI:
>    sends the sequence "101" to start transactions. (No initial ones)
>    writes a whole byte which is the "command" read is 0xa9
>    on RTL8366RB and apparently something else on other chips
>    writes low byte of 16bit address
>    writes high byte of 16bit address
>    turn around (switch MDIO to input)
>    reads the low byte of the 16bit data
>    reads the high byte of the 16bit data
>    sends the stop sequence 01
>    then an extra clock pulse
> 
> As you can see those are pretty different. PHY always being
> addressed in MDIO (the switch chips has PHYs but this
> protocol is not defined exclusively for that) and both phy and
> reg being 5 bits addressing at most 10 address bits is the most
> obvious deviation then 8 bits for command instead of 2 etc.
> 
> It's just very different.

Okay. Just wanted to make sure.

Reviewed-by: Rob Herring <robh@kernel.org>
