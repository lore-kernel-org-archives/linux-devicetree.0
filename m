From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next v2 6/7] dt-bindings: net: phy: mscc: vsc8531:
 remove compatible from required properties
Date: Mon, 3 Sep 2018 15:30:20 +0200
Message-ID: <20180903133020.GE4445@lunn.ch>
References: <20180903084853.18092-1-quentin.schulz@bootlin.com>
 <20180903084853.18092-6-quentin.schulz@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180903084853.18092-6-quentin.schulz@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Quentin Schulz <quentin.schulz@bootlin.com>
Cc: davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, f.fainelli@gmail.com, allan.nielsen@microchip.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com
List-Id: devicetree@vger.kernel.org

On Mon, Sep 03, 2018 at 10:48:52AM +0200, Quentin Schulz wrote:
> Compatible isn't a required property for PHYs so let's remove it from
> the binding DT of the VSC8531 PHYs.

Hi Quentin

It is actually a optional property. So you could move it into that
section of the binding documentation. But removing it is also O.K.

	Andrew
