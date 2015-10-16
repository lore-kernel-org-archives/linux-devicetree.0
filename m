From: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
Subject: [PATCHv2 0/3] Adding FPGA Manager support for Xilinx Zynq
Date: Fri, 16 Oct 2015 15:42:27 -0700
Message-ID: <1445035350-3569-1-git-send-email-moritz.fischer@ettus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi all,

I've tried to address most of the feedback that was brought up,
the one thing I haven't looked at was the firmware format part,
since that was still in discussion.
So I'm still open to suggestions on how to handle this.

In the interest of moving forward, and early feedback I decided
to submit another rev without the firmware format part addressed.

Thanks to all the reviewers of the first round, can we maybe
get ACKs for the docs and devicetree changes?

Cheers,

    Moritz

Moritz Fischer (3):
  ARM: dt: fpga: Added binding docs for Xilinx Zynq FPGA manager.
  ARM: zynq: dt: Updated devicetree for Zynq 7000 platform.
  fpga manager: Adding FPGA Manager support for Xilinx Zynq 7000

 .../bindings/fpga/xilinx-zynq-fpga-mgr.txt         |  19 +
 arch/arm/boot/dts/zynq-7000.dtsi                   |   5 +
 drivers/fpga/Kconfig                               |   5 +
 drivers/fpga/Makefile                              |   1 +
 drivers/fpga/zynq-fpga.c                           | 533 +++++++++++++++++++++
 5 files changed, 563 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fpga/xilinx-zynq-fpga-mgr.txt
 create mode 100644 drivers/fpga/zynq-fpga.c

-- 
2.4.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
