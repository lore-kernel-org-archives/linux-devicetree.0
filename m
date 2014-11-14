From: Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH v4 0/6] Xilinx Zynq OCM support
Date: Fri, 14 Nov 2014 11:52:01 +0100
Message-ID: <cover.1415962281.git.michal.simek@xilinx.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2335263040510286878=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, Soren Brinkmann <soren.brinkmann@xilinx.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>
Cc: Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Josh Cartwright <josh.cartwright@ni.com>, Russell King <linux@arm.linux.org.uk>, Jingoo Han <jg1.han@samsung.com>, Sandeep Nair <sandeep_n@ti.com>, Antti Palosaari <crope@iki.fi>, Grant Likely <grant.likely@linaro.org>, Thierry Reding <treding@nvidia.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Michal Simek <monstr@monstr.eu>, Rob Herring <robh+dt@kernel.org>, Peter Crosthwaite <peter.crosthwaite@xilinx.com>, Santosh Shilimkar <santosh.shilimkar@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-kernel@vger.kernel.org, Andy Gross <agro>
List-Id: devicetree@vger.kernel.org

This is a MIME GnuPG-signed message.  If you see this text, it means that
your E-mail or Usenet software does not support MIME signed messages.
The Internet standard for MIME PGP messages, RFC 2015, was published in 1996.
To open this message correctly you will need to install E-mail or Usenet
software that supports modern Internet standards.

--===============2335263040510286878==
Content-Type: multipart/signed;
    boundary="=_mimegpg-monstr-desktop-14082-1415962327-0001";
    micalg=pgp-sha1; protocol="application/pgp-signature"

This is a MIME GnuPG-signed message.  If you see this text, it means that
your E-mail or Usenet software does not support MIME signed messages.
The Internet standard for MIME PGP messages, RFC 2015, was published in 1996.
To open this message correctly you will need to install E-mail or Usenet
software that supports modern Internet standards.

--=_mimegpg-monstr-desktop-14082-1415962327-0001

Hi,

this is the next attepmt to add support for On Chip Memory
configuration via On Chip Memory Controller.
OCM can be divided into 4 independend blocks and placed to
two locations which this driver detects.

For everybody on-chip SRAM driver "mmio-sram"
is missing parity IRQ handling not sure how to write
in generic way and also the memory layout
can be changed at run time (not currently supported by this driver)

smp-sram trampoline allocation can be used from mmio-sram
and size allocated via DT but currently no reason for using
it.

Creating mmio-sram node with setting at run time based on current setting
is possible but it won't look good.
One way how to do it is here
"ARM: mvebu: Add quirk for i2c for the OpenBlocks AX3-4 board"
(sha1: 85e618a1be2b2092318178d1d66bdad49cbbeeeb)
but creating nodes at run-time or changing compact strings
will be just more hacky code.

Using device-tree overlays is another option but SMP
trampoline code is placed there and it will be used by PM code
that's why driver should be there before user-space.

Next option is to create driver which just create platform device
at run-time. This is doable but I expect sram driver has to be
updated.

Thanks,
Michal


Changes in v4:
- New patch in this series
- New patch in this series
- Move only slcr.h and smp.h and keep common.h in platform
  which is not needed by OCMC driver
  Based on Arnd request: https://lkml.org/lkml/2014/10/20/268
  Not all symbols from slcr.h/smp.h will be used by OCMC driver
  - no problem to remove them if it is needed
- Add record to MAINTAINERS file
- slcr.h has moved to soc/include/ folder. Move definition there too.
- Use }; instead of } ; in doc
- Use memory-controller@... instead of ocmc@...
- Create Kconfig entry for OCMC driver - enable GENERIC_ALLOCATOR here
- Add entry to MAINTAINERS file
- Use memory-controller@... instead of ocmc@...

Changes in v3:
- Move OCM to drivers/soc
- Update year
- Extract DTS node to be able to apply it out of driver
- Remove generic allocator enabling
- Extract SLCR part
- Use const in of_device_id
- OCM->OCMC
- Use ocmc-1.0 compatible string
- Extract from OCM driver

Changes in v2:
- Update pm.c added in 3.17 too - Soren pointed on it
- Change compatibility string to be in xilinx format
- Fix kernel-doc format

Michal Simek (6):
  ARM: zynq: Extract smp related functions out of common.h
  ARM: zynq: Extract slcr related functions out of common.h
  ARM: zynq: Move slcr.h and smp.h to generic location
  ARM: zynq: Extend SLCR driver to read OCM configuration
  ARM: zynq: Add OCM controller driver
  ARM: zynq: DT: Add OCM controller node

 .../bindings/arm/zynq/xlnx,zynq-ocmc.txt           |  17 ++
 MAINTAINERS                                        |   2 +
 arch/arm/boot/dts/zynq-7000.dtsi                   |   7 +
 arch/arm/mach-zynq/common.c                        |   2 +
 arch/arm/mach-zynq/common.h                        |  19 --
 arch/arm/mach-zynq/platsmp.c                       |   3 +
 arch/arm/mach-zynq/slcr.c                          |  17 ++
 drivers/soc/Kconfig                                |   1 +
 drivers/soc/Makefile                               |   1 +
 drivers/soc/zynq/Kconfig                           |  13 ++
 drivers/soc/zynq/Makefile                          |   1 +
 drivers/soc/zynq/zynq_ocmc.c                       | 247 +++++++++++++++++++++
 include/soc/zynq/slcr.h                            |  30 +++
 include/soc/zynq/smp.h                             |  30 +++
 14 files changed, 371 insertions(+), 19 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/zynq/xlnx,zynq-ocmc.txt
 create mode 100644 drivers/soc/zynq/Kconfig
 create mode 100644 drivers/soc/zynq/Makefile
 create mode 100644 drivers/soc/zynq/zynq_ocmc.c
 create mode 100644 include/soc/zynq/slcr.h
 create mode 100644 include/soc/zynq/smp.h

--
1.8.2.3


--=_mimegpg-monstr-desktop-14082-1415962327-0001
Content-Type: application/pgp-signature
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAlRl3tcACgkQykllyylKDCEn5ACggoXR6bwBuUrJbEytoa1PF1TC
pnkAn1FwDKYq0/9luJ/z4SLKg2fi82wX
=ck+b
-----END PGP SIGNATURE-----

--=_mimegpg-monstr-desktop-14082-1415962327-0001--


--===============2335263040510286878==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============2335263040510286878==--
