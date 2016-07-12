From: Wan Zongshun <vw@iommu.org>
Subject: Re: [PATCH v2 01/10] ARM: NUC900: Add nuc970 machine support
Date: Tue, 12 Jul 2016 12:30:48 +0800
Message-ID: <57847278.8000408@iommu.org>
References: <1468135649-19980-1-git-send-email-vw@iommu.org>
 <1468135649-19980-2-git-send-email-vw@iommu.org>
 <18260150.aRRy8ybKlm@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <18260150.aRRy8ybKlm@wuerfel>
Sender: linux-clk-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, robh@kernel.org, jason@lakedaemon.net, p.zabel@pengutronix.de, Wan Zongshun <mcuos.com@gmail.com>
List-Id: devicetree@vger.kernel.org



On 2016=E5=B9=B407=E6=9C=8812=E6=97=A5 00:04, Arnd Bergmann wrote:
> On Sunday, July 10, 2016 3:27:21 PM CEST Wan Zongshun wrote:
>> +ifeq ($(CONFIG_SOC_NUC970),)
>>   obj-y                          :=3D irq.o time.o mfp.o gpio.o cloc=
k.o
>>   obj-y                          +=3D clksel.o dev.o cpu.o
>> +endif
>>   # W90X900 CPU support files
>
> When mfp.o is disabled like this, I get a link error in two drivers
> using the exported interface:
>
> ERROR: "mfp_set_groupg" [drivers/spi/spi-nuc900.ko] undefined!
> ERROR: "mfp_set_groupi" [drivers/input/keyboard/w90p910_keypad.ko] un=
defined!

Why remove mfp modules? this multifunction pin driver should be used fo=
r=20
those two drivers, if no mfp_set_groupX, I don't think driver can work.

Now mfp has standard driver subsystem?

>
> Any idea for a better migration strategy?
>
> 	Arnd
>
>
