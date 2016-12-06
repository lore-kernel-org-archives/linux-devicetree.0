From: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 2/2] mtd: spi-nor: add rockchip serial flash controller
 driver
Date: Tue, 6 Dec 2016 04:08:23 +0100
Message-ID: <cdc8647b-77c5-5d74-931c-46bcebafae65@gmail.com>
References: <1480906577-38455-1-git-send-email-shawn.lin@rock-chips.com>
 <1480906577-38455-3-git-send-email-shawn.lin@rock-chips.com>
 <852b11c2-daf3-75dc-a5c6-576109a974a9@gmail.com>
 <8cac8489-3fd1-bfc3-9a25-a3fbda74e03e@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8cac8489-3fd1-bfc3-9a25-a3fbda74e03e-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12/06/2016 03:56 AM, Shawn Lin wrote:

[...]

>>> +static inline void rockchip_sfc_setup_transfer(struct spi_nor *nor,
>>> +                           loff_t from_to,
>>> +                           size_t len, u8 op_type)
>>> +{
>>> +    struct rockchip_sfc_chip_priv *priv = nor->priv;
>>> +    struct rockchip_sfc *sfc = priv->sfc;
>>> +    u32 reg;
>>> +    u8 if_type = 0;
>>> +
>>> +    if_type = get_if_type(sfc, nor->flash_read);
>>> +    writel_relaxed((if_type << SFC_CTRL_DATA_BITS_SHIFT) |
>>> +               (if_type << SFC_CTRL_ADDR_BITS_SHIFT) |
>>> +               (if_type << SFC_CTRL_CMD_BITS_SHIFT) |
>>
>> Hm, looking at this, does the controller only support n-n-n mode (1-1-1,
>> 2-2-2, 4-4-4) ? Or why don't you allow 1-1-n/1-n-n/2-n-n ?
> 
> No, it also could support 1-1-n, etc.
> By looking at the cadence-quadspi.c,  it only allows
> CQSPI_INST_TYPE_SINGLE for f_pdata->addr_width and f_pdata->inst_width,
> so finally it only supports 1-1-1, 1-1-2, 1-1-4?
> 
>> I would like to hear some input from Cyrille on this one.

The CQSPI driver indeed does only 1-1-x read thus far.
I am not sure whether support for the other modes in the SPI NOR
subsystem landed already, which is why I'd like to hear from
Cyrille here.

[...]

>>> +#ifdef CONFIG_PM
>>> +int rockchip_sfc_runtime_suspend(struct device *dev)
>>> +{
>>> +    struct rockchip_sfc *sfc = dev_get_drvdata(dev);
>>> +
>>> +    clk_disable_unprepare(sfc->hclk);
>>> +    return 0;
>>> +}
>>
>> Was the suspend ever really tested with this block ? Is disabling clock
>> really enough ?
> 
> It was tested and we could do more, for instance power off the genpd,
> but disabling clcok should be enough.

What about putting the controller into some reset state , is that possible?

>>> +int rockchip_sfc_runtime_resume(struct device *dev)
>>> +{
>>> +    struct rockchip_sfc *sfc = dev_get_drvdata(dev);
>>> +
>>> +    clk_prepare_enable(sfc->hclk);
>>> +    return 0;
>>> +}
>>> +#endif /* CONFIG_PM */
>>
>> [...]
>>
> 
> 


-- 
Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
