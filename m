From: Yixun Lan <yixun.lan@amlogic.com>
Subject: Re: [PATCH v3 1/2] clk: meson: add DT documentation for emmc clock
 controller
Date: Fri, 27 Jul 2018 22:14:28 +0800
Message-ID: <e797412b-55db-6678-82ba-3a10ac99db9f@amlogic.com>
References: <20180712211244.11428-1-yixun.lan@amlogic.com>
 <20180712211244.11428-2-yixun.lan@amlogic.com>
 <20180724232917.GA27041@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180724232917.GA27041@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: yixun.lan@amlogic.com, Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Boris Brezillon <boris.brezillon@bootlin.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Liang Yang <liang.yang@amlogic.com>, Qiufang Dai <qiufang.dai@amlogic.com>, Jian Hu <jian.hu@amlogic.com>, linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


HI Rob

On 07/25/2018 07:29 AM, Rob Herring wrote:
> On Thu, Jul 12, 2018 at 09:12:43PM +0000, Yixun Lan wrote:
>> Document the MMC sub clock controller driver, the potential consumer
>> of this driver is MMC or NAND. Also add three clock bindings IDs which
>> provided by this driver.
>>
>> Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
>> ---
>>  .../bindings/clock/amlogic,mmc-clkc.txt       | 31 +++++++++++++++++++
>>  .../clock/amlogic,meson-mmc-clkc.h            | 16 ++++++++++
>>  2 files changed, 47 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,mmc-clkc.txt
>>  create mode 100644 include/dt-bindings/clock/amlogic,meson-mmc-clkc.h
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> 

Thanks for the review!

There is a discussion about dropping "meson-" prefix in the compatible
string[1]

So, I will send another version with the new compatible name adjusted
from "amlogic,meson-axg-mmc-clkc" to "amlogic,axg-mmc-clkc"..
probably also rename the dt-bindings header file to amlogc,mmc-clkc.h

[1]  https://lkml.kernel.org/r/7hk1prmg4w.fsf@baylibre.com


Yixun
