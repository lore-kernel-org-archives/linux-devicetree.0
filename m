From: Eddie James <eajames-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v4 0/4] drivers/fsi: Add SBEFIFO client driver
Date: Fri, 17 Nov 2017 13:34:30 -0600
Message-ID: <1510947274-7519-1-git-send-email-eajames@linux.vnet.ibm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, bradleyb-r5pk2Da7Bxt8sGd51Jp2sdBPR1lH4CV8@public.gmane.org, cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, eajames-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, "Edward A. James" <eajames-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: "Edward A. James" <eajames-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>

This series adds an FSI-based device driver for the SBEFIFO.

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

Changes since v3:
 - Add reset procedure and use it if there is data in the FIFO at probe time.
 - Add timeout for waiting for data to appear in the FIFO; if the SBE isn't
   running, then previously we would wait forever.
 - Fix remove() order of operations.
 - Fix xfr memory leak.
 - Formatting fixes.

Edward A. James (4):
  dt-bindings: fsi: Add SBEFIFO documentation
  drivers/fsi: Add SBEFIFO FSI client device driver
  drivers/fsi: sbefifo: Add miscdevice
  drivers/fsi: sbefifo: Add in-kernel API

 .../devicetree/bindings/fsi/ibm,p9-sbefifo.txt     |   35 +
 drivers/fsi/Kconfig                                |    7 +
 drivers/fsi/Makefile                               |    1 +
 drivers/fsi/fsi-sbefifo.c                          | 1024 ++++++++++++++++++++
 include/linux/fsi-sbefifo.h                        |   30 +
 5 files changed, 1097 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-sbefifo.txt
 create mode 100644 drivers/fsi/fsi-sbefifo.c
 create mode 100644 include/linux/fsi-sbefifo.h

-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
