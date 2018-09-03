From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v2 net-next 3/7] net: dsa: Add Lantiq / Intel GSWIP tag
 support
Date: Mon, 3 Sep 2018 11:52:44 -0700
Message-ID: <b13de4db-f115-e7d5-9efd-0af18f947978@gmail.com>
References: <20180901114535.9070-1-hauke@hauke-m.de>
 <20180901120332.9792-1-hauke@hauke-m.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180901120332.9792-1-hauke@hauke-m.de>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Hauke Mehrtens <hauke@hauke-m.de>, davem@davemloft.net
Cc: netdev@vger.kernel.org, andrew@lunn.ch, vivien.didelot@savoirfairelinux.com, john@phrozen.org, linux-mips@linux-mips.org, dev@kresin.me, hauke.mehrtens@intel.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 9/1/2018 5:03 AM, Hauke Mehrtens wrote:
> This handles the tag added by the PMAC on the VRX200 SoC line.
> 
> The GSWIP uses internally a GSWIP special tag which is located after the
> Ethernet header. The PMAC which connects the GSWIP to the CPU converts
> this special tag used by the GSWIP into the PMAC special tag which is
> added in front of the Ethernet header.
> 
> This was tested with GSWIP 2.1 found in the VRX200 SoCs, other GSWIP
> versions use slightly different PMAC special tags.
> 
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>

Just one suggestion below, if you need to resubmit this:

[snip]

> +static struct sk_buff *gswip_tag_rcv(struct sk_buff *skb,
> +				     struct net_device *dev,
> +				     struct packet_type *pt)
> +{
> +	int port;
> +	u8 *gswip_tag;
> +
> +	if (unlikely(!pskb_may_pull(skb, GSWIP_RX_HEADER_LEN)))
> +		return NULL;
> +
> +	gswip_tag = skb->data - ETH_HLEN;
> +	skb_pull_rcsum(skb, GSWIP_RX_HEADER_LEN);

I would be moving this after the port lookup was successful, that way if 
you are discarding a frame, you can do this as quickly as possible, this 
should not have a functional impact since you return a skb with the 
checksum updated past the return of that function.
-- 
Florian
