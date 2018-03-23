From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [RFC PATCH v2] net: phy: Added device tree binding for dev-addr
 and dev-addr code check-up
Date: Fri, 23 Mar 2018 16:44:41 +0100
Message-ID: <20180323154441.GE24361@lunn.ch>
References: <20180323150522.9603-1-vicentiu.galanopulo@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180323150522.9603-1-vicentiu.galanopulo@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vicentiu Galanopulo <vicentiu.galanopulo@nxp.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, davem@davemloft.net, marcel@holtmann.org, devicetree@vger.kernel.org, madalin.bucur@nxp.com, alexandru.marginean@nxp.com
List-Id: devicetree@vger.kernel.org

> --- a/drivers/of/of_mdio.c
> +++ b/drivers/of/of_mdio.c
> @@ -24,6 +24,8 @@
>  
>  #define DEFAULT_GPIO_RESET_DELAY	10	/* in microseconds */
>  
> +struct phy_c45_device_ids mdio_c45_ids = {0};

You do know that Linux is multi-threaded. It could be probing two MDIO
busses at once.

	Andrew
