From: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
Subject: Re: [PATCHi v2] net: sh_eth: Add support of device tree probe
Date: Wed, 27 Feb 2013 09:39:15 +0900
Message-ID: <512D55B3.3070707@renesas.com>
References: <1360803091-26400-1-git-send-email-nobuhiro.iwamatsu.yj@renesas.com>
 <87mwv7ofgj.wl%kuninori.morimoto.gx@renesas.com>
 <511C5279.3070008@renesas.com> <20130222184918.GC31345@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netdev-owner@vger.kernel.org>
In-reply-to: <20130222184918.GC31345@verge.net.au>
Sender: netdev-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, netdev@vger.kernel.org, magnus.damm@gmail.com, devicetree-discuss@lists.ozlabs.org, kda@linux-powerpc.org
List-Id: devicetree@vger.kernel.org

Hi, Simon.

This does not apply yet to upstream.
I will send a patch without of_device_is_available=E3=80=80function.

Best regards,
   Nobuhiro

(2013/02/23 3:49), Simon Horman wrote:
> On Thu, Feb 14, 2013 at 11:56:57AM +0900, Nobuhiro Iwamatsu wrote:
>> (2013/02/14 10:24), Kuninori Morimoto wrote:
>>>
>>> Hi Iwamatsu-san
>>>
>>> Thank you for this patch.
>>>
>>> Small comment from me
>>>
>>>> +#ifdef CONFIG_OF
>>> (snip)
>>>> +sh_eth_parse_dt(struct device *dev, struct net_device *ndev)
>>>> +{
>>>> +	int ret;
>>>> +	struct device_node *np =3D dev->of_node;
>>>> +	struct sh_eth_plat_data *pdata;
>>> ...
>>>> +#else
>>>> +static struct sh_eth_plat_data *
>>>> +sh_eth_parse_dt(struct device *dev, struct net_device *ndev)
>>>> +{
>>>> +	return NULL;
>>>> +}
>>>> +#endif
>>>
>>> (snip)
>>>
>>>>   static int sh_eth_drv_probe(struct platform_device *pdev)
>>>>   {
>>> ...
>>>> +#ifdef CONFIG_OF
>>>> +	if (np&&   of_device_is_available(np)) {
>>>> +		pd =3D sh_eth_parse_dt(&pdev->dev, ndev);
>>>> +		if (pdev->dev.platform_data) {
>>>> +			struct sh_eth_plat_data *tmp =3D
>>>> +				pdev->dev.platform_data;
>>>> +			pd->set_mdio_gate =3D tmp->set_mdio_gate;
>>>> +			pd->needs_init =3D tmp->needs_init;
>>>> +		}
>>>> +	} else
>>>> +#endif
>>>
>>> sh_eth_parse_dt() was defined for both CONFIG_OF and !CONFIG_OF.
>>> But it is called only from CONFIG_OF ?
>>>
>>
>> Because of_device_is_available needs CONFIG_OF.
>> I already send a patch which add empty function of of_device_is_avai=
lable.
>> If this was apply, this ifdef becomes without need.
>
> Hi Iwamatsu-san,
>
> could you let me know of the status of that patch?
> Has it been queued-up or merged? If so, where and when?
>
>
