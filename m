Return-Path: <SRS0=20hm=XR=linaro.org=baoyou.xie@kernel.org>
MIME-Version: 1.0
In-Reply-To: <1480657956-8140-1-git-send-email-baoyou.xie@linaro.org>
References: <1480657956-8140-1-git-send-email-baoyou.xie@linaro.org>
From: Baoyou Xie <baoyou.xie@linaro.org>
Date: Fri, 2 Dec 2016 13:58:29 +0800
Message-ID: <CA+DQWkzGOzn1TRa9041Jjksj-=509XWXS_U1uaaJXNydB8Apow@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: zx: support cpu-freq for zx296718
Content-Type: multipart/alternative; boundary=94eb2c0bdd6e99e1320542a6a042
To: Rob Herring <robh+dt@kernel.org>, mark.rutland@arm.com, catalin.marinas@arm.com, Will Deacon <will.deacon@arm.com>, Shawn Guo <shawnguo@kernel.org>, Jun Nie <jun.nie@linaro.org>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Baoyou Xie <baoyou.xie@linaro.org>, "xie.baoyou" <xie.baoyou@zte.com.cn>, chen.chaokai@zte.com.cn, wang.qiang01@zte.com.cn
List-ID: <devicetree@vger.kernel.org>

--94eb2c0bdd6e99e1320542a6a042
Content-Type: text/plain; charset=UTF-8

+ Viresh, the author of the bindings.

On 2 December 2016 at 13:52, Baoyou Xie <baoyou.xie@linaro.org> wrote:

