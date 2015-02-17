From: Moritz Fischer <moritz.fischer@ettus.com>
Subject: Re: [PATCH 1/2] power: reset: Add support for NI Ettus Research USRP
 E3x0 soft-poweroff.
Date: Tue, 17 Feb 2015 12:49:15 -0800
Message-ID: <CAAtXAHeD=145xiMYS3irwDATaY1wkWhYMnk6fj4mZYC4SE14GQ@mail.gmail.com>
References: <1423790080-8264-1-git-send-email-moritz.fischer@ettus.com>
	<1423790080-8264-2-git-send-email-moritz.fischer@ettus.com>
	<1424032334.9418.109.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1424032334.9418.109.camel@x220>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Bolle <pebolle@tiscali.nl>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, David Woodhouse <dwmw2@infradead.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Paul,

thanks for your feedback. Will incorporate the changes into the v2
when I'll resend.


On Sun, Feb 15, 2015 at 12:32 PM, Paul Bolle <pebolle@tiscali.nl> wrote:
> One nit below.
>
> On Thu, 2015-02-12 at 17:14 -0800, Moritz Fischer wrote:
>> Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
>> ---
>>  .../bindings/power/reset/e3x0-poweroff.txt         | 16 ++++
>>  drivers/power/reset/Kconfig                        | 10 +++
>>  drivers/power/reset/Makefile                       |  1 +
>>  drivers/power/reset/e3x0-poweroff.c                | 94 ++++++++++++++++++++++
>>  4 files changed, 121 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/power/reset/e3x0-poweroff.txt b/Documentation/devicetree/bindings/power/reset/e3x0-poweroff.txt
>> new file mode 100644
>> index 0000000..df19998
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/power/reset/e3x0-poweroff.txt
>> @@ -0,0 +1,16 @@
>> +National Instruments Ettus Research USRP E3x0 poweroff driver
>> +
>> +This module is part of the NI Ettus Research USRP E3x0 SDR.
>> +
>> +Required properties:
>> +- compatible: should be one of the following
>> +  - "ettus,e3x0-poweroff": For devices such as the NI Ettus Research USRP E3x0
>> +- reg: The registers to write to in order to trigger the poweroff.
>> +
>> +Note: Addresses may vary depending on the FPGA configuration
>> +
>> +Example:
>> +     poweroff0: poweroff@40300000 {
>> +             compatible = "ettus,e3x0-poweroff";
>> +             reg = <0x40300000 0x04>;
>> +     };
>> diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
>> index 27f6646..e45029f 100644
>> --- a/drivers/power/reset/Kconfig
>> +++ b/drivers/power/reset/Kconfig
>> @@ -48,6 +48,16 @@ config POWER_RESET_BRCMSTB
>>         Say Y here if you have a Broadcom STB board and you wish
>>         to have restart support.
>>
>> +config POWER_RESET_E3X0
>> +     tristate "NI Ettus Research USRP E3x0 soft poweroff driver."
>> +     default n
>> +     help
>> +       Say Y here to enable support for the NI Ettus Research
>> +       USRP E3x0 soft poweroff.
>> +
>> +       To compile this driver as a module, chose M here: the
>> +       module will be called e3x0-reset.
>
>                                   e3x0-poweroff
>
>> +
>>  config POWER_RESET_GPIO
>>       bool "GPIO power-off driver"
>>       depends on OF_GPIO
>> diff --git a/drivers/power/reset/Makefile b/drivers/power/reset/Makefile
>> index 11de15b..eef50e9a 100644
>> --- a/drivers/power/reset/Makefile
>> +++ b/drivers/power/reset/Makefile
>> @@ -3,6 +3,7 @@ obj-$(CONFIG_POWER_RESET_AT91_POWEROFF) += at91-poweroff.o
>>  obj-$(CONFIG_POWER_RESET_AT91_RESET) += at91-reset.o
>>  obj-$(CONFIG_POWER_RESET_AXXIA) += axxia-reset.o
>>  obj-$(CONFIG_POWER_RESET_BRCMSTB) += brcmstb-reboot.o
>> +obj-$(CONFIG_POWER_RESET_E3X0) += e3x0-poweroff.o
>>  obj-$(CONFIG_POWER_RESET_GPIO) += gpio-poweroff.o
>>  obj-$(CONFIG_POWER_RESET_GPIO_RESTART) += gpio-restart.o
>>  obj-$(CONFIG_POWER_RESET_HISI) += hisi-reboot.o
>
>
> Paul Bolle
>

Moritz
