From: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v3 2/2] mtd: spi-nor: add rockchip serial flash controller
 driver
Date: Tue, 13 Dec 2016 09:24:54 +0800
Message-ID: <05e7b05c-f4a4-f747-f6bd-44b89fd33b00@rock-chips.com>
References: <1480906577-38455-1-git-send-email-shawn.lin@rock-chips.com>
 <1480906577-38455-3-git-send-email-shawn.lin@rock-chips.com>
 <852b11c2-daf3-75dc-a5c6-576109a974a9@gmail.com>
 <8cac8489-3fd1-bfc3-9a25-a3fbda74e03e@rock-chips.com>
 <cdc8647b-77c5-5d74-931c-46bcebafae65@gmail.com>
 <8fae0968-5e3d-2454-c79c-599bc55ac0e5@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8fae0968-5e3d-2454-c79c-599bc55ac0e5-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 2016/12/6 23:44, Cyrille Pitchen wrote:
> Hi all,
>
> Le 06/12/2016 à 04:08, Marek Vasut a écrit :
>> On 12/06/2016 03:56 AM, Shawn Lin wrote:
>>
>> [...]
>>
>>>>> +static inline void rockchip_sfc_setup_transfer(struct spi_nor *nor,
>>>>> +                           loff_t from_to,
>>>>> +                           size_t len, u8 op_type)
>>>>> +{
>>>>> +    struct rockchip_sfc_chip_priv *priv = nor->priv;
>>>>> +    struct rockchip_sfc *sfc = priv->sfc;
>>>>> +    u32 reg;
>>>>> +    u8 if_type = 0;
>>>>> +
>>>>> +    if_type = get_if_type(sfc, nor->flash_read);
>>>>> +    writel_relaxed((if_type << SFC_CTRL_DATA_BITS_SHIFT) |
>>>>> +               (if_type << SFC_CTRL_ADDR_BITS_SHIFT) |
>>>>> +               (if_type << SFC_CTRL_CMD_BITS_SHIFT) |
>>>>
>>>> Hm, looking at this, does the controller only support n-n-n mode (1-1-1,
>>>> 2-2-2, 4-4-4) ? Or why don't you allow 1-1-n/1-n-n/2-n-n ?
>>>
>>> No, it also could support 1-1-n, etc.
>>> By looking at the cadence-quadspi.c,  it only allows
>>> CQSPI_INST_TYPE_SINGLE for f_pdata->addr_width and f_pdata->inst_width,
>>> so finally it only supports 1-1-1, 1-1-2, 1-1-4?
>>>
>>>> I would like to hear some input from Cyrille on this one.
>>
>> The CQSPI driver indeed does only 1-1-x read thus far.
>> I am not sure whether support for the other modes in the SPI NOR
>> subsystem landed already, which is why I'd like to hear from
>> Cyrille here.
>>
>> [...]
>>
>
> No, the support of SPI protocols other than 1-1-z has not been merged yet
> into the spi-nor subsystem. I've sent it as part of the SFDP series, since
> then I've been waiting for more reviews and approvals before merging it
> because I don't want to force anything and wait to avoid regression.
>
> Recently I was thinking about splitting the series into smaller and almost
> independent topics. For instance the Macronix patch to improve the
> management of the Quad Enable bit is a stand alone patch.
>
> Then the patch about improving support of > 128Mbit memory by using the
> dedicated 4-byte instruction set only depends on the patch renaming some
> SPINOR_OP_* macros to unify the use of the "_4B" suffix. Those two patches
> solve the issue of bootloaders which fail to read from SPI flash when the
> memory has entered its statefull 4-byte address mode.
>
> Next, there are 3 patches to add support to SPI protocols 1-y-z. I guess
> they are the patches your are talking about. Those patches prepares the
> move to the SFDP support but actually they can be also be used as is just
> to use SPI 1-y-z protocol without talking about SFDP.
>
> Finally, the last patches introduce the SFDP support. As I said, there are
> not mandatory for your use case if you only want to test SPI protocols such
> as 1-4-4.
>
> In your case, you might be interested in reviewing/testing:
>

Thanks for sharing these patches and I will test them. :)



> [v4, 4/8] mtd: spi-nor: add support of SPI protocols like SPI 1-2-2 and
> SPI-1-4-4
> http://patchwork.ozlabs.org/patch/697268/
> This is the main patch.
>
> [v4, 5/8] mtd: spi-nor: remove unused set_quad_mode() function
> http://patchwork.ozlabs.org/patch/697269/
> Only small cleanup, please read the commit message for more explination
>
> [v4, 6/8] mtd: m25p80: add support of dual and quad spi protocols to all
> commands
> http://patchwork.ozlabs.org/patch/697270/
> This one is not need when testing with this rockchip serial flash
> controller driver as it directly calls spi_nor_scan() from
> rockchip_sfc_register.
>
> Please note there might be a small dependence to the SPINOR_OP_* macro
> renaming patch:
> [v4, 2/8] mtd: spi-nor: rename SPINOR_OP_* macros of the 4-byte address op
> codes
> http://patchwork.ozlabs.org/patch/697266/
> Indeed this patch introduces in spi-nor.h the SPINOR_OP_READ_1_2_2 and
> SPINOR_OP_READ_1_4_4 macros and their associated op codes.
>
> About the support of SPI 2-2-2 and SPI 4-4-4, I also have patches to add
> support to those two protocols however I decided not to submit them for now
> for many reasons. First, the series is already long and hard enough to
> review. Secondly, in most cases the performance increase between SPI 1-4-4
> and SPI 4-4-4 isn't worth it when you read 512 byte pages or 64KB sectors.
>
> I think it was a mistake to send all those patches in a single big series
> since actually most of them have nothing to do with SFDP. They just prepare
> the transition. I understand big series might scare people and discourage
> them from reviewing or testing.
>
> However, if you are interested in some of those features, I think I should
> send the patches step by step.
>
> Best regards,
>
> Cyrille
>
>>>>> +#ifdef CONFIG_PM
>>>>> +int rockchip_sfc_runtime_suspend(struct device *dev)
>>>>> +{
>>>>> +    struct rockchip_sfc *sfc = dev_get_drvdata(dev);
>>>>> +
>>>>> +    clk_disable_unprepare(sfc->hclk);
>>>>> +    return 0;
>>>>> +}
>>>>
>>>> Was the suspend ever really tested with this block ? Is disabling clock
>>>> really enough ?
>>>
>>> It was tested and we could do more, for instance power off the genpd,
>>> but disabling clcok should be enough.
>>
>> What about putting the controller into some reset state , is that possible?
>>
>>>>> +int rockchip_sfc_runtime_resume(struct device *dev)
>>>>> +{
>>>>> +    struct rockchip_sfc *sfc = dev_get_drvdata(dev);
>>>>> +
>>>>> +    clk_prepare_enable(sfc->hclk);
>>>>> +    return 0;
>>>>> +}
>>>>> +#endif /* CONFIG_PM */
>>>>
>>>> [...]
>>>>
>>>
>>>
>>
>>
>
>
>
>


-- 
Best Regards
Shawn Lin

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
