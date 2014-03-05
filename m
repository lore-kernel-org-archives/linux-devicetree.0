From: Kumar Gala <galak@codeaurora.org>
Subject: Re: [PATCH 2/3] soc: keystone: add QMSS driver
Date: Wed, 5 Mar 2014 03:55:43 -0600
Message-ID: <0817AD72-FBD0-4DB0-86C7-6C8EAC84BAA2@codeaurora.org>
References: <1393629520-12713-1-git-send-email-santosh.shilimkar@ti.com> <1393629520-12713-3-git-send-email-santosh.shilimkar@ti.com> <AAE2808F-A2C8-4031-BFA4-1A20B182EA69@codeaurora.org> <53169036.9060808@ti.com>
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <53169036.9060808@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Santosh Shilimkar <santosh.shilimkar@ti.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Nair, Sandeep" <sandeep_n@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>, Grant Likely <grant.likely@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


On Mar 4, 2014, at 8:47 PM, Santosh Shilimkar <santosh.shilimkar@ti.com=
> wrote:

> On Wednesday 05 March 2014 01:59 AM, Kumar Gala wrote:
>>=20
>> On Feb 28, 2014, at 5:18 PM, Santosh Shilimkar <santosh.shilimkar@ti=
=2Ecom> wrote:
>>=20
>>> From: Sandeep Nair <sandeep_n@ti.com>
>>>=20
>>> The QMSS (Queue Manager Sub System) found on Keystone SOCs is one o=
f
>>> the main hardware sub system which forms the backbone of the Keysto=
ne
>>> Multi-core Navigator. QMSS consist of queue managers, packed-data s=
tructure
>>> processors(PDSP), linking RAM, descriptor pools and infrastructure
>>> Packet DMA.
>>>=20
>>> The Queue Manager is a hardware module that is responsible for acce=
lerating
>>> management of the packet queues. Packets are queued/de-queued by wr=
iting or
>>> reading descriptor address to a particular memory mapped location. =
The PDSPs
>>> perform QMSS related functions like accumulation, QoS, or event man=
agement.
>>> Linking RAM registers are used to link the descriptors which are st=
ored in
>>> descriptor RAM. Descriptor RAM is configurable as internal or exter=
nal memory.
>>>=20
>>> The QMSS driver manages the PDSP setups, linking RAM regions,
>>> queue pool management (allocation, push, pop and notify) and descri=
ptor
>>> pool management. The specifics on the device tree bindings for
>>> QMSS can be found in:
>>>       Documentation/devicetree/bindings/soc/keystone-qmss.txt
>>>=20
>>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>> Cc: Kumar Gala <galak@codeaurora.org>
>>> Cc: Olof Johansson <olof@lixom.net>
>>> Cc: Arnd Bergmann <arnd@arndb.de>
>>> Cc: Grant Likely <grant.likely@linaro.org>
>>> Cc: Rob Herring <robh+dt@kernel.org>
>>> Cc: Mark Rutland <mark.rutland@arm.com>
>>> Signed-off-by: Sandeep Nair <sandeep_n@ti.com>
>>> Signed-off-by: Santosh Shilimkar <santosh.shilimkar@ti.com>
>>> ---
>>> .../devicetree/bindings/soc/keystone-qmss.txt      |  209 +++
>>> drivers/Kconfig                                    |    2 +
>>> drivers/Makefile                                   |    3 +
>>> drivers/soc/Kconfig                                |    2 +
>>> drivers/soc/Makefile                               |    5 +
>>> drivers/soc/keystone/Kconfig                       |   15 +
>>> drivers/soc/keystone/Makefile                      |    5 +
>>> drivers/soc/keystone/qmss_acc.c                    |  591 ++++++++
>>> drivers/soc/keystone/qmss_queue.c                  | 1533 +++++++++=
+++++++++++
>>> drivers/soc/keystone/qmss_queue.h                  |  236 +++
>>> include/linux/soc/keystone_qmss.h                  |  390 +++++
>>> 11 files changed, 2991 insertions(+)
>>> create mode 100644 Documentation/devicetree/bindings/soc/keystone-q=
mss.txt
>>> create mode 100644 drivers/soc/Makefile
>>> create mode 100644 drivers/soc/keystone/Kconfig
>>> create mode 100644 drivers/soc/keystone/Makefile
>>> create mode 100644 drivers/soc/keystone/qmss_acc.c
>>> create mode 100644 drivers/soc/keystone/qmss_queue.c
>>> create mode 100644 drivers/soc/keystone/qmss_queue.h
>>> create mode 100644 include/linux/soc/keystone_qmss.h
>>=20
>> Do you see qmss being able to provide HW support for a qdisc or doin=
g processor to processor communication over something like rpmsg?
>>=20
>> I ask because I do wondering if we should be looking at a drivers/hw=
queue as other vendors have similar hardware.
>>=20
> QMSS just provides the programming interfaces so that certain queues =
can be configured to achieve QOS tree. The actual qdisc should be
> part of the network driver as such. The queues are such a generic har=
dware that it can be used for wide variety of usecases and=20
> supporting that through one driver will be really hard. We did talk o=
f hwqueue last year but looks like the usecase variety is
> too much because of generic nature of them.
>=20
> QMSS isn't used as such for message passing but queue hardware can be=
 used as done by APM hardware which Arnd pointed me on the other
> thread. As Arnd recommended, the processor to processor communication=
 related drivers should go under drivers/mailbox. One example,
> was the APM QMTM patchset [1]
>=20
> From first look the QMSS(APM) and QMTM(APM) looked very similar but t=
hey actually differ largely the way it works. Thanks to Arnd
> for useful discussion here at connect, I better understood how the QM=
TM works.
>=20
> If you know any other hardware, which needs similar interfaces as QMS=
S, we can surely think of another subsystem. QMSS is
> largely network usecase dominated but not limited to only those useca=
ses. It is also used by pure drivers/crypto/ or
> can also be used for data movement for video etc.=20
>=20
> Regards,
> Santosh
>=20
> [1] https://lkml.org/lkml/2014/2/14/703

The Freescale QorIQ Devices have a Queue Manager (QMan) as part of thei=
r Data Path Architecture (DPAA).  I haven=92t looked at the QMTM from A=
PM, but not sure if mailbox is the best place for these things.  They s=
eem so much more involved than what I=92m guessing most people are thin=
king with mailbox.

- k

--=20
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, host=
ed by The Linux Foundation
