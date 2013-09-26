From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH v3 1/2] Documentation: devicetree: arm: cpus/cpu nodes bindings updates
Date: Thu, 26 Sep 2013 10:42:02 +0100
Message-ID: <1380188523-20589-2-git-send-email-lorenzo.pieralisi@arm.com>
References: <1380188523-20589-1-git-send-email-lorenzo.pieralisi@arm.com>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1380188523-20589-1-git-send-email-lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Dave Martin <dave.martin-5wv7dgnIgG8@public.gmane.org>, Vincent Guittot <vincent.guittot-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

In order to extend the current cpu nodes bindings to newer CPUs
inclusive of AArch64 and to update support for older ARM CPUs this
patch updates device tree documentation for the cpu nodes bindings.

Main changes:
    - adds 64-bit bindings
    - define usage of #address-cells
    - defines behaviour on pre and post v7 uniprocessor systems
    - adds ARM 11MPcore specific reg property definition

Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Acked-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Acked-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Acked-by: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/cpus.txt | 401 +++++++++++++++++++++=
+---
 1 file changed, 354 insertions(+), 47 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/cpus.txt b/Documentation=
/devicetree/bindings/arm/cpus.txt
index f32494d..9130435 100644
--- a/Documentation/devicetree/bindings/arm/cpus.txt
+++ b/Documentation/devicetree/bindings/arm/cpus.txt
@@ -1,77 +1,384 @@
-* ARM CPUs binding description
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+ARM CPUs bindings
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 The device tree allows to describe the layout of CPUs in a system through
 the "cpus" node, which in turn contains a number of subnodes (ie "cpu")
 defining properties for every cpu.
