From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 1/7] ARM: mmp: parse irq from DT
Date: Tue, 19 Jul 2011 11:39:11 -0600
Message-ID: <CACxGe6vGZ1H57NboKU7QnhNwb3RneWmGZjQpAQuzgsyyqLXncQ@mail.gmail.com>
References: <1311042290-20253-1-git-send-email-haojian.zhuang@marvell.com>
	<1311042290-20253-2-git-send-email-haojian.zhuang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1311042290-20253-2-git-send-email-haojian.zhuang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Haojian Zhuang <haojian.zhuang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Cc: eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, alan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 18, 2011 at 8:24 PM, Haojian Zhuang
<haojian.zhuang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org> wrote:
> Parse irq sepcifier from DT and translate it to Linux irq number.
>
> Signed-off-by: Haojian Zhuang <haojian.zhuang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> ---
> =A0.../devicetree/bindings/arm/marvell/intc.txt =A0 =A0 =A0 | =A0120 ++++=
+++++++
> =A0arch/arm/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 | =A0 =A01 +
> =A0arch/arm/mach-mmp/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 | =A0 =A02 +
> =A0arch/arm/mach-mmp/common.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 | =A0 =A01 +
> =A0arch/arm/mach-mmp/intc.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 | =A0223 ++++++++++++++++++++
> =A05 files changed, 347 insertions(+), 0 deletions(-)
> =A0create mode 100644 Documentation/devicetree/bindings/arm/marvell/intc.=
txt
> =A0create mode 100644 arch/arm/mach-mmp/intc.c
>
> diff --git a/Documentation/devicetree/bindings/arm/marvell/intc.txt b/Doc=
umentation/devicetree/bindings/arm/marvell/intc.txt
> new file mode 100644
> index 0000000..e730a16
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/marvell/intc.txt
> @@ -0,0 +1,120 @@
> +* Interrupt Controller Binding for ARCH-MMP
> +
> +This binding specifies what properties must be available in device tree =
representation of an ARCH-MMP compliant interrupt controller.
> +
> +Required properties:
> +
> + =A0 =A0 =A0 - compatible: Specifies the compatibility list of the inter=
rupt
> + =A0 =A0 =A0 =A0 controller. The type shall be <string> and the value sh=
all be
> + =A0 =A0 =A0 =A0 "mrvl,mmp-intc" or "mrvl,mux-intc".
> + =A0 =A0 =A0 =A0 "mrvl,mmp-intc" is the base interrupt controller. It mu=
st be
> + =A0 =A0 =A0 =A0 included. "mrvl,mux-intc" is the expanded interrupt con=
troller,
> + =A0 =A0 =A0 =A0 and it's optional.

Please encode the soc name into the compatible property.  Different
SoCs get different versions of IP blocks.  The compatible property is
the easiest way to differentiate between them.  New devices can always
claim compatibility with older ones to avoid needing an exhaustive
list in the device driver.  Both of these should be something like
"mrvl,<soc>-mmp-intc" and "mrvl,<soc>-mux-intc".

> +
> + =A0 =A0 =A0 - reg: Specified the base physical address(s) and size(s) o=
f the
> + =A0 =A0 =A0 =A0 interrupt controller's addressable register space. The =
type
> + =A0 =A0 =A0 =A0 should be <prop-encoded-array>.
> +
> + =A0 =A0 =A0 - interrupt-controller: The presence of this property ident=
ifies
> + =A0 =A0 =A0 =A0 the node as interrupt controller. No property value sho=
uld be
> + =A0 =A0 =A0 =A0 defined.
> +
> + =A0 =A0 =A0 - #interrupt-cells: Specifies the number of cells needed to=
 encode
> + =A0 =A0 =A0 =A0 an interrupt source. The type should be <u32> and the v=
alue should
> + =A0 =A0 =A0 =A0 be 1.
> +
> + =A0 =A0 =A0 - #address-cells: Specifies the number of cells needed to e=
ncode an
> + =A0 =A0 =A0 =A0 address. The type should be <u32> and the value should =
be 1.
> +
> + =A0 =A0 =A0 - #size-cells: Specifies the number of cells need to encode=
 an
> + =A0 =A0 =A0 =A0 size. The type should be <u32> and the value should be =
1.

This is not a bus node.  It should not have #address-cells or #size-cells.

> +
> + =A0 =A0 =A0 - intc-numbers: Specifies the number of interrupts is suppo=
rted in
> + =A0 =A0 =A0 =A0 this interrupt controller. The type should be <u32>.


