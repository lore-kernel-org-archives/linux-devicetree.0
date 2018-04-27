From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH net-next v2 3/7] dt-bindings: net: add DT bindings for
 Microsemi Ocelot Switch
Date: Fri, 27 Apr 2018 15:10:03 -0500
Message-ID: <20180427201003.j6gn4ljse4mree36@rob-hp-laptop>
References: <20180426195931.5393-1-alexandre.belloni@bootlin.com>
 <20180426195931.5393-4-alexandre.belloni@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180426195931.5393-4-alexandre.belloni@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: "David S . Miller" <davem@davemloft.net>, Allan Nielsen <Allan.Nielsen@microsemi.com>, razvan.stefanescu@nxp.com, po.liu@nxp.com, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, James Hogan <jhogan@kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 26, 2018 at 09:59:27PM +0200, Alexandre Belloni wrote:
> DT bindings for the Ethernet switch found on Microsemi Ocelot platforms.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: James Hogan <jhogan@kernel.org>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
>  .../devicetree/bindings/net/mscc-ocelot.txt   | 82 +++++++++++++++++++
>  1 file changed, 82 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/mscc-ocelot.txt

Reviewed-by: Rob Herring <robh@kernel.org>
