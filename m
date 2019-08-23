From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [BUG] [PATCH v5 02/10] mfd: mt6397: extract irq related code from
 core driver
Date: Fri, 23 Aug 2019 17:42:05 +0200
Message-ID: <b5a21908-faee-17d1-ce26-99b941c0fa70@gmail.com>
References: <1566531931-9772-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1566531931-9772-3-git-send-email-hsin-hsiung.wang@mediatek.com>
 <trinity-1f82bff1-535e-47cd-9a2f-8faccb56e356-1566562433314@3c-app-gmx-bs11>
 <e8a918ab-3e7a-b487-db77-df28d56518ce@gmail.com>
 <0A87F427-2D81-412A-9549-09A51A021799@public-files.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0A87F427-2D81-412A-9549-09A51A021799@public-files.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: frank-w@public-files.de, linux-mediatek@lists.infradead.org, Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, srv_heupstream@mediatek.com, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sean Wang <sean.wang@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, Richard Fontana <rfontana@redhat.com>, Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org, =?UTF-8?Q?Ren=c3=a9_van_Dorst?= <opensource@vdorst.com>, Thomas Gleixner <tglx@linutronix.de>, Eddie Huang <eddie.huang@mediatek.com>, Lee Jones <lee.jones@linaro.org>, Kate Stewart <kstewart@linuxfoundation.org>, linux-rtc@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 23/08/2019 17:26, Frank Wunderlich wrote:
> 
> 
> Am 23. August 2019 16:56:13 MESZ schrieb Matthias Brugger <matthias.bgg@gmail.com>:
>> are you sure that you provide the correct chip_id here? I saw 0x2023
>> (if I
>> remember correctly), while this switch checks for 0x23, 0x91 and 0x97,
>> so I'm
>> not sure if the problem really lies here. I didn't dig into the code to
>> find out
>> how the chip_id is created.
> 
> The chip-id 0x2023 is reported with 5.3-rc5, next-code says 0x0. So i guess the chipid is read out/calculated the wrong way. If calculation is not changed the read is changed compared to 5.3
> 

I suppose that's because 3/10 has code that should be in 2/10 and for some
reason 3/10 was not pushed for linux-next inclusion. Although it has the same
Acked-for-mfd-by tag.

@Frank, can you test if adding 3/10 to your code base fixes the issue?

Regards,
Matthias
