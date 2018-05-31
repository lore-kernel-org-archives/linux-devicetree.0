From: Suzuki K Poulose <Suzuki.Poulose@arm.com>
Subject: Re: [PATCH v2 00/12] coresight: tmc-etr Transparent buffer management
Date: Thu, 31 May 2018 17:17:58 +0100
Message-ID: <7ddccf7d-9d83-fff3-98db-046da029963b@arm.com>
References: <1527599737-28408-1-git-send-email-suzuki.poulose@arm.com>
 <CANLsYkxStH5R0_8WFF1oe=PCCFr4Ko+0J+Xhn-wzopFFDgrRCw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CANLsYkxStH5R0_8WFF1oe=PCCFr4Ko+0J+Xhn-wzopFFDgrRCw@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mike Leach <mike.leach@linaro.org>, Robert Walker <robert.walker@arm.com>, coresight@lists.linaro.org, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

On 31/05/18 16:36, Mathieu Poirier wrote:
> On 29 May 2018 at 07:15, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:

>> Suzuki K Poulose (12):
>>    coresight: ETM: Add support for Arm Cortex-A73 and Cortex-A35
>>    coresight: tmc: Hide trace buffer handling for file read
>>    coresight: tmc-etr: Do not clean trace buffer
>>    coresight: tmc-etr: Disallow perf mode
>>    coresight: Add helper for inserting synchronization packets
>>    dts: bindings: Restrict coresight tmc-etr scatter-gather mode
>>    dts: juno: Add scatter-gather support for all revisions
>>    coresight: Add generic TMC sg table framework
>>    coresight: Add support for TMC ETR SG unit
>>    coresight: tmc-etr: Add transparent buffer management
>>    coresight: tmc-etr buf: Add TMC scatter gather mode backend
>>    coresight: tmc: Add configuration support for trace buffer size
>>
>>   .../ABI/testing/sysfs-bus-coresight-devices-tmc    |    8 +
>>   .../devicetree/bindings/arm/coresight.txt          |    5 +-
>>   arch/arm64/boot/dts/arm/juno-base.dtsi             |    1 +
>>   drivers/hwtracing/coresight/coresight-etb10.c      |   12 +-
>>   drivers/hwtracing/coresight/coresight-etm4x.c      |   31 +-
>>   drivers/hwtracing/coresight/coresight-priv.h       |   10 +-
>>   drivers/hwtracing/coresight/coresight-tmc-etf.c    |   45 +-
>>   drivers/hwtracing/coresight/coresight-tmc-etr.c    | 1010 ++++++++++++++++++--
>>   drivers/hwtracing/coresight/coresight-tmc.c        |   83 +-
>>   drivers/hwtracing/coresight/coresight-tmc.h        |  110 ++-
>>   drivers/hwtracing/coresight/coresight.c            |    3 +-
>>   11 files changed, 1144 insertions(+), 174 deletions(-)
> 
> Applied after correcting indentation problems and rectifying the
> kernel version and date in "sysfs-bus-coresight-devices-tmc".

Mathieu,

Thanks for the fixups.

Suzuki
