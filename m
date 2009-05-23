From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [net-next-2.6 PATCH v2] can: SJA1000: generic OF platform bus driver
Date: Sat, 23 May 2009 13:15:56 +0200
Message-ID: <200905231315.57016.arnd@arndb.de>
References: <4A16BAAE.3070401@grandegger.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <4A16BAAE.3070401@grandegger.com>
Content-Disposition: inline
Sender: netdev-owner@vger.kernel.org
To: devicetree-discuss@ozlabs.org
Cc: Wolfgang Grandegger <wg@grandegger.com>, Linux Netdev List <netdev@vger.kernel.org>, linuxppc-dev <Linuxppc-dev@ozlabs.org>
List-Id: devicetree@vger.kernel.org

On Friday 22 May 2009, Wolfgang Grandegger wrote:
> This patch adds a generic driver for SJA1000 chips on the OpenFirmware
> platform bus found on embedded PowerPC systems. 

Nice driver!

> +static u8 sja1000_ofp_read_reg(const struct net_device *dev, int reg)
> +{
> +	return in_8((void __iomem *)(dev->base_addr + reg));
> +}
> +
> +static void sja1000_ofp_write_reg(const struct net_device *dev, int reg, u8 val)
> +{
> +	out_8((void __iomem *)(dev->base_addr + reg), val);
> +}

Minor nitpicking: dev->base_addr should be defined as an __iomem pointer
so you can avoid the cast here and in the ioremap/iounmap path.

	Arnd <><
