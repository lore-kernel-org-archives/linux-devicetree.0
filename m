From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] ARM: dts: ls1021a: Specify TBIPA register address
Date: Sun, 08 Apr 2018 12:45:09 -0400 (EDT)
Message-ID: <20180408.124509.41759803832731428.davem@davemloft.net>
References: <20180406123836.12019-2-esben.haabendal@gmail.com>
        <20180406124635.12319-1-esben.haabendal@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180406124635.12319-1-esben.haabendal@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: esben.haabendal@gmail.com
Cc: netdev@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, claudiu.manoil@freescale.com, garsilva@embeddedor.com, eha@deif.com
List-Id: devicetree@vger.kernel.org

From: Esben Haabendal <esben.haabendal@gmail.com>
Date: Fri,  6 Apr 2018 14:46:35 +0200

> From: Esben Haabendal <eha@deif.com>
> 
> The current (mildly evil) fsl_pq_mdio code uses an undocumented shadow of
> the TBIPA register on LS1021A, which happens to be read-only.
> Changing TBI PHY address therefore does not work on LS1021A.
> 
> The real (and documented) address of the TBIPA registere lies in the eTSEC
> block and not in MDIO/MII, which is read/write, so using that fixes
> the problem.
> 
> Signed-off-by: Esben Haabendal <eha@deif.com>

Applied.
