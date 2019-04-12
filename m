From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v3 1/3] ARM: dts: da850: add cpu node and operating points
 to DT
Date: Fri, 12 Apr 2019 19:23:01 +0530
Message-ID: <3f6c906b-53b0-8284-bf4d-9b404f341e7b@ti.com>
References: <20190408075924.2284-1-brgl@bgdev.pl>
 <20190408075924.2284-2-brgl@bgdev.pl>
 <5f72a26b-428a-c50e-cb6a-7c888ea22329@ti.com>
 <CAMRc=McGwGh9RKhxxCDnz3aMG_EVjjXzN+pmMZVtE7aChdU3jw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMRc=McGwGh9RKhxxCDnz3aMG_EVjjXzN+pmMZVtE7aChdU3jw@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David Lechner <david@lechnology.com>, Adam Ford <aford173@gmail.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

On 12/04/19 5:41 PM, Bartosz Golaszewski wrote:
> pt., 12 kwi 2019 o 13:26 Sekhar Nori <nsekhar@ti.com> napisał(a):
>>
>> Hi Bartosz,
>>
>> On 08/04/19 1:29 PM, Bartosz Golaszewski wrote:
>>> From: David Lechner <david@lechnology.com>
>>>
>>> This adds a cpu node and operating points to the common da850.dtsi file.
>>>
>>> Additionally, a regulator is added to the LEGO EV3 board along with
>>> some board-specific CPU configuration.
>>>
>>> Regulators need to be hooked up on other boards to get them working.
>>>
>>> Signed-off-by: David Lechner <david@lechnology.com>
>>> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>>
>> I remember you mentioning about some problems using OCHI and cpufreq
>> together. Are those resolved now? CPU PLL on DA850 can affect other
>> peripheral clock frequencies too. So enabling it should really be a
>> per-board decision.
>>
> 
> The problems are still there. I've never been able to find the
> culprit, but it also occurs on TI BSP in the same way (a couple
> cpufreq transitions will make the controller unresponsive).

Is that on LCDK as well? As I recall cpufreq was never enabled on LCDK
in TI BSP.

If the OHCI problem is present on LCDK, then there is a user visible
regression on mainline after this patch. Lets enable cpufreq in LCDK
only if all working peripherals keep working afterwards.

Thanks,
Sekhar
