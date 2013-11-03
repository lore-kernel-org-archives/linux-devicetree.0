From: Igor Grinberg <grinberg-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: Add initial support for cm-fx6.
Date: Sun, 03 Nov 2013 12:37:42 +0200
Message-ID: <52762776.4010303@compulab.co.il>
References: <1383048703-2101-1-git-send-email-valentin@compulab.co.il> <20131031055631.GA23549@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131031055631.GA23549-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Valentin Raevsky <valentin-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/31/13 07:56, Shawn Guo wrote:
> On Tue, Oct 29, 2013 at 02:11:43PM +0200, Valentin Raevsky wrote:
>> Add initial support for cm-fx6 module.
>>
>> cm-fx6 is a module based on mx6q SoC with the following features:
>> - Up to 4GB of DDR3
>> - 1 LCD/DVI output port
>> - 1 HDMI output port
>> - 2 LVDS LCD ports
>> - Gigabit Ethernet
>> - Analog Audio
>> - CAN
>> - SATA
>> - NAND
>> - PCIE
>>
>> This patch allows to boot up the module, configures the serial console,
>> the Ethernet adapter and the heartbeat led.
>>
>> cm-fx6 is embedded inside the Utilite computer.
>>
>> Signed-off-by: Valentin Raevsky <valentin-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
>> Signed-off-by: Igor Grinberg <grinberg-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
>> ---
>>
>> Shawn, can this still be applied for 3.13 ?
> 
> Sorry, it's late for 3.13.  Applied for 3.14 with a small fix-up below.

Thanks!

> 
>>
>>  arch/arm/boot/dts/Makefile         |    1 +
>>  arch/arm/boot/dts/imx6q-cm-fx6.dts |   53 ++++++++++++++++++++++++++++++++++++
>>  2 files changed, 54 insertions(+)
>>  create mode 100644 arch/arm/boot/dts/imx6q-cm-fx6.dts
>>
>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>> index 641b3c9..87ca7ca 100644
>> --- a/arch/arm/boot/dts/Makefile
>> +++ b/arch/arm/boot/dts/Makefile
>> @@ -131,6 +131,7 @@ dtb-$(CONFIG_ARCH_MXC) += \
>>  	imx6q-sabrelite.dtb \
>>  	imx6q-sabresd.dtb \
>>  	imx6q-sbc6x.dtb \
>> +	imx6q-cm-fx6.dtb \
> 
> If you look at the list, you can find that they are sorted
> alphabetically.  I just moved it around to maintain the order.

Sorry for that. Thanks for fixing this up!

-- 
Regards,
Igor.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
