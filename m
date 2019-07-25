From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [RFC] dt-bindings: net: phy: Add subnode for LED configuration
Date: Thu, 25 Jul 2019 12:18:25 -0700
Message-ID: <20190725191825.GF250418@google.com>
References: <20190722223741.113347-1-mka@chromium.org>
 <20190724180430.GB28488@lunn.ch>
 <20190725175258.GE250418@google.com>
 <20190725183441.GL21952@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190725183441.GL21952@lunn.ch>
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 25, 2019 at 08:34:41PM +0200, Andrew Lunn wrote:
> > As of now I don't plan to expose the label to userspace by the PHY
> > driver/framework itself.
> 
> Great.
> 
> With that change, i think this proposed binding is O.K.

Great, thanks for your feedback!

I'll probably post a new version with actual code next week, unless
there is more discussion before I get to it.
