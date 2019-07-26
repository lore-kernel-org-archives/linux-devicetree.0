From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net-next 3/3] net: dsa: mt7530: Add support for port 5
Date: Fri, 26 Jul 2019 14:04:20 -0700 (PDT)
Message-ID: <20190726.140420.688330328284393964.davem@davemloft.net>
References: <20190724192549.24615-1-opensource@vdorst.com>
        <20190724192549.24615-4-opensource@vdorst.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190724192549.24615-4-opensource@vdorst.com>
Sender: netdev-owner@vger.kernel.org
To: opensource@vdorst.com
Cc: netdev@vger.kernel.org, frank-w@public-files.de, sean.wang@mediatek.com, f.fainelli@gmail.com, linux@armlinux.org.uk, matthias.bgg@gmail.com, andrew@lunn.ch, vivien.didelot@gmail.com, john@phrozen.org, linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: René van Dorst <opensource@vdorst.com>
Date: Wed, 24 Jul 2019 21:25:49 +0200

> @@ -1167,6 +1236,10 @@ mt7530_setup(struct dsa_switch *ds)
>  	u32 id, val;
>  	struct device_node *dn;
>  	struct mt7530_dummy_poll p;
> +	phy_interface_t interface;
> +	struct device_node *mac_np;
> +	struct device_node *phy_node;
> +	const __be32 *_id;

Reverse christmas tree here please.

Thank you.
