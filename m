From: Yixun Lan <yixun.lan@amlogic.com>
Subject: Re: [PATCH v2 2/3] clk: meson: add sub MMC clock dt-bindings IDs
Date: Thu, 12 Jul 2018 10:51:28 +0800
Message-ID: <84511d9a-5d29-ae6f-de0b-4701bafe2ab7@amlogic.com>
References: <20180710163658.6175-1-yixun.lan@amlogic.com>
 <20180710163658.6175-3-yixun.lan@amlogic.com>
 <20180711194546.GA7090@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180711194546.GA7090@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: yixun.lan@amlogic.com, Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Boris Brezillon <boris.brezillon@bootlin.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Liang Yang <liang.yang@amlogic.com>, Qiufang Dai <qiufang.dai@amlogic.com>, Jian Hu <jian.hu@amlogic.com>, linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Rob

On 07/12/18 03:45, Rob Herring wrote:
> On Tue, Jul 10, 2018 at 04:36:57PM +0000, Yixun Lan wrote:
>> Add two clock bindings IDs which provided by the MMC clock controller,
>> These two clocks will be used by MMC or NAND driver.
> 
> I count 3 ids.
I will update this

> 
>>
>> Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
>> ---
>>  .../dt-bindings/clock/amlogic,meson-mmc-clkc.h   | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>  create mode 100644 include/dt-bindings/clock/amlogic,meson-mmc-clkc.h
> 
> This can go with the binding patch.
> 
sure

.
