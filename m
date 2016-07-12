From: Wan Zongshun <vw@iommu.org>
Subject: Re: [PATCH v2 01/10] ARM: NUC900: Add nuc970 machine support
Date: Tue, 12 Jul 2016 15:14:47 +0800
Message-ID: <578498E7.4080709@iommu.org>
References: <1468135649-19980-1-git-send-email-vw@iommu.org>
 <1468135649-19980-2-git-send-email-vw@iommu.org>
 <18260150.aRRy8ybKlm@wuerfel> <57847278.8000408@iommu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <57847278.8000408@iommu.org>
Sender: linux-clk-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: devicetree@vger.kernel.org, jason@lakedaemon.net, Wan Zongshun <mcuos.com@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, p.zabel@pengutronix.de, Thomas Gleixner <tglx@linutronix.de>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org



On 2016=E5=B9=B407=E6=9C=8812=E6=97=A5 12:30, Wan Zongshun wrote:
>
>
> On 2016=E5=B9=B407=E6=9C=8812=E6=97=A5 00:04, Arnd Bergmann wrote:
>> On Sunday, July 10, 2016 3:27:21 PM CEST Wan Zongshun wrote:
>>> +ifeq ($(CONFIG_SOC_NUC970),)
>>>   obj-y                          :=3D irq.o time.o mfp.o gpio.o clo=
ck.o
>>>   obj-y                          +=3D clksel.o dev.o cpu.o
>>> +endif
>>>   # W90X900 CPU support files
>>
>> When mfp.o is disabled like this, I get a link error in two drivers
>> using the exported interface:
>>
>> ERROR: "mfp_set_groupg" [drivers/spi/spi-nuc900.ko] undefined!
>> ERROR: "mfp_set_groupi" [drivers/input/keyboard/w90p910_keypad.ko]
>> undefined!
>
> Why remove mfp modules? this multifunction pin driver should be used =
for
> those two drivers, if no mfp_set_groupX, I don't think driver can wor=
k.
>
> Now mfp has standard driver subsystem?
>
>>
>> Any idea for a better migration strategy?

Arnd, If you still think the mfp should be removed, we can send a serie=
s=20
patches to instead of using mfp interface quickly, and do mfp set in=20
local driver. Do you think it is ok?

>>
>>     Arnd
>>
>>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
