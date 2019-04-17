From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v3 1/3] ARM: dts: da850: add cpu node and operating points
 to DT
Date: Wed, 17 Apr 2019 13:45:06 +0530
Message-ID: <7a26df9e-4e8d-2da2-48ad-157a1fe68d66@ti.com>
References: <20190408075924.2284-1-brgl@bgdev.pl>
 <20190408075924.2284-2-brgl@bgdev.pl>
 <5f72a26b-428a-c50e-cb6a-7c888ea22329@ti.com>
 <CAMRc=McGwGh9RKhxxCDnz3aMG_EVjjXzN+pmMZVtE7aChdU3jw@mail.gmail.com>
 <3f6c906b-53b0-8284-bf4d-9b404f341e7b@ti.com>
 <CAMRc=Me8vppb9vEmKOUcU28YKVR9jJ64sBSn-KwNyNnZA=VB9Q@mail.gmail.com>
 <6ff5711c-b607-1f3a-e362-709b53762179@ti.com>
 <CAMRc=Mfb4xrpLkJoX0SyoCPU6Au1TPxCtr29EhvU=VsKkSt2xQ@mail.gmail.com>
 <CAHCN7x+CAr9MjckhVP_suBRHY+o8Je1aLz28XTL9bnDBd4WyKA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHCN7x+CAr9MjckhVP_suBRHY+o8Je1aLz28XTL9bnDBd4WyKA@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Adam Ford <aford173@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: David Lechner <david@lechnology.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

On 16/04/19 5:18 PM, Adam Ford wrote:
> On Tue, Apr 16, 2019 at 3:38 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>>
>> pon., 15 kwi 2019 o 12:21 Sekhar Nori <nsekhar@ti.com> napisał(a):
>>>
>>> On 12/04/19 9:01 PM, Bartosz Golaszewski wrote:
>>>> pt., 12 kwi 2019 o 15:53 Sekhar Nori <nsekhar@ti.com> napisał(a):
>>>>>
>>>>> On 12/04/19 5:41 PM, Bartosz Golaszewski wrote:
>>>>>> pt., 12 kwi 2019 o 13:26 Sekhar Nori <nsekhar@ti.com> napisał(a):
>>>>>>>
>>>>>>> Hi Bartosz,
>>>>>>>
>>>>>>> On 08/04/19 1:29 PM, Bartosz Golaszewski wrote:
>>>>>>>> From: David Lechner <david@lechnology.com>
>>>>>>>>
>>>>>>>> This adds a cpu node and operating points to the common da850.dtsi file.
>>>>>>>>
>>>>>>>> Additionally, a regulator is added to the LEGO EV3 board along with
>>>>>>>> some board-specific CPU configuration.
>>>>>>>>
>>>>>>>> Regulators need to be hooked up on other boards to get them working.
>>>>>>>>
>>>>>>>> Signed-off-by: David Lechner <david@lechnology.com>
>>>>>>>> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>>>>>>>
>>>>>>> I remember you mentioning about some problems using OCHI and cpufreq
>>>>>>> together. Are those resolved now? CPU PLL on DA850 can affect other
>>>>>>> peripheral clock frequencies too. So enabling it should really be a
>>>>>>> per-board decision.
>>>>>>>
>>>>>>
>>>>>> The problems are still there. I've never been able to find the
>>>>>> culprit, but it also occurs on TI BSP in the same way (a couple
>>>>>> cpufreq transitions will make the controller unresponsive).
>>>>>
>>>>> Is that on LCDK as well? As I recall cpufreq was never enabled on LCDK
>>>>> in TI BSP.
>>>>>
>>>>
>>>> Yes, I just verified that the bug occurs on LCDK with patches from this series.
>>>>
>>>>> If the OHCI problem is present on LCDK, then there is a user visible
>>>>> regression on mainline after this patch. Lets enable cpufreq in LCDK
>>>>> only if all working peripherals keep working afterwards.
>>>>>
>>>>
>>>> The OHCI driver doesn't register any cpufreq transition notifier
>>>> callbacks. I can't really find anything in the datasheet, but I'm
>>>> wondering if we shouldn't do something similar to what the driver for
>>>> davinci i2c controller does. I'll try a couple things tomorrow.
>>>
>>> Even if OHCI issue is fixed, with a fixed regulator like on LCDK, I am
>>> not sure the benefits of just frequency scaling will be justifiable enough.
>>>
>>> Fixing the OHCI issue may help in other boards like da850-evm use it
>>> though. So that will be a good thing.
>>>
>>
>> I've been trying different things, like suspending the device before
>> the transition, resetting the controller or playing with the clock
>> during transitions but it always results in the same kind of error:
>>
>> ohci-da8xx 1e25000.usb: frame counter not updating; disabled
>> ohci-da8xx 1e25000.usb: HC died; cleaning up
>> usb 1-1: USB disconnect, device number 2
>>
>> If you have any idea - let me know, otherwise I'll give up.
>>
>> If we agree on the direction of these patches, then I can go with a
>> single enabled OPP for lcdk (456 MHz) and all OPPs up to 375 MHz
>> enabled for da850-evm.
> 
> One last questions, and this probably directed at Sekhar, but what
> happens if you modify the OPP for the boards with fixed regulators to
> enable all the frequencies but with the only available voltage.  Is
> there harm is running the processor at a higher voltage than
> necessary?  I did some quick experiments on a different ARM board and
> I saw some changes in power consumption.  I would think some power
> savings might be better than none, but I don't know if it causes> damage.

The OMAP-L138 datasheet mentions two versions of devices in core voltage
specification:

Variable (1.2V-1.0V) for 375 MHz version
Variable (1.3V-1.0V) for 456 MHz version

If you have 375 MHz version of device, I do not think you should run at
1.3V. I don't know what "damage" it will cause or how long it takes for
any of it to be visible.

Keeping that aside, I doubt there will be a lot of power-saving benefit
without voltage scaling. Even if you see a slightly lower power number
when you reduce frequency, there is also work to be done for the scaling
operation itself.

Thanks,
Sekhar
