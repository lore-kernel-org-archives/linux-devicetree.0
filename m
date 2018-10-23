From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v3 0/2] phy: ocelot-serdes: fix out-of-bounds read
Date: Mon, 22 Oct 2018 19:27:47 -0700 (PDT)
Message-ID: <20181022.192747.1517598401629589272.davem@davemloft.net>
References: <cover.1539940387.git.gustavo@embeddedor.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1539940387.git.gustavo@embeddedor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gustavo@embeddedor.com
Cc: linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, kishon@ti.com, quentin.schulz@bootlin.com, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Date: Fri, 19 Oct 2018 11:18:43 +0200

> This patchset aims to fix an out-of-bounds bug in
> the phy-ocelot-serdes driver.
> 
> Currently, there is an out-of-bounds read on array ctrl->phys,
> once variable i reaches the maximum array size of SERDES_MAX
> in the for loop.
> 
> Quentin Schulz pointed out that SERDES_MAX is a valid value to
> index ctrl->phys. So, I updated SERDES_MAX to be SERDES6G_MAX + 1
> in include/dt-bindings/phy/phy-ocelot-serdes.h.
> 
> Then I changed the condition in the for loop from
> i <= SERDES_MAX to i < SERDES_MAX in order to
> complete the fix.
> 
> The reason I'm sending this fix as series is because
> checkpatch reported an error when I first tried to
> integrate the whole solution into a singe patch. So,
> changes to dt-bindings should be sent as a separate
> patch.
> 
> Thanks!
> 
> Changes in v3:
>  - Post the series to netdev, so Dave can take it.
> 
> Changes in v2:
>  - Send the whole series to Kishon Vijay Abraham I, so it
>    can be taken into the PHY tree.
>  - Add Quentin's Reviewed-by to commit log in both patches.

Series applied.
