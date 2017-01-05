From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Subject: Re: [PATCHv2 0/5] Support for Marvell switches with integrated CPUs
Date: Thu, 5 Jan 2017 20:02:06 +0000
Message-ID: <c79e5aa519d14c7d9fdecb187a95d1c1@svr-chch-ex1.atlnz.lc>
References: <20170105033641.6212-1-chris.packham@alliedtelesis.co.nz>
 <CAPv3WKcT8MxX+g12C1o81MmQJWRt7Rpd-hgBh8rTpLOS3vdtqA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
To: Marcin Wojtas <mw@semihalf.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Laxman Dewangan <ldewangan@nvidia.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Juri Lelli <juri.lelli@arm.com>, Russell King <linux@armlinux.org.uk>, Thierry Reding <treding@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Arnd Bergmann <arnd@arndb.de>, Kalyan Kinthada <Kalyan.Kinthada@alliedtelesis>
List-Id: devicetree@vger.kernel.org

On 06/01/17 03:09, Marcin Wojtas wrote:=0A=
> Hi Chris,=0A=
>=0A=
> Thanks a lot for your work and v2. Can you please add changelog=0A=
> between patchset versions in your cover letter?=0A=
=0A=
Will do for v3. I did actually include a changelog in the individual =0A=
patches but I can collate that here.=0A=
=0A=
clk: mvebu: support for 98DX3236 SoC=0A=
- Update devicetree binding documentation for new compatible string=0A=
arm: mvebu: support for SMP on 98DX3336 SoC=0A=
- Document new enable-method value=0A=
- Correct some references from 98DX4521 to 98DX3236=0A=
pinctrl: mvebu: pinctrl driver for 98DX3236 SoC=0A=
- include sdio support for the 98DX4251=0A=
arm: mvebu: Add device tree for 98DX3236 SoCs=0A=
- Update devicetree binding documentation to reflect that 98DX3336 and=0A=
   984251 are supersets of 98DX3236.=0A=
- disable crypto block=0A=
- disable sdio for 98DX3236, enable for 98DX4251=0A=
arm: mvebu: Add device tree for db-dxbc2 and db-xc3-24g4xg boards=0A=
- None=0A=
=0A=
Here's the interdiff=0A=
=0A=
diff --git a/Documentation/devicetree/bindings/arm/cpus.txt =0A=
b/Documentation/devicetree/bindings/arm/cpus.txt=0A=
index a1bcfeed5f24..3c2fd72d0bf9 100644=0A=
--- a/Documentation/devicetree/bindings/arm/cpus.txt=0A=
+++ b/Documentation/devicetree/bindings/arm/cpus.txt=0A=
@@ -202,6 +202,7 @@ nodes to be present and contain the properties =0A=
described below.=0A=
                             "marvell,armada-380-smp"=0A=
                             "marvell,armada-390-smp"=0A=
                             "marvell,armada-xp-smp"=0A=
+                           "marvell,98dx3236-smp"=0A=
                             "mediatek,mt6589-smp"=0A=
                             "mediatek,mt81xx-tz-smp"=0A=
                             "qcom,gcc-msm8660"=0A=
diff --git a/Documentation/devicetree/bindings/arm/marvell/98dx3236.txt =0A=
b/Documentation/devicetree/bindings/arm/marvell/98dx3236.txt=0A=
index e7dc9b2dd90b..64e8c73fc5ab 100644=0A=
--- a/Documentation/devicetree/bindings/arm/marvell/98dx3236.txt=0A=
+++ b/Documentation/devicetree/bindings/arm/marvell/98dx3236.txt=0A=
@@ -6,5 +6,18 @@ shall have the following property:=0A=
=0A=
  Required root node property:=0A=
