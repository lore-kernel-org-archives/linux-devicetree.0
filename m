From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v3 6/7] dt-bindings: net: realtek: Add property to
 configure LED mode
Date: Mon, 8 Jul 2019 13:07:05 -0700
Message-ID: <20190708200705.GN250418@google.com>
References: <20190708192459.187984-1-mka@chromium.org>
 <20190708192459.187984-7-mka@chromium.org>
 <20190708194834.GI9027@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190708194834.GI9027@lunn.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

Hi Andrew,

On Mon, Jul 08, 2019 at 09:48:34PM +0200, Andrew Lunn wrote:
> On Mon, Jul 08, 2019 at 12:24:58PM -0700, Matthias Kaehlcke wrote:
> > The LED behavior of some Realtek PHYs is configurable. Add the
> > property 'realtek,led-modes' to specify the configuration of the
> > LEDs.
> > 
> > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> 
> Hi Matthias
> 
> Humm. I thought you were going to drop this and the next patch?

It wasn't clear to me whether not introducing a generic interface is a
definitive NACK and tought I could at least post a version with the
review comments addressed. If there is no way forward without a
generic interface I'll drop the two patches.
