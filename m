From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v2 4/4] ARM: dts: meson: consistently disable pin bias
Date: Wed, 28 Nov 2018 16:44:40 -0800
Message-ID: <7h7egwd85j.fsf@baylibre.com>
References: <20181109140445.17795-1-jbrunet@baylibre.com> <20181109140445.17795-5-jbrunet@baylibre.com> <CAFBinCCDMUem0AJ56jrW2ZQf06Q=O690aRwWY4Ua79np0J+g+w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFBinCCDMUem0AJ56jrW2ZQf06Q=O690aRwWY4Ua79np0J+g+w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, jbrunet@baylibre.com
Cc: carlo@caione.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> On Fri, Nov 9, 2018 at 3:05 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>>
>> On Amlogic chipsets, the bias set through pinconf applies to the pad
>> itself, not only the GPIO function. This means that even when we change
>> the function of the pad from GPIO to anything else, the bias previously
>> set still applies.
>>
>> As we have seen with the eMMC, depending on the bias type and the function,
>> it may trigger problems.
>>
>> The underlying issue is that we inherit whatever was left by previous user
>> of the pad (pinconf, u-boot or the ROM code). As a consequence, the actual
>> setup we will get is undefined.
>>
>> There is nothing mentioned in the documentation about pad bias and pinmux
>> function, however leaving it undefined is not an option.
>>
>> This change consistently disable the pad bias for every pinmux functions.
>> It seems to work well, we can only assume that the necessary bias (if any)
>> is already provided by the pin function itself.
>>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> Acked-by: Martin Blumenstingl<martin.blumenstingl@googlemail.com>
>
> my Odroid-C1 still boots fine from SD card and Ethernet (ping) also still works
>
> Kevin, can you please move this patch from your v4.21/dt64 branch to
> the v4.21/dt (32-bit) branch?
> all other patches from this series are for the 64-bit SoCs, so only
> this single patch has to be moved

Thanks for catching it.

I moved it to the 32-bit branch, and added your ack.

Kevin
