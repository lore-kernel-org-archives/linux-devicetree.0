From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v4 13/14] net: phy: adin: add ethtool get_stats support
Date: Wed, 14 Aug 2019 16:04:12 +0200
Message-ID: <20190814140412.GD5265@lunn.ch>
References: <20190812112350.15242-1-alexandru.ardelean@analog.com>
 <20190812112350.15242-14-alexandru.ardelean@analog.com>
 <20190812143315.GS14290@lunn.ch>
 <c3fdb21c40900dae0e52b02b98fe27924a76c256.camel@analog.com>
 <2175a95d818172153e839f6bcf6d3d61a3e23dd8.camel@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2175a95d818172153e839f6bcf6d3d61a3e23dd8.camel@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>
Cc: "davem@davemloft.net" <davem@davemloft.net>, "hkallweit1@gmail.com" <hkallweit1@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

> So, I have to apologize again here.
> I guess I was an idiot/n00b about this.

Not a problem. If it is not something you have come across before, you
can easily miss the significance.

So you just need to modify the ordering and you are good to go.
Please add a comment in the code about this latching. We don't want
somebody changing the ordering and breaking it.

	 Thanks
		Andrew
