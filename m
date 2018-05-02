From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net-next v2 00/15] ARM: sun8i: r40: Add Ethernet support
Date: Wed, 02 May 2018 11:04:56 -0400 (EDT)
Message-ID: <20180502.110456.2281101229498743058.davem@davemloft.net>
References: <20180501161227.2110-1-wens@csie.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180501161227.2110-1-wens@csie.org>
Sender: netdev-owner@vger.kernel.org
To: wens@csie.org
Cc: maxime.ripard@bootlin.com, mturquette@baylibre.com, sboyd@kernel.org, peppe.cavallaro@st.com, robh+dt@kernel.org, mark.rutland@arm.com, broonie@kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, netdev@vger.kernel.org, clabbe.montjoie@gmail.com, icenowy@aosc.io
List-Id: devicetree@vger.kernel.org

From: Chen-Yu Tsai <wens@csie.org>
Date: Wed,  2 May 2018 00:12:12 +0800

> This is v2 of my R40 Ethernet support series.

There are a lot of non-networking changes in here, in particular DTS
changes and modifications to clock drivers.

Are all parties involved OK with the entire series going into net-next?

Thanks.
