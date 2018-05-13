From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH RESEND net-next v2 1/8] dt-bindings: net: dwmac-sun8i:
 Clean up clock delay chain descriptions
Date: Sun, 13 May 2018 22:27:49 +0200
Message-ID: <20180513202749.GG12738@lunn.ch>
References: <20180513191425.9801-1-wens@csie.org>
 <20180513191425.9801-2-wens@csie.org>
 <20180513194919.GE12738@lunn.ch>
 <CAGb2v66nqWnioS1pwfWFtMZFZSWvf4SwXr_ExnnGvYsK9RU_LA@mail.gmail.com>
 <20180513200529.GF12738@lunn.ch>
 <272E1914-029C-492C-B521-BC63D6A705D7@aosc.io>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <272E1914-029C-492C-B521-BC63D6A705D7@aosc.io>
Sender: netdev-owner@vger.kernel.org
To: Icenowy Zheng <icenowy@aosc.io>
Cc: linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>, devicetree <devicetree@vger.kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>, netdev <netdev@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Corentin Labbe <clabbe.montjoie@gmail.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>
List-Id: devicetree@vger.kernel.org

On Mon, May 14, 2018 at 04:10:58AM +0800, Icenowy Zheng wrote:
> 
> 
> 于 2018年5月14日 GMT+08:00 上午4:05:29, Andrew Lunn <andrew@lunn.ch> 写到:
> >> > Hi Chen-Yu
> >> >
> >> > Are these delays the MAC applies? Not the PHY. It would be good to
> >> > make it clear here these are MAC imposed delays.
> >> 
> >> Yes these are applied on the MAC side. Being described in the device
> >> tree bindings for the MAC, I thought this was implied to be the case?
> >> Are there known exceptions?
> >
> >There is frequent confusion with this. Most of the time, the PHY does
> >the delay, not the MAC, based on the phy-mode. So the MAC doing it is
> >an exception in itself.
> >
> >Do you actually need these delays for the board you adding support
> >for? Does the PHY not support adding the needed delays? If you don't
> >need the delays, i would not even implement them.
> 
> They are needed if the rx/tx have not equal length.
> 

> For several boards if the delay is not present, the network
> is unusable. (I have at least met this on Banana Pi M3, an
> Allwinner A83T SBC w/ RTL8211E)

The RTL8211E does not appear to support adding delays, via
registers. You can do it with strapping resistors. The RTL8211F does
support delays via a register. So for the Banana Pi M3 it is
justified.

However, in general, i would recommend letting the PHY do it, if it
can.

	Andrew
