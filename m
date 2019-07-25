From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [RFC] dt-bindings: net: phy: Add subnode for LED configuration
Date: Thu, 25 Jul 2019 20:34:41 +0200
Message-ID: <20190725183441.GL21952@lunn.ch>
References: <20190722223741.113347-1-mka@chromium.org>
 <20190724180430.GB28488@lunn.ch>
 <20190725175258.GE250418@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190725175258.GE250418@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

> As of now I don't plan to expose the label to userspace by the PHY
> driver/framework itself.

Great.

With that change, i think this proposed binding is O.K.

     Andrew
