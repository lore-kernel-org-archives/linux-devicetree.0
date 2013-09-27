From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: device tree binding documentation outdated
Date: Fri, 27 Sep 2013 10:49:02 +0100
Message-ID: <20130927094902.GX12758@n2100.arm.linux.org.uk>
References: <20130926195158.GS12758@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130926195158.GS12758-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Here's another instance:

Documentation/devicetree/bindings/net/fsl-fec.txt:

Required properties:
- phy-mode : String, operation mode of the PHY interface.
  Supported values are: "mii", "gmii", "sgmii", "tbi", "rmii",
  "rgmii", "rgmii-id", "rgmii-rxid", "rgmii-txid", "rtbi", "smii".

Is this really required?  Maybe someone can point to where the code
makes use of this, because I'm damned if I can find it:

$ grep phy-mode drivers/net/ include/ net/ -r
drivers/net/ethernet/marvell/mvneta.c:              dev_err(&pdev->dev, "incorrect phy-mode\n");
drivers/net/ethernet/nxp/lpc_eth.c:                                            phy-mode", NULL);

"local-mac-address" in the optional properties also falls into this
category: only a small handful of network drivers make use of this,
and fec is not one of them.

What's the use of documentation if its inaccurate.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
