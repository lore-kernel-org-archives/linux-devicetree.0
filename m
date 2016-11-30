Return-Path: <baoyou.xie@linaro.org>
MIME-Version: 1.0
In-Reply-To: <CABymUCPMDqcfKQOtfj6gHWs69sh3HXaErDjE740xq6UQh_DFow@mail.gmail.com>
References: <1480491237-5169-1-git-send-email-baoyou.xie@linaro.org> <CABymUCPMDqcfKQOtfj6gHWs69sh3HXaErDjE740xq6UQh_DFow@mail.gmail.com>
From: Baoyou Xie <baoyou.xie@linaro.org>
Date: Wed, 30 Nov 2016 17:04:39 +0800
Message-ID: <CA+DQWkyBMEiOUteXUGnB3y_DROLJ5iuWanLQzCeG4GFbG1fYPw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: add zx296718's topcrm node
Content-Type: multipart/alternative; boundary=001a114abf4aac7a43054280feb0
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, mark.rutland@arm.com, catalin.marinas@arm.com, Will Deacon <will.deacon@arm.com>, Shawn Guo <shawnguo@kernel.org>, "xie.baoyou" <xie.baoyou@zte.com.cn>, chen.chaokai@zte.com.cn, wang.qiang01@zte.com.cn, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

--001a114abf4aac7a43054280feb0
Content-Type: text/plain; charset=UTF-8

On 30 November 2016 at 16:26, Jun Nie <jun.nie@linaro.org> wrote:

> 2016-11-30 15:33 GMT+08:00 Baoyou Xie <baoyou.xie@linaro.org>:
> > Enable topcrm clock node for zx296718, which is used for
> > CPU's frequency change.
>
> Please follow general rule, such as
> arm64: dts: zx: brief title of your changes
>
> Sounds good, though some patches didn't do so.


