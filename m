From: Eddie James <eajames-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v5 0/8] drivers/fsi: Add SBEFIFO and OCC client drivers
Date: Mon, 20 Nov 2017 13:46:49 -0600
Message-ID: <1511207217-14075-1-git-send-email-eajames@linux.vnet.ibm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, bradleyb-r5pk2Da7Bxt8sGd51Jp2sdBPR1lH4CV8@public.gmane.org, cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, eajames-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, "Edward A. James" <eajames-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: "Edward A. James" <eajames-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>

This series adds two FSI-based device drivers; one for the SBEFIFO and one for
the On-Chip Controller (OCC). 

IBM POWER9 processors contain some embedded hardware and software bits
collectively referred to as the self boot engine (SBE).  One role of
the SBE is to act as a proxy that provides access to the registers of
the POWER chip from other (embedded) systems.

The POWER9 chip contains a hardware frontend for communicating with
the SBE from remote systems called the SBEFIFO.  The SBEFIFO logic
is contained within an FSI CFAM  and as such the driver implements an
FSI bus device.

The SBE expects to communicate using a defined wire protocol; however,
the driver knows nothing of the protocol and only provides raw access
to the fifo device to userspace applications wishing to communicate with
the SBE using the wire protocol.

The SBEFIFO consists of two hardware fifos. The upstream fifo is used
by the driver to transfer data to the SBE on the POWER chip, from the
system hosting the driver.  The downstream fifo is used by the driver to
transfer data from the SBE on the power chip to the system hosting the
driver.

The OCC is a device embedded on a POWER processor that collects and
aggregates sensor data from the processor and system. The OCC can
provide the raw sensor data as well as perform thermal and power
management on the system.

This driver provides an atomic communications channel between a service
processor (e.g. a BMC) and the OCC. The driver is dependent on the FSI
SBEFIFO driver to get hardware access through the SBE to the OCC SRAM.
Commands are issued to the SBE to send or fetch data to the SRAM.

The format of communications to the OCC is writing a command to SRAM,
followed by a sending a "doorbell" or attention to the OCC, followed by
reading the response from OCC. All of this takes place atomically so
that multiple users don't collide in the SRAM.

Changes since v4:
 * Use irqsave/irqrestore for spinlocks.
 * Put the OCC driver in the same patchset as it doesn't build without SBEFIFO.
 * Switch to reference counting for OCC clients.

Changes since v3:
 * Add reset procedure and use it if there is data in the FIFO at probe time.
 * Add timeout for waiting for data to appear in the FIFO; if the SBE isn't
   running, then previously we would wait forever.
 * Fix remove() order of operations for both drivers.
 * Fix xfr memory leak for SBEFIFO.
 * Formatting fixes.

Changes since v2:
 * Rename occ.c and occ.h to fsi-occ.c and fsi-occ.h
 * Improved remove() ordering in both drivers.
 * Added cancel functionality to OCC driver to make sure no xfrs started during
   remove().
 * Fix spin_unlock with spin_unlock_irq in OCC driver.
 * Fix list_first_entry with list_first_entry_or_null in OCC worker function.
 * Add OCC response definitions to OCC include file.
 * Handle probe() failures better.

Changes since v1:
 * Split bindings into separate patch and added SBEFIFO device binding
 * Fixed #includes
 * Fix SBEFIFO race condition between write() and poll_timer().
 * Followed Rob's suggestion to just create one platform device for hwmon
   driver, instead of using the device tree.
 * Also check for "command in progress" response from OCC and try a while

Edward A. James (8):
  dt-bindings: fsi: Add SBEFIFO documentation
  drivers/fsi: Add SBEFIFO FSI client device driver
  drivers/fsi: sbefifo: Add miscdevice
  drivers/fsi: sbefifo: Add in-kernel API
  dt-bindings: fsi: Add OCC documentation
  drivers/fsi: Add On-Chip Controller (OCC) driver
  drivers/fsi: occ: Add miscdevice
  drivers/fsi: occ: Add in-kernel API

 .../devicetree/bindings/fsi/ibm,p9-occ.txt         |   18 +
 .../devicetree/bindings/fsi/ibm,p9-sbefifo.txt     |   35 +
 drivers/fsi/Kconfig                                |   17 +
 drivers/fsi/Makefile                               |    2 +
 drivers/fsi/fsi-occ.c                              |  876 +++++++++++++++++
 drivers/fsi/fsi-sbefifo.c                          | 1027 ++++++++++++++++++++
 include/linux/fsi-occ.h                            |   41 +
 include/linux/fsi-sbefifo.h                        |   30 +
 8 files changed, 2046 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
 create mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-sbefifo.txt
 create mode 100644 drivers/fsi/fsi-occ.c
 create mode 100644 drivers/fsi/fsi-sbefifo.c
 create mode 100644 include/linux/fsi-occ.h
 create mode 100644 include/linux/fsi-sbefifo.h

-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
