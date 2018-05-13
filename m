From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH RESEND net-next v2 1/8] dt-bindings: net: dwmac-sun8i:
 Clean up clock delay chain descriptions
Date: Sun, 13 May 2018 13:11:08 -0700
Message-ID: <CAGb2v64ACc1tQRhy4LhnvCC7VJ3nVM-wMbgUgzviGMWKPFsSuQ@mail.gmail.com>
References: <20180513191425.9801-1-wens@csie.org> <20180513191425.9801-2-wens@csie.org>
 <20180513194919.GE12738@lunn.ch> <CAGb2v66nqWnioS1pwfWFtMZFZSWvf4SwXr_ExnnGvYsK9RU_LA@mail.gmail.com>
 <20180513200529.GF12738@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180513200529.GF12738@lunn.ch>
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, netdev <netdev@vger.kernel.org>, Corentin Labbe <clabbe.montjoie@gmail.com>, Icenowy Zheng <icenowy@aosc.io>, Maxime Ripard <maxime.ripard@bootlin.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

On Sun, May 13, 2018 at 1:05 PM, Andrew Lunn <andrew@lunn.ch> wrote:
>> > Hi Chen-Yu
>> >
>> > Are these delays the MAC applies? Not the PHY. It would be good to
>> > make it clear here these are MAC imposed delays.
>>
>> Yes these are applied on the MAC side. Being described in the device
>> tree bindings for the MAC, I thought this was implied to be the case?
>> Are there known exceptions?
>
> There is frequent confusion with this. Most of the time, the PHY does
> the delay, not the MAC, based on the phy-mode. So the MAC doing it is
> an exception in itself.
>
> Do you actually need these delays for the board you adding support
> for? Does the PHY not support adding the needed delays? If you don't
> need the delays, i would not even implement them.

Yes this is already used on the Bananapi M3. This patch merely reformats
the description and adds a note saying this only applies to RGMII mode.

ChenYu
