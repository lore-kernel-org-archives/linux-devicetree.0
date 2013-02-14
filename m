From: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
Subject: Re: [PATCHi v2] net: sh_eth: Add support of device tree probe
Date: Thu, 14 Feb 2013 11:56:57 +0900
Message-ID: <511C5279.3070008@renesas.com>
References: <1360803091-26400-1-git-send-email-nobuhiro.iwamatsu.yj@renesas.com>
 <87mwv7ofgj.wl%kuninori.morimoto.gx@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-reply-to: <87mwv7ofgj.wl%kuninori.morimoto.gx@renesas.com>
Sender: netdev-owner@vger.kernel.org
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: netdev@vger.kernel.org, horms+renesas@verge.net.au, magnus.damm@gmail.com, devicetree-discuss@lists.ozlabs.org, kda@linux-powerpc.org
List-Id: devicetree@vger.kernel.org

(2013/02/14 10:24), Kuninori Morimoto wrote:
>
> Hi Iwamatsu-san
>
> Thank you for this patch.
>
> Small comment from me
>
>> +#ifdef CONFIG_OF
> (snip)
>> +sh_eth_parse_dt(struct device *dev, struct net_device *ndev)
>> +{
>> +	int ret;
>> +	struct device_node *np = dev->of_node;
>> +	struct sh_eth_plat_data *pdata;
> ...
>> +#else
>> +static struct sh_eth_plat_data *
>> +sh_eth_parse_dt(struct device *dev, struct net_device *ndev)
>> +{
>> +	return NULL;
>> +}
>> +#endif
>
> (snip)
>
>>   static int sh_eth_drv_probe(struct platform_device *pdev)
>>   {
> ...
>> +#ifdef CONFIG_OF
>> +	if (np&&  of_device_is_available(np)) {
>> +		pd = sh_eth_parse_dt(&pdev->dev, ndev);
>> +		if (pdev->dev.platform_data) {
>> +			struct sh_eth_plat_data *tmp =
>> +				pdev->dev.platform_data;
>> +			pd->set_mdio_gate = tmp->set_mdio_gate;
>> +			pd->needs_init = tmp->needs_init;
>> +		}
>> +	} else
>> +#endif
>
> sh_eth_parse_dt() was defined for both CONFIG_OF and !CONFIG_OF.
> But it is called only from CONFIG_OF ?
>

Because of_device_is_available needs CONFIG_OF.
I already send a patch which add empty function of of_device_is_available.
If this was apply, this ifdef becomes without need.

Best,
   Nobuhiro
