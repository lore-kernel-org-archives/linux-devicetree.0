From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH RESEND net-next v2 0/8] net: stmmac: dwmac-sun8i:
 Support R40
Date: Mon, 14 May 2018 15:07:28 -0400 (EDT)
Message-ID: <20180514.150728.169655566450818502.davem@davemloft.net>
References: <20180513191425.9801-1-wens@csie.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180513191425.9801-1-wens@csie.org>
Sender: netdev-owner@vger.kernel.org
To: wens@csie.org
Cc: peppe.cavallaro@st.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, netdev@vger.kernel.org, clabbe.montjoie@gmail.com, icenowy@aosc.io, maxime.ripard@bootlin.com, robh+dt@kernel.org
List-Id: devicetree@vger.kernel.org

From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 14 May 2018 03:14:17 +0800

> This is a resend of the patches for net-next split out from my R40
> Ethernet support v2 series, as requested by David Miller. The arm-soc
> bits will follow, once I rework the A64 system controller compatible.

Series applied, but please continue to follow-up with Andrew Lunn about
how best to handle these RX and TX delays.

Thank you.
