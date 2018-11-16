Return-Path: <monstr@monstr.eu>
MIME-Version: 1.0
References: <73038a438592d806874920f6680f2f3c7e20c0ad.1541684554.git.michal.simek@xilinx.com>
In-Reply-To: <73038a438592d806874920f6680f2f3c7e20c0ad.1541684554.git.michal.simek@xilinx.com>
From: Michal Simek <monstr@monstr.eu>
Date: Fri, 16 Nov 2018 09:14:35 +0100
Message-ID: <CAHTX3dLieNRz8co0VV+YfDTorK=rWbkOLXY4pLK12BppWW8qOg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: zynqmp: Fix node names which contain "_"
Content-Type: multipart/alternative; boundary="000000000000a47098057ac3c2e8"
To: Rob Herring <robh@kernel.org>, Rob Herring <robherring2@gmail.com>, devicetree@vger.kernel.org
Cc: Olof Johansson <olof@lixom.net>, LKML <linux-kernel@vger.kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, Will Deacon <will.deacon@arm.com>, Manish Narani <manish.narani@xilinx.com>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-arm <linux-arm-kernel@lists.infradead.org>
List-ID: <devicetree@vger.kernel.org>

--000000000000a47098057ac3c2e8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=C4=8Dt 8. 11. 2018 v 14:43 odes=C3=ADlatel Michal Simek <michal.simek@xili=
nx.com>
napsal:

