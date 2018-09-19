From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 2/4] dt-bindings: net: qcom: Add binding for shared
 mdio bus
Date: Wed, 19 Sep 2018 14:25:21 +0200
Message-ID: <20180919122521.GA26940@lunn.ch>
References: <1537174411-34510-1-git-send-email-dongsheng.wang@hxt-semitech.com>
 <1537174411-34510-3-git-send-email-dongsheng.wang@hxt-semitech.com>
 <20180917145028.GC5458@lunn.ch>
 <b01bb33b30164088a9cae59a825acdc9@HXTBJIDCEMVIW02.hxtcorp.net>
 <13018118-9883-4b26-9017-b324d745cc58@gmail.com>
 <71ba0057c5e547c382793be899e3268a@HXTBJIDCEMVIW02.hxtcorp.net>
 <20180918123545.GA29092@lunn.ch>
 <7696bcd8ca594b1da683b437197b4ddf@HXTBJIDCEMVIW02.hxtcorp.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7696bcd8ca594b1da683b437197b4ddf@HXTBJIDCEMVIW02.hxtcorp.net>
Sender: netdev-owner@vger.kernel.org
To: "Wang, Dongsheng" <dongsheng.wang@hxt-semitech.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, "timur@kernel.org" <timur@kernel.org>, "davem@davemloft.net" <davem@davemloft.net>, "Zheng, Joey" <yu.zheng@hxt-semitech.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 19, 2018 at 09:19:19AM +0000, Wang, Dongsheng wrote:
> On 2018/9/18 20:35, Andrew Lunn wrote:
> >>> If you want to describe the MDIO controller, then you embed a mdio
> >>> subnode into your Ethernet MAC node:
> >>>
> >>>  emac0: ethernet@feb20000 {
> >>> 	mdio {
> >>> 		#address-cells = <1>;
> >>> 		#size-cells = <0>;
> >>>
> >>> 		phy0: ethernet-phy@0 {
> >>> 			reg = <0>;
> >>> 		};
> >>> 	};
> >>> };
> >>>
> >>> And then each Ethernet MAC controller refers to their appropriate PHY
> >>> device tree node using a phy-handle property to point to either their
> >>> own MDIO controller, or another MAC's MDIO controller.
> >> Sorry, I do not understand how phy-handle point to MDIO controller,
> >> because phy-handle is defined to point to a phy.
> > The MAC driver does not care what MDIO controller a PHY is on. All you
> > need to do to register the PHY is:
> 
> Yes, these are all things that must be done, and emac driver will
> connect phy when mac up.
> If we had a separate MDIO controller, the MAC would not care about MDIO
> bus. But MDIO is integrated within the EMAC, and emac driver maintains
> the mdio.
> 
> Each EMAC do their mdio register/unregister. But in the shared scenario,
> the EMACs that use the shared bus do not need to create an MDIO and
> cannot release the Shared bus.

Hi Dongsheng

There is nothing new here. Many Ethernet drivers export an MDIO bus
which is then used by some other device, often an Ethernet
switch. Ordering should not be a problem, you just need to handle
EPROBE_DEFER, which will happen if the MDIO bus has not yet been
probed when you try to lookup the phy-handle. And once the phy has
been connected, the MDIO bus will be locked, preventing it from being
removed.

> But ACPI environment my understand is this:

ACPI is completely separate and should not affect the DT binding.
I've not yet looked at the ACPI changes you added.

> I will rework this patchset and maybe patches will be a delay for a few
> days.

Thanks

	Andrew
