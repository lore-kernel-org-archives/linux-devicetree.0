From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH 1/2] net/fsl_pq_mdio: Allow explicit speficition of
 TBIPA address
Date: Sun, 08 Apr 2018 12:45:03 -0400 (EDT)
Message-ID: <20180408.124503.332537054164377764.davem@davemloft.net>
References: <20180406123836.12019-1-esben.haabendal@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180406123836.12019-1-esben.haabendal@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: esben.haabendal@gmail.com
Cc: netdev@vger.kernel.org, eha@deif.com, claudiu.manoil@freescale.com, robh+dt@kernel.org, mark.rutland@arm.com, garsilva@embeddedor.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Esben Haabendal <esben.haabendal@gmail.com>
Date: Fri,  6 Apr 2018 14:38:34 +0200

> From: Esben Haabendal <eha@deif.com>
> 
> This introduces a simpler and generic method for for finding (and mapping)
> the TBIPA register.
> 
> Instead of relying of complicated logic for finding the TBIPA register
> address based on the MDIO or MII register block base
> address, which even in some cases relies on undocumented shadow registers,
> a second "reg" entry for the mdio bus devicetree node specifies the TBIPA
> register.
> 
> Backwards compatibility is kept, as the existing logic is applied when
> only a single "reg" mapping is specified.
> 
> Signed-off-by: Esben Haabendal <eha@deif.com>

Applied.