> s/_/-/ for node names.
>
> It fixes warnings like this:
> ... Warning (node_name_chars_strict): /cpu_opp_table:
> Character '_' not recommended in node name ...
>
> Issues reported by make dtbs W=3D12
>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> ---
>
> dr_mode property is also reported but it is not fixed because code needs
> to fixed first.
>
> ---
>  arch/arm64/boot/dts/xilinx/zynqmp-clk.dtsi        |  4 ++--
>  arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts |  4 ++--
>  arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts | 10 +++++-----
>  arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts |  2 +-
>  arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts |  2 +-
>  arch/arm64/boot/dts/xilinx/zynqmp.dtsi            |  4 ++--
>  6 files changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-clk.dtsi
> b/arch/arm64/boot/dts/xilinx/zynqmp-clk.dtsi
> index 9c09baca7dd7..306ad2157c98 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp-clk.dtsi
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp-clk.dtsi
> @@ -58,13 +58,13 @@
>                 clock-accuracy =3D <100>;
>         };
>
> -       dpdma_clk: dpdma_clk {
> +       dpdma_clk: dpdma-clk {
>                 compatible =3D "fixed-clock";
>                 #clock-cells =3D <0x0>;
>                 clock-frequency =3D <533000000>;
>         };
>
> -       drm_clock: drm_clock {
> +       drm_clock: drm-clock {
>                 compatible =3D "fixed-clock";
>                 #clock-cells =3D <0x0>;
>                 clock-frequency =3D <262750000>;
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts
> b/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts
> index 527b4d0f88e2..13a0a028df98 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts
> @@ -82,7 +82,7 @@
>                         linux,default-trigger =3D "bluetooth-power";
>                 };
>
> -               vbus_det { /* U5 USB5744 VBUS detection via MIO25 */
> +               vbus-det { /* U5 USB5744 VBUS detection via MIO25 */
>                         label =3D "vbus_det";
>                         gpios =3D <&gpio 25 GPIO_ACTIVE_HIGH>;
>                         default-state =3D "on";
> @@ -98,7 +98,7 @@
>                 regulator-boot-on;
>         };
>
> -       sdio_pwrseq: sdio_pwrseq {
> +       sdio_pwrseq: sdio-pwrseq {
>                 compatible =3D "mmc-pwrseq-simple";
>                 reset-gpios =3D <&gpio 7 GPIO_ACTIVE_LOW>; /* WIFI_EN */
>         };
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts
> b/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts
> index 0397bf66b2e7..cef81671f3ab 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts
> @@ -53,7 +53,7 @@
>
>         leds {
>                 compatible =3D "gpio-leds";
> -               heartbeat_led {
> +               heartbeat-led {
>                         label =3D "heartbeat";
>                         gpios =3D <&gpio 23 GPIO_ACTIVE_HIGH>;
>                         linux,default-trigger =3D "heartbeat";
> @@ -139,25 +139,25 @@
>                  * 7, 10 - 17 - not connected
>                  */
>
> -               gtr_sel0 {
> +               gtr-sel0 {
>                         gpio-hog;
>                         gpios =3D <0 0>;
>                         output-low; /* PCIE =3D 0, DP =3D 1 */
>                         line-name =3D "sel0";
>                 };
> -               gtr_sel1 {
> +               gtr-sel1 {
>                         gpio-hog;
>                         gpios =3D <1 0>;
>                         output-high; /* PCIE =3D 0, DP =3D 1 */
>                         line-name =3D "sel1";
>                 };
> -               gtr_sel2 {
> +               gtr-sel2 {
>                         gpio-hog;
>                         gpios =3D <2 0>;
>                         output-high; /* PCIE =3D 0, USB0 =3D 1 */
>                         line-name =3D "sel2";
>                 };
> -               gtr_sel3 {
> +               gtr-sel3 {
>                         gpio-hog;
>                         gpios =3D <3 0>;
>                         output-high; /* PCIE =3D 0, SATA =3D 1 */
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts
> b/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts
> index 7238f022a671..94cf5094df64 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dts
> @@ -53,7 +53,7 @@
>
>         leds {
>                 compatible =3D "gpio-leds";
> -               heartbeat_led {
> +               heartbeat-led {
>                         label =3D "heartbeat";
>                         gpios =3D <&gpio 23 GPIO_ACTIVE_HIGH>;
>                         linux,default-trigger =3D "heartbeat";
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts
> b/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts
> index fa055e718d4b..460adc378295 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts
> @@ -53,7 +53,7 @@
>
>         leds {
>                 compatible =3D "gpio-leds";
> -               heartbeat_led {
> +               heartbeat-led {
>                         label =3D "heartbeat";
>                         gpios =3D <&gpio 23 GPIO_ACTIVE_HIGH>;
>                         linux,default-trigger =3D "heartbeat";
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> index ae3c1b929648..fa4fd777d90e 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> @@ -71,7 +71,7 @@
>                 };
>         };
>
> -       cpu_opp_table: cpu_opp_table {
> +       cpu_opp_table: cpu-opp-table {
>                 compatible =3D "operating-points-v2";
>                 opp-shared;
>                 opp00 {
> @@ -124,7 +124,7 @@
>                              <1 10 0xf08>;
>         };
>
> -       amba_apu: amba_apu@0 {
> +       amba_apu: amba-apu@0 {
>                 compatible =3D "simple-bus";
>                 #address-cells =3D <2>;
>                 #size-cells =3D <1>;
> --
> 1.9.1
>
>
Applied.

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform

--000000000000a47098057ac3c2e8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGJyPjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGRpdiBkaXI9
Imx0ciI+xI10IDguIDExLiAyMDE4IHbCoDE0OjQzIG9kZXPDrWxhdGVsIE1pY2hhbCBTaW1layAm
bHQ7PGEgaHJlZj0ibWFpbHRvOm1pY2hhbC5zaW1la0B4aWxpbnguY29tIj5taWNoYWwuc2ltZWtA
eGlsaW54LmNvbTwvYT4mZ3Q7IG5hcHNhbDo8YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9Imdt
YWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mg
c29saWQ7cGFkZGluZy1sZWZ0OjFleCI+cy9fLy0vIGZvciBub2RlIG5hbWVzLjxicj4NCjxicj4N
Ckl0IGZpeGVzIHdhcm5pbmdzIGxpa2UgdGhpczo8YnI+DQouLi4gV2FybmluZyAobm9kZV9uYW1l
X2NoYXJzX3N0cmljdCk6IC9jcHVfb3BwX3RhYmxlOjxicj4NCkNoYXJhY3RlciAmIzM5O18mIzM5
OyBub3QgcmVjb21tZW5kZWQgaW4gbm9kZSBuYW1lIC4uLjxicj4NCjxicj4NCklzc3VlcyByZXBv
cnRlZCBieSBtYWtlIGR0YnMgVz0xMjxicj4NCjxicj4NClNpZ25lZC1vZmYtYnk6IE1pY2hhbCBT
aW1layAmbHQ7PGEgaHJlZj0ibWFpbHRvOm1pY2hhbC5zaW1la0B4aWxpbnguY29tIiB0YXJnZXQ9
Il9ibGFuayI+bWljaGFsLnNpbWVrQHhpbGlueC5jb208L2E+Jmd0Ozxicj4NCi0tLTxicj4NCjxi
cj4NCmRyX21vZGUgcHJvcGVydHkgaXMgYWxzbyByZXBvcnRlZCBidXQgaXQgaXMgbm90IGZpeGVk
IGJlY2F1c2UgY29kZSBuZWVkczxicj4NCnRvIGZpeGVkIGZpcnN0Ljxicj4NCjxicj4NCi0tLTxi
cj4NCsKgYXJjaC9hcm02NC9ib290L2R0cy94aWxpbngvenlucW1wLWNsay5kdHNpwqAgwqAgwqAg
wqAgfMKgIDQgKystLTxicj4NCsKgYXJjaC9hcm02NC9ib290L2R0cy94aWxpbngvenlucW1wLXpj
dTEwMC1yZXZDLmR0cyB8wqAgNCArKy0tPGJyPg0KwqBhcmNoL2FybTY0L2Jvb3QvZHRzL3hpbGlu
eC96eW5xbXAtemN1MTAyLXJldkEuZHRzIHwgMTAgKysrKystLS0tLTxicj4NCsKgYXJjaC9hcm02
NC9ib290L2R0cy94aWxpbngvenlucW1wLXpjdTEwNi1yZXZBLmR0cyB8wqAgMiArLTxicj4NCsKg
YXJjaC9hcm02NC9ib290L2R0cy94aWxpbngvenlucW1wLXpjdTExMS1yZXZBLmR0cyB8wqAgMiAr
LTxicj4NCsKgYXJjaC9hcm02NC9ib290L2R0cy94aWxpbngvenlucW1wLmR0c2nCoCDCoCDCoCDC
oCDCoCDCoCB8wqAgNCArKy0tPGJyPg0KwqA2IGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMo
KyksIDEzIGRlbGV0aW9ucygtKTxicj4NCjxicj4NCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jv
b3QvZHRzL3hpbGlueC96eW5xbXAtY2xrLmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3hpbGlu
eC96eW5xbXAtY2xrLmR0c2k8YnI+DQppbmRleCA5YzA5YmFjYTdkZDcuLjMwNmFkMjE1N2M5OCAx
MDA2NDQ8YnI+DQotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3hpbGlueC96eW5xbXAtY2xrLmR0
c2k8YnI+DQorKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3hpbGlueC96eW5xbXAtY2xrLmR0c2k8
YnI+DQpAQCAtNTgsMTMgKzU4LDEzIEBAPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgY2xv
Y2stYWNjdXJhY3kgPSAmbHQ7MTAwJmd0Ozs8YnI+DQrCoCDCoCDCoCDCoCB9Ozxicj4NCjxicj4N
Ci3CoCDCoCDCoCDCoGRwZG1hX2NsazogZHBkbWFfY2xrIHs8YnI+DQorwqAgwqAgwqAgwqBkcGRt
YV9jbGs6IGRwZG1hLWNsayB7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgY29tcGF0aWJs
ZSA9ICZxdW90O2ZpeGVkLWNsb2NrJnF1b3Q7Ozxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
ICNjbG9jay1jZWxscyA9ICZsdDsweDAmZ3Q7Ozxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IGNsb2NrLWZyZXF1ZW5jeSA9ICZsdDs1MzMwMDAwMDAmZ3Q7Ozxicj4NCsKgIMKgIMKgIMKgIH07
PGJyPg0KPGJyPg0KLcKgIMKgIMKgIMKgZHJtX2Nsb2NrOiBkcm1fY2xvY2sgezxicj4NCivCoCDC
oCDCoCDCoGRybV9jbG9jazogZHJtLWNsb2NrIHs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCBjb21wYXRpYmxlID0gJnF1b3Q7Zml4ZWQtY2xvY2smcXVvdDs7PGJyPg0KwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgI2Nsb2NrLWNlbGxzID0gJmx0OzB4MCZndDs7PGJyPg0KwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgY2xvY2stZnJlcXVlbmN5ID0gJmx0OzI2Mjc1MDAwMCZndDs7PGJyPg0KZGlm
ZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMveGlsaW54L3p5bnFtcC16Y3UxMDAtcmV2Qy5k
dHMgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3hpbGlueC96eW5xbXAtemN1MTAwLXJldkMuZHRzPGJy
Pg0KaW5kZXggNTI3YjRkMGY4OGUyLi4xM2EwYTAyOGRmOTggMTAwNjQ0PGJyPg0KLS0tIGEvYXJj
aC9hcm02NC9ib290L2R0cy94aWxpbngvenlucW1wLXpjdTEwMC1yZXZDLmR0czxicj4NCisrKyBi
L2FyY2gvYXJtNjQvYm9vdC9kdHMveGlsaW54L3p5bnFtcC16Y3UxMDAtcmV2Qy5kdHM8YnI+DQpA
QCAtODIsNyArODIsNyBAQDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IGxpbnV4LGRlZmF1bHQtdHJpZ2dlciA9ICZxdW90O2JsdWV0b290aC1wb3dlciZxdW90Ozs8YnI+
DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB9Ozxicj4NCjxicj4NCi3CoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoHZidXNfZGV0IHsgLyogVTUgVVNCNTc0NCBWQlVTIGRldGVjdGlvbiB2aWEgTUlPMjUg
Ki88YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB2YnVzLWRldCB7IC8qIFU1IFVTQjU3NDQg
VkJVUyBkZXRlY3Rpb24gdmlhIE1JTzI1ICovPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgbGFiZWwgPSAmcXVvdDt2YnVzX2RldCZxdW90Ozs8YnI+DQrCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBncGlvcyA9ICZsdDsmYW1wO2dwaW8gMjUgR1BJT19B
Q1RJVkVfSElHSCZndDs7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
ZGVmYXVsdC1zdGF0ZSA9ICZxdW90O29uJnF1b3Q7Ozxicj4NCkBAIC05OCw3ICs5OCw3IEBAPGJy
Pg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmVndWxhdG9yLWJvb3Qtb247PGJyPg0KwqAgwqAg
wqAgwqAgfTs8YnI+DQo8YnI+DQotwqAgwqAgwqAgwqBzZGlvX3B3cnNlcTogc2Rpb19wd3JzZXEg
ezxicj4NCivCoCDCoCDCoCDCoHNkaW9fcHdyc2VxOiBzZGlvLXB3cnNlcSB7PGJyPg0KwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgY29tcGF0aWJsZSA9ICZxdW90O21tYy1wd3JzZXEtc2ltcGxlJnF1
b3Q7Ozxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJlc2V0LWdwaW9zID0gJmx0OyZhbXA7
Z3BpbyA3IEdQSU9fQUNUSVZFX0xPVyZndDs7IC8qIFdJRklfRU4gKi88YnI+DQrCoCDCoCDCoCDC
oCB9Ozxicj4NCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3hpbGlueC96eW5xbXAt
emN1MTAyLXJldkEuZHRzIGIvYXJjaC9hcm02NC9ib290L2R0cy94aWxpbngvenlucW1wLXpjdTEw
Mi1yZXZBLmR0czxicj4NCmluZGV4IDAzOTdiZjY2YjJlNy4uY2VmODE2NzFmM2FiIDEwMDY0NDxi
cj4NCi0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMveGlsaW54L3p5bnFtcC16Y3UxMDItcmV2QS5k
dHM8YnI+DQorKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3hpbGlueC96eW5xbXAtemN1MTAyLXJl
dkEuZHRzPGJyPg0KQEAgLTUzLDcgKzUzLDcgQEA8YnI+DQo8YnI+DQrCoCDCoCDCoCDCoCBsZWRz
IHs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBjb21wYXRpYmxlID0gJnF1b3Q7Z3Bpby1s
ZWRzJnF1b3Q7Ozxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGhlYXJ0YmVhdF9sZWQgezxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGhlYXJ0YmVhdC1sZWQgezxicj4NCsKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGxhYmVsID0gJnF1b3Q7aGVhcnRiZWF0JnF1b3Q7
Ozxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGdwaW9zID0gJmx0OyZh
bXA7Z3BpbyAyMyBHUElPX0FDVElWRV9ISUdIJmd0Ozs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCBsaW51eCxkZWZhdWx0LXRyaWdnZXIgPSAmcXVvdDtoZWFydGJlYXQm
cXVvdDs7PGJyPg0KQEAgLTEzOSwyNSArMTM5LDI1IEBAPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAqIDcsIDEwIC0gMTcgLSBub3QgY29ubmVjdGVkPGJyPg0KwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAqLzxicj4NCjxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGd0cl9zZWww
IHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBndHItc2VsMCB7PGJyPg0KwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZ3Bpby1ob2c7PGJyPg0KwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgZ3Bpb3MgPSAmbHQ7MCAwJmd0Ozs8YnI+DQrCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBvdXRwdXQtbG93OyAvKiBQQ0lFID0gMCwgRFAgPSAx
ICovPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgbGluZS1uYW1lID0g
JnF1b3Q7c2VsMCZxdW90Ozs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB9Ozxicj4NCi3C
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGd0cl9zZWwxIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBndHItc2VsMSB7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
Z3Bpby1ob2c7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZ3Bpb3Mg
PSAmbHQ7MSAwJmd0Ozs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBv
dXRwdXQtaGlnaDsgLyogUENJRSA9IDAsIERQID0gMSAqLzxicj4NCsKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIGxpbmUtbmFtZSA9ICZxdW90O3NlbDEmcXVvdDs7PGJyPg0KwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgfTs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBndHJf
c2VsMiB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ3RyLXNlbDIgezxicj4NCsKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGdwaW8taG9nOzxicj4NCsKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGdwaW9zID0gJmx0OzIgMCZndDs7PGJyPg0KwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgb3V0cHV0LWhpZ2g7IC8qIFBDSUUgPSAwLCBV
U0IwID0gMSAqLzxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGxpbmUt
bmFtZSA9ICZxdW90O3NlbDImcXVvdDs7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfTs8
YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBndHJfc2VsMyB7PGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgZ3RyLXNlbDMgezxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIGdwaW8taG9nOzxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IGdwaW9zID0gJmx0OzMgMCZndDs7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgb3V0cHV0LWhpZ2g7IC8qIFBDSUUgPSAwLCBTQVRBID0gMSAqLzxicj4NCmRpZmYgLS1n
aXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3hpbGlueC96eW5xbXAtemN1MTA2LXJldkEuZHRzIGIv
YXJjaC9hcm02NC9ib290L2R0cy94aWxpbngvenlucW1wLXpjdTEwNi1yZXZBLmR0czxicj4NCmlu
ZGV4IDcyMzhmMDIyYTY3MS4uOTRjZjUwOTRkZjY0IDEwMDY0NDxicj4NCi0tLSBhL2FyY2gvYXJt
NjQvYm9vdC9kdHMveGlsaW54L3p5bnFtcC16Y3UxMDYtcmV2QS5kdHM8YnI+DQorKysgYi9hcmNo
L2FybTY0L2Jvb3QvZHRzL3hpbGlueC96eW5xbXAtemN1MTA2LXJldkEuZHRzPGJyPg0KQEAgLTUz
LDcgKzUzLDcgQEA8YnI+DQo8YnI+DQrCoCDCoCDCoCDCoCBsZWRzIHs8YnI+DQrCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCBjb21wYXRpYmxlID0gJnF1b3Q7Z3Bpby1sZWRzJnF1b3Q7Ozxicj4NCi3C
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGhlYXJ0YmVhdF9sZWQgezxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGhlYXJ0YmVhdC1sZWQgezxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIGxhYmVsID0gJnF1b3Q7aGVhcnRiZWF0JnF1b3Q7Ozxicj4NCsKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGdwaW9zID0gJmx0OyZhbXA7Z3BpbyAyMyBHUElPX0FD
VElWRV9ISUdIJmd0Ozs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBs
aW51eCxkZWZhdWx0LXRyaWdnZXIgPSAmcXVvdDtoZWFydGJlYXQmcXVvdDs7PGJyPg0KZGlmZiAt
LWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMveGlsaW54L3p5bnFtcC16Y3UxMTEtcmV2QS5kdHMg
Yi9hcmNoL2FybTY0L2Jvb3QvZHRzL3hpbGlueC96eW5xbXAtemN1MTExLXJldkEuZHRzPGJyPg0K
aW5kZXggZmEwNTVlNzE4ZDRiLi40NjBhZGMzNzgyOTUgMTAwNjQ0PGJyPg0KLS0tIGEvYXJjaC9h
cm02NC9ib290L2R0cy94aWxpbngvenlucW1wLXpjdTExMS1yZXZBLmR0czxicj4NCisrKyBiL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMveGlsaW54L3p5bnFtcC16Y3UxMTEtcmV2QS5kdHM8YnI+DQpAQCAt
NTMsNyArNTMsNyBAQDxicj4NCjxicj4NCsKgIMKgIMKgIMKgIGxlZHMgezxicj4NCsKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIGNvbXBhdGlibGUgPSAmcXVvdDtncGlvLWxlZHMmcXVvdDs7PGJyPg0K
LcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaGVhcnRiZWF0X2xlZCB7PGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgaGVhcnRiZWF0LWxlZCB7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgbGFiZWwgPSAmcXVvdDtoZWFydGJlYXQmcXVvdDs7PGJyPg0KwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZ3Bpb3MgPSAmbHQ7JmFtcDtncGlvIDIzIEdQSU9f
QUNUSVZFX0hJR0gmZ3Q7Ozxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IGxpbnV4LGRlZmF1bHQtdHJpZ2dlciA9ICZxdW90O2hlYXJ0YmVhdCZxdW90Ozs8YnI+DQpkaWZm
IC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy94aWxpbngvenlucW1wLmR0c2kgYi9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL3hpbGlueC96eW5xbXAuZHRzaTxicj4NCmluZGV4IGFlM2MxYjkyOTY0OC4u
ZmE0ZmQ3NzdkOTBlIDEwMDY0NDxicj4NCi0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMveGlsaW54
L3p5bnFtcC5kdHNpPGJyPg0KKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy94aWxpbngvenlucW1w
LmR0c2k8YnI+DQpAQCAtNzEsNyArNzEsNyBAQDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IH07PGJyPg0KwqAgwqAgwqAgwqAgfTs8YnI+DQo8YnI+DQotwqAgwqAgwqAgwqBjcHVfb3BwX3Rh
YmxlOiBjcHVfb3BwX3RhYmxlIHs8YnI+DQorwqAgwqAgwqAgwqBjcHVfb3BwX3RhYmxlOiBjcHUt
b3BwLXRhYmxlIHs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBjb21wYXRpYmxlID0gJnF1
b3Q7b3BlcmF0aW5nLXBvaW50cy12MiZxdW90Ozs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCBvcHAtc2hhcmVkOzxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIG9wcDAwIHs8YnI+DQpA
QCAtMTI0LDcgKzEyNCw3IEBAPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAmbHQ7MSAxMCAweGYwOCZndDs7PGJyPg0KwqAgwqAgwqAgwqAgfTs8YnI+DQo8
YnI+DQotwqAgwqAgwqAgwqBhbWJhX2FwdTogYW1iYV9hcHVAMCB7PGJyPg0KK8KgIMKgIMKgIMKg
YW1iYV9hcHU6IGFtYmEtYXB1QDAgezxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGNvbXBh
dGlibGUgPSAmcXVvdDtzaW1wbGUtYnVzJnF1b3Q7Ozxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgICNhZGRyZXNzLWNlbGxzID0gJmx0OzImZ3Q7Ozxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgICNzaXplLWNlbGxzID0gJmx0OzEmZ3Q7Ozxicj4NCi0tIDxicj4NCjEuOS4xPGJyPg0KPGJy
Pg0KPC9ibG9ja3F1b3RlPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+QXBwbGllZC48L2Rpdj48
ZGl2Pjxicj48L2Rpdj48ZGl2PlRoYW5rcyw8L2Rpdj48ZGl2Pk1pY2hhbDxicj48L2Rpdj48YnI+
LS0gPGJyPjxkaXYgZGlyPSJsdHIiIGNsYXNzPSJnbWFpbF9zaWduYXR1cmUiIGRhdGEtc21hcnRt
YWlsPSJnbWFpbF9zaWduYXR1cmUiPk1pY2hhbCBTaW1laywgSW5nLiAoTS5FbmcpLCBPcGVuUEdQ
IC0mZ3Q7IEtleUlEOiBGRTNEMUY5MTxicj53OiA8YSBocmVmPSJodHRwOi8vd3d3Lm1vbnN0ci5l
dSIgdGFyZ2V0PSJfYmxhbmsiPnd3dy5tb25zdHIuZXU8L2E+IHA6ICs0Mi0wLTcyMTg0Mjg1NDxi
cj5NYWludGFpbmVyIG9mIExpbnV4IGtlcm5lbCAtIE1pY3JvYmxhemUgY3B1IC0gPGEgaHJlZj0i
aHR0cDovL3d3dy5tb25zdHIuZXUvZmR0LyIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly93d3cubW9u
c3RyLmV1L2ZkdC88L2E+PGJyPk1haW50YWluZXIgb2YgTGludXgga2VybmVsIC0gWGlsaW54IFp5
bnEgQVJNIGFyY2hpdGVjdHVyZTxicj5NaWNyb2JsYXplIFUtQk9PVCBjdXN0b2RpYW4gYW5kIHJl
c3BvbnNpYmxlIGZvciB1LWJvb3QgYXJtIHp5bnEgcGxhdGZvcm08L2Rpdj48L2Rpdj4NCg==
--000000000000a47098057ac3c2e8--
