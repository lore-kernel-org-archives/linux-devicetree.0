From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next v3 09/10] dt-bindings: net: dsa: marvell: add
 "marvell,mv88e6250" compatible string
Date: Mon, 3 Jun 2019 17:17:04 +0200
Message-ID: <20190603151704.GH19627@lunn.ch>
References: <20190603144112.27713-1-rasmus.villemoes@prevas.dk>
 <20190603144112.27713-10-rasmus.villemoes@prevas.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190603144112.27713-10-rasmus.villemoes@prevas.dk>
Sender: linux-kernel-owner@vger.kernel.org
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Cc: Vivien Didelot <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rasmus Villemoes <Rasmus.Villemoes@prevas.se>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 03, 2019 at 02:42:23PM +0000, Rasmus Villemoes wrote:
> The mv88e6250 has port_base_addr 0x8 or 0x18 (depending on
> configuration pins), so it constitutes a new family and hence needs
> its own compatible string.
> 
> Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