> >
> > Furthermore, this patch adds the CPU clock phandle in CPU's node
> > and uses operating-points-v2 to register operating points.
> >
> > So it can be used by cpufreq-dt driver.
>
> Suggest to split clock nodes and cpu-freq nodes changes into different
> patches.
>
> >
> > Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
> > ---
> >  arch/arm64/boot/dts/zte/zx296718.dtsi | 48
> +++++++++++++++++++++++++++++++++++
> >  1 file changed, 48 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/zte/zx296718.dtsi
> b/arch/arm64/boot/dts/zte/zx296718.dtsi
> > index 6b239a3..f9eb37d 100644
> > --- a/arch/arm64/boot/dts/zte/zx296718.dtsi
> > +++ b/arch/arm64/boot/dts/zte/zx296718.dtsi
> > @@ -44,6 +44,7 @@
> >  #include <dt-bindings/input/input.h>
> >  #include <dt-bindings/interrupt-controller/arm-gic.h>
> >  #include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/clock/zx296718-clock.h>
> >
> >  / {
> >         compatible = "zte,zx296718";
> > @@ -81,6 +82,8 @@
> >                         compatible = "arm,cortex-a53","arm,armv8";
> >                         reg = <0x0 0x0>;
> >                         enable-method = "psci";
> > +                       clocks = <&topcrm A53_GATE>;
> > +                       operating-points-v2 = <&cluster0_opp>;
> >                 };
> >
> >                 cpu1: cpu@1 {
> > @@ -88,6 +91,7 @@
> >                         compatible = "arm,cortex-a53","arm,armv8";
> >                         reg = <0x0 0x1>;
> >                         enable-method = "psci";
> > +                       operating-points-v2 = <&cluster0_opp>;
> >                 };
> >
> >                 cpu2: cpu@2 {
> > @@ -95,6 +99,7 @@
> >                         compatible = "arm,cortex-a53","arm,armv8";
> >                         reg = <0x0 0x2>;
> >                         enable-method = "psci";
> > +                       operating-points-v2 = <&cluster0_opp>;
> >                 };
> >
> >                 cpu3: cpu@3 {
> > @@ -102,6 +107,43 @@
> >                         compatible = "arm,cortex-a53","arm,armv8";
> >                         reg = <0x0 0x3>;
> >                         enable-method = "psci";
> > +                       operating-points-v2 = <&cluster0_opp>;
> > +               };
> > +       };
> > +
> > +       cluster0_opp: opp_table0 {
> > +               compatible = "operating-points-v2";
> > +               opp-shared;
> > +
> > +               opp@1000000000 {
> > +                       opp-hz = /bits/ 64 <500000000>;
>
> Why frequency in opp name differ with opp-hz value?
>
> Do we must keep them same? if don't so, just leave it, OK?


> > +                       opp-microvolt = <857000>;
> > +                       clock-latency-ns = <500000>;
> > +               };
> > +               opp@1100000000 {
> > +                       opp-hz = /bits/ 64 <648000000>;
> > +                       opp-microvolt = <857000>;
> > +                       clock-latency-ns = <500000>;
> > +               };
> > +               opp@1200000000 {
> > +                       opp-hz = /bits/ 64 <800000000>;
> > +                       opp-microvolt = <882000>;
> > +                       clock-latency-ns = <500000>;
> > +               };
> > +               opp@1300000000 {
> > +                       opp-hz = /bits/ 64 <1000000000>;
> > +                       opp-microvolt = <892000>;
> > +                       clock-latency-ns = <500000>;
> > +               };
> > +               opp@1400000000 {
> > +                       opp-hz = /bits/ 64 <1188000000>;
> > +                       opp-microvolt = <1009000>;
> > +                       clock-latency-ns = <500000>;
> > +               };
> > +               opp@1500000000 {
> > +                       opp-hz = /bits/ 64 <1312000000>;
> > +                       opp-microvolt = <1052000>;
> > +                       clock-latency-ns = <500000>;
> >                 };
>
> I did not see frequency 1500000000 or 1312000000 in clock drivers for
> A53. Please confirm whether clock driver need update or your need
> revise your patch.
>
> Oh, it's my mistake. In fact, frequency 1500000000 or 1312000000 can be
removed. These two cases are trial, but we don't suggest using them in
products.


> >         };
> >
> > @@ -279,6 +321,12 @@
> >                         dma-requests = <32>;
> >                 };
> >
> > +               topcrm: clock-controller@01461000 {
>
> Removing heading 0 in address of name.
>
> > +                       compatible = "zte,zx296718-topcrm";
> > +                       reg = <0x01461000 0x1000>;
> > +                       #clock-cells = <1>;
> > +               };
> > +
> >                 sysctrl: sysctrl@1463000 {
> >                         compatible = "zte,zx296718-sysctrl", "syscon";
> >                         reg = <0x1463000 0x1000>;
> > --
> > 2.7.4
> >
>

--001a114abf4aac7a43054280feb0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX2V4dHJhIj48YnI+PGRpdiBjbGFz
cz0iZ21haWxfcXVvdGUiPk9uIDMwIE5vdmVtYmVyIDIwMTYgYXQgMTY6MjYsIEp1biBOaWUgPHNw
YW4gZGlyPSJsdHIiPiZsdDs8YSBocmVmPSJtYWlsdG86anVuLm5pZUBsaW5hcm8ub3JnIiB0YXJn
ZXQ9Il9ibGFuayI+anVuLm5pZUBsaW5hcm8ub3JnPC9hPiZndDs8L3NwYW4+IHdyb3RlOjxicj48
YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHgg
MC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0
OjFleCI+PHNwYW4gY2xhc3M9ImdtYWlsLSI+MjAxNi0xMS0zMCAxNTozMyBHTVQrMDg6MDAgQmFv
eW91IFhpZSAmbHQ7PGEgaHJlZj0ibWFpbHRvOmJhb3lvdS54aWVAbGluYXJvLm9yZyI+YmFveW91
LnhpZUBsaW5hcm8ub3JnPC9hPiZndDs6PGJyPg0KJmd0OyBFbmFibGUgdG9wY3JtIGNsb2NrIG5v
ZGUgZm9yIHp4Mjk2NzE4LCB3aGljaCBpcyB1c2VkIGZvcjxicj4NCiZndDsgQ1BVJiMzOTtzIGZy
ZXF1ZW5jeSBjaGFuZ2UuPGJyPg0KPGJyPg0KPC9zcGFuPlBsZWFzZSBmb2xsb3cgZ2VuZXJhbCBy
dWxlLCBzdWNoIGFzPGJyPg0KYXJtNjQ6IGR0czogeng6IGJyaWVmIHRpdGxlIG9mIHlvdXIgY2hh
bmdlczxicj4NCjxzcGFuIGNsYXNzPSJnbWFpbC0iPjxicj48L3NwYW4+PC9ibG9ja3F1b3RlPjxk
aXY+U291bmRzIGdvb2QsIHRob3VnaCBzb21lIHBhdGNoZXMgZGlkbiYjMzk7dCBkbyBzby48YnI+
PC9kaXY+PGRpdj7CoDwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9
Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwy
MDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij48c3BhbiBjbGFzcz0iZ21haWwtIj4NCiZndDs8YnI+
DQomZ3Q7IEZ1cnRoZXJtb3JlLCB0aGlzIHBhdGNoIGFkZHMgdGhlIENQVSBjbG9jayBwaGFuZGxl
IGluIENQVSYjMzk7cyBub2RlPGJyPg0KJmd0OyBhbmQgdXNlcyBvcGVyYXRpbmctcG9pbnRzLXYy
IHRvIHJlZ2lzdGVyIG9wZXJhdGluZyBwb2ludHMuPGJyPg0KJmd0Ozxicj4NCiZndDsgU28gaXQg
Y2FuIGJlIHVzZWQgYnkgY3B1ZnJlcS1kdCBkcml2ZXIuPGJyPg0KPGJyPg0KPC9zcGFuPlN1Z2dl
c3QgdG8gc3BsaXQgY2xvY2sgbm9kZXMgYW5kIGNwdS1mcmVxIG5vZGVzIGNoYW5nZXMgaW50byBk
aWZmZXJlbnQgcGF0Y2hlcy48YnI+DQo8ZGl2PjxkaXYgY2xhc3M9ImdtYWlsLWg1Ij48YnI+DQom
Z3Q7PGJyPg0KJmd0OyBTaWduZWQtb2ZmLWJ5OiBCYW95b3UgWGllICZsdDs8YSBocmVmPSJtYWls
dG86YmFveW91LnhpZUBsaW5hcm8ub3JnIj5iYW95b3UueGllQGxpbmFyby5vcmc8L2E+Jmd0Ozxi
cj4NCiZndDsgLS0tPGJyPg0KJmd0O8KgIGFyY2gvYXJtNjQvYm9vdC9kdHMvenRlLzx3YnI+engy
OTY3MTguZHRzaSB8IDQ4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKzx3YnI+KysrKys8
YnI+DQomZ3Q7wqAgMSBmaWxlIGNoYW5nZWQsIDQ4IGluc2VydGlvbnMoKyk8YnI+DQomZ3Q7PGJy
Pg0KJmd0OyBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy96dGUvPHdicj56eDI5Njcx
OC5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy96dGUvPHdicj56eDI5NjcxOC5kdHNpPGJyPg0K
Jmd0OyBpbmRleCA2YjIzOWEzLi5mOWViMzdkIDEwMDY0NDxicj4NCiZndDsgLS0tIGEvYXJjaC9h
cm02NC9ib290L2R0cy96dGUvPHdicj56eDI5NjcxOC5kdHNpPGJyPg0KJmd0OyArKysgYi9hcmNo
L2FybTY0L2Jvb3QvZHRzL3p0ZS88d2JyPnp4Mjk2NzE4LmR0c2k8YnI+DQomZ3Q7IEBAIC00NCw2
ICs0NCw3IEBAPGJyPg0KJmd0O8KgICNpbmNsdWRlICZsdDtkdC1iaW5kaW5ncy9pbnB1dC9pbnB1
dC5oJmd0Ozxicj4NCiZndDvCoCAjaW5jbHVkZSAmbHQ7ZHQtYmluZGluZ3MvaW50ZXJydXB0LTx3
YnI+Y29udHJvbGxlci9hcm0tZ2ljLmgmZ3Q7PGJyPg0KJmd0O8KgICNpbmNsdWRlICZsdDtkdC1i
aW5kaW5ncy9ncGlvL2dwaW8uaCZndDs8YnI+DQomZ3Q7ICsjaW5jbHVkZSAmbHQ7ZHQtYmluZGlu
Z3MvY2xvY2svengyOTY3MTgtPHdicj5jbG9jay5oJmd0Ozxicj4NCiZndDs8YnI+DQomZ3Q7wqAg
LyB7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O3p0ZSx6eDI5Njcx
OCZxdW90Ozs8YnI+DQomZ3Q7IEBAIC04MSw2ICs4Miw4IEBAPGJyPg0KJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O2FybSxjb3J0ZXgt
YTUzJnF1b3Q7LCZxdW90O2FybSxhcm12OCZxdW90Ozs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgwIDB4MCZndDs7PGJyPg0KJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZW5hYmxlLW1ldGhvZCA9ICZxdW90
O3BzY2kmcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBjbG9ja3MgPSAmbHQ7JmFtcDt0b3Bjcm0gQTUzX0dBVEUmZ3Q7Ozxicj4NCiZndDsgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgb3BlcmF0aW5nLXBvaW50cy12MiA9ICZsdDsm
YW1wO2NsdXN0ZXIwX29wcCZndDs7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
fTs8YnI+DQomZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY3B1MTogY3B1
QDEgezxicj4NCiZndDsgQEAgLTg4LDYgKzkxLDcgQEA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7YXJtLGNvcnRleC1hNTMm
cXVvdDssJnF1b3Q7YXJtLGFybXY4JnF1b3Q7Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDAgMHgxJmd0Ozs8YnI+DQomZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBlbmFibGUtbWV0aG9kID0gJnF1b3Q7cHNj
aSZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG9w
ZXJhdGluZy1wb2ludHMtdjIgPSAmbHQ7JmFtcDtjbHVzdGVyMF9vcHAmZ3Q7Ozxicj4NCiZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGNwdTI6IGNwdUAyIHs8YnI+DQomZ3Q7IEBAIC05NSw2ICs5OSw3IEBA
PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJs
ZSA9ICZxdW90O2FybSxjb3J0ZXgtYTUzJnF1b3Q7LCZxdW90O2FybSxhcm12OCZxdW90Ozs8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgw
IDB4MiZndDs7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
ZW5hYmxlLW1ldGhvZCA9ICZxdW90O3BzY2kmcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBvcGVyYXRpbmctcG9pbnRzLXYyID0gJmx0OyZhbXA7Y2x1
c3RlcjBfb3BwJmd0Ozs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4N
CiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjcHUzOiBjcHVAMyB7PGJy
Pg0KJmd0OyBAQCAtMTAyLDYgKzEwNyw0MyBAQDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDthcm0sY29ydGV4LWE1MyZxdW90
OywmcXVvdDthcm0sYXJtdjgmcXVvdDs7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4MCAweDMmZ3Q7Ozxicj4NCiZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGVuYWJsZS1tZXRob2QgPSAmcXVvdDtwc2NpJnF1
b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgb3BlcmF0
aW5nLXBvaW50cy12MiA9ICZsdDsmYW1wO2NsdXN0ZXIwX29wcCZndDs7PGJyPg0KJmd0OyArwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7
ICs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoGNsdXN0ZXIwX29wcDogb3BwX3RhYmxlMCB7PGJyPg0K
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7b3BlcmF0aW5n
LXBvaW50cy12MiZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG9wcC1z
aGFyZWQ7PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBvcHBA
MTAwMDAwMDAwMCB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBvcHAtaHogPSAvYml0cy8gNjQgJmx0OzUwMDAwMDAwMCZndDs7PGJyPg0KPGJyPg0KPC9kaXY+
PC9kaXY+V2h5IGZyZXF1ZW5jeSBpbiBvcHAgbmFtZSBkaWZmZXIgd2l0aCBvcHAtaHogdmFsdWU/
PGJyPg0KPGRpdj48ZGl2IGNsYXNzPSJnbWFpbC1oNSI+PGJyPjwvZGl2PjwvZGl2PjwvYmxvY2tx
dW90ZT48ZGl2PkRvIHdlIG11c3Qga2VlcCB0aGVtIHNhbWU/IGlmIGRvbiYjMzk7dCBzbywganVz
dCBsZWF2ZSBpdCwgT0s/PGJyPjwvZGl2PjxkaXY+wqA8L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0i
Z21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6
MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+PGRpdj48ZGl2IGNs
YXNzPSJnbWFpbC1oNSI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oG9wcC1taWNyb3ZvbHQgPSAmbHQ7ODU3MDAwJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2NrLWxhdGVuY3ktbnMgPSAmbHQ7NTAwMDAwJmd0Ozs8
YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBvcHBAMTEwMDAwMDAwMCB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBvcHAtaHogPSAvYml0cy8gNjQgJmx0OzY0ODAwMDAwMCZndDs7
PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBvcHAtbWljcm92
b2x0ID0gJmx0Ozg1NzAwMCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBjbG9jay1sYXRlbmN5LW5zID0gJmx0OzUwMDAwMCZndDs7PGJyPg0KJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgb3BwQDEyMDAwMDAwMDAgezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgb3BwLWh6ID0gL2JpdHMvIDY0ICZsdDs4MDAwMDAwMDAmZ3Q7Ozxicj4NCiZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgb3BwLW1pY3Jvdm9sdCA9ICZsdDs4
ODIwMDAmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
Y2xvY2stbGF0ZW5jeS1ucyA9ICZsdDs1MDAwMDAmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG9wcEAxMzAw
MDAwMDAwIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG9w
cC1oeiA9IC9iaXRzLyA2NCAmbHQ7MTAwMDAwMDAwMCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBvcHAtbWljcm92b2x0ID0gJmx0Ozg5MjAwMCZndDs7
PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjbG9jay1sYXRl
bmN5LW5zID0gJmx0OzUwMDAwMCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqB9Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgb3BwQDE0MDAwMDAwMDAgezxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgb3BwLWh6ID0gL2Jp
dHMvIDY0ICZsdDsxMTg4MDAwMDAwJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoG9wcC1taWNyb3ZvbHQgPSAmbHQ7MTAwOTAwMCZndDs7PGJyPg0KJmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjbG9jay1sYXRlbmN5LW5zID0g
Jmx0OzUwMDAwMCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4N
CiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgb3BwQDE1MDAwMDAwMDAgezxicj4NCiZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgb3BwLWh6ID0gL2JpdHMvIDY0ICZs
dDsxMzEyMDAwMDAwJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoG9wcC1taWNyb3ZvbHQgPSAmbHQ7MTA1MjAwMCZndDs7PGJyPg0KJmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjbG9jay1sYXRlbmN5LW5zID0gJmx0OzUwMDAw
MCZndDs7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQo8YnI+DQo8
L2Rpdj48L2Rpdj5JIGRpZCBub3Qgc2VlIGZyZXF1ZW5jeSAxNTAwMDAwMDAwIG9yIDEzMTIwMDAw
MDAgaW4gY2xvY2sgZHJpdmVycyBmb3I8YnI+DQpBNTMuIFBsZWFzZSBjb25maXJtIHdoZXRoZXIg
Y2xvY2sgZHJpdmVyIG5lZWQgdXBkYXRlIG9yIHlvdXIgbmVlZDxicj4NCnJldmlzZSB5b3VyIHBh
dGNoLjxicj4NCjxzcGFuIGNsYXNzPSJnbWFpbC0iPjxicj48L3NwYW4+PC9ibG9ja3F1b3RlPjxk
aXY+T2gsIGl0JiMzOTtzIG15IG1pc3Rha2UuIEluIGZhY3QsIGZyZXF1ZW5jeSAxNTAwMDAwMDAw
IG9yIDEzMTIwMDAwMDAgY2FuIGJlIHJlbW92ZWQuIFRoZXNlIHR3byBjYXNlcyBhcmUgdHJpYWws
IGJ1dCB3ZSBkb24mIzM5O3Qgc3VnZ2VzdCB1c2luZyB0aGVtIGluIHByb2R1Y3RzLjxicj48L2Rp
dj48ZGl2PsKgPC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFy
Z2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwy
MDQpO3BhZGRpbmctbGVmdDoxZXgiPjxzcGFuIGNsYXNzPSJnbWFpbC0iPg0KJmd0O8KgIMKgIMKg
IMKgIMKgfTs8YnI+DQomZ3Q7PGJyPg0KJmd0OyBAQCAtMjc5LDYgKzMyMSwxMiBAQDxicj4NCiZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGRtYS1yZXF1ZXN0cyA9ICZs
dDszMiZndDs7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7
PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0b3Bjcm06IGNsb2NrLWNvbnRyb2xs
ZXJAMDE0NjEwMDAgezxicj4NCjxicj4NCjwvc3Bhbj5SZW1vdmluZyBoZWFkaW5nIDAgaW4gYWRk
cmVzcyBvZiBuYW1lLjxicj4NCjxkaXYgY2xhc3M9ImdtYWlsLUhPRW5aYiI+PGRpdiBjbGFzcz0i
Z21haWwtaDUiPjxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
Y29tcGF0aWJsZSA9ICZxdW90O3p0ZSx6eDI5NjcxOC10b3Bjcm0mcXVvdDs7PGJyPg0KJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgwMTQ2MTAwMCAw
eDEwMDAmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
I2Nsb2NrLWNlbGxzID0gJmx0OzEmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgfTs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzeXNj
dHJsOiBzeXNjdHJsQDE0NjMwMDAgezxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDt6dGUsengyOTY3MTgtc3lzY3RybCZxdW90
OywgJnF1b3Q7c3lzY29uJnF1b3Q7Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDE0NjMwMDAgMHgxMDAwJmd0Ozs8YnI+DQomZ3Q7IC0t
PGJyPg0KJmd0OyAyLjcuNDxicj4NCiZndDs8YnI+DQo8L2Rpdj48L2Rpdj48L2Jsb2NrcXVvdGU+
PC9kaXY+PGJyPjwvZGl2PjwvZGl2Pg0K
--001a114abf4aac7a43054280feb0--
