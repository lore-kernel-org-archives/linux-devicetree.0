From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH] dt-bindings: net: dsa: ksz9477: fix indentation for
 switch spi bindings
Date: Tue, 25 Dec 2018 13:38:54 +0100
Message-ID: <20181225123854.GA27955@lunn.ch>
References: <20181222073909.23900-1-sergio.paracuellos@gmail.com>
 <20181224.141511.1399133540508249248.davem@davemloft.net>
 <CAMhs-H9o6z6YcnVTwHEnbr4vknEnHbSFvoobbscsx3isG5+G4A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMhs-H9o6z6YcnVTwHEnbr4vknEnHbSFvoobbscsx3isG5+G4A@mail.gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: David Miller <davem@davemloft.net>, Woojung.Huh@microchip.com, UNGLinuxDriver@microchip.com, vivien.didelot@savoirfairelinux.com, Florian Fainelli <f.fainelli@gmail.com>, driverdev-devel@linuxdriverproject.org, netdev@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 25, 2018 at 12:45:11PM +0100, Sergio Paracuellos wrote:
> Hi David,
> 
> On Mon, Dec 24, 2018 at 11:15 PM David Miller <davem@davemloft.net> wrote:
> >
> > From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > Date: Sat, 22 Dec 2018 08:39:09 +0100
> >
> > > Switch bindings for spi managed mode are using spaces instead of tabs.
> > > Fix them to get a file with a proper kernel indentation style.
> > >
> > > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> >
> > This doesn't apply to any of my trees so I'm going to assume this was
> > targetting the devicetree GIT tree or something like that.
> 
> Actually, this was rebased onto linux-next. Which tree do you want me
> to rebase onto?

Hi Sergio

It should be based on net-next. However, that is closed now, so please
wait until it reopens in about two weeks time.

     Thanks
	Andrew
