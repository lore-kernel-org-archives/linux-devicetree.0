From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCHv3] mvebu: add Linksys WRT1900AC (Mamba) support
Date: Wed, 18 Feb 2015 14:54:43 +0100
Message-ID: <20150218135443.GJ10224@lunn.ch>
References: <1424089864-15651-1-git-send-email-kaloz@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1424089864-15651-1-git-send-email-kaloz-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Imre Kaloz <kaloz-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 16, 2015 at 01:31:04PM +0100, Imre Kaloz wrote:
> The Linksys WRT1900AC (Mamba) is a router that has
> 
> - 2 mini-PCIe slots with Marvell 88W8864 radios
> - 1 USB 3.0 port
> - 1 USB 2.0/eSATAp port
> - 2 Ethernet interfaces connected to a 88E6172 switch (1x WAN + 4x LAN)
> - 128MB NAND flash
> - 256MB RAM
> 
> Signed-off-by: Imre Kaloz <kaloz-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>

Hi Imre

This looks good now.

Acked-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>

I want to test this, and add a Tested-by:, and add support for the
switch, but i don't have time for this at the moment.

	Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
