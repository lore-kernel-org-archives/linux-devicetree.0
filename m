From: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
Subject: Re: [Patch v5 3/7] mfd: ti-keystone-devctrl: add bindings for device
 state control
Date: Thu, 22 May 2014 19:30:23 +0300
Message-ID: <537E261F.10401@ti.com>
References: <1400766516-14537-1-git-send-email-ivan.khoronzhuk@ti.com> <1400766516-14537-4-git-send-email-ivan.khoronzhuk@ti.com> <20140522141432.GA19747@lee--X1> <537E0A87.5010408@ti.com> <20140522153309.GB19747@lee--X1> <537E224E.3060601@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <537E224E.3060601@ti.com>
Sender: linux-doc-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: dbaryshkov@gmail.com, dwmw2@infradead.org, santosh.shilimkar@ti.com, arnd@arndb.de, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, grant.likely@linaro.org, devicetree@vger.kernel.org, grygorii.strashko@ti.com, linux@arm.linux.org.uk, sergei.shtylyov@cogentembedded.com, linux-doc@vger.kernel.org, w-kwok2@ti.com, rdunlap@infradead.org, sboyd@codeaurora.org, linux-kernel@vger.kernel.org, m-karicheri2@ti.com, olof@lixom.net, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


On 05/22/2014 07:14 PM, Ivan Khoronzhuk wrote:
>
> On 05/22/2014 06:33 PM, Lee Jones wrote:
>>>> Why do I only have this patch?  Where is the rest of the set?  Also,
>>>> it's on v5 and I don't recall seeing the other 4 versions?
>>> It's strange I've sent whole series on
>>>
>>> linux-kernel@vger.kernel.org
>>> linux-arm-kernel@lists.infradead.org
>>> linux-doc@vger.kernel.org
>>> devicetree@vger.kernel.org
>>>
>>> v4 is also was sent to lists in question:
>>> https://lkml.org/lkml/2014/5/21/359
>> But did you send them to me?  I don't parse the list.
>>
>
> Sorry.
> Becouse /scripts/get_maintainer.pl  patches/reset_driver_v6/* hadn't 
> been listed you
> It's because there is no patch with "code" for the bindings you've 
> comment.
>
> I should check it by hand for mtd.
>
> The bindings for mtd device_state_control were added only on v5
> And it's added only to describe what is the node we've used in a 
> keystone DT.
> The node is planned to be used only via syscon phandle, there is no 
> driver for it,
> and compatible string for "ti,keystone-devctrl" added only to be 
> matched by
> a high-level device driver if needed.
>
> I'll send new v6 series to you also.
> Once again sorry.
>

s/mtd/mfd

-- 
Regards,
Ivan Khoronzhuk

