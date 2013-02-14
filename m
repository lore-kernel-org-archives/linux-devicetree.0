From: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
Subject: Re: [PATCHi v2] net: sh_eth: Add support of device tree probe
Date: Fri, 15 Feb 2013 08:07:13 +0900
Message-ID: <CABMQnVLVW1fbmZSsZeshB8=NgyYLK67Lv9xydLeQmDLdM8FrmA@mail.gmail.com>
References: <1360803091-26400-1-git-send-email-nobuhiro.iwamatsu.yj@renesas.com>
 <87mwv7ofgj.wl%kuninori.morimoto.gx@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <87mwv7ofgj.wl%kuninori.morimoto.gx@renesas.com>
Sender: netdev-owner@vger.kernel.org
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: netdev@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, magnus.damm@gmail.com, kda@linux-powerpc.org, horms+renesas@verge.net.au
List-Id: devicetree@vger.kernel.org

On Thu, Feb 14, 2013 at 10:24 AM, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
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
>> +     int ret;
>> +     struct device_node *np = dev->of_node;
>> +     struct sh_eth_plat_data *pdata;
> ...
>> +#else
>> +static struct sh_eth_plat_data *
>> +sh_eth_parse_dt(struct device *dev, struct net_device *ndev)
>> +{
>> +     return NULL;
>> +}
>> +#endif
>
> (snip)
>
>>  static int sh_eth_drv_probe(struct platform_device *pdev)
>>  {
> ...
>> +#ifdef CONFIG_OF
>> +     if (np && of_device_is_available(np)) {
>> +             pd = sh_eth_parse_dt(&pdev->dev, ndev);
>> +             if (pdev->dev.platform_data) {
>> +                     struct sh_eth_plat_data *tmp =
>> +                             pdev->dev.platform_data;
>> +                     pd->set_mdio_gate = tmp->set_mdio_gate;
>> +                     pd->needs_init = tmp->needs_init;
>> +             }
>> +     } else
>> +#endif
>
> sh_eth_parse_dt() was defined for both CO NFIG_OF and !CONFIG_OF.
> But it is called only from CONFIG_OF ?
>
Because of_device_is_available depennds CONFIG_OF.
I already send a patch which add empty fuction of of_device_is_available.
If this was applied, your point does not need.

OK, I erase empty sh_eth_parse_dt, and if a patch is applied, I will
update this.

Regards,
 Nobuhiro

-- 
Nobuhiro Iwamatsu
