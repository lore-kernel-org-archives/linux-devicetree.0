From: Sherman Yin <syin@broadcom.com>
Subject: Re: [PATCH 3/4] ARM: pinctrl: Add Broadcom Capri pinctrl driver
Date: Tue, 10 Dec 2013 16:05:30 -0800
Message-ID: <52A7AC4A.8010504@broadcom.com>
References: <1380846199-12829-1-git-send-email-syin@broadcom.com> <1380846199-12829-4-git-send-email-syin@broadcom.com> <CAEPRUYqfpdp1GqxBgx-q=hyvQDe4uyi6okzHPW2QmfmPG_Z3NQ@mail.gmail.com> <525FFA40.9050901@wwwdotorg.org> <CAEPRUYq5DA982AqAmrUpsb3qc30VaFBawaXKTp2pcDvdbM-S1g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <CAEPRUYq5DA982AqAmrUpsb3qc30VaFBawaXKTp2pcDvdbM-S1g@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Christian Daudt <bcm@fixthebug.org>, Stephen Warren <swarren@wwwdotorg.org>, Kevin Hilman <khilman@linaro.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, Grant Likely <grant.likely@linaro.org>, Matt Porter <matt.porter@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Markus Mayer <mmayer@broadcom.com>
List-Id: devicetree@vger.kernel.org

On 13-10-17 08:31 AM, Christian Daudt wrote:
> On Thu, Oct 17, 2013 at 7:54 AM, Stephen Warren <swarren@wwwdotorg.org> wrote:
>> On 10/17/2013 12:03 AM, Christian Daudt wrote:
>>> On Thu, Oct 3, 2013 at 5:23 PM, Sherman Yin <syin@broadcom.com> wrote:
>>>> Adds pinctrl driver for Broadcom Capri (BCM281xx) SoCs.
>>>>
>>>> Signed-off-by: Sherman Yin <syin@broadcom.com>
>>>> Reviewed-by: Christian Daudt <bcm@fixthebug.org>
>>>> Reviewed-by: Matt Porter <matt.porter@linaro.org>
>>>> ---
>>>>   arch/arm/mach-bcm/Kconfig       |    2 +
>>>>   drivers/pinctrl/Kconfig         |   10 +
>>>>   drivers/pinctrl/Makefile        |    1 +
>>>>   drivers/pinctrl/pinctrl-capri.c | 1727 +++++++++++++++++++++++++++++++++++++++
>>>>   4 files changed, 1740 insertions(+)
>>>>   create mode 100644 drivers/pinctrl/pinctrl-capri.c
>>>>
>>>> diff --git a/arch/arm/mach-bcm/Kconfig b/arch/arm/mach-bcm/Kconfig
>>>> index 69d67f7..2546365 100644
>>>> --- a/arch/arm/mach-bcm/Kconfig
>>>> +++ b/arch/arm/mach-bcm/Kconfig
>>>> @@ -10,6 +10,8 @@ config ARCH_BCM
>>>>          select GENERIC_CLOCKEVENTS
>>>>          select GENERIC_TIME
>>>>          select GPIO_BCM
>>>> +       select PINCTRL
>>>> +       select PINCTRL_CAPRI
>>>>          select SPARSE_IRQ
>>>>          select TICK_ONESHOT
>>>>          select CACHE_L2X0
>>>
>>> On your subsequent patchset pls move this from Kconfig to
>>> arm/configs/bcm_defconfig, and break that modification into a separate
>>> patch from the drivers/* modification.
>>
>> The other SoCs I'm familiar with all select this from their ARCH_xxx
>> config symbol.
>>
> I had a discussion on what is best left under ARCH and what is best
> left to defconfig with Kevin Hilman a while back and the conclusion
> was that any config not strictly required for bootup is best left to
> defconfig. This will allow multiplatform kernels to switch to using
> them as loadable modules later on, something not possible with configs
> put under ARCH_xxx.
>
>   Thanks,
>      csd
>

I was just trying to move "select PINCTRL" to a defconfig as Christian 
suggested.  However, CONFIG_PINCTRL is not selectable by a defconfig 
file (the option will be gone by the time .config is generated), even 
though PINCTRL has no dependency.  Also, this option is not visible in 
menuconfig.

I found that by adding a string after "bool" in the PINCTRL config 
definition (see diff below), CONFIG_PINCTRL will be selectable in a 
defconfig file and this option will also be visible in menuconfig.

Was this intentional or is this a bug?  To address Christian's comment, 
I'll need to add the following patch.

Regards,
Sherman

==================
diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 6c70fc5..664c8e6 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -3,7 +3,7 @@
  #

  config PINCTRL
-       bool
+       bool "Enable the pinctrl framework"

  if PINCTRL
==================

