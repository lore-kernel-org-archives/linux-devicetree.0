From: =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
Subject: Re: [PATCH net-next 3/3] net: dsa: mt7530: Add support for port 5
Date: Sat, 27 Jul 2019 18:43:05 +0000
Message-ID: <20190727184305.Horde.vkqh7I-8IM_ifnVhhIU9l2c@www.vdorst.com>
References: <20190724192549.24615-1-opensource@vdorst.com>
 <20190724192549.24615-4-opensource@vdorst.com>
 <20190726.140420.688330328284393964.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190726.140420.688330328284393964.davem@davemloft.net>
Content-Disposition: inline
Sender: netdev-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: netdev@vger.kernel.org, frank-w@public-files.de, sean.wang@mediatek.com, f.fainelli@gmail.com, linux@armlinux.org.uk, matthias.bgg@gmail.com, andrew@lunn.ch, vivien.didelot@gmail.com, john@phrozen.org, linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting David Miller <davem@davemloft.net>:

> From: René van Dorst <opensource@vdorst.com>
> Date: Wed, 24 Jul 2019 21:25:49 +0200
>
>> @@ -1167,6 +1236,10 @@ mt7530_setup(struct dsa_switch *ds)
>>  	u32 id, val;
>>  	struct device_node *dn;
>>  	struct mt7530_dummy_poll p;
>> +	phy_interface_t interface;
>> +	struct device_node *mac_np;
>> +	struct device_node *phy_node;
>> +	const __be32 *_id;
>

Hi David,

> Reverse christmas tree here please.
>
> Thank you.

OK, I shall change that.
I spin a new version.

Greats,

René
