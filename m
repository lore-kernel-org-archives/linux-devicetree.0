From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 0/3] ARM: dts: meson: add the APB/APB2 busses
Date: Wed, 12 Dec 2018 10:52:32 +0100
Message-ID: <3aad3554-9320-e356-c78d-5dec0cccb380@baylibre.com>
References: <20181208165025.27689-1-martin.blumenstingl@googlemail.com>
 <ba3e4fef-7a18-8c7d-e0ea-05c541b29913@baylibre.com>
 <CAFBinCBYBAqtKp_edgs6b44MpOhc-iN_FwR425bkU4xirGQKvA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFBinCBYBAqtKp_edgs6b44MpOhc-iN_FwR425bkU4xirGQKvA@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, khilman@baylibre.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 11/12/2018 23:09, Martin Blumenstingl wrote:
> Hi Neil,
> 
> On Tue, Dec 11, 2018 at 10:16 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> On 08/12/2018 17:50, Martin Blumenstingl wrote:
>>> This adds the APB bus on Meson8 and Meson8b as well as the APB2 bus on
>>> Meson6. This is preparation work for adding the Mali GPU which is
>>> located on theses busses.
>>>
>>> Meson6 seems to have it's APB at 0xc8000000 instead of 0xd0000000. The
>>> region at 0xd0000000 is called APB2 or A9_APB and it has a different
>>> size (256k) compared to Meson8 and Meson8b (2M).
>>>
>>> Addresses and sizes are taken from the Amlogic 3.10 kernel sources:
>>> - Meson6: [0]
>>> - Meson8: [1]
>>> - Meson8b: [2]
>>>
>>>
>>> Changes since v1 at [3]:
>>> - re-send the patches but this time don't include the old patches
>>>   which still had a typo in the patch description (ABP vs APB)
>>>
>>>
>>> [0] https://github.com/endlessm/linux-meson/blob/cd4096c3ff4eb5b8a8a5581bb46508601c5470dc/arch/arm/mach-meson6/include/mach/io.h#L61
>>> [1] https://github.com/endlessm/linux-meson/blob/cd4096c3ff4eb5b8a8a5581bb46508601c5470dc/arch/arm/mach-meson8/include/mach/io.h#L53
>>> [2] https://github.com/endlessm/linux-meson/blob/cd4096c3ff4eb5b8a8a5581bb46508601c5470dc/arch/arm/mach-meson8b/include/mach/io.h#L53
>>> [3] http://lists.infradead.org/pipermail/linux-amlogic/2018-December/009424.html
>>>
>>>
>>> Martin Blumenstingl (3):
>>>   ARM: dts: meson6: add the APB2 bus
>>>   ARM: dts: meson8: add the APB bus
>>>   ARM: dts: meson8b: add the APB bus
>>>
>>>  arch/arm/boot/dts/meson6.dtsi  | 8 ++++++++
>>>  arch/arm/boot/dts/meson8.dtsi  | 8 ++++++++
>>>  arch/arm/boot/dts/meson8b.dtsi | 8 ++++++++
>>>  3 files changed, 24 insertions(+)
>>>
>>
>> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> thank you for taking the time to review this!
> 
>> But frankly I'll squash the meson8/meson8b patches with the mali node patches !
> I didn't do this because I realized that there are different busses
> between Meson6 and Meson8/Meson8b. so I wanted to have a commit
> message which describes this.
> if you prefer I can still squash the Meson8 and Meson8b patches into
> their corresponding GPU .dts patch but I would like to keep the Meson6
> patch (as I'm not planning to add the Mali GPU until someone can
> actually test it on that SoC)

Yes this is what I was thinking actually !

Neil

> 
> 
> Regards
> Martin
> 
