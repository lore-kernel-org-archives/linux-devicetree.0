From: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: stm32: use right compatible for stm32f469
Date: Mon, 28 Aug 2017 15:50:48 +0200
Message-ID: <f70fddcf-e2cb-7c55-f318-09a146c79559@st.com>
References: <1501172847-31323-1-git-send-email-alexandre.torgue@st.com>
 <CAK8P3a17b3viT=TduBXzV5LCpNO5-=vopq6u_nX7syHzyGsvAw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK8P3a17b3viT=TduBXzV5LCpNO5-=vopq6u_nX7syHzyGsvAw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, arm-soc <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Arnd,

On 08/16/2017 11:00 PM, Arnd Bergmann wrote:
> On Thu, Jul 27, 2017 at 6:27 PM, Alexandre Torgue
> <alexandre.torgue-qxv4g6HH51o@public.gmane.org> wrote:
>> Currently, same stm32f429-pinctrl driver is used for stm32f429 and
>> stm32f469. As pin map is different between those 2 MCUs,
>> a stm32f469-pinctrl driver has been recently added.
>> This patch
>>   -allows to use stm32f469-pinctrl driver for stm32f469 boards
>>   -reworks stm32 devicetree files to fit with stm32f429 / stm32f469
>>
>> In the same time it fixes an issue when only MACH_STM32F469 flag is
>> selected in menuconfig.
>>
>> Fixes: d28bcd53fa90 ("ARM: stm32: Introduce MACH_STM32F469 flag")
>> Reported-by: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Signed-off-by: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
>> ---
>>
>> Hi Arnd, Kevin and Olof,
>>
>> I send this series in 4.13-rcx cycle to fix d28bcd53fa90
>> ("ARM: stm32: Introduce MACH_STM32F469 flag").
>> This patch could look "huge" to fix the issue but I prefer to send
>> a clean patch now that send a quick fix first and a DT rework in 4.14
>> cycle.
>> Let me know, if tou disagree with that.
> 
> Unfortunately I did not have this one on my radar for the 4.13 fixes,
> as the subject looked rather innocent. My feeling is that we could have
> done it earlier, but by now it's a bit late, and I'd rather have a quick
> fix to merge for 4.13.

Sorry for this late answer, I just returned for vacation.
As you said title was not enough clear to take it as a fix, my fault.

Some words about the initial issue:
It concerns stm32f469-board. This board used stm32f429-pinctrl driver 
(under MACH_STM32F429 flag) and used "st,stm32f429-pinctrl" compatible 
in devicetree.
Recently I added a dedicated stm32f469-pinctrl driver (under 
MACH_STM32F469 flag) without changing devicetree.

In stm32_defconfig all pinctrl drivers (all MACH_STM32Fxx flags)  are 
enabled , so stm32f469-board boots with stm32f429-pinctrl driver. But 
users have possibility to change defconfig through menuconfig to select 
ONLY stm32f469-pinctrl driver (MACH_STM32F469 flag). In this case the 
board will not boot (as in device tree only "st,stm32f429-pinctrl" 
compatible is used).

As we are in -rc7, either we could consider that issue is minor (as it 
doesn't occur in default stm32 defconfig or I could send a fix like below:

-	compatible = "st,stm32f429-pinctrl";
+	compatible = "st,stm32f429-pinctrl", "st,stm32f469-pinctrl";

> 
> Doing this without merge conflicts unfortunately means that you have
> to send two pull requests, with the 4.14 one based on the quick fix
> for 4.13.

I checked that patch above doesn't impact my pull request 4.14 #1

Sorry for the inconvenience.

Alex


> 
>          Arnd
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