> This patch adds the CPU clock phandle in CPU's node
> and uses operating-points-v2 to register operating points.
>
> So it can be used by cpufreq-dt driver.
>
> Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
> ---
>  arch/arm64/boot/dts/zte/zx296718.dtsi | 39 ++++++++++++++++++++++++++++++
> +++++
>  1 file changed, 39 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/zte/zx296718.dtsi
> b/arch/arm64/boot/dts/zte/zx296718.dtsi
> index 7a1aed7..b44d1d1 100644
> --- a/arch/arm64/boot/dts/zte/zx296718.dtsi
> +++ b/arch/arm64/boot/dts/zte/zx296718.dtsi
> @@ -44,6 +44,7 @@
>  #include <dt-bindings/input/input.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/clock/zx296718-clock.h>
>
>  / {
>         compatible = "zte,zx296718";
> @@ -81,6 +82,8 @@
>                         compatible = "arm,cortex-a53","arm,armv8";
>                         reg = <0x0 0x0>;
>                         enable-method = "psci";
> +                       clocks = <&topcrm A53_GATE>;
> +                       operating-points-v2 = <&cluster0_opp>;
>                 };
>
>                 cpu1: cpu@1 {
> @@ -88,6 +91,8 @@
>                         compatible = "arm,cortex-a53","arm,armv8";
>                         reg = <0x0 0x1>;
>                         enable-method = "psci";
> +                       clocks = <&topcrm A53_GATE>;
> +                       operating-points-v2 = <&cluster0_opp>;
>                 };
>
>                 cpu2: cpu@2 {
> @@ -95,6 +100,8 @@
>                         compatible = "arm,cortex-a53","arm,armv8";
>                         reg = <0x0 0x2>;
>                         enable-method = "psci";
> +                       clocks = <&topcrm A53_GATE>;
> +                       operating-points-v2 = <&cluster0_opp>;
>                 };
>
>                 cpu3: cpu@3 {
> @@ -102,6 +109,38 @@
>                         compatible = "arm,cortex-a53","arm,armv8";
>                         reg = <0x0 0x3>;
>                         enable-method = "psci";
> +                       clocks = <&topcrm A53_GATE>;
> +                       operating-points-v2 = <&cluster0_opp>;
> +               };
> +       };
> +
> +       cluster0_opp: opp-table0 {
> +               compatible = "operating-points-v2";
> +               opp-shared;
> +
> +               opp@500000000 {
> +                       opp-hz = /bits/ 64 <500000000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp@648000000 {
> +                       opp-hz = /bits/ 64 <648000000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp@800000000 {
> +                       opp-hz = /bits/ 64 <800000000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp@1000000000 {
> +                       opp-hz = /bits/ 64 <1000000000>;
> +                       clock-latency-ns = <500000>;
> +               };
> +
> +               opp@1188000000 {
> +                       opp-hz = /bits/ 64 <1188000000>;
> +                       clock-latency-ns = <500000>;
>                 };
>         };
>
> --
> 2.7.4
>
>

--94eb2c0bdd6e99e1320542a6a042
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+KyBWaXJlc2gsIHRoZSBhdXRob3Igb2YgdGhlIGJpbmRpbmdzLjxkaXYg
Y2xhc3M9ImdtYWlsX2V4dHJhIj48YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPk9uIDIgRGVj
ZW1iZXIgMjAxNiBhdCAxMzo1MiwgQmFveW91IFhpZSA8c3BhbiBkaXI9Imx0ciI+Jmx0OzxhIGhy
ZWY9Im1haWx0bzpiYW95b3UueGllQGxpbmFyby5vcmciIHRhcmdldD0iX2JsYW5rIj5iYW95b3Uu
eGllQGxpbmFyby5vcmc8L2E+Jmd0Ozwvc3Bhbj4gd3JvdGU6PGJyPjxibG9ja3F1b3RlIGNsYXNz
PSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVm
dDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij5UaGlzIHBhdGNo
IGFkZHMgdGhlIENQVSBjbG9jayBwaGFuZGxlIGluIENQVSYjMzk7cyBub2RlPGJyPg0KYW5kIHVz
ZXMgb3BlcmF0aW5nLXBvaW50cy12MiB0byByZWdpc3RlciBvcGVyYXRpbmcgcG9pbnRzLjxicj4N
Cjxicj4NClNvIGl0IGNhbiBiZSB1c2VkIGJ5IGNwdWZyZXEtZHQgZHJpdmVyLjxicj4NCjxicj4N
ClNpZ25lZC1vZmYtYnk6IEJhb3lvdSBYaWUgJmx0OzxhIGhyZWY9Im1haWx0bzpiYW95b3UueGll
QGxpbmFyby5vcmciIHRhcmdldD0iX2JsYW5rIj5iYW95b3UueGllQGxpbmFyby5vcmc8L2E+Jmd0
Ozxicj4NCi0tLTxicj4NCsKgYXJjaC9hcm02NC9ib290L2R0cy96dGUvengyOTY8d2JyPjcxOC5k
dHNpIHwgMzkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrPHdicj4rKysrKzxicj4NCsKg
MSBmaWxlIGNoYW5nZWQsIDM5IGluc2VydGlvbnMoKyk8YnI+DQo8YnI+DQpkaWZmIC0tZ2l0IGEv
YXJjaC9hcm02NC9ib290L2R0cy96dGUvengyOTx3YnI+NjcxOC5kdHNpIGIvYXJjaC9hcm02NC9i
b290L2R0cy96dGUvengyOTx3YnI+NjcxOC5kdHNpPGJyPg0KaW5kZXggN2ExYWVkNy4uYjQ0ZDFk
MSAxMDA2NDQ8YnI+DQotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3p0ZS96eDI5PHdicj42NzE4
LmR0c2k8YnI+DQorKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3p0ZS96eDI5PHdicj42NzE4LmR0
c2k8YnI+DQpAQCAtNDQsNiArNDQsNyBAQDxicj4NCsKgI2luY2x1ZGUgJmx0O2R0LWJpbmRpbmdz
L2lucHV0L2lucHV0LmgmZ3Q7PGJyPg0KwqAjaW5jbHVkZSAmbHQ7ZHQtYmluZGluZ3MvaW50ZXJy
dXB0LWNvbnRyb2w8d2JyPmxlci9hcm0tZ2ljLmgmZ3Q7PGJyPg0KwqAjaW5jbHVkZSAmbHQ7ZHQt
YmluZGluZ3MvZ3Bpby9ncGlvLmgmZ3Q7PGJyPg0KKyNpbmNsdWRlICZsdDtkdC1iaW5kaW5ncy9j
bG9jay96eDI5NjcxOC1jbDx3YnI+b2NrLmgmZ3Q7PGJyPg0KPGJyPg0KwqAvIHs8YnI+DQrCoCDC
oCDCoCDCoCBjb21wYXRpYmxlID0gJnF1b3Q7enRlLHp4Mjk2NzE4JnF1b3Q7Ozxicj4NCkBAIC04
MSw2ICs4Miw4IEBAPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgY29t
cGF0aWJsZSA9ICZxdW90O2FybSxjb3J0ZXgtYTUzJnF1b3Q7LCZxdW90O2FybSxhcm12OCZxdW90
Ozs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCByZWcgPSAmbHQ7MHgw
IDB4MCZndDs7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZW5hYmxl
LW1ldGhvZCA9ICZxdW90O3BzY2kmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgY2xvY2tzID0gJmx0OyZhbXA7dG9wY3JtIEE1M19HQVRFJmd0Ozs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBvcGVyYXRpbmctcG9pbnRzLXYyID0g
Jmx0OyZhbXA7Y2x1c3RlcjBfb3BwJmd0Ozs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB9
Ozxicj4NCjxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGNwdTE6IGNwdUAxIHs8YnI+DQpA
QCAtODgsNiArOTEsOCBAQDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IGNvbXBhdGlibGUgPSAmcXVvdDthcm0sY29ydGV4LWE1MyZxdW90OywmcXVvdDthcm0sYXJtdjgm
cXVvdDs7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmVnID0gJmx0
OzB4MCAweDEmZ3Q7Ozxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGVu
YWJsZS1tZXRob2QgPSAmcXVvdDtwc2NpJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGNsb2NrcyA9ICZsdDsmYW1wO3RvcGNybSBBNTNfR0FURSZndDs7PGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgb3BlcmF0aW5nLXBvaW50cy12
MiA9ICZsdDsmYW1wO2NsdXN0ZXIwX29wcCZndDs7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgfTs8YnI+DQo8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBjcHUyOiBjcHVAMiB7PGJy
Pg0KQEAgLTk1LDYgKzEwMCw4IEBAPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgY29tcGF0aWJsZSA9ICZxdW90O2FybSxjb3J0ZXgtYTUzJnF1b3Q7LCZxdW90O2FybSxh
cm12OCZxdW90Ozs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCByZWcg
PSAmbHQ7MHgwIDB4MiZndDs7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgZW5hYmxlLW1ldGhvZCA9ICZxdW90O3BzY2kmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xvY2tzID0gJmx0OyZhbXA7dG9wY3JtIEE1M19HQVRFJmd0
Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBvcGVyYXRpbmctcG9p
bnRzLXYyID0gJmx0OyZhbXA7Y2x1c3RlcjBfb3BwJmd0Ozs8YnI+DQrCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCB9Ozxicj4NCjxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGNwdTM6IGNwdUAz
IHs8YnI+DQpAQCAtMTAyLDYgKzEwOSwzOCBAQDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIGNvbXBhdGlibGUgPSAmcXVvdDthcm0sY29ydGV4LWE1MyZxdW90OywmcXVv
dDthcm0sYXJtdjgmcXVvdDs7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgcmVnID0gJmx0OzB4MCAweDMmZ3Q7Ozxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIGVuYWJsZS1tZXRob2QgPSAmcXVvdDtwc2NpJnF1b3Q7Ozxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2NrcyA9ICZsdDsmYW1wO3RvcGNybSBBNTNf
R0FURSZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgb3BlcmF0
aW5nLXBvaW50cy12MiA9ICZsdDsmYW1wO2NsdXN0ZXIwX29wcCZndDs7PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgfTs8YnI+DQorwqAgwqAgwqAgwqB9Ozxicj4NCis8YnI+DQorwqAgwqAg
wqAgwqBjbHVzdGVyMF9vcHA6IG9wcC10YWJsZTAgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGNvbXBhdGlibGUgPSAmcXVvdDtvcGVyYXRpbmctcG9pbnRzLXYyJnF1b3Q7Ozxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoG9wcC1zaGFyZWQ7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoG9wcEA1MDAwMDAwMDAgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoG9wcC1oeiA9IC9iaXRzLyA2NCAmbHQ7NTAwMDAwMDAwJmd0Ozs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjbG9jay1sYXRlbmN5LW5zID0gJmx0
OzUwMDAwMCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgb3BwQDY0ODAwMDAwMCB7PGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgb3BwLWh6ID0gL2JpdHMvIDY0ICZsdDs2NDgwMDAwMDAm
Z3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2NrLWxhdGVu
Y3ktbnMgPSAmbHQ7NTAwMDAwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxi
cj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBvcHBAODAwMDAwMDAwIHs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBvcHAtaHogPSAvYml0cy8gNjQgJmx0
OzgwMDAwMDAwMCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
Y2xvY2stbGF0ZW5jeS1ucyA9ICZsdDs1MDAwMDAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG9wcEAxMDAwMDAw
MDAwIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBvcHAtaHogPSAv
Yml0cy8gNjQgJmx0OzEwMDAwMDAwMDAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoGNsb2NrLWxhdGVuY3ktbnMgPSAmbHQ7NTAwMDAwJmd0Ozs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBvcHBAMTE4ODAwMDAwMCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgb3BwLWh6ID0gL2JpdHMvIDY0ICZsdDsxMTg4MDAwMDAwJmd0Ozs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjbG9jay1sYXRlbmN5LW5zID0gJmx0OzUwMDAwMCZn
dDs7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfTs8YnI+DQrCoCDCoCDCoCDCoCB9Ozxi
cj4NCjxzcGFuIGNsYXNzPSJnbWFpbC1tXy02MDg1NDI0MjA0NTc4NTUyODYySE9FblpiIj48Zm9u
dCBjb2xvcj0iIzg4ODg4OCI+PGJyPg0KLS08YnI+DQoyLjcuNDxicj4NCjxicj4NCjwvZm9udD48
L3NwYW4+PC9ibG9ja3F1b3RlPjwvZGl2Pjxicj48L2Rpdj48L2Rpdj4NCg==
--94eb2c0bdd6e99e1320542a6a042--
