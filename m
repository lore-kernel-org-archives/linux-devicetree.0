From: arno@natisbad.org (Arnaud Ebalard)
Subject: Re: [PATCHv0 5/5] dt-bindings: fix isl vs isil prefix issue for Intersil
Date: Mon, 15 Dec 2014 19:05:18 +0100
Message-ID: <87388gkcv5.fsf@natisbad.org>
References: <cover.1418519430.git.arno@natisbad.org>
	<b2c34bea6fc7bd42d636c9cadfe1b7e5ec523aeb.1418519430.git.arno@natisbad.org>
	<20141215135545.GC967@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20141215135545.GC967@titan.lakedaemon.net> (Jason Cooper's
	message of "Mon, 15 Dec 2014 08:55:45 -0500")
Sender: linux-doc-owner@vger.kernel.org
To: Jason Cooper <jason@lakedaemon.net>
Cc: Andrew Morton <akpm@linux-foundation.org>, Uwe =?utf-8?Q?Kleine-K?= =?utf-8?Q?=C3=B6nig?= <uwe@kleine-koenig.org>, Mark Rutland <mark.rutland@arm.com>, Alessandro Zummo <a.zummo@towertech.it>, Peter Huewe <peter.huewe@infineon.com>, Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <treding@nvidia.com>, Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Darshana Padmadas <darshanapadmadas@gmail.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Rob Landley <rob@landley.net>, rtc-linux@googlegroups.com, Guenter Roeck <linux@roeck-us.net>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@l
List-Id: devicetree@vger.kernel.org

Hi,

Jason Cooper <jason@lakedaemon.net> writes:

>> AFAICT, it seems it makes sense to *definitively* settle for isil as the
>> vendor prefix for Intersil, as Philip did in 7a6540ca856a: it's the NASDAQ
>> symbol and this choice requires less changes than opting for isl.
>> 
>> So, this patch changes compatible strings in .dts files to use isil where
>> isl was found before, and modify drivers w/ compatible strings using isl
>> to add one using isil. In those cases, a comment is made that the old
>> compatible string is kept for backward compatibility (w/ out-fo-tree users
>> of those drivers). Additionally, it leaves only isil as prefix in
>> vendor-prefixes.txt. Those changes should prevent any new inclusion of
>> isl compatible strings for Intersil devices due to copy-and-paste.
>> 
>> Signed-off-by: Arnaud Ebalard <arno@natisbad.org>
>> ---
>>  Documentation/devicetree/bindings/i2c/trivial-devices.txt | 5 ++---
>>  Documentation/devicetree/bindings/regulator/isl9305.txt   | 4 ++--
>>  Documentation/devicetree/bindings/vendor-prefixes.txt     | 3 +--
>
>>  arch/arm/boot/dts/tegra30-cardhu.dtsi                     | 2 +-
>>  arch/arm/boot/dts/zynq-parallella.dts                     | 2 +-
>
>>  drivers/regulator/isl9305.c                               | 6 ++++--
>>  drivers/rtc/rtc-isl12022.c                                | 3 ++-
>>  drivers/rtc/rtc-isl12057.c                                | 3 ++-
>>  drivers/staging/iio/light/isl29028.c                      | 4 ++--
>>  9 files changed, 17 insertions(+), 15 deletions(-)
>
> Please split the dts{i} changes out into a separate patch.  The
> different maintainers under drivers/ may want separate patches as well.

I will prepare that, and then let get_maintainer.pl decide who should
be added to the CC: list. But before doing that work, I would like to
at least get some feedback that there will not be a big NAK on the
whole approach in the end.

Cheers,

a+
