From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v1 2/2] net: npcm: add NPCM7xx EMC 10/100 Ethernet
 driver
Date: Thu, 01 Aug 2019 12:27:45 -0400 (EDT)
Message-ID: <20190801.122745.9301893283319822.davem@davemloft.net>
References: <20190801072611.27935-1-avifishman70@gmail.com>
        <20190801072611.27935-3-avifishman70@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190801072611.27935-3-avifishman70@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: avifishman70@gmail.com
Cc: venture@google.com, yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org, mark.rutland@arm.com, gregkh@linuxfoundation.org, tmaimon77@gmail.com, tali.perry1@gmail.com, openbmc@lists.ozlabs.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, tglx@linutronix.de
List-Id: devicetree@vger.kernel.org

From: Avi Fishman <avifishman70@gmail.com>
Date: Thu,  1 Aug 2019 10:26:11 +0300

> +#Eternet 10/100 EMC

"Ethernet"

> +#ifdef CONFIG_NPCM7XX_EMC_ETH_DEBUG
> +#define DEBUG
> +#endif

Please don't control the DEBUG define in this way.

> +#if defined CONFIG_NPCM7XX_EMC_ETH_DEBUG || defined CONFIG_DEBUG_FS
> +#define REG_PRINT(reg_name) {t = scnprintf(next, size, "%-10s = %08X\n", \
> +	#reg_name, readl(ether->reg + (reg_name))); size -= t;	next += t; }
> +#define DUMP_PRINT(f, x...) {t = scnprintf(next, size, f, ## x); size -= t; \
> +	next += t; }

Really, get rid of this custom debugging infrastructure and just use
generic facilities the kernel has for this, as designed.

> +static int npcm7xx_info_dump(char *buf, int count, struct net_device *netdev)
> +{
> +	struct npcm7xx_ether *ether = netdev_priv(netdev);
> +	struct npcm7xx_txbd *txbd;
> +	struct npcm7xx_rxbd *rxbd;
> +	unsigned long flags;
> +	unsigned int i, cur, txd_offset, rxd_offset;
> +	char *next = buf;
> +	unsigned int size = count;
> +	int t;
> +	int is_locked = spin_is_locked(&ether->lock);

Reverse christmas tree (longest to shortest) ordering for local variables
please.

Audit your entire submission for this problem.
