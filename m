From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 1/2] net: dsa: ksz9477: add I2C managed mode support
Date: Sun, 16 Dec 2018 09:44:00 +0100
Message-ID: <20181216084400.GE18287@lunn.ch>
References: <20181216075741.13827-1-sergio.paracuellos@gmail.com>
 <20181216081542.GB18287@lunn.ch>
 <CAMhs-H_5=+AKtnMZ-89pV04WZ46kEkhOX8bmuC-uD5YRY+xW3g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMhs-H_5=+AKtnMZ-89pV04WZ46kEkhOX8bmuC-uD5YRY+xW3g@mail.gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: Woojung.Huh@microchip.com, UNGLinuxDriver@microchip.com, vivien.didelot@savoirfairelinux.com, f.fainelli@gmail.com, driverdev-devel@linuxdriverproject.org, davem@davemloft.net, netdev@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

> I'll change these two to to get memory from kernel allocators instead
> of using the stack. Thanks for let me know this.

There appear to be other cases as well. Please review the whole
driver.

	Thanks
		Andrew
