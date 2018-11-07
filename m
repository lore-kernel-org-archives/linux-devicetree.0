From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: [PATCH 06/15] Bluetooth: hci_bcm: Simplify clk_get error handling
Date: Wed, 7 Nov 2018 10:51:19 +0000
Message-ID: <20181107105119.GT30658@n2100.armlinux.org.uk>
References: <20181107101308.7626-1-wens@csie.org>
 <20181107101308.7626-7-wens@csie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181107101308.7626-7-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org, linux-sunxi@googlegroups.com, Loic Poulain <loic.poulain@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 07, 2018 at 06:12:59PM +0800, Chen-Yu Tsai wrote:
> @@ -911,6 +911,10 @@ static int bcm_get_resources(struct bcm_device *dev)
>  	if (IS_ERR(dev->clk) && PTR_ERR(dev->clk) == -EPROBE_DEFER)

You can also simplify the above test to:

	if (dev->clk == ERR_PTR(-EPROBE_DEFER))

as error pointers are uniquely different from normal pointers.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
