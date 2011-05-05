From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [RFC PATCH v3 0/6] MIPS: Octeon: Use Device Tree.
Date: Thu, 5 May 2011 11:40:14 -0600
Message-ID: <BANLkTi=emL85ROThAEz_RsVXL-oJsL6aAQ@mail.gmail.com>
References: <1304614949-30460-1-git-send-email-ddaney@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1304614949-30460-1-git-send-email-ddaney@caviumnetworks.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Daney <ddaney@caviumnetworks.com>
Cc: linux-mips@linux-mips.org, ralf@linux-mips.org, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, May 5, 2011 at 11:02 AM, David Daney <ddaney@caviumnetworks.com=
> wrote:
> After several weeks of fire fighting, I am back to my Octeon device
> tree patches.
>
> New in v3:
>
> More updates to device tree bindings, and perhaps more importantly
> descriptions/definitions of the bindings
>
> libfdt building moved to devices/of/libfdt.
>
> Cleanup and style improvements as suggested by Grant Likley.
>
> Omitted all the driver changes, as they are unchanged from the last
> set, and at this stage the patches are just an RFC.
>
> New in v2:
>
> Changed many device tree bindings. =A0They should be closer to the
> standard naming scheme now.
>
> Editing of the template device tree is done in the flattened form
> using libfdt.
>
> Standard platform driver functions used in preference to the
> of_platform variety.
>
> v1:
>
> Background: The Octeon family of SOCs has a variety of on-chip
> controllers for Ethernet, MDIO, I2C, and several other I/O devices.
> These chips are used on boards with a great variety of different
> configurations. =A0To date, the configuration and bus topology
> information has been hard coded in the drivers and support code.
>
> To facilitate supporting new chips and boards, we would like to make
> use use the Device Tree to encode the configuration information.
>
> I would like to get some feedback on the current code I am working
> with. =A0The migration approach is as follows:
>
> o Several device tree templates are statically linked into the kernel
> =A0image. =A0Based on SOC type and board type one of these is selecte=
d in
> =A0early boot. =A0Legacy configuration probing code is used to prune =
and
> =A0patch the device tree template.
>
> o New SOCs and boards will directly use a device tree passed by the
> =A0bootloader (This patch set doesn't actually implement this, but it
> =A0is trivial to add).
>
>
>
> 1/6 - =A0Infrastructure to allow scripts/dtc/libfdt to be used in the
> =A0 =A0 =A0 kernel.
>
> 2/6 - OF patch to simplify of_find_node_by_path().
>
> 3/6 - Add the statically linked Device Tree templates and bindings
> =A0 =A0 =A0descriptions.
>
> 4/6 - Remove unused arch/mips/prom.c code that conflicts with
> =A0 =A0 =A0following patches.
>
> 5/6 - irq_create_of_mapping() function.
>
> 6/6 - Fix up Device Tree template for current environment.
>
>
> David Daney (6):
> =A0of: Allow scripts/dtc/libfdt to be used from kernel code
> =A0of: Make of_find_node_by_path() traverse /aliases for relative pat=
hs.
> =A0MIPS: Octeon: Add device tree source files.
> =A0MIPS: Prune some target specific code out of prom.c
> =A0MIPS: Octeon: Add irq_create_of_mapping() and GPIO interrupts.
> =A0MIPS: Octeon: Initialize and fixup device tree.
>
> =A0.../devicetree/bindings/mips/cavium/bootbus.txt =A0 =A0| =A0 37 ++
> =A0.../devicetree/bindings/mips/cavium/ciu.txt =A0 =A0 =A0 =A0| =A0 2=
6 ++
> =A0.../devicetree/bindings/mips/cavium/gpio.txt =A0 =A0 =A0 | =A0 48 =
+++
> =A0.../devicetree/bindings/mips/cavium/mdio.txt =A0 =A0 =A0 | =A0 27 =
++
> =A0.../devicetree/bindings/mips/cavium/mix.txt =A0 =A0 =A0 =A0| =A0 4=
0 ++
> =A0.../devicetree/bindings/mips/cavium/pip.txt =A0 =A0 =A0 =A0| =A0 9=
8 +++++
> =A0.../devicetree/bindings/mips/cavium/twsi.txt =A0 =A0 =A0 | =A0 34 =
++
> =A0.../devicetree/bindings/mips/cavium/uart.txt =A0 =A0 =A0 | =A0 19 =
+
> =A0.../devicetree/bindings/mips/cavium/uctl.txt =A0 =A0 =A0 | =A0 47 =
+++
> =A0arch/mips/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0| =A0 =A01 +
> =A0arch/mips/cavium-octeon/.gitignore =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A02 +
> =A0arch/mips/cavium-octeon/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 15 +
> =A0arch/mips/cavium-octeon/octeon-irq.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0183 ++++++++-
> =A0arch/mips/cavium-octeon/octeon-platform.c =A0 =A0 =A0 =A0 =A0| =A0=
295 +++++++++++++
> =A0arch/mips/cavium-octeon/octeon_3xxx.dts =A0 =A0 =A0 =A0 =A0 =A0| =A0=
431 ++++++++++++++++++++
> =A0arch/mips/cavium-octeon/setup.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0| =A0 17 +
> =A0arch/mips/kernel/prom.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0| =A0 49 ---
> =A0drivers/of/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 | =A0 =A03 +
> =A0drivers/of/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0| =A0 =A02 +
> =A0drivers/of/base.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0| =A0 41 ++-
> =A0drivers/of/libfdt/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 | =A0 =A08 +

Out of curiosity, how big are the compiled libfdt object files?

> =A0include/linux/libfdt.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 | =A0 =A08 +
> =A0include/linux/libfdt_env.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 | =A0 13 +
> =A023 files changed, 1393 insertions(+), 51 deletions(-)
> =A0create mode 100644 Documentation/devicetree/bindings/mips/cavium/b=
ootbus.txt
> =A0create mode 100644 Documentation/devicetree/bindings/mips/cavium/c=
iu.txt
> =A0create mode 100644 Documentation/devicetree/bindings/mips/cavium/g=
pio.txt
> =A0create mode 100644 Documentation/devicetree/bindings/mips/cavium/m=
dio.txt
> =A0create mode 100644 Documentation/devicetree/bindings/mips/cavium/m=
ix.txt
> =A0create mode 100644 Documentation/devicetree/bindings/mips/cavium/p=
ip.txt
> =A0create mode 100644 Documentation/devicetree/bindings/mips/cavium/t=
wsi.txt
> =A0create mode 100644 Documentation/devicetree/bindings/mips/cavium/u=
art.txt
> =A0create mode 100644 Documentation/devicetree/bindings/mips/cavium/u=
ctl.txt
> =A0create mode 100644 arch/mips/cavium-octeon/.gitignore
> =A0create mode 100644 arch/mips/cavium-octeon/octeon_3xxx.dts
> =A0create mode 100644 drivers/of/libfdt/Makefile
> =A0create mode 100644 include/linux/libfdt.h
> =A0create mode 100644 include/linux/libfdt_env.h
>
> --
> 1.7.2.3
>
>



--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
