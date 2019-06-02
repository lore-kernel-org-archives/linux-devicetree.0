From: Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH net-next 00/10] net: ethernet: ti: netcp: update and
 enable cpts support
Date: Sun, 2 Jun 2019 12:52:49 -0700
Message-ID: <20190602195129.hjx5qyzqxyirdkx7@localhost>
References: <20190601104534.25790-1-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190601104534.25790-1-grygorii.strashko@ti.com>
Sender: netdev-owner@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: "David S. Miller" <davem@davemloft.net>, Santosh Shilimkar <ssantosh@kernel.org>, Rob Herring <robh+dt@kernel.org>, Sekhar Nori <nsekhar@ti.com>, Murali Karicheri <m-karicheri2@ti.com>, Wingman Kwok <w-kwok2@ti.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sat, Jun 01, 2019 at 01:45:24PM +0300, Grygorii Strashko wrote:
> The Keystone 2 66AK2HK/E/L 1G Ethernet Switch Subsystems contains The
> Common Platform Time Sync (CPTS) module which is in general compatible with
> CPTS module found on TI AM3/4/5 SoCs. So, the basic support for
> Keystone 2 CPTS is available by default, but not documented and has never been
> enabled inconfig files.
> 
> The Keystone 2 CPTS module supports also some additional features like time
> sync reference (RFTCLK) clock selection through CPTS_RFTCLK_SEL register
> (offset: x08) in CPTS module, which can modelled as multiplexer clock
> (this was discussed some time ago [1]).
> 
> This series adds missed binding documentation for Keystone 2 66AK2HK/E/L
> CPTS module and enables CPTS for TI Keystone 2 66AK2HK/E/L SoCs with possiblity
> to select CPTS reference clock.

For the series:

Acked-by: Richard Cochran <richardcochran@gmail.com>