=20
-Bindings for CPU nodes follow the ePAPR standard, available from:
-
-http://devicetree.org
-
-For the ARM architecture every CPU node must contain the following propert=
ies:
-
-- device_type:=09must be "cpu"
-- reg:=09=09property matching the CPU MPIDR[23:0] register bits
-=09=09reg[31:24] bits must be set to 0
-- compatible:=09should be one of:
-=09=09"arm,arm1020"
-=09=09"arm,arm1020e"
-=09=09"arm,arm1022"
-=09=09"arm,arm1026"
-=09=09"arm,arm720"
-=09=09"arm,arm740"
-=09=09"arm,arm7tdmi"
-=09=09"arm,arm920"
-=09=09"arm,arm922"
-=09=09"arm,arm925"
-=09=09"arm,arm926"
-=09=09"arm,arm940"
-=09=09"arm,arm946"
-=09=09"arm,arm9tdmi"
-=09=09"arm,cortex-a5"
-=09=09"arm,cortex-a7"
-=09=09"arm,cortex-a8"
-=09=09"arm,cortex-a9"
-=09=09"arm,cortex-a15"
-=09=09"arm,arm1136"
-=09=09"arm,arm1156"
-=09=09"arm,arm1176"
-=09=09"arm,arm11mpcore"
-=09=09"faraday,fa526"
-=09=09"intel,sa110"
-=09=09"intel,sa1100"
-=09=09"marvell,feroceon"
-=09=09"marvell,mohawk"
-=09=09"marvell,xsc3"
-=09=09"marvell,xscale"
-
-Example:
+Bindings for CPU nodes follow the ePAPR v1.1 standard, available from:
+
+https://www.power.org/documentation/epapr-version-1-1/
+
+with updates for 32-bit and 64-bit ARM systems provided in this document.
+
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
+Convention used in this document
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
+
+This document follows the conventions described in the ePAPR v1.1, with
+the addition:
+
+- square brackets define bitfields, eg reg[7:0] value of the bitfield in
+  the reg property contained in bits 7 down to 0
+
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+cpus and cpu node bindings definition
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+The ARM architecture, in accordance with the ePAPR, requires the cpus and =
cpu
+nodes to be present and contain the properties described below.
+
+- cpus node
+
+=09Description: Container of cpu nodes
+
+=09The node name must be "cpus".
+
+=09A cpus node must define the following properties:
+
+=09- #address-cells
+=09=09Usage: required
+=09=09Value type: <u32>
+
+=09=09Definition depends on ARM architecture version and
+=09=09configuration:
+
+=09=09=09# On uniprocessor ARM architectures previous to v7
+=09=09=09  value must be 1, to enable a simple enumeration
+=09=09=09  scheme for processors that do not have a HW CPU
+=09=09=09  identification register.
+=09=09=09# On 32-bit ARM 11 MPcore, ARM v7 or later systems
+=09=09=09  value must be 1, that corresponds to CPUID/MPIDR
+=09=09=09  registers sizes.
+=09=09=09# On ARM v8 64-bit systems value should be set to 2,
+=09=09=09  that corresponds to the MPIDR_EL1 register size.
+=09=09=09  If MPIDR_EL1[63:32] value is equal to 0 on all CPUs
+=09=09=09  in the system, #address-cells can be set to 1, since
+=09=09=09  MPIDR_EL1[63:32] bits are not used for CPUs
+=09=09=09  identification.
+=09- #size-cells
+=09=09Usage: required
+=09=09Value type: <u32>
+=09=09Definition: must be set to 0
+
+- cpu node
+
+=09Description: Describes a CPU in an ARM based system
+
+=09PROPERTIES
+
+=09- device_type
+=09=09Usage: required
+=09=09Value type: <string>
+=09=09Definition: must be "cpu"
+=09- reg
+=09=09Usage and definition depend on ARM architecture version and
+=09=09configuration:
+
+=09=09=09# On uniprocessor ARM architectures previous to v7
+=09=09=09  this property is required and must be set to 0.
+
+=09=09=09# On ARM 11 MPcore based systems this property is
+=09=09=09  required and matches the CPUID[11:0] register bits.
+
+=09=09=09  Bits [11:0] in the reg cell must be set to
+=09=09=09  bits [11:0] in CPU ID register.
+
+=09=09=09  All other bits in the reg cell must be set to 0.
+
+=09=09=09# On 32-bit ARM v7 or later systems this property is
+=09=09=09  required and matches the CPU MPIDR[23:0] register
+=09=09=09  bits.
+
+=09=09=09  Bits [23:0] in the reg cell must be set to
+=09=09=09  bits [23:0] in MPIDR.
+
+=09=09=09  All other bits in the reg cell must be set to 0.
+
+=09=09=09# On ARM v8 64-bit systems this property is required
+=09=09=09  and matches the MPIDR_EL1 register affinity bits.
+
+=09=09=09  * If cpus node's #address-cells property is set to 2
+
+=09=09=09    The first reg cell bits [7:0] must be set to
+=09=09=09    bits [39:32] of MPIDR_EL1.
+
+=09=09=09    The second reg cell bits [23:0] must be set to
+=09=09=09    bits [23:0] of MPIDR_EL1.
+
+=09=09=09  * If cpus node's #address-cells property is set to 1
+
+=09=09=09    The reg cell bits [23:0] must be set to bits [23:0]
+=09=09=09    of MPIDR_EL1.
+
+=09=09=09  All other bits in the reg cells must be set to 0.
+
+=09- compatible:
+=09=09Usage: required
+=09=09Value type: <string>
+=09=09Definition: should be one of:
+=09=09=09    "arm,arm710t"
+=09=09=09    "arm,arm720t"
+=09=09=09    "arm,arm740t"
+=09=09=09    "arm,arm7ej-s"
+=09=09=09    "arm,arm7tdmi"
+=09=09=09    "arm,arm7tdmi-s"
+=09=09=09    "arm,arm9es"
+=09=09=09    "arm,arm9ej-s"
+=09=09=09    "arm,arm920t"
+=09=09=09    "arm,arm922t"
+=09=09=09    "arm,arm925"
+=09=09=09    "arm,arm926e-s"
+=09=09=09    "arm,arm926ej-s"
+=09=09=09    "arm,arm940t"
+=09=09=09    "arm,arm946e-s"
+=09=09=09    "arm,arm966e-s"
+=09=09=09    "arm,arm968e-s"
+=09=09=09    "arm,arm9tdmi"
+=09=09=09    "arm,arm1020e"
+=09=09=09    "arm,arm1020t"
+=09=09=09    "arm,arm1022e"
+=09=09=09    "arm,arm1026ej-s"
+=09=09=09    "arm,arm1136j-s"
+=09=09=09    "arm,arm1136jf-s"
+=09=09=09    "arm,arm1156t2-s"
+=09=09=09    "arm,arm1156t2f-s"
+=09=09=09    "arm,arm1176jzf"
+=09=09=09    "arm,arm1176jz-s"
+=09=09=09    "arm,arm1176jzf-s"
+=09=09=09    "arm,arm11mpcore"
+=09=09=09    "arm,cortex-a5"
+=09=09=09    "arm,cortex-a7"
+=09=09=09    "arm,cortex-a8"
+=09=09=09    "arm,cortex-a9"
+=09=09=09    "arm,cortex-a15"
+=09=09=09    "arm,cortex-a53"
+=09=09=09    "arm,cortex-a57"
+=09=09=09    "arm,cortex-m0"
+=09=09=09    "arm,cortex-m0+"
+=09=09=09    "arm,cortex-m1"
+=09=09=09    "arm,cortex-m3"
+=09=09=09    "arm,cortex-m4"
+=09=09=09    "arm,cortex-r4"
+=09=09=09    "arm,cortex-r5"
+=09=09=09    "arm,cortex-r7"
+=09=09=09    "faraday,fa526"
+=09=09=09    "intel,sa110"
+=09=09=09    "intel,sa1100"
+=09=09=09    "marvell,feroceon"
+=09=09=09    "marvell,mohawk"
+=09=09=09    "marvell,pj4a"
+=09=09=09    "marvell,pj4b"
+=09=09=09    "marvell,sheeva-v5"
+=09=09=09    "qcom,krait"
+=09=09=09    "qcom,scorpion"
+=09- enable-method
+=09=09Value type: <stringlist>
+=09=09Usage and definition depend on ARM architecture version.
+=09=09=09# On ARM v8 64-bit this property is required and must
+=09=09=09  be one of:
+=09=09=09     "spin-table"
+=09=09=09     "psci"
+=09=09=09# On ARM 32-bit systems this property is optional.
+
+=09- cpu-release-addr
+=09=09Usage: required for systems that have an "enable-method"
+=09=09       property value of "spin-table".
+=09=09Value type: <prop-encoded-array>
+=09=09Definition:
+=09=09=09# On ARM v8 64-bit systems must be a two cell
+=09=09=09  property identifying a 64-bit zero-initialised
+=09=09=09  memory location.
+
+Example 1 (dual-cluster big.LITTLE system 32-bit):
=20
 =09cpus {
 =09=09#size-cells =3D <0>;
 =09=09#address-cells =3D <1>;
=20
-=09=09CPU0: cpu@0 {
+=09=09cpu@0 {
 =09=09=09device_type =3D "cpu";
 =09=09=09compatible =3D "arm,cortex-a15";
 =09=09=09reg =3D <0x0>;
 =09=09};
=20
-=09=09CPU1: cpu@1 {
+=09=09cpu@1 {
 =09=09=09device_type =3D "cpu";
 =09=09=09compatible =3D "arm,cortex-a15";
 =09=09=09reg =3D <0x1>;
 =09=09};
=20
-=09=09CPU2: cpu@100 {
+=09=09cpu@100 {
 =09=09=09device_type =3D "cpu";
 =09=09=09compatible =3D "arm,cortex-a7";
 =09=09=09reg =3D <0x100>;
 =09=09};
=20
-=09=09CPU3: cpu@101 {
+=09=09cpu@101 {
 =09=09=09device_type =3D "cpu";
 =09=09=09compatible =3D "arm,cortex-a7";
 =09=09=09reg =3D <0x101>;
 =09=09};
 =09};
+
+Example 2 (Cortex-A8 uniprocessor 32-bit system):
+
+=09cpus {
+=09=09#size-cells =3D <0>;
+=09=09#address-cells =3D <1>;
+
+=09=09cpu@0 {
+=09=09=09device_type =3D "cpu";
+=09=09=09compatible =3D "arm,cortex-a8";
+=09=09=09reg =3D <0x0>;
+=09=09};
+=09};
+
+Example 3 (ARM 926EJ-S uniprocessor 32-bit system):
+
+=09cpus {
+=09=09#size-cells =3D <0>;
+=09=09#address-cells =3D <1>;
+
+=09=09cpu@0 {
+=09=09=09device_type =3D "cpu";
+=09=09=09compatible =3D "arm,arm926ej-s";
+=09=09=09reg =3D <0x0>;
+=09=09};
+=09};
+
+Example 4 (ARM Cortex-A57 64-bit system):
+
+cpus {
+=09#size-cells =3D <0>;
+=09#address-cells =3D <2>;
+
+=09cpu@0 {
+=09=09device_type =3D "cpu";
+=09=09compatible =3D "arm,cortex-a57";
+=09=09reg =3D <0x0 0x0>;
+=09=09enable-method =3D "spin-table";
+=09=09cpu-release-addr =3D <0 0x20000000>;
+=09};
+
+=09cpu@1 {
+=09=09device_type =3D "cpu";
+=09=09compatible =3D "arm,cortex-a57";
+=09=09reg =3D <0x0 0x1>;
+=09=09enable-method =3D "spin-table";
+=09=09cpu-release-addr =3D <0 0x20000000>;
+=09};
+
+=09cpu@100 {
+=09=09device_type =3D "cpu";
+=09=09compatible =3D "arm,cortex-a57";
+=09=09reg =3D <0x0 0x100>;
+=09=09enable-method =3D "spin-table";
+=09=09cpu-release-addr =3D <0 0x20000000>;
+=09};
+
+=09cpu@101 {
+=09=09device_type =3D "cpu";
+=09=09compatible =3D "arm,cortex-a57";
+=09=09reg =3D <0x0 0x101>;
+=09=09enable-method =3D "spin-table";
+=09=09cpu-release-addr =3D <0 0x20000000>;
+=09};
+
+=09cpu@10000 {
+=09=09device_type =3D "cpu";
+=09=09compatible =3D "arm,cortex-a57";
+=09=09reg =3D <0x0 0x10000>;
+=09=09enable-method =3D "spin-table";
+=09=09cpu-release-addr =3D <0 0x20000000>;
+=09};
+
+=09cpu@10001 {
+=09=09device_type =3D "cpu";
+=09=09compatible =3D "arm,cortex-a57";
+=09=09reg =3D <0x0 0x10001>;
+=09=09enable-method =3D "spin-table";
+=09=09cpu-release-addr =3D <0 0x20000000>;
+=09};
+
+=09cpu@10100 {
+=09=09device_type =3D "cpu";
+=09=09compatible =3D "arm,cortex-a57";
+=09=09reg =3D <0x0 0x10100>;
+=09=09enable-method =3D "spin-table";
+=09=09cpu-release-addr =3D <0 0x20000000>;
+=09};
+
+=09cpu@10101 {
+=09=09device_type =3D "cpu";
+=09=09compatible =3D "arm,cortex-a57";
+=09=09reg =3D <0x0 0x10101>;
+=09=09enable-method =3D "spin-table";
+=09=09cpu-release-addr =3D <0 0x20000000>;
+=09};
+
+=09cpu@100000000 {
+=09=09device_type =3D "cpu";
+=09=09compatible =3D "arm,cortex-a57";
+=09=09reg =3D <0x1 0x0>;
+=09=09enable-method =3D "spin-table";
+=09=09cpu-release-addr =3D <0 0x20000000>;
+=09};
+
+=09cpu@100000001 {
+=09=09device_type =3D "cpu";
+=09=09compatible =3D "arm,cortex-a57";
+=09=09reg =3D <0x1 0x1>;
+=09=09enable-method =3D "spin-table";
+=09=09cpu-release-addr =3D <0 0x20000000>;
+=09};
+
+=09cpu@100000100 {
+=09=09device_type =3D "cpu";
+=09=09compatible =3D "arm,cortex-a57";
+=09=09reg =3D <0x1 0x100>;
+=09=09enable-method =3D "spin-table";
+=09=09cpu-release-addr =3D <0 0x20000000>;
+=09};
+
+=09cpu@100000101 {
+=09=09device_type =3D "cpu";
+=09=09compatible =3D "arm,cortex-a57";
+=09=09reg =3D <0x1 0x101>;
+=09=09enable-method =3D "spin-table";
+=09=09cpu-release-addr =3D <0 0x20000000>;
+=09};
+
+=09cpu@100010000 {
+=09=09device_type =3D "cpu";
+=09=09compatible =3D "arm,cortex-a57";
+=09=09reg =3D <0x1 0x10000>;
+=09=09enable-method =3D "spin-table";
+=09=09cpu-release-addr =3D <0 0x20000000>;
+=09};
+
+=09cpu@100010001 {
+=09=09device_type =3D "cpu";
+=09=09compatible =3D "arm,cortex-a57";
+=09=09reg =3D <0x1 0x10001>;
+=09=09enable-method =3D "spin-table";
+=09=09cpu-release-addr =3D <0 0x20000000>;
+=09};
+
+=09cpu@100010100 {
+=09=09device_type =3D "cpu";
+=09=09compatible =3D "arm,cortex-a57";
+=09=09reg =3D <0x1 0x10100>;
+=09=09enable-method =3D "spin-table";
+=09=09cpu-release-addr =3D <0 0x20000000>;
+=09};
+
+=09cpu@100010101 {
+=09=09device_type =3D "cpu";
+=09=09compatible =3D "arm,cortex-a57";
+=09=09reg =3D <0x1 0x10101>;
+=09=09enable-method =3D "spin-table";
+=09=09cpu-release-addr =3D <0 0x20000000>;
+=09};
+};
--=20
1.8.2.2


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
