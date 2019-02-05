From: Pawel Laszczak <pawell@cadence.com>
Subject: RE: [PATCH v3 5/6] usb:cdns3 Add Cadence USB3 DRD Driver
Date: Tue, 5 Feb 2019 08:33:04 +0000
Message-ID: <BYAPR07MB47097B8DD9A86D9066B35E31DD6E0@BYAPR07MB4709.namprd07.prod.outlook.com>
References: <1548935553-452-1-git-send-email-pawell@cadence.com>
 <1548935553-452-6-git-send-email-pawell@cadence.com>
 <20190204114841.GD28608@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190204114841.GD28608@kroah.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "rogerq@ti.com" <rogerq@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, "peter.chen@nxp.com" <peter.chen@nxp.com>, Pawel Jez <pjez@cadence.com>, Rahul Kumar <kurahul@cadence.com>
List-Id: devicetree@vger.kernel.org

Hi,

>On Thu, Jan 31, 2019 at 11:52:32AM +0000, Pawel Laszczak wrote:
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
>
>Please line-wrap this properly at 72 columns, like your editor asks you
>to when you run git :)
>
>>
>> Signed-off-by: Pawel Laszczak <pawell@cadence.com>
>> ---
>>  drivers/usb/Kconfig                |    2 +
>>  drivers/usb/Makefile               |    2 +
>>  drivers/usb/cdns3/Kconfig          |   44 +
>>  drivers/usb/cdns3/Makefile         |   14 +
>>  drivers/usb/cdns3/cdns3-pci-wrap.c |  155 +++
>>  drivers/usb/cdns3/core.c           |  403 ++++++
>>  drivers/usb/cdns3/core.h           |  116 ++
>>  drivers/usb/cdns3/debug.h          |  168 +++
>>  drivers/usb/cdns3/debugfs.c        |  164 +++
>>  drivers/usb/cdns3/drd.c            |  365 +++++
>>  drivers/usb/cdns3/drd.h            |  162 +++
>>  drivers/usb/cdns3/ep0.c            |  907 +++++++++++++
>>  drivers/usb/cdns3/gadget-export.h  |   28 +
>>  drivers/usb/cdns3/gadget.c         | 1985 ++++++++++++++++++++++++++++
>>  drivers/usb/cdns3/gadget.h         | 1207 +++++++++++++++++
>>  drivers/usb/cdns3/host-export.h    |   28 +
>>  drivers/usb/cdns3/host.c           |   72 +
>>  drivers/usb/cdns3/trace.c          |   23 +
>>  drivers/usb/cdns3/trace.h          |  404 ++++++
>>  19 files changed, 6249 insertions(+)
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
>
>This is way too big to try to review all at once.  You need to break
>this up into logical chunks, each one adding a single functionality to
>make it possible to actually review it.
>

In the past driver was split into series of patch, but it was difficult to =
review for other=20
reviewers so I made decision to prepare it in this way.=20
The short discuss you can find on https://lkml.org/lkml/2018/11/30/502.

Quotation: "
>> Frankly, I don't understand why this is a series. It's a single driver a=
nd splitting it into
>> a series just makes it more difficult to review, actually.
>>
>> Sure, a single patch will be large, but there's no way to have a functio=
nal driver until
>> all patches are applied, anyway.
>>
>
>Yes, I agree with Felipe. Pawel, you could remove the "RFC" prefix, and se=
nd the whole
>one as one patch. I will test it at my hardware.

Ok, I will prepare such single patch. =20
Peter I know that you have little different platform.=20
Probably you should made some additional changes for your platform.
"

Thanks

Pawel Laszczak.
