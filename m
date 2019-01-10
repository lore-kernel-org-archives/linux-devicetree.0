From: Loys Ollivier <lollivier@baylibre.com>
Subject: Re: [PATCH v2] arm64: dts: meson: Fix mmc cd-gpio polarity
Date: Thu, 10 Jan 2019 13:58:35 +0100
Message-ID: <861s5ku0sk.fsf@baylibre.com>
References: <1547042198-17601-1-git-send-email-lollivier@baylibre.com> <CACRpkdbhVB7-Y9EBhBC6GAxqFt8zujS2QJ4CzGDJnDMDjj2Ptg@mail.gmail.com> <CAFBinCBf+yJu4z1JYNdH7B4h07-U_0ckysV_=nC65nd5ByOCvA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <CAFBinCBf+yJu4z1JYNdH7B4h07-U_0ckysV_=nC65nd5ByOCvA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Loys Ollivier <lollivier@baylibre.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Kevin Hilman <khilman@baylibre.com>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
List-Id: devicetree@vger.kernel.org

Hi,

On Wed 09 Jan 2019 at 22:14, Martin Blumenstingl wrote:

> Hi,
>
> On Wed, Jan 9, 2019 at 7:31 PM Linus Walleij <linus.walleij@linaro.org> 
> wrote:
>>
>> Hi Ollivier!
>>
>> On Wed, Jan 9, 2019 at 2:56 PM Loys Ollivier <lollivier@baylibre.com> 
>> wrote:
>>
>> > Commit 89a5e15bcba8 ("gpio/mmc/of: Respect polarity in the device tree")
>> > changed the behavior of "cd-inverted" to follow the device tree bindings
>> > specification.
>> > Lines specifying "cd-inverted" are now "acitve high".
> there's a typo in the description - it should be "active"
>
Thanks I'll fix it.
>> >
>> > Fix the SD card for meson by setting the cd-gpio as "active low" 
>> > according
>> > to the boards specifications.
>> >
>> > Fixes: 89a5e15bcba8 ("gpio/mmc/of: Respect polarity in the device tree")
>> > Signed-off-by: Loys Ollivier <lollivier@baylibre.com>
>> >
>> > v2: fix more occurences, also in other meson boards.
>>
>> This is a good change in itself since it gets rid of some occasions
>> of the dreaded "cd-inverted" property. I think Martin Blumenstingl
>> already sent patches like these though (I might be confused).
> I sent patches for the 32-bit Amlogic SoCs
> my TODO-list is now a bit longer, I'll test this series on my Khadas
> VIM, VIM2 and Libretech CC during the weekend
>
I have seen Martin's patch for the arm boards.
This adresses arm64 boards.
Tested on libretech-cc.

>> But we should keep the old device trees working as well.
>> Can you test if Martins patch:
>> https://marc.info/?l=linux-mmc&m=154637189021211&w=2
>>
>> Also makes your boards work?
> feedback on that patch is appreciated
>
Answered to the patch mail directly. Tested on libretech-cc, it works.
Fixing the meson boards DT for future release would still be valid imho.

>
> Regards
> Martin

Best,
Loys
-- 
-L
