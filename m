From: Jiancheng Xue <xuejiancheng@hisilicon.com>
Subject: Re: [PATCH v2] clk: hisilicon: add CRG driver for Hi3798CV200 SoC
Date: Sat, 24 Sep 2016 09:45:11 +0800
Message-ID: <5a6e3727-214a-c791-3d8d-3982ae2f6bac@hisilicon.com>
References: <1474183821-7570-1-git-send-email-xuejiancheng@hisilicon.com>
 <20160923174704.GA32729@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20160923174704.GA32729@rob-hp-laptop>
Sender: linux-clk-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, mark.rutland@arm.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, yanhaifeng@hisilicon.com, gaofei@hisilicon.com, hermit.wangheming@hisilicon.com, scott.bambrough@linaro.org, mark.gregotski@linaro.org
List-Id: devicetree@vger.kernel.org

在 2016/9/24 1:47, Rob Herring 写道:
> On Sun, Sep 18, 2016 at 03:30:21PM +0800, Jiancheng Xue wrote:
>> Add CRG driver for Hi3798CV200 SoC. CRG(Clock and Reset
>> Generator) module generates clock and reset signals used
>> by other module blocks on SoC.
>>
>> Signed-off-by: Jiancheng Xue <xuejiancheng@hisilicon.com>
>> ---
>> change log
>> v2:
>> - Fixed compiling error when compiled as a module.
>> - Fixed issues pointed by Stephen Boyd.
>> - Added prefix HISTB for clock index macro definitions.
>>
>>  .../clock/{hi3519-crg.txt => hisi-crg.txt}         |  11 +-
>>  drivers/clk/hisilicon/Kconfig                      |   8 +
>>  drivers/clk/hisilicon/Makefile                     |   1 +
>>  drivers/clk/hisilicon/crg-hi3798cv200.c            | 305 +++++++++++++++++++++
>>  drivers/clk/hisilicon/crg.h                        |  34 +++
>>  include/dt-bindings/clock/histb-clock.h            |  64 +++++
>>  6 files changed, 419 insertions(+), 4 deletions(-)
>>  rename Documentation/devicetree/bindings/clock/{hi3519-crg.txt => hisi-crg.txt} (82%)
>>  create mode 100644 drivers/clk/hisilicon/crg-hi3798cv200.c
>>  create mode 100644 drivers/clk/hisilicon/crg.h
>>  create mode 100644 include/dt-bindings/clock/histb-clock.h
>>
>> diff --git a/Documentation/devicetree/bindings/clock/hi3519-crg.txt b/Documentation/devicetree/bindings/clock/hisi-crg.txt
>> similarity index 82%
>> rename from Documentation/devicetree/bindings/clock/hi3519-crg.txt
>> rename to Documentation/devicetree/bindings/clock/hisi-crg.txt
>> index acd1f23..e3919b6 100644
>> --- a/Documentation/devicetree/bindings/clock/hi3519-crg.txt
>> +++ b/Documentation/devicetree/bindings/clock/hisi-crg.txt
>> @@ -1,7 +1,7 @@
>> -* Hisilicon Hi3519 Clock and Reset Generator(CRG)
>> +* HiSilicon Clock and Reset Generator(CRG)
>>  
>> -The Hi3519 CRG module provides clock and reset signals to various
>> -controllers within the SoC.
>> +The CRG module provides clock and reset signals to various
>> +modules within the SoC.
>>  
>>  This binding uses the following bindings:
>>      Documentation/devicetree/bindings/clock/clock-bindings.txt
>> @@ -10,7 +10,10 @@ This binding uses the following bindings:
>>  Required Properties:
>>  
>>  - compatible: should be one of the following.
>> -  - "hisilicon,hi3519-crg" - controller compatible with Hi3519 SoC.
>> +  - "hisilicon,hi3516cv300-crg"
>> +  - "hisilicon,hi3519-crg"
>> +  - "hisilicon,hi3798cv200-crg"
>> +  - "hisilicon,hi3798cv200-sysctrl"
> 
> Why crg and sysctrl?
> 
Hi Rob，

In Hi3798cv200 SoC, the system controller (sysctrl) is another clock
provider which provides clocks for some modules such as timer0, uart0,
ir, led etc. These modules won't be power down when the system enters
into the stand-by mode. Besides providing above clocks, sysctrl also
contains registers used to control the whole system and some peripherals.

Thanks,
Jiancheng

>>  
>>  - reg: physical base address of the controller and length of memory mapped
>>    region.
> 
> .
> 

