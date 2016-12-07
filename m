From: Chris Bostic <christopher.lee.bostic-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 00/16] FSI device driver introduction
Date: Tue,  6 Dec 2016 18:14:21 -0600
Message-ID: <1481069677-53660-1-git-send-email-christopher.lee.bostic@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Chris Bostic <cbostic-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andrew-zrmu5oMJ5Fs@public.gmane.org, alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Chris Bostic <cbostic-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>

Introduction of the IBM 'Flexible Support Interface' (FSI) bus device
driver. FSI is a high fan out serial bus consisting of a clock and a serial
data line capable of running at speeds up to 166 MHz.

This set provides the basic framework to add FSI extensions to the
Linux bus and device models. Master specific implementations are
defined to utilize the core FSI function.

In Linux, we have a core FSI "bus type", along with drivers for FSI
masters and engines.

The FSI master drivers expose a read/write interface to the bus address
space. The master drivers are under drivers/fsi/fsi-master-*.c.

The core handles probing and discovery of slaves and slave
engines, using those read/write interfaces. It is responsible for
creating the endpoint Linux devices corresponding to the discovered
engines on each slave.

Slave engines are identified by an 'engine' type, and an optional
version. Engine, a.k.a. client, drivers are matched and bound to these
engines during discovery.

This patch set does not include extended FSI function such as:
    *  Hub master support
    *  Cascaded master support
    *  Application layer hot plug notification
    *  Application layer FSI bus status interface

Common FSI terminology:

* Master
    Controller of the FSI bus.  Only the master is allowed to control the
    clock line and is the initiator of all transactions on a bus.

* Slave
    The receiver or target of a master initiated transaction.  The slave
    cannot initiate communications on a bus and must respond to any
    master requests for data.

* CFAM
    Stands for Common Field replaceable unit Access Macro.  A CFAM is an
    ASIC residing in any device requiring FSI communications. CFAMs
    consist of an array of hardware 'engines' used for various purposes.
    I2C masters, UARTs, General Purpose IO hardware are common types of
    these engines.

* Configuration Space / Table
    A table contained at the beginning of each CFAM address space.
    This table lists information such as the CFAM's ID, which engine types
    and versions it has available, as well as its addressing range.

* FSI Engine driver
    A device driver that registers with the FSI core so that it can access
    devices it owns on an FSI bus.


Chris Bostic (5):
  drivers/fsi: Set up links for slave communication
  drivers/fsi: Set slave SMODE to init communication
  drivers/fsi: Add master unscan
  drivers/fsi: Add documentation for GPIO bindings
  drivers/fsi: Add GPIO based FSI master

Jeremy Kerr (11):
  drivers/fsi: Add empty fsi bus definitions
  drivers/fsi: Add device & driver definitions
  drivers/fsi: add driver to device matches
  drivers/fsi: Add fsi master definition
  drivers/fsi: Add fake master driver
  drivers/fsi: Add slave definition
  drivers/fsi: Add empty master scan
  drivers/fsi: Add crc4 helpers
  drivers/fsi: Implement slave initialisation
  drivers/fsi: scan slaves & register devices
  drivers/fsi: Add device read/write/peek functions

 .../devicetree/bindings/fsi/fsi-master-gpio.txt    |  21 +
 drivers/Kconfig                                    |   2 +
 drivers/Makefile                                   |   1 +
 drivers/fsi/Kconfig                                |  29 ++
 drivers/fsi/Makefile                               |   4 +
 drivers/fsi/fsi-core.c                             | 514 +++++++++++++++++++
 drivers/fsi/fsi-master-fake.c                      |  95 ++++
 drivers/fsi/fsi-master-gpio.c                      | 552 +++++++++++++++++++++
 drivers/fsi/fsi-master.h                           |  62 +++
 include/linux/fsi.h                                |  60 +++
 10 files changed, 1340 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fsi/fsi-master-gpio.txt
 create mode 100644 drivers/fsi/Kconfig
 create mode 100644 drivers/fsi/Makefile
 create mode 100644 drivers/fsi/fsi-core.c
 create mode 100644 drivers/fsi/fsi-master-fake.c
 create mode 100644 drivers/fsi/fsi-master-gpio.c
 create mode 100644 drivers/fsi/fsi-master.h
 create mode 100644 include/linux/fsi.h

-- 
1.8.2.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
