From: Yunzhi Li <lyz-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v2 1/5] phy: add a driver for the Rockchip SoC internal
 USB2.0 PHY.
Date: Mon, 08 Dec 2014 12:12:26 +0800
Message-ID: <5485252A.90308@rock-chips.com>
References: <1417783941-2418-1-git-send-email-lyz@rock-chips.com>	<1417783941-2418-2-git-send-email-lyz@rock-chips.com> <CABgxDoLe2RxCjD53uvTgYZ=tNOKHLeGoZE5Aa5XvaUYvNX=HYw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABgxDoLe2RxCjD53uvTgYZ=tNOKHLeGoZE5Aa5XvaUYvNX=HYw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Romain Perier <romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Tao Huang <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, Eddie Cai <cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, ulrich.prinz-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Romain :

On 2014/12/5 21:38, Romain Perier wrote:
> Hi,
>
> Some quick comments
>
> 2014-12-05 13:52 GMT+01:00 Yunzhi Li <lyz-TNX95d0MmH7DzftRWevZcw@public.gmane.org>:
>> [...]
>>
>> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
>> index ccad880..e3a5857 100644
>> --- a/drivers/phy/Kconfig
>> +++ b/drivers/phy/Kconfig
>> @@ -239,6 +239,13 @@ config PHY_QCOM_IPQ806X_SATA
>>          depends on OF
>>          select GENERIC_PHY
>>
>> +config PHY_ROCKCHIP_RK3288_USB2
>> +       tristate "Rockchip USB2 RK3288 PHY Driver"
>> +       depends on ARCH_ROCKCHIP && OF
>> +       select GENERIC_PHY
>> +       help
>> +         Enable this to support the Rockchip USB 2.0 PHY.
>> +
>
> The C module is named phy-rockchip-usb.c, why did you call the config
> entry PHY_ROCKCHIP_RK3288_USB2 ? why RK3288 ? this driver might be
> ported to old SoCs later.
> I think that PHY_ROCKCHIP_USB would be enough.
Right, this driver will be ported to old SoCs like RK3188 or RK3066, 
this will be renamed to PHY_ROCKCHIP_USB in the next version.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
