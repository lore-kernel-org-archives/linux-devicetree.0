From: Santosh Shilimkar <santosh.shilimkar@ti.com>
Subject: Re: [Patch v5 0/7] Introduce keystone reset driver
Date: Thu, 22 May 2014 10:02:01 -0400
Message-ID: <537E0359.10300@ti.com>
References: <1400766516-14537-1-git-send-email-ivan.khoronzhuk@ti.com> <537E011B.9090902@ti.com> <5069120.YZWxxyxdrl@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <5069120.YZWxxyxdrl@wuerfel>
Sender: linux-doc-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>, dbaryshkov@gmail.com, dwmw2@infradead.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, grant.likely@linaro.org, rdunlap@infradead.org, linux@arm.linux.org.uk, grygorii.strashko@ti.com, olof@lixom.net, w-kwok2@ti.com, sboyd@codeaurora.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, m-karicheri2@ti.com, sergei.shtylyov@cogentembedded.com
List-Id: devicetree@vger.kernel.org

Arnd,

On Thursday 22 May 2014 09:54 AM, Arnd Bergmann wrote:
> On Thursday 22 May 2014 09:52:27 Santosh Shilimkar wrote:
>> On Thursday 22 May 2014 09:48 AM, Ivan Khoronzhuk wrote:
>>> These patches introduce keystone reset driver.
>>>
>>> The keystone SoC can be rebooted in several ways. By external reset
>>> pin, by soft and by watchdogs. This driver allows software reset and reset
>>> by one of the watchdogs. Also added opportunity to set soft/hard reset type.
>>>
>>> Based on linux-next/master
>>>
>>> v5..v4
>>>   power: reset: keystone-reset: introduce keystone reset driver
>>>       - changed to get rsmux and rspll offsets from DT
>>>   clock: keystone-pllctrl: add bindings for keystone pll controller
>>>       - new patch
>>>   mfd: ti-keystone-devctrl: add bindings for device state control
>>>       - new patch
>>>   power: reset: add bindings for keystone reset driver
>>>       - corrected description of "ti,syscon-pll", "ti,syscon-dev" properties
>>>       - corrected examples
>>>   ARM: dts: keystone: update reset node to work with reset driver
>>>       - added nodes for pll-controller and device-state-controll
>>>       - added offsets to "ti,syscon-pll", "ti,syscon-dev" properties
>>>
>> Looks like you haven't collected Arnd's Reviewed-by tag on the patches.
>> Can be added later as well while applying.
>>
>>
> 
> I was going to comment the same. Anyway here you have it for the remaining
> patches:
> 
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> 
Thanks. Can we take this driver via arm-soc tree ? I asked the question on previous
thread to drivers/reset/* folks whether they are ok to take the series via arm-soc
or prefer to split the series. No responses so far.

If possible I would like get this driver in current merge window since it ready now.
It has been on the list for almost 3 merge windows including the upcoming.

Regards,
Snatosh
