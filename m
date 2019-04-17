From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH] of_net: add mtd-mac-address support to
 of_get_mac_address()
Date: Tue, 16 Apr 2019 17:29:16 -0700
Message-ID: <d29bcf08-9299-8f2c-00bc-791b60658581@gmail.com>
References: <1555445100-30936-1-git-send-email-ynezz@true.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1555445100-30936-1-git-send-email-ynezz@true.cz>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: =?UTF-8?Q?Petr_=c5=a0tetiar?= <ynezz@true.cz>, netdev@vger.kernel.org, devicetree@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Frank Rowand <frowand.list@gmail.com>, John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>
List-Id: devicetree@vger.kernel.org



On 16/04/2019 13:05, Petr Štetiar wrote:
> From: John Crispin <john@phrozen.org>
> 
> Many embedded devices have information such as MAC addresses stored
> inside MTD devices. This patch allows us to add a property inside a node
> describing a network interface. The new property points at a MTD
> partition with an offset where the MAC address can be found.
> 
> This patch has originated in OpenWrt some time ago, so in order to
> consider usefulness of this patch, here are some real-world numbers
> which hopefully speak for themselves:
> 
>   * mtd-mac-address                used 497 times in 357 device tree files
>   * mtd-mac-address-increment      used  74 times in  58 device tree files
>   * mtd-mac-address-increment-byte used   1 time  in   1 device tree file
> 
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> [cleanup of the patch for upstream submission]
> Signed-off-by: Petr Štetiar <ynezz@true.cz>
> ---

[snip]

> +static const void *of_get_mac_address_mtd(struct device_node *np)
> +{
> +#ifdef CONFIG_MTD
> +	void *addr;
> +	size_t retlen;
> +	int size, ret;
> +	u8 mac[ETH_ALEN];
> +	phandle phandle;
> +	const char *part;
> +	const __be32 *list;
> +	struct mtd_info *mtd;
> +	struct property *prop;
> +	u32 mac_inc = 0;
> +	u32 inc_idx = ETH_ALEN-1;
> +	struct device_node *mtd_np = NULL;

Reverse christmas tree would look a bit nicer here.

> +
> +	list = of_get_property(np, "mtd-mac-address", &size);
> +	if (!list || (size != (2 * sizeof(*list))))
> +		return NULL;
> +
> +	phandle = be32_to_cpup(list++);
> +	if (phandle)
> +		mtd_np = of_find_node_by_phandle(phandle);
> +
> +	if (!mtd_np)
> +		return NULL;
> +
> +	part = of_get_property(mtd_np, "label", NULL);
> +	if (!part)
> +		part = mtd_np->name;
> +
> +	mtd = get_mtd_device_nm(part);
> +	if (IS_ERR(mtd))
> +		return NULL;
> +
> +	ret = mtd_read(mtd, be32_to_cpup(list), ETH_ALEN, &retlen, mac);
> +	put_mtd_device(mtd);
> +
> +	of_property_read_u32(np, "mtd-mac-address-increment-byte", &inc_idx);

of_property_read_u8() would probably be good here since this can't be 
bigger than 5 anyway.

> +	if (inc_idx > ETH_ALEN-1)
> +		return NULL; >
> +	if (!of_property_read_u32(np, "mtd-mac-address-increment", &mac_inc))
> +		mac[inc_idx] += mac_inc;

If I use a number greater than and included 128; this will cause a roll 
over, should this be range checked? Similarly, using 
of_property_read_u8() might be a better fit?

Other than those, LGTM
-- 
Florian
