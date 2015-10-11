From: Alexander Popov <alex.popov-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v4 0/2] powerpc/512x: add LocalPlus Bus FIFO device driver
Date: Mon, 12 Oct 2015 00:08:00 +0300
Message-ID: <1444597682-22181-1-git-send-email-alex.popov@linux.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Timur Tabi <timur-N01EOCouUvQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Alexander Popov <alex.popov-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This driver for Freescale MPC512x LocalPlus Bus FIFO (called SCLPC
in the Reference Manual) allows Direct Memory Access transfers
between RAM and peripheral devices on LocalPlus Bus.

Changes in v3:
 - resource usage in probe() is fixed;
 - driver methods are made safe against remove();
 - dma_request_slave_channel() is used to get DMA channel number from
    the device tree;
 - chip select number concerned with the DMA transaction is determined
    from 'localbus' device tree node information;
 - register set is described as a structure;
 - symbolic names are given to shift counts to keep magic numbers
    out of the code;
 - choosing values for LPBFIFO BPT (bytes per transfer) and DMA maxburst
    is improved, so DMA transfer size has increased for some cases;
 - device tree binding for LPBFIFO is documented;
 - Kconfig and Makefile are improved;
 - email address "a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" is changed to a more pleasant
    alias "alex.popov-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org".

Changes in v4:
 - the race condition is fixed;
 - plenty of style fixes are made;
 - devm_* functions and EPROBE_DEFER are used in probe().

Alexander Popov (2):
  powerpc/512x: add LocalPlus Bus FIFO device driver
  powerpc/512x: add a device tree binding for LocalPlus Bus FIFO

 .../bindings/powerpc/fsl/mpc512x_lpbfifo.txt       |  21 +
 arch/powerpc/boot/dts/mpc5121.dtsi                 |  11 +-
 arch/powerpc/boot/dts/mpc5125twr.dts               |  11 +-
 arch/powerpc/configs/mpc512x_defconfig             |   1 +
 arch/powerpc/include/asm/mpc5121.h                 |  59 +++
 arch/powerpc/platforms/512x/Kconfig                |   6 +
 arch/powerpc/platforms/512x/Makefile               |   1 +
 arch/powerpc/platforms/512x/mpc512x_lpbfifo.c      | 539 +++++++++++++++++++++
 8 files changed, 646 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/powerpc/fsl/mpc512x_lpbfifo.txt
 create mode 100644 arch/powerpc/platforms/512x/mpc512x_lpbfifo.c

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
