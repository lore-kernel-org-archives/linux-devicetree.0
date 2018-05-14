From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH] net: phy: micrel: workaround for errata #2 for KSZ9031
Date: Mon, 14 May 2018 12:41:39 +0300
Message-ID: <58661916-1a0a-b6cb-ed47-d98499116441@cogentembedded.com>
References: <20180514082218.29158-1-m.felsch@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180514082218.29158-1-m.felsch@pengutronix.de>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Marco Felsch <m.felsch@pengutronix.de>, robh+dt@kernel.org, mark.rutland@arm.com, andrew@lunn.ch, f.fainelli@gmail.com
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, Markus Niebel <Markus.Niebel@tqs.de>
List-Id: devicetree@vger.kernel.org

Hello!

On 5/14/2018 11:22 AM, Marco Felsch wrote:

> From: Markus Niebel <Markus.Niebel@tqs.de>
> 
> handle errata #2 for KSZ9031: force 1000Base-T master
> 
> Attention: enabling the workaround will cause no link to
> other GIGE master.
> 
> Signed-off-by: Markus Niebel <Markus.Niebel@tqs.de>
> [m.felsch@pengutronix.de: move dt binding to the KSZ9031 entry]
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
[...]
> @@ -573,6 +575,22 @@ static int ksz9031_config_init(struct phy_device *phydev)
>   		ksz9031_of_load_skew_values(phydev, of_node,
>   				MII_KSZ9031RN_TX_DATA_PAD_SKEW, 4,
>   				tx_data_skews, 4);
> +
> +		/* force master mode -> errata #2
> +		 * attention: Master <-> Master will not work
> +		 */
> +		if (of_property_read_bool(of_node, "force-master")) {
> +			rc = phy_read(phydev, MII_CTRL1000);
> +			if (rc >= 0) {
> +				val = (u16)rc;
> +				/* enable master mode, config &
> +				 * prefer master
> +				 */
> +				val |= (CTL1000_ENABLE_MASTER |
> +					CTL1000_AS_MASTER);

   Parens not needed.

> +				phy_write(phydev, MII_CTRL1000, val);
> +			}
> +		}
>   	}
>   
>   	return ksz9031_center_flp_timing(phydev);
> 

MBR, Sergei
