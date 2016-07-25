From: Tan Xiaojun <tanxiaojun@huawei.com>
Subject: Re: [RFC PATCH v1 0/2] Add Hisilicon Djtag driver
Date: Mon, 25 Jul 2016 10:09:44 +0800
Message-ID: <579574E8.4080201@huawei.com>
References: <1469177332-72156-1-git-send-email-tanxiaojun@huawei.com>
 <20160722105648.GD17584@leverpostej> <11848764.OZ77lJYCM4@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <11848764.OZ77lJYCM4@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, xuwei5@hisilicon.com, devicetree@vger.kernel.org, khilman@linaro.org, k.kozlowski@samsung.com, amitdanielk@gmail.com, heiko@sntech.de, wxt@rock-chips.com, alex.aring@gmail.com, qiang.zhao@freescale.com, treding@nvidia.com, rmk+kernel@arm.linux.org.uk, gregory.clement@free-electrons.com, f.fainelli@gmail.com, geert+renesas@glider.be, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 2016/7/22 21:27, Arnd Bergmann wrote:
> On Friday, July 22, 2016 11:56:49 AM CEST Mark Rutland wrote:
>> Hi,
>>
>> I understand that some SoC/socket level PMU is accessed via these
>> registers. It doesn't make sense to review either in isolation. Please
>> put together a unified series, with both the djtag accessors and the
>> PMU code.
>>
>> On it's own, it's *very* difficult to understand how this fits into the
>> SoC, and how it is to be used.
> 
> Is there anything else that the driver is used for?
> 
> Having it in drivers/soc/ feels wrong to me, and if there is only
> one user, I'd recommend having it as part of the same driver module
> as the code accessing it.
> 
> 	Arnd
> 

Many modules will use it, and they are waiting for djtag upstream. Maybe
it should not have been presented separately. I will think about it.

Thanks,
Xiaojun.

> 
> .
> 