=0A=
-compatible: one of "marvell,armadaxp-98dx3236", "marvell,armadaxp-98dx3336=
"=0A=
-            or "marvell,armadaxp-98dx4251"=0A=
+compatible: must contain "marvell,armadaxp-98dx3236"=0A=
+=0A=
+In addition, boards using the Marvell 98DX3336 SoC shall have the=0A=
+following property:=0A=
+=0A=
+Required root node property:=0A=
+=0A=
+compatible: must contain "marvell,armadaxp-98dx3336"=0A=
+=0A=
+In addition, boards using the Marvell 98DX4251 SoC shall have the=0A=
+following property:=0A=
+=0A=
+Required root node property:=0A=
+=0A=
+compatible: must contain "marvell,armadaxp-98dx4251"=0A=
diff --git a/Documentation/devicetree/bindings/clock/mvebu-cpu-clock.txt =
=0A=
b/Documentation/devicetree/bindings/clock/mvebu-cpu-clock.txt=0A=
index 99c214660bdc..7f28506eaee7 100644=0A=
--- a/Documentation/devicetree/bindings/clock/mvebu-cpu-clock.txt=0A=
+++ b/Documentation/devicetree/bindings/clock/mvebu-cpu-clock.txt=0A=
@@ -3,6 +3,7 @@ Device Tree Clock bindings for cpu clock of Marvell EBU =0A=
platforms=0A=
  Required properties:=0A=
  - compatible : shall be one of the following:=0A=
         "marvell,armada-xp-cpu-clock" - cpu clocks for Armada XP=0A=
+       "marvell,mv98dx3236-cpu-clock" - cpu clocks for 98DX3236 SoC=0A=
  - reg : Address and length of the clock complex register set, followed=0A=
          by address and length of the PMU DFS registers=0A=
  - #clock-cells : should be set to 1.=0A=
diff --git =0A=
a/Documentation/devicetree/bindings/pinctrl/marvell,armada-98dx3236-pinctrl=
.txt =0A=
b/Documentation/devicetree/bindings/pinctrl/marvell,armada-98dx3236-pinctrl=
.txt=0A=
index 34c1e380adaa..d4e6ecdfc853 100644=0A=
--- =0A=
a/Documentation/devicetree/bindings/pinctrl/marvell,armada-98dx3236-pinctrl=
.txt=0A=
+++ =0A=
b/Documentation/devicetree/bindings/pinctrl/marvell,armada-98dx3236-pinctrl=
.txt=0A=
@@ -4,7 +4,7 @@ Please refer to marvell,mvebu-pinctrl.txt in this =0A=
directory for common binding=0A=
  part and usage=0A=
=0A=
  Required properties:=0A=
-- compatible: "marvell,98dx3236-pinctrl"=0A=
+- compatible: "marvell,98dx3236-pinctrl" or "marvell,98dx4251-pinctrl"=0A=
  - reg: register specifier of MPP registers=0A=
=0A=
  This driver supports all 98dx3236, 98dx3336 and 98dx4251 variants=0A=
@@ -16,12 +16,12 @@ mpp1          1        gpio, spi0(miso), dev(ad9)=0A=
  mpp2          2        gpio, spi0(sck), dev(ad10)=0A=
  mpp3          3        gpio, spi0(cs0), dev(ad11)=0A=
  mpp4          4        gpio, spi0(cs1), smi(mdc), dev(cs0)=0A=
-mpp5          5        gpio, pex(rsto), dev(bootcs)=0A=
-mpp6          6        gpio, dev(a2)=0A=
-mpp7          7        gpio, dev(ale0)=0A=
-mpp8          8        gpio, dev(ale1)=0A=
-mpp9          9        gpio, dev(ready0)=0A=
-mpp10         10       gpio, dev(ad12)=0A=
+mpp5          5        gpio, pex(rsto), sd0(cmd), dev(bootcs)=0A=
+mpp6          6        gpio, sd0(clk), dev(a2)=0A=
+mpp7          7        gpio, sd0(d0), dev(ale0)=0A=
+mpp8          8        gpio, sd0(d1), dev(ale1)=0A=
+mpp9          9        gpio, sd0(d2), dev(ready0)=0A=
+mpp10         10       gpio, sd0(d3), dev(ad12)=0A=
  mpp11         11       gpio, uart1(rxd), uart0(cts), dev(ad13)=0A=
  mpp12         12       gpio, uart1(txd), uart0(rts), dev(ad14)=0A=
  mpp13         13       gpio, intr(out), dev(ad15)=0A=
