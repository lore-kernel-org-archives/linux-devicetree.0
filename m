From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v2 11/11] ARM: dts: sunxi: Switch to the generic PHY properties
Date: Tue, 11 Jun 2019 18:08:34 +0800
Message-ID: <CAGb2v66vKPeyvw56ROR-B=5Bzi7GVby1CXCjgQ5hnuUdPWX0cg@mail.gmail.com>
References: <91618c7e9a5497462afa74c6d8a947f709f54331.1560158667.git-series.maxime.ripard@bootlin.com>
 <af3a342a6cba1dda27763c13093a8fc060946c1e.1560158667.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <af3a342a6cba1dda27763c13093a8fc060946c1e.1560158667.git-series.maxime.ripard@bootlin.com>
Sender: netdev-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, "David S . Miller" <davem@davemloft.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, netdev <netdev@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com, Maxime Chevallier <maxime.chevallier@bootlin.com>, =?UTF-8?Q?Antoine_T=C3=A9nart?= <antoine.tenart@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 10, 2019 at 5:26 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> The DWMAC specific properties to manage the PHY have been superseeded by
> the generic PHY properties. Let's move to it.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
>
> ---
>
> This patch should go through arm-soc.
>
> Changes from v1:
>   - New patch
> ---
>  arch/arm/boot/dts/sun6i-a31-hummingbird.dts       |  6 +++---

Tested-by: Chen-Yu Tsai <wens@csie.org>
