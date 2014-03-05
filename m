From: Santosh Shilimkar <santosh.shilimkar@ti.com>
Subject: Re: [PATCH 2/3] soc: keystone: add QMSS driver
Date: Wed, 5 Mar 2014 10:47:18 +0800
Message-ID: <53169036.9060808@ti.com>
References: <1393629520-12713-1-git-send-email-santosh.shilimkar@ti.com>
 <1393629520-12713-3-git-send-email-santosh.shilimkar@ti.com>
 <AAE2808F-A2C8-4031-BFA4-1A20B182EA69@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <AAE2808F-A2C8-4031-BFA4-1A20B182EA69@codeaurora.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kumar Gala <galak@codeaurora.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Nair, Sandeep" <sandeep_n@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>, Grant Likely <grant.likely@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 05 March 2014 01:59 AM, Kumar Gala wrote:
> 
> On Feb 28, 2014, at 5:18 PM, Santosh Shilimkar <santosh.shilimkar@ti.com> wrote:
> 
>> From: Sandeep Nair <sandeep_n@ti.com>
>>
>> The QMSS (Queue Manager Sub System) found on Keystone SOCs is one of
>> the main hardware sub system which forms the backbone of the Keystone
>> Multi-core Navigator. QMSS consist of queue managers, packed-data structure
>> processors(PDSP), linking RAM, descriptor pools and infrastructure
>> Packet DMA.
>>
>> The Queue Manager is a hardware module that is responsible for accelerating
>> management of the packet queues. Packets are queued/de-queued by writing or
>> reading descriptor address to a particular memory mapped location. The PDSPs
>> perform QMSS related functions like accumulation, QoS, or event management.
>> Linking RAM registers are used to link the descriptors which are stored in
>> descriptor RAM. Descriptor RAM is configurable as internal or external memory.
>>
>> The QMSS driver manages the PDSP setups, linking RAM regions,
>> queue pool management (allocation, push, pop and notify) and descriptor
>> pool management. The specifics on the device tree bindings for
>> QMSS can be found in:
>>        Documentation/devicetree/bindings/soc/keystone-qmss.txt
>>
>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Cc: Kumar Gala <galak@codeaurora.org>
>> Cc: Olof Johansson <olof@lixom.net>
>> Cc: Arnd Bergmann <arnd@arndb.de>
>> Cc: Grant Likely <grant.likely@linaro.org>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Signed-off-by: Sandeep Nair <sandeep_n@ti.com>
>> Signed-off-by: Santosh Shilimkar <santosh.shilimkar@ti.com>
>> ---
>> .../devicetree/bindings/soc/keystone-qmss.txt      |  209 +++
>> drivers/Kconfig                                    |    2 +
>> drivers/Makefile                                   |    3 +
>> drivers/soc/Kconfig                                |    2 +
>> drivers/soc/Makefile                               |    5 +
>> drivers/soc/keystone/Kconfig                       |   15 +
>> drivers/soc/keystone/Makefile                      |    5 +
>> drivers/soc/keystone/qmss_acc.c                    |  591 ++++++++
>> drivers/soc/keystone/qmss_queue.c                  | 1533 ++++++++++++++++++++
>> drivers/soc/keystone/qmss_queue.h                  |  236 +++
>> include/linux/soc/keystone_qmss.h                  |  390 +++++
>> 11 files changed, 2991 insertions(+)
>> create mode 100644 Documentation/devicetree/bindings/soc/keystone-qmss.txt
>> create mode 100644 drivers/soc/Makefile
>> create mode 100644 drivers/soc/keystone/Kconfig
>> create mode 100644 drivers/soc/keystone/Makefile
>> create mode 100644 drivers/soc/keystone/qmss_acc.c
>> create mode 100644 drivers/soc/keystone/qmss_queue.c
>> create mode 100644 drivers/soc/keystone/qmss_queue.h
>> create mode 100644 include/linux/soc/keystone_qmss.h
> 
> Do you see qmss being able to provide HW support for a qdisc or doing processor to processor communication over something like rpmsg?
> 
> I ask because I do wondering if we should be looking at a drivers/hwqueue as other vendors have similar hardware.
> 
QMSS just provides the programming interfaces so that certain queues can be configured to achieve QOS tree. The actual qdisc should be
part of the network driver as such. The queues are such a generic hardware that it can be used for wide variety of usecases and 
supporting that through one driver will be really hard. We did talk of hwqueue last year but looks like the usecase variety is
too much because of generic nature of them.

QMSS isn't used as such for message passing but queue hardware can be used as done by APM hardware which Arnd pointed me on the other
thread. As Arnd recommended, the processor to processor communication related drivers should go under drivers/mailbox. One example,
was the APM QMTM patchset [1]

>From first look the QMSS(APM) and QMTM(APM) looked very similar but they actually differ largely the way it works. Thanks to Arnd
for useful discussion here at connect, I better understood how the QMTM works.

If you know any other hardware, which needs similar interfaces as QMSS, we can surely think of another subsystem. QMSS is
largely network usecase dominated but not limited to only those usecases. It is also used by pure drivers/crypto/ or
can also be used for data movement for video etc. 

Regards,
Santosh

[1] https://lkml.org/lkml/2014/2/14/703
