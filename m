From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 6/7] dt-bindings: net: realtek: Add property to
 configure LED mode
Date: Mon, 22 Jul 2019 21:38:34 +0200
Message-ID: <20190722193834.GG8972@lunn.ch>
References: <20190703193724.246854-1-mka@chromium.org>
 <20190703193724.246854-6-mka@chromium.org>
 <e8fe7baf-e4e0-c713-7b93-07a3859c33c6@gmail.com>
 <20190703232331.GL250418@google.com>
 <CAL_JsqL_AU+JV0c2mNbXiPh2pvfYbPbLV-2PHHX0hC3vUH4QWg@mail.gmail.com>
 <20190722171418.GV250418@google.com>
 <20190722190133.GF8972@lunn.ch>
 <20190722191411.GW250418@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190722191411.GW250418@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, "David S . Miller" <davem@davemloft.net>, Mark Rutland <mark.rutland@arm.com>, Heiner Kallweit <hkallweit1@gmail.com>, netdev <netdev@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Douglas Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

> as of now it isn't even an API, the phy_device populates a new array
> in its struct with the values from the DT. PHY drivers access the
> array directly. Is it still preferable to post everything together?
> 
> (maybe I'm too concerned about 'noise' from the driver patches while
>  we are figuring out what exactly the binding should be).

We should try to have the DT parsing made generic in phylib, and add
new driver API calls to actually configure the LEDs.

Please also take a look at the Linux generic LED binding. It would be
nice to have something compatible with that. With time, the code could
morph into being part of the generic LED subsystem. So we are mostly
talking about triggers. But we offload the trigger to the hardware,
rather than have software trigger the blinking of the LEDs. So
something like:

ethernet-phy0  {
	reg = <0>;

	leds {
		phy-led@0 {
	     	      reg = <0>
		      label = "left:green";
		      linux,default-trigger = "phy_link_1000_active";
		}
		phy-led@1 {
	     	      reg = <1>
		      label = "right:red";
		      linux,default-trigger = "phy_collision";
		}
	}
}

      Andrew
