From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC PATCH 00/14] Versatile Express device tree port
Date: Wed, 18 Aug 2010 13:14:52 -0600
Message-ID: <AANLkTinaACASQ044SETb_i_rWXfXoBWYA+wxwMJdnm9Z@mail.gmail.com>
References: <1282158000-23081-1-git-send-email-lorenzo.pieralisi@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1282158000-23081-1-git-send-email-lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, philippe.robin-5wv7dgnIgG8@public.gmane.org, jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 18, 2010 at 12:59 PM, Lorenzo Pieralisi
<lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org> wrote:
> This patchset provides an initial version of device tree enabled kernel on
> an ARM Versatile Express board. The patchset applies to Jeremy Kerr's tre=
e:
>
> =A0 =A0 =A0 =A0git://kernel.ubuntu.com/jk/dt/linux-2.6.git dtbimage
> =A0 =A0 =A0 =A0commit: 4cb80ac96489220554d28f6fde527aeef83e628b
>
> The patched kernel version is available on my public ARM git tree:
>
> =A0 =A0 =A0 =A0git://linux-arm.org/linux-2.6-lp.git ve-fdt
>
> It has been tested on HW ARM Versatile Express board, with both static an=
d DT
> configurations.

w00t!  Thanks Lorenzo.  I'll look through and make comments.  There
have been quite few changes since Jeremy's dtbimage branch.  In
particular the amba bus clock changes are taking a bit to rework.
I've also cherry picked most of Jeremy's patches (everything except
imx51) and have also made a number of changes.  For the next spin it
would be a good idea to use my test-devicetree branch as the base.

I'm currently reworking the device tree breakage caused by amba clock
support, and then I'll be pushing out my branch updated to 2.6.36-rc1
later this afternoon.

Cheers,
g.

> It contains fixes for generic device tree features and clock configuratio=
n,
> code to patch Versatile Express peripherals drivers and build system.
>
> Clock names as well as amba device names are temporary waiting for OF bin=
dings
> definition (clocks).
> The Versatile Express board specific init code has been split into DT and
> non-DT code in order to factor out common code between the two configs.
>
> A static inline function has been added to the platform bus in order
> to initialize the OF match table and avoid cluttering code with preproces=
sor
> macros.
>
> Drivers ( and GIC, sp804, PL310 specific code) device tree init is an ini=
tial
> stab at configuring peripherals with device tree data, so some choices
> especially concerning error codes are arguable and require thorough revie=
w.
>
> The whole patchset is a request for comments on code and methodology.
>
> Cheers.
>
> Lorenzo Pieralisi (14):
> =A0ARM: amba device memory allocation fix
> =A0ARM: vexpress: fix clocks definition to comply with new framework
> =A0ARM: fix add instruction to set the flags
> =A0ARM: r1 DT mach id init
> =A0ARM: vexpress: fix typo in addruart
> =A0platform: add function to initialize OF match table
> =A0drivers/smsc911x: add DT support
> =A0ARM: versatile-i2c driver DT port
> =A0ARM: ARM flash driver DT port
> =A0drivers/USB: isp1760 DT platform parsing and binding
> =A0ARM: PMU: add device tree probing
> =A0ARM: vexpress: add board support for DT probing
> =A0ARM: vexpress: Definition of vexpress dts specification
> =A0ARM: vexpress: add device tree build system and dtbuImage
>
> =A0arch/arm/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0| =A0 =A04 +-
> =A0arch/arm/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 | =A0 =A02 +-
> =A0arch/arm/boot/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0| =A0 10 +-
> =A0arch/arm/boot/dt/dtb.S =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0| =A0 =A03 +
> =A0arch/arm/boot/dts/vexpress.dts =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
| =A0199 +++++++++++++++++++++
> =A0arch/arm/include/asm/pmu.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0| =A0 =A06 +
> =A0arch/arm/kernel/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0| =A0 =A03 +-
> =A0arch/arm/kernel/head.S =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0| =A0 =A02 +-
> =A0arch/arm/kernel/pmu-of.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0| =A0 30 +++
> =A0arch/arm/kernel/pmu.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 | =A0 18 ++-
> =A0arch/arm/mach-vexpress/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
| =A0 =A07 +
> =A0arch/arm/mach-vexpress/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 =A05 +-
> =A0arch/arm/mach-vexpress/core.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
| =A0 15 ++-
> =A0arch/arm/mach-vexpress/ct-ca9x4-base.c =A0 =A0 =A0 =A0 =A0 =A0| =A0108=
 +++++++++++
> =A0arch/arm/mach-vexpress/ct-ca9x4-of.c =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A01=
92 ++++++++++++++++++++
> =A0arch/arm/mach-vexpress/ct-ca9x4.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 93 ----------
> =A0arch/arm/mach-vexpress/include/mach/clkdev.h =A0 =A0 =A0| =A0 =A02 +-
> =A0arch/arm/mach-vexpress/include/mach/ct-ca9x4.h =A0 =A0| =A0 =A02 +
> =A0arch/arm/mach-vexpress/include/mach/debug-macro.S | =A0 =A02 +-
> =A0arch/arm/mach-vexpress/v2m-base.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0197 ++++++++++++++++++++
> =A0arch/arm/mach-vexpress/v2m-of.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 94 ++++++++++
> =A0arch/arm/mach-vexpress/v2m.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0167 +-----------------
> =A0arch/arm/mm/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 | =A0 =A02 +-
> =A0drivers/amba/bus.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0| =A0 =A02 +-
> =A0drivers/i2c/busses/i2c-versatile.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 =A06 +
> =A0drivers/mtd/maps/integrator-flash.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
=A06 +
> =A0drivers/net/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0| =A0 =A03 +-
> =A0drivers/net/smsc911x-of.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0 53 ++++++
> =A0drivers/net/smsc911x.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0| =A0 28 ++-
> =A0drivers/net/smsc911x.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0| =A0 =A08 +
> =A0drivers/usb/host/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0 =A04 +-
> =A0drivers/usb/host/isp1760-hcd.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
| =A0 =A07 +
> =A0drivers/usb/host/isp1760-if.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
| =A0 43 +++--
> =A0drivers/usb/host/isp1760-of.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
| =A0 36 ++++
> =A0include/linux/platform_device.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 11 ++
> =A035 files changed, 1067 insertions(+), 303 deletions(-)
> =A0create mode 100644 arch/arm/boot/dts/vexpress.dts
> =A0create mode 100644 arch/arm/kernel/pmu-of.c
> =A0create mode 100644 arch/arm/mach-vexpress/ct-ca9x4-base.c
> =A0create mode 100644 arch/arm/mach-vexpress/ct-ca9x4-of.c
> =A0create mode 100644 arch/arm/mach-vexpress/v2m-base.c
> =A0create mode 100644 arch/arm/mach-vexpress/v2m-of.c
> =A0create mode 100644 drivers/net/smsc911x-of.c
> =A0create mode 100644 drivers/usb/host/isp1760-of.c
>
>



-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
