From: Pawel Laszczak <pawell@cadence.com>
Subject: RE: [PATCH v1 2/2] usb:cdns3 Add Cadence USB3 DRD Driver
Date: Tue, 11 Dec 2018 10:01:02 +0000
Message-ID: <BYAPR07MB47095A5EEBC106EE7CD0E078DDA60@BYAPR07MB4709.namprd07.prod.outlook.com>
References: <1544445555-17325-1-git-send-email-pawell@cadence.com>
 <1544445555-17325-3-git-send-email-pawell@cadence.com>
 <5C0F85E4.10609@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5C0F85E4.10609@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Roger Quadros <rogerq@ti.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "balbi@kernel.org" <balbi@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alan Douglas <adouglas@cadence.com>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, "peter.chen@nxp.com" <peter.chen@nxp.com>, Pawel Jez <pjez@cadence.com>, Rahul Kumar <kurahul@cadence.com>
List-Id: devicetree@vger.kernel.org

Hi,

>On 10/12/18 14:39, Pawel Laszczak wrote:
>> This patch introduce new Cadence USBSS DRD driver
>> to linux kernel.
>>
>> The Cadence USBSS DRD Driver is a highly
>> configurable IP Core which can be
>> instantiated as Dual-Role Device (DRD),
>> Peripheral Only and Host Only (XHCI)
>> configurations.
>>
>> The current driver has been validated with
>> FPGA burned. We have support for PCIe
>> bus, which is used on FPGA prototyping.
>>
>> The host side of USBSS-DRD controller is compliance
>> with XHCI specification, so it works with
>> standard XHCI linux driver.
>>
>> Signed-off-by: Pawel Laszczak <pawell@cadence.com>
>> ---
>>  drivers/usb/Kconfig                |    2 +
>>  drivers/usb/Makefile               |    2 +
>>  drivers/usb/cdns3/Kconfig          |   44 +
>>  drivers/usb/cdns3/Makefile         |   16 +
>>  drivers/usb/cdns3/cdns3-pci-wrap.c |  157 +++
>>  drivers/usb/cdns3/core.c           |  451 +++++++
>>  drivers/usb/cdns3/core.h           |  108 ++
>>  drivers/usb/cdns3/debug.h          |  346 ++++++
>>  drivers/usb/cdns3/debugfs.c        |  168 +++
>>  drivers/usb/cdns3/drd.c            |  315 +++++
>>  drivers/usb/cdns3/drd.h            |  129 ++
>>  drivers/usb/cdns3/ep0.c            |  864 +++++++++++++
>>  drivers/usb/cdns3/gadget-export.h  |   28 +
>>  drivers/usb/cdns3/gadget.c         | 1802 ++++++++++++++++++++++++++++
>>  drivers/usb/cdns3/gadget.h         | 1177 ++++++++++++++++++
>>  drivers/usb/cdns3/host-export.h    |   28 +
>>  drivers/usb/cdns3/host.c           |   74 ++
>>  drivers/usb/cdns3/trace.c          |   11 +
>>  drivers/usb/cdns3/trace.h          |  343 ++++++
>
>You went to the other extreme of combining everything (host/gadget/drd) to=
gether
>which again makes this very hard to review.
>
>I think what Felipe meant was to only combine the gadget driver code into =
one patch.
>
>The series could be split into 6 patches like so.
>-dt binding
>-pci glue
>-core driver
>-host driver
>-gadget driver
>-drd driver

Felipe wrote:
"=20
Frankly, I don't understand why this is a series. It's a single driver
and splitting it into a series just makes it more difficult to review,
actually.

Sure, a single patch will be large, but there's no way to have a
functional driver until all patches are applied, anyway.
"

Felipe should I split this driver as suggested by Roger ?.=20
Now it's very big patch but it's still a single driver.


>>  19 files changed, 6065 insertions(+)
>>  create mode 100644 drivers/usb/cdns3/Kconfig
>>  create mode 100644 drivers/usb/cdns3/Makefile
>>  create mode 100644 drivers/usb/cdns3/cdns3-pci-wrap.c
>>  create mode 100644 drivers/usb/cdns3/core.c
>>  create mode 100644 drivers/usb/cdns3/core.h
>>  create mode 100644 drivers/usb/cdns3/debug.h
>>  create mode 100644 drivers/usb/cdns3/debugfs.c
>>  create mode 100644 drivers/usb/cdns3/drd.c
>>  create mode 100644 drivers/usb/cdns3/drd.h
>>  create mode 100644 drivers/usb/cdns3/ep0.c
>>  create mode 100644 drivers/usb/cdns3/gadget-export.h
>>  create mode 100644 drivers/usb/cdns3/gadget.c
>>  create mode 100644 drivers/usb/cdns3/gadget.h
>>  create mode 100644 drivers/usb/cdns3/host-export.h
>>  create mode 100644 drivers/usb/cdns3/host.c
>>  create mode 100644 drivers/usb/cdns3/trace.c
>>  create mode 100644 drivers/usb/cdns3/trace.h
>>
><snip>
>
Cheers=20
Pawel
