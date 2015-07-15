From: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
Subject: [PATCHv7 0/2] Adding driver for Xilinx LogiCORE IP mailbox.
Date: Tue, 14 Jul 2015 18:00:20 -0700
Message-ID: <1436922022-17564-1-git-send-email-moritz.fischer@ettus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org, jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi all,

Thanks for hanging in there, hopefully the last round of review ...

This patchset adds mailbox framework integration for the Xilinx LogiCOR=
E IP
mailbox.  The Xilinx LogiCORE IP mailbox is a fpga softcore that allows
interprocessor communication between AXI4 stream / memory mapped
processors.

Cheers,

Moritz

Changes from v6:
- As suggested by Jassi and S=C3=B6ren use #mbox-cells =3D <1>

Changes from v5:
- Fixed constness for ops struct
- Removed redundant checks
- Moved ops assignment
- Removed MODULE_ALIAS

Changes from v4:
- Have separate mbox_ops structs for polling / irq mode
- Moved clk handling to startup / shutdown
- Embedded struct mbox_chan in struct xilinx_mbox
- Fixed mbox-cells in devicetree documentation
- Misc stylistic issues

Changes from v3:
- Stylistic changes
- Changed reg size in dts to 0x100

Changes from v2:
- Fixed error condition for IRQ from >=3D 0 to > 0
- Fixed clock enable
- Cleaned up docs

Changes from v1:
- Added common clock framework support
- Deal with IRQs that happend before driver load,
  since HW will not let us know about them when we enable IRQs

Changes from v0:
- Several stylistic issues
- Dropped superfluous intr_mode member
- Really masking the IRQs on mailbox_shutdown
- No longer using polling by accident in non-IRQ mode
- Swapped doc and driver commits


Moritz Fischer (2):
  dts: Adding docs for Xilinx LogiCORE IP mailbox driver.
  mailbox: Adding driver for Xilinx LogiCORE IP mailbox.

 .../devicetree/bindings/mailbox/xilinx-mailbox.txt |  44 +++
 MAINTAINERS                                        |   7 +
 drivers/mailbox/Kconfig                            |   7 +
 drivers/mailbox/Makefile                           |   2 +
 drivers/mailbox/mailbox-xilinx.c                   | 367 +++++++++++++=
++++++++
 5 files changed, 427 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/xilinx-ma=
ilbox.txt
 create mode 100644 drivers/mailbox/mailbox-xilinx.c

--=20
2.4.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
