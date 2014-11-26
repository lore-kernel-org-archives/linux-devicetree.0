From: arno@natisbad.org (Arnaud Ebalard)
Subject: Re: [PATCHv1 0/6] rtc: rtc-isl12057: fixes and alarm support
Date: Wed, 26 Nov 2014 19:35:56 +0100
Message-ID: <874mtlyflf.fsf@natisbad.org>
References: <cover.1416006090.git.arno@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Jason Cooper <jason@lakedaemon.net>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Peter Huewe <peter.huewe@infineon.com>, Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <treding@nvidia.com>, devicetree@vger.kernel.org, rtc-linux@googlegroups.com, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, linux-doc@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>, linux-arm-kernel@lists.infradead.org, Rob Landley <rob@landley.net>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, Guenter Roeck <linux@roeck-us.net>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Hi Jason and Mark,

Arnaud Ebalard <arno@natisbad.org> writes:

> This series includes six patches for Intersil ISL12057 driver.
>
>  - First patch is a fix for masking issues which dates back to driver
>    inclusion. Even if those issues are not critical per se, the patch is
>    a good candidate for stable down to 3.14.
>
>  - As suggested by Uwe, second patch adds proper support for century bit
>    provided by the driver. This will allow to use the chip until 2199
>    if we manage to pass 2038.
>
>  - Following another comment by Uwe, third patch corrects the handling
>    of oscillator failure bit.
>
>  - fourth patch fixes remaining places where 'isl' is used instead of the
>    expected NASDAQ symbol for Intersil (i.e. isil) after commit
>    7a6540ca856ae ("ARM: mvebu: Change vendor prefix for Intersil 
>    Corporation to isil"). 
>
>  - As suggested by Mark, fifth patch improves failure reports by providing
>    error code in dev_err() code.
>
>  - Sixth patch provides alarm support for Intersil ISL12057. This
>    support was not added when the driver was initially pushed in 3.14
>    kernel due to the inability to check interrupt support. After some
>    soldering, this tests have been performed. More time was also
>    spent on testing.

I wonder if you could take a look at this series I sent providing fixes
(patches #1-5) and alarm support (patch #6) for ISL12057 RTC Chip. As
all people do for RTC patches - due to lack of feedback from maintainer
- I am looking for someone to review the patches (Mark, patch 6 has a
sticker w/ regmap-inside ;-)) and then push those upstream if they are
ok (Jason, you handled that part for 70e123373c05: "rtc: Add support for
Intersil ISL12057 I2C RTC chip" in 2013 for the same reason).

Note that I addressed previous comments and feedback received from Uwe
and also spent time to do some soldering in order to support and test
the last patch for both my use case (Alarm IRQ signal not routed to the
SoC on ReadyNAS RN102, RN104 and RN2120) and the common case.

Do not hesitate to ask if you want me to resend!

Cheers,

a+

Thread: http://thread.gmane.org/gmane.linux.documentation/28237
Patch 1/6: https://patchwork.kernel.org/patch/5310101/raw/
Patch 2/6: https://patchwork.kernel.org/patch/5310111/raw/
Patch 3/6: https://patchwork.kernel.org/patch/5310121/raw/
Patch 4/6: https://patchwork.kernel.org/patch/5310131/raw/
Patch 5/6: https://patchwork.kernel.org/patch/5310141/raw/
Patch 6/6: https://patchwork.kernel.org/patch/5310151/raw/