> +
> +Optional properties:
> +
> + =A0 =A0 =A0 - intc-enable-mask: Specifies the masking value of interrupt
> + =A0 =A0 =A0 =A0 configuration register. The property is used in mmp-int=
c. The value
> + =A0 =A0 =A0 =A0 should be <u32>.

What is the purpose of having a mask register?  I would expect that
unused interrupts simply wouldn't be requested by any devices.

> +
> + =A0 =A0 =A0 - intc-status: Specifies the offset of status register. The=
 property
> + =A0 =A0 =A0 =A0 is used in mux-intc. The type should be <u32>.
> +
> + =A0 =A0 =A0 - intc-mask: Specifies the offset of mask register. The pro=
perty
> + =A0 =A0 =A0 =A0 is used in mux-intc. The type should be <u32>.
> +
> + =A0 =A0 =A0 - intc-mfp-edge: Specifies the address of mfp edge detectio=
n register.
> + =A0 =A0 =A0 =A0 The property is used while acking specified interrupt. =
The type
> + =A0 =A0 =A0 =A0 should be <prop-encoded-array>. The first cell indicate=
s the address
> + =A0 =A0 =A0 =A0 of mfp edge detection register. The second cell indicat=
es the
> + =A0 =A0 =A0 =A0 index of interrupt in current interrupt controller that=
 should
> + =A0 =A0 =A0 =A0 handle mfp edge detection.

Use a "mrvl," prefix on the above non-standard properties.  Since the
4 properties above are all register offsets, the name should reflect
that.  Something like "mrvl,status-reg-offset"

Do the register offsets change with difference versions of the silicon?

> +
> +* Examples
> +
> +Example 1:
> +
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* base INTC
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 mmp_intc: interrupt-controller@d4282000 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Compatible with mmp-intc. */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "mrvl,mmp-intc";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <1>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <1>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Offset address of 0xd4282000 and size of=
 0x400. */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xd4282000 0x400>;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #interrupt-cells =3D <1>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupt-controller;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* 64 interrupts are supported in this INTC=
. */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 intc-numbers =3D <64>;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* enable bits in configuration register */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 intc-enable-mask =3D <0x20>;
> + =A0 =A0 =A0 };
> +
> +Example 2:
> +
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* mux INTC that is internal wired to base INTC
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 mux_intc4: interrupt-controller@d4282150 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "mrvl,mux-intc";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <1>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <1>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xd4282000 0x400>;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 #interrupt-cells =3D <1>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupt-controller;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupt-parent =3D <&mmp_intc>;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* interrupt source '4' of parent INTC. */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <4>;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* 2 interrupts are supported in this INTC.=
 */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 intc-numbers =3D <2>;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Status offset address of 0x150. */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 intc-status =3D <0x150>;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Mask offset address of 0x168. */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 intc-mask =3D <0x168>;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* mfp register of 0xd401e2c4 & interrupt i=
ndex of 1 */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 intc-mfp-edge =3D <0xd401e2c4 1>;
> + =A0 =A0 =A0 };
> +
> +Example 3:
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* An interrupt generating device that is wired to an INT=
C.
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 uart0: uart@d4030000 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* parent's '#interrupt-cells' property. */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <27>;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* The INTC that this device is wired to. */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupt-parent =3D <&mmp_intc>;
> + =A0 =A0 =A0 };
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 17507b8..f18eb14 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -542,6 +542,7 @@ config ARCH_MMP
> =A0 =A0 =A0 =A0select ARCH_REQUIRE_GPIOLIB
> =A0 =A0 =A0 =A0select CLKDEV_LOOKUP
> =A0 =A0 =A0 =A0select GENERIC_CLOCKEVENTS
> + =A0 =A0 =A0 select GENERIC_IRQ_CHIP
> =A0 =A0 =A0 =A0select HAVE_SCHED_CLOCK
> =A0 =A0 =A0 =A0select TICK_ONESHOT
> =A0 =A0 =A0 =A0select PLAT_PXA
> diff --git a/arch/arm/mach-mmp/Makefile b/arch/arm/mach-mmp/Makefile
> index 5c68382..e7862ea 100644
> --- a/arch/arm/mach-mmp/Makefile
> +++ b/arch/arm/mach-mmp/Makefile
> @@ -4,6 +4,8 @@
>
> =A0obj-y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D common.o=
 clock.o devices.o time.o
>
> +obj-$(CONFIG_OF_IRQ) =A0 =A0 =A0 =A0 =A0 +=3D intc.o
> +

Do drivers already exist for the pxa interrupt controllers?  I would
expect the existing driver to be updated to include DT support instead
of writing an entirely new IRQ controller driver.

g.
