From: Yixun Lan <yixun.lan@amlogic.com>
Subject: Re: [PATCH v3 2/3] clk: meson-axg: add clock controller drivers
Date: Wed, 29 Nov 2017 07:16:52 +0800
Message-ID: <1811d609-36bc-290c-6405-80121e4de8bb@amlogic.com>
References: <20171128125330.363-1-yixun.lan@amlogic.com>
 <20171128125330.363-3-yixun.lan@amlogic.com>
 <20171128163022.7b7wvfqedkhhnaj6@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20171128163022.7b7wvfqedkhhnaj6@rob-hp-laptop>
Sender: linux-clk-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: yixun.lan@amlogic.com, Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Carlo Caione <carlo@caione.org>, Qiufang Dai <qiufang.dai@amlogic.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



HI Rob

On 11/29/17 00:30, Rob Herring wrote:
> On Tue, Nov 28, 2017 at 08:53:29PM +0800, Yixun Lan wrote:
>> From: Qiufang Dai <qiufang.dai@amlogic.com>
>>
>> Add clock controller drivers for Amlogic Meson-AXG SoC.
>>
>> Signed-off-by: Qiufang Dai <qiufang.dai@amlogic.com>
>> Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
>> ---
>>  arch/arm64/Kconfig.platforms         |   1 +
>>  drivers/clk/meson/Kconfig            |   8 +
>>  drivers/clk/meson/Makefile           |   1 +
>>  drivers/clk/meson/axg.c              | 948 +++++++++++++++++++++++++++++++++++
>>  drivers/clk/meson/axg.h              | 126 +++++
> 
>>  include/dt-bindings/clock/axg-clkc.h |  72 +++
> 
> This belongs in the binding patch.
> 
is it Ok to keep it in this patch?
the initial idea to do this is to keep the commit bisectable..

> Otherwise, 
> 
> Acked-by: Rob Herring <robh@kernel.org>
> 
> 
>>  6 files changed, 1156 insertions(+)
>>  create mode 100644 drivers/clk/meson/axg.c
>>  create mode 100644 drivers/clk/meson/axg.h
>>  create mode 100644 include/dt-bindings/clock/axg-clkc.h
> 
> .
> 

