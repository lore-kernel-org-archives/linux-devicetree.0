From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH V2 09/15] irqchip: Remove ARM dependency for bcm7120-l2
 and brcmstb-l2
Date: Thu, 30 Oct 2014 14:48:20 +0300
Message-ID: <54522584.2030102@cogentembedded.com>
References: <1414635488-14137-1-git-send-email-cernekee@gmail.com> <1414635488-14137-10-git-send-email-cernekee@gmail.com> <54521CA6.1000802@cogentembedded.com> <3334166.jta5WKHbUO@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3334166.jta5WKHbUO@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kevin Cernekee <cernekee@gmail.com>, f.fainelli@gmail.com, tglx@linutronix.de, jason@lakedaemon.net, ralf@linux-mips.org, lethal@linux-sh.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mbizon@freebox.fr, jogo@openwrt.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

Hello.

On 10/30/2014 2:24 PM, Arnd Bergmann wrote:

>>> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
>>> index b21f12f..09c79d1 100644
>>> --- a/drivers/irqchip/Kconfig
>>> +++ b/drivers/irqchip/Kconfig
>>> @@ -50,7 +50,6 @@ config ATMEL_AIC5_IRQ
>>>
>>>    config BRCMSTB_L2_IRQ
>>>        bool
>>> -     depends on ARM

>>      How about the following?

>>          depends on ARM || MIPS || COMPILE_TEST

> Makes no sense when the driver isn't user-selectable.

    Ah, I was just blind. :-/

> 	Arnd

WBR, Sergei
