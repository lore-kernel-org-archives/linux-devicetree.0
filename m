From: Paolo Pisati <p.pisati-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 0/2] Lattice MachXO2 Slave SPI FPGA Manager support
Date: Mon,  1 May 2017 15:15:10 +0200
Message-ID: <1493644512-14776-1-git-send-email-p.pisati@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi all,

this series adds support for the Lattice MachXO2 FPGA chip, programmed
over Slave SPI.

Tested on my raspberry pi3 + bugblat's pif2 fpga hat.

Changes from v1:
* fixed all the warnings pointed out by 'checkpatch --strict' and
  Alan Tull

Paolo Pisati (2):
  dt: bindings: fpga: add lattice machxo2 slave spi binding description
  fpga: lattice machxo2: Add Lattice MachXO2 support

 .../bindings/fpga/lattice-machxo2-spi.txt          |  29 +++
 drivers/fpga/Kconfig                               |   7 +
 drivers/fpga/Makefile                              |   1 +
 drivers/fpga/machxo2-spi.c                         | 214 +++++++++++++++++++++
 4 files changed, 251 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fpga/lattice-machxo2-spi.txt
 create mode 100644 drivers/fpga/machxo2-spi.c

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
