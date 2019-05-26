From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v6 0/3] MIPS: ath79: add ag71xx support
Date: Sun, 26 May 2019 13:23:35 -0700 (PDT)
Message-ID: <20190526.132335.1937144810229440950.davem@davemloft.net>
References: <20190524111224.24819-1-o.rempel@pengutronix.de>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190524111224.24819-1-o.rempel@pengutronix.de>
Sender: netdev-owner@vger.kernel.org
To: o.rempel@pengutronix.de
Cc: paul.burton@mips.com, ralf@linux-mips.org, jhogan@kernel.org, robh+dt@kernel.org, jcliburn@gmail.com, chris.snook@gmail.com, mark.rutland@arm.com, kernel@pengutronix.de, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, john@phrozen.org, nbd@nbd.name, netdev@vger.kernel.org, andrew@lunn.ch, gch981213@gmail.com, info@freifunk-bad-gandersheim.net
List-Id: devicetree@vger.kernel.org

From: Oleksij Rempel <o.rempel@pengutronix.de>
Date: Fri, 24 May 2019 13:12:21 +0200

 ...
> This patch series provide ethernet support for many Atheros/QCA
> MIPS based SoCs.
> 
> I reworked ag71xx driver which was previously maintained within OpenWRT
> repository. So far, following changes was made to make upstreaming
> easier:
> - everything what can be some how used in user space was removed. Most
>   of it was debug functionality.
> - most of deficetree bindings was removed. Not every thing made sense
>   and most of it is SoC specific, so it is possible to detect it by
>   compatible.
> - mac and mdio parts are merged in to one driver. It makes easier to
>   maintaine SoC specific quirks.

Series applied, thanks.
