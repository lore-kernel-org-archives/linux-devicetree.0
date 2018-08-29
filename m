From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] sh_eth: Add R7S9210 support
Date: Tue, 28 Aug 2018 19:53:48 -0500
Message-ID: <20180829005348.GA14821@bogus>
References: <20180827174202.80750-1-chris.brandt@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180827174202.80750-1-chris.brandt@renesas.com>
Sender: netdev-owner@vger.kernel.org
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, "David S . Miller" <davem@davemloft.net>, Mark Rutland <mark.rutland@arm.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 27, 2018 at 12:42:02PM -0500, Chris Brandt wrote:
> Add support for the R7S9210 which is part of the RZ/A2 series.
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
> v2:
>  * Use sh_eth_offset_fast_sh4 instead of sh_eth_offset_fast_rza2
>  * Use sh_eth_set_rate_rcar instead of sh_eth_set_rate_r7s9210()
>  * Removed enum SH_ETH_REG_FAST_RZA2
> ---
>  Documentation/devicetree/bindings/net/sh_eth.txt |  1 +

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/net/ethernet/renesas/sh_eth.c            | 36 ++++++++++++++++++++++++
>  2 files changed, 37 insertions(+)
