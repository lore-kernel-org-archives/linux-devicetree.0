From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 2/4] dt-bindings: net: qcom: Add binding for shared
 mdio bus
Date: Wed, 19 Sep 2018 17:20:52 +0200
Message-ID: <20180919152052.GD17466@lunn.ch>
References: <1537174411-34510-1-git-send-email-dongsheng.wang@hxt-semitech.com>
 <1537174411-34510-3-git-send-email-dongsheng.wang@hxt-semitech.com>
 <20180917145028.GC5458@lunn.ch>
 <b01bb33b30164088a9cae59a825acdc9@HXTBJIDCEMVIW02.hxtcorp.net>
 <13018118-9883-4b26-9017-b324d745cc58@gmail.com>
 <71ba0057c5e547c382793be899e3268a@HXTBJIDCEMVIW02.hxtcorp.net>
 <20180918123545.GA29092@lunn.ch>
 <7696bcd8ca594b1da683b437197b4ddf@HXTBJIDCEMVIW02.hxtcorp.net>
 <20180919122521.GA26940@lunn.ch>
 <1226d3d3-e2ba-571d-5b70-b246cbde2fb6@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1226d3d3-e2ba-571d-5b70-b246cbde2fb6@kernel.org>
Sender: netdev-owner@vger.kernel.org
To: Timur Tabi <timur@kernel.org>
Cc: "Wang, Dongsheng" <dongsheng.wang@hxt-semitech.com>, Florian Fainelli <f.fainelli@gmail.com>, "davem@davemloft.net" <davem@davemloft.net>, "Zheng, Joey" <yu.zheng@hxt-semitech.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

> The focus of any patches for the EMAC should be ACPI, not DT.  If anything,
> ACPI support should come first.  No one should be writing or reviewing DT
> code before ACPI code.

I suspect that is not going to be easy. Last time i looked, the ACPI
standard had nothing about MDIO busses or PHYs. Marcin Wojtas did some
work in this area a while back for the mvpp2, but if i remember
correctly, he worked around this by simply not having a PHY when using
ACPI, and making use of a MAC interrupt which indicated when there was
link.

Whoever implements this first needs to be an ACPI expert and probably
needs to write it up and submit it as an amendment to the ACPI
standard.

      Andrew
