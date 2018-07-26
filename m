From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 2/7] net: phy: Fix the register offsets in Broadcom iProc
 mdio mux driver
Date: Thu, 26 Jul 2018 21:06:36 +0200
Message-ID: <20180726190636.GG10686@lunn.ch>
References: <1532630184-29450-1-git-send-email-arun.parameswaran@broadcom.com>
 <1532630184-29450-3-git-send-email-arun.parameswaran@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1532630184-29450-3-git-send-email-arun.parameswaran@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arun Parameswaran <arun.parameswaran@broadcom.com>
Cc: "David S. Miller" <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

On Thu, Jul 26, 2018 at 11:36:19AM -0700, Arun Parameswaran wrote:
> Modify the register offsets in the Broadcom iProc mdio mux to start
> from the top of the register address space.
> 
> Earlier the base address specified was from the middle of the block's
> register space. The base address will now point to the start of the
> mdio's address space. The offsets have been fixed to match this.

Hi Arun

Did you consider a change something like:

diff --git a/drivers/net/phy/mdio-mux-bcm-iproc.c b/drivers/net/phy/mdio-mux-bcm-iproc.c
index 0831b7142df7..2d53e609498c 100644
--- a/drivers/net/phy/mdio-mux-bcm-iproc.c
+++ b/drivers/net/phy/mdio-mux-bcm-iproc.c
@@ -169,6 +169,12 @@ static int mdio_mux_iproc_probe(struct platform_device *pdev)
        md->dev = &pdev->dev;
 
        res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+
+       if (res->start & 0xfff != 0) {
+               dev_info(&pdev->dev, "Please upgrade your device tree blob.\n");
+               res->start &= ~0xfff;
+       }
+
        md->base = devm_ioremap_resource(&pdev->dev, res);
        if (IS_ERR(md->base)) {
                dev_err(&pdev->dev, "failed to ioremap register\n");


	Andrew
