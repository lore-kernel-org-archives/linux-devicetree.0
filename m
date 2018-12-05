From: Jian Hu <jian.hu@amlogic.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: clk: meson-g12a: Add G12A EE Clock
 Bindings
Date: Wed, 5 Dec 2018 11:10:51 +0800
Message-ID: <5d181208-1d51-fb1d-da8f-d8e1f55709ac@amlogic.com>
References: <1543498917-98605-1-git-send-email-jian.hu@amlogic.com>
 <1543498917-98605-2-git-send-email-jian.hu@amlogic.com>
 <20181203230645.GA14522@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181203230645.GA14522@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Yixun Lan <yixun.lan@amlogic.com>, Qiufang Dai <qiufang.dai@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>, linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi, Rob

I will add it in next version, thanks.

On 2018/12/4 7:06, Rob Herring wrote:
> On Thu, Nov 29, 2018 at 09:41:56PM +0800, Jian Hu wrote:
>> Add new clock controller compatible and dt-bingdings headers
>> for the Everything-Else domain of the g12a SoC
>>
>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>> ---
>>   .../bindings/clock/amlogic,gxbb-clkc.txt           |  1 +
>>   include/dt-bindings/clock/g12a-clkc.h              | 93 ++++++++++++++++++++++
>>   2 files changed, 94 insertions(+)
>>   create mode 100644 include/dt-bindings/clock/g12a-clkc.h
> 
> Please add acks/reviewed-bys when posting new versions.
> 
> Rob
> 
> .
> 
