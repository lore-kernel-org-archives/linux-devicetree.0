From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [BUG] [PATCH v5 02/10] mfd: mt6397: extract irq related code from
 core driver
Date: Fri, 23 Aug 2019 16:56:13 +0200
Message-ID: <e8a918ab-3e7a-b487-db77-df28d56518ce@gmail.com>
References: <1566531931-9772-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1566531931-9772-3-git-send-email-hsin-hsiung.wang@mediatek.com>
 <trinity-1f82bff1-535e-47cd-9a2f-8faccb56e356-1566562433314@3c-app-gmx-bs11>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <trinity-1f82bff1-535e-47cd-9a2f-8faccb56e356-1566562433314@3c-app-gmx-bs11>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Wunderlich <frank-w@public-files.de>, Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Mark Rutland <mark.rutland@arm.com>, Alessandro Zummo <a.zummo@towertech.it>, srv_heupstream@mediatek.com, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kate Stewart <kstewart@linuxfoundation.org>, Sean Wang <sean.wang@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Richard Fontana <rfontana@redhat.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>, Eddie Huang <eddie.huang@mediatek.com>, linux-rtc@vger.kernel.org, =?UTF-8?Q?Ren=c3=a9_van_Dorst?= <opensource@vdorst.com>
List-Id: devicetree@vger.kernel.org



On 23/08/2019 14:13, Frank Wunderlich wrote:
> Hi,
> 
> this commit breaks mt6323 pmic on BananaPi-R2
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=a4872e80ce7d2a1844328176dbf279d0a2b89bdb
> 
> resulting in this message in dmesg:
> 
> mt6397 1000d000.pwrap:mt6323: unsupported chip: 0x0
> and multiple
> mtk-cpufreq mtk-cpufreq: failed to initialize dvfs info for cpu0
> 
> see discussion here:
> http://lists.infradead.org/pipermail/linux-mediatek/2019-August/022505.html
> 
> after reverting this one the errors are gone, please provide a fix

are you sure that you provide the correct chip_id here? I saw 0x2023 (if I
remember correctly), while this switch checks for 0x23, 0x91 and 0x97, so I'm
not sure if the problem really lies here. I didn't dig into the code to find out
how the chip_id is created.

Regards,
Matthias

> 
> regards Frank
> 
> 
>> Gesendet: Freitag, 23. August 2019 um 05:45 Uhr
>> Von: "Hsin-Hsiung Wang" <hsin-hsiung.wang@mediatek.com>
>> Betreff: [PATCH v5 02/10] mfd: mt6397: extract irq related code from core driver
>>
>> In order to support different types of irq design, we decide to add
>> separate irq drivers for different design and keep mt6397 mfd core
>> simple and reusable to all generations of PMICs so far.
>>
>> Acked-for-mfd-by: Lee Jones <lee.jones@linaro.org>
>> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
>> ---
>>  drivers/mfd/Makefile            |   3 +-
>>  drivers/mfd/mt6397-core.c       | 146 --------------------------------
>>  drivers/mfd/mt6397-irq.c        | 181 ++++++++++++++++++++++++++++++++++++++++
>>  include/linux/mfd/mt6397/core.h |   9 ++
>>  4 files changed, 192 insertions(+), 147 deletions(-)
>>  create mode 100644 drivers/mfd/mt6397-irq.c
> 