diff --git a/arch/arm/boot/dts/armada-xp-98dx3236.dtsi =0A=
b/arch/arm/boot/dts/armada-xp-98dx3236.dtsi=0A=
index bac53f8b44af..61bd3acc5cfe 100644=0A=
--- a/arch/arm/boot/dts/armada-xp-98dx3236.dtsi=0A=
+++ b/arch/arm/boot/dts/armada-xp-98dx3236.dtsi=0A=
@@ -138,6 +138,10 @@=0A=
                                 status =3D "disabled";=0A=
                         };=0A=
=0A=
+                       crypto@90000 {=0A=
+                               status =3D "disabled";=0A=
+                       };=0A=
+=0A=
                         xor@f0900 {=0A=
                                 status =3D "disabled";=0A=
                         };=0A=
@@ -229,3 +233,15 @@=0A=
                 marvell,function =3D "spi0";=0A=
         };=0A=
  };=0A=
+=0A=
+&sdio {=0A=
+       status =3D "disabled";=0A=
+};=0A=
+=0A=
+&crypto_sram0 {=0A=
+       status =3D "disabled";=0A=
+};=0A=
+=0A=
+&crypto_sram1 {=0A=
+       status =3D "disabled";=0A=
+};=0A=
diff --git a/arch/arm/boot/dts/armada-xp-98dx4251.dtsi =0A=
b/arch/arm/boot/dts/armada-xp-98dx4251.dtsi=0A=
index 5d1da8513fae..5f7edc23d5ae 100644=0A=
--- a/arch/arm/boot/dts/armada-xp-98dx4251.dtsi=0A=
+++ b/arch/arm/boot/dts/armada-xp-98dx4251.dtsi=0A=
@@ -76,3 +76,17 @@=0A=
                 };=0A=
         };=0A=
  };=0A=
+=0A=
+&sdio {=0A=
+       status =3D "okay";=0A=
+};=0A=
+=0A=
+&pinctrl {=0A=
+       compatible =3D "marvell,98dx4251-pinctrl";=0A=
+=0A=
+       sdio_pins: sdio-pins {=0A=
+               marvell,pins =3D "mpp5", "mpp6", "mpp7",=0A=
+                              "mpp8", "mpp9", "mpp10";=0A=
+               marvell,function =3D "sd0";=0A=
+       };=0A=
+};=0A=
diff --git a/arch/arm/mach-mvebu/pmsu-98dx3236.c =0A=
b/arch/arm/mach-mvebu/pmsu-98dx3236.c=0A=
index fadc81d0c051..87ca42ef40c7 100644=0A=
--- a/arch/arm/mach-mvebu/pmsu-98dx3236.c=0A=
+++ b/arch/arm/mach-mvebu/pmsu-98dx3236.c=0A=
@@ -1,5 +1,5 @@=0A=
  /**=0A=
- * CPU resume support for 98DX4521 internal CPU (a.k.a. MSYS).=0A=
+ * CPU resume support for 98DX3236 internal CPU (a.k.a. MSYS).=0A=
   */=0A=
=0A=
  #define pr_fmt(fmt) "mv98dx3236-resume: " fmt=0A=
@@ -38,7 +38,7 @@ static int __init mv98dx3236_resume_init(void)=0A=
         if (!np)=0A=
                 return 0;=0A=
