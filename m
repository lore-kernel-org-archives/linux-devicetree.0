From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 1/7] dt-bindings: net: Add bindings for Realtek PHYs
Date: Wed, 3 Jul 2019 23:33:27 +0200
Message-ID: <20190703213327.GH18473@lunn.ch>
References: <20190703193724.246854-1-mka@chromium.org>
 <CAL_JsqJdBAMPc1sZJfL7V9cxGgCb4GWwRokwJDmac5L2AO2-wg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqJdBAMPc1sZJfL7V9cxGgCb4GWwRokwJDmac5L2AO2-wg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Matthias Kaehlcke <mka@chromium.org>, "David S . Miller" <davem@davemloft.net>, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, netdev <netdev@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Douglas Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

> I think if we're going to have custom properties for phys, we should
> have a compatible string to at least validate whether the custom
> properties are even valid for the node.

Hi Rob

What happens with other enumerable busses where a compatible string is
not used?

The Ethernet PHY subsystem will ignore the compatible string and load
the driver which fits the enumeration data. Using the compatible
string only to get the right YAML validator seems wrong. I would
prefer adding some other property with a clear name indicates its is
selecting the validator, and has nothing to do with loading the
correct driver. And it can then be used as well for USB and PCI
devices etc.

	Andrew
