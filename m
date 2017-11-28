From: Yixun Lan <yixun.lan@amlogic.com>
Subject: Re: [PATCH v2 0/2] add clk controller driver for Meson-AXG SoC
Date: Tue, 28 Nov 2017 20:47:09 +0800
Message-ID: <78b268eb-6aff-a9c4-e358-f91069e12da5@amlogic.com>
References: <20171127094844.16742-1-yixun.lan@amlogic.com>
 <1511790489.30519.11.camel@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1511790489.30519.11.camel@baylibre.com>
Sender: linux-clk-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: yixun.lan@amlogic.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Carlo Caione <carlo@caione.org>, Qiufang Dai <qiufang.dai@amlogic.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi jerome:


On 11/27/17 21:48, Jerome Brunet wrote:
> On Mon, 2017-11-27 at 17:48 +0800, Yixun Lan wrote:
>> Add driver for the clk controller which found in Meson AXG SoC
>>
>>   Note, we deliberately create a seperate source file for the Meson AXG
>> series, instead of sharing code with previous GXBB/GXL - the file axg.c
>> It would help us maintaining the code more easily.
> 
> But this will be the last meson SoC added this way. We need factor the code the
> between meson8, gx and axg series since there is a lot of duplication there.
> 
>>
>> Changes since v1 [1]:
>>  - rework register definion, use '(offset << 2)' to better match
> 
> As previously discussed, please drop these calculations and just write what the
> offset actually are. Putting one comment at the top, explaining the translation,
> would be nice though. 
> 
can drop the calculations, but there is already a comment at top here..

>>    the description from data sheet
>>  - drop "#include dt-bindings/clock/gxbb-aoclkc.h" from dts
>>  - rebase code to v4.15-rc1
>>
>> [1] 
>>   http://lists.infradead.org/pipermail/linux-amlogic/2017-November/005239.html
>>   http://lists.infradead.org/pipermail/linux-amlogic/2017-November/005240.html
>>   http://lists.infradead.org/pipermail/linux-amlogic/2017-November/005241.html
>>
>>
>> Qiufang Dai (2):
> 
> First patch of the series should be adding the compatible documentation, which
> is missing here (unless it has gone through another channel and I missed it)
> 
I missed the dt-binding, will fix in next version

>>   clk: meson-axg: add clock controller drivers
>>   arm64: dts: meson-axg: add clock DT info for Meson AXG SoC
>>
>>  arch/arm64/Kconfig.platforms               |   1 +
>>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi |  15 +
>>  drivers/clk/meson/Kconfig                  |   8 +
>>  drivers/clk/meson/Makefile                 |   1 +
>>  drivers/clk/meson/axg.c                    | 948
>> +++++++++++++++++++++++++++++
>>  drivers/clk/meson/axg.h                    | 126 ++++
>>  include/dt-bindings/clock/axg-clkc.h       |  72 +++
>>  7 files changed, 1171 insertions(+)
>>  create mode 100644 drivers/clk/meson/axg.c
>>  create mode 100644 drivers/clk/meson/axg.h
>>  create mode 100644 include/dt-bindings/clock/axg-clkc.h
>>
> 
> .
> 