=0A=
-       pr_info("Initializing 98DX4521 Resume\n");=0A=
+       pr_info("Initializing 98DX3236 Resume\n");=0A=
=0A=
         if (of_address_to_resource(np, 0, &res)) {=0A=
                 pr_err("unable to get resource\n");=0A=
diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-xp.c =0A=
b/drivers/pinctrl/mvebu/pinctrl-armada-xp.c=0A=
index 2586903c59f0..554eeae8cd21 100644=0A=
--- a/drivers/pinctrl/mvebu/pinctrl-armada-xp.c=0A=
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-xp.c=0A=
@@ -389,21 +389,27 @@ static struct mvebu_mpp_mode =0A=
mv98dx3236_mpp_modes[] =3D {=0A=
         MPP_MODE(5,=0A=
                  MPP_VAR_FUNCTION(0x0, "gpio", NULL, =0A=
V_98DX3236_PLUS),=0A=
                  MPP_VAR_FUNCTION(0x1, "pex", "rsto", =0A=
V_98DX3236_PLUS),=0A=
+                MPP_VAR_FUNCTION(0x2, "sd0", "cmd",         V_98DX4251),=
=0A=
                  MPP_VAR_FUNCTION(0x4, "dev", "bootcs0", =0A=
V_98DX3236_PLUS)),=0A=
         MPP_MODE(6,=0A=
                  MPP_VAR_FUNCTION(0x0, "gpo", NULL, =0A=
V_98DX3236_PLUS),=0A=
+                MPP_VAR_FUNCTION(0x2, "sd0", "clk",         V_98DX4251),=
=0A=
                  MPP_VAR_FUNCTION(0x4, "dev", "a2", =0A=
V_98DX3236_PLUS)),=0A=
         MPP_MODE(7,=0A=
                  MPP_VAR_FUNCTION(0x0, "gpio", NULL, =0A=
V_98DX3236_PLUS),=0A=
+                MPP_VAR_FUNCTION(0x2, "sd0", "d0",          V_98DX4251),=
=0A=
                  MPP_VAR_FUNCTION(0x4, "dev", "ale0", =0A=
V_98DX3236_PLUS)),=0A=
         MPP_MODE(8,=0A=
                  MPP_VAR_FUNCTION(0x0, "gpio", NULL, =0A=
V_98DX3236_PLUS),=0A=
+                MPP_VAR_FUNCTION(0x2, "sd0", "d1",          V_98DX4251),=
=0A=
                  MPP_VAR_FUNCTION(0x4, "dev", "ale1", =0A=
V_98DX3236_PLUS)),=0A=
         MPP_MODE(9,=0A=
                  MPP_VAR_FUNCTION(0x0, "gpio", NULL, =0A=
V_98DX3236_PLUS),=0A=
+                MPP_VAR_FUNCTION(0x2, "sd0", "d2",          V_98DX4251),=
=0A=
                  MPP_VAR_FUNCTION(0x4, "dev", "ready0", =0A=
V_98DX3236_PLUS)),=0A=
         MPP_MODE(10,=0A=
                  MPP_VAR_FUNCTION(0x0, "gpio", NULL, =0A=
V_98DX3236_PLUS),=0A=
+                MPP_VAR_FUNCTION(0x2, "sd0", "d3",          V_98DX4251),=
=0A=
                  MPP_VAR_FUNCTION(0x4, "dev", "ad12", =0A=
V_98DX3236_PLUS)),=0A=
         MPP_MODE(11,=0A=
                  MPP_VAR_FUNCTION(0x0, "gpio", NULL, =0A=
V_98DX3236_PLUS),=0A=
@@ -501,6 +507,10 @@ static const struct of_device_id =0A=
armada_xp_pinctrl_of_match[] =3D {=0A=
                 .compatible =3D "marvell,98dx3236-pinctrl",=0A=
                 .data       =3D (void *) V_98DX3236,=0A=
         },=0A=
+       {=0A=
+               .compatible =3D "marvell,98dx4251-pinctrl",=0A=
+               .data       =3D (void *) V_98DX4251,=0A=
+       },=0A=
         { },=0A=
  };=0A=
=0A=
=0A=
=0A=
>=0A=
> Best regards,=0A=
> Marcin=0A=
>=0A=
> 2017-01-05 4:36 GMT+01:00 Chris Packham <chris.packham@alliedtelesis.co.n=
z>:=0A=
>> The 98DX3236, 98DX3336 and 98DX4251 are a set of switch ASICs with=0A=
>> integrated CPUs. They CPU block is common within these product lines and=
=0A=
>> (as far as I can tell/have been told) is based on the Armada XP. There=
=0A=
>> are a few differences due to the fact they have to squeeze the CPU into=
=0A=
>> the same package as the switch.=0A=
>>=0A=
>> Chris Packham (4):=0A=
>>   clk: mvebu: support for 98DX3236 SoC=0A=
>>   arm: mvebu: support for SMP on 98DX3336 SoC=0A=
>>   arm: mvebu: Add device tree for 98DX3236 SoCs=0A=
>>   arm: mvebu: Add device tree for db-dxbc2 and db-xc3-24g4xg boards=0A=
>>=0A=
>> Kalyan Kinthada (1):=0A=
>>   pinctrl: mvebu: pinctrl driver for 98DX3236 SoC=0A=
>>=0A=
>>  Documentation/devicetree/bindings/arm/cpus.txt     |   1 +=0A=
>>  .../bindings/arm/marvell/98dx3236-resume-ctrl.txt  |  18 ++=0A=
>>  .../devicetree/bindings/arm/marvell/98dx3236.txt   |  23 ++=0A=
>>  .../devicetree/bindings/clock/mvebu-cpu-clock.txt  |   1 +=0A=
>>  .../pinctrl/marvell,armada-98dx3236-pinctrl.txt    |  46 ++++=0A=
>>  arch/arm/boot/dts/armada-xp-98dx3236.dtsi          | 247 ++++++++++++++=
+++++++=0A=
>>  arch/arm/boot/dts/armada-xp-98dx3336.dtsi          |  78 +++++++=0A=
>>  arch/arm/boot/dts/armada-xp-98dx4251.dtsi          |  92 ++++++++=0A=
>>  arch/arm/boot/dts/db-dxbc2.dts                     | 159 +++++++++++++=
=0A=
>>  arch/arm/boot/dts/db-xc3-24g4xg.dts                | 155 +++++++++++++=
=0A=
>>  arch/arm/mach-mvebu/Makefile                       |   1 +=0A=
>>  arch/arm/mach-mvebu/common.h                       |   1 +=0A=
>>  arch/arm/mach-mvebu/platsmp.c                      |  43 ++++=0A=
>>  arch/arm/mach-mvebu/pmsu-98dx3236.c                |  69 ++++++=0A=
>>  drivers/clk/mvebu/Makefile                         |   2 +-=0A=
>>  drivers/clk/mvebu/armada-xp.c                      |  42 ++++=0A=
>>  drivers/clk/mvebu/clk-cpu.c                        |  33 ++-=0A=
>>  drivers/clk/mvebu/mv98dx3236-corediv.c             | 207 ++++++++++++++=
+++=0A=
>>  drivers/pinctrl/mvebu/pinctrl-armada-xp.c          | 155 +++++++++++++=
=0A=
>>  19 files changed, 1369 insertions(+), 4 deletions(-)=0A=
>>  create mode 100644 Documentation/devicetree/bindings/arm/marvell/98dx32=
36-resume-ctrl.txt=0A=
>>  create mode 100644 Documentation/devicetree/bindings/arm/marvell/98dx32=
36.txt=0A=
>>  create mode 100644 Documentation/devicetree/bindings/pinctrl/marvell,ar=
mada-98dx3236-pinctrl.txt=0A=
>>  create mode 100644 arch/arm/boot/dts/armada-xp-98dx3236.dtsi=0A=
>>  create mode 100644 arch/arm/boot/dts/armada-xp-98dx3336.dtsi=0A=
>>  create mode 100644 arch/arm/boot/dts/armada-xp-98dx4251.dtsi=0A=
>>  create mode 100644 arch/arm/boot/dts/db-dxbc2.dts=0A=
>>  create mode 100644 arch/arm/boot/dts/db-xc3-24g4xg.dts=0A=
>>  create mode 100644 arch/arm/mach-mvebu/pmsu-98dx3236.c=0A=
>>  create mode 100644 drivers/clk/mvebu/mv98dx3236-corediv.c=0A=
>>=0A=
>> --=0A=
>> 2.11.0.24.ge6920cf=0A=
>>=0A=
>>=0A=
>> _______________________________________________=0A=
>> linux-arm-kernel mailing list=0A=
>> linux-arm-kernel@lists.infradead.org=0A=
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel=0A=
>=0A=
=0A=
