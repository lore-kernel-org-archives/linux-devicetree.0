Return-Path: <SRS0=0emD=ZR=linaro.org=baoyou.xie@kernel.org>
MIME-Version: 1.0
In-Reply-To: <1486116655-24111-1-git-send-email-baoyou.xie@linaro.org>
References: <1486116655-24111-1-git-send-email-baoyou.xie@linaro.org>
From: Baoyou Xie <baoyou.xie@linaro.org>
Date: Sat, 4 Feb 2017 08:26:12 +0800
Message-ID: <CA+DQWkx9JKat1BO=52ASXNKaf835Offt70cv8woEOe2KD98f9g@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] dt: bindings: add documentation for zx2967 family
 thermal sensor
Content-Type: multipart/alternative; boundary=94eb2c0b0b9c16710d0547a97214
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Jun Nie <jun.nie@linaro.org>, rui.zhang@intel.com, Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, linux-pm@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>, Baoyou Xie <baoyou.xie@linaro.org>, "xie.baoyou" <xie.baoyou@zte.com.cn>, chen.chaokai@zte.com.cn, wang.qiang01@zte.com.cn
List-ID: <devicetree@vger.kernel.org>

--94eb2c0b0b9c16710d0547a97214
Content-Type: text/plain; charset=UTF-8

On 3 February 2017 at 18:10, Baoyou Xie <baoyou.xie@linaro.org> wrote:

> This patch adds dt-binding documentation for zx2967 family thermal sensor.
>
> Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Shawn Guo <shawnguo@kernel.org>
> ---
>  .../devicetree/bindings/thermal/zx2967-thermal.txt | 116
> +++++++++++++++++++++
>  1 file changed, 116 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/thermal/zx2967-
> thermal.txt
>
> diff --git a/Documentation/devicetree/bindings/thermal/zx2967-thermal.txt
> b/Documentation/devicetree/bindings/thermal/zx2967-thermal.txt
> new file mode 100644
> index 0000000..169a699
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/thermal/zx2967-thermal.txt
> @@ -0,0 +1,116 @@
> +* ZTE zx2967 family Thermal
> +
> +Required Properties:
> +- compatible: should be one of the following.
> +    * zte,zx296718-thermal
> +- reg: physical base address of the controller and length of memory mapped
> +    region.
> +- clocks : Pairs of phandle and specifier referencing the controller's
> clocks.
> +- clock-names: "gate" for the topcrm clock.
> +              "pclk" for the apb clock.
> +- #thermal-sensor-cells: must be 0.
> +
> +Please note: coefficients defined in thermal-zones section need to be
> +multiplied by 1000.
> +
> +Example for tempsensor:
> +
> +       tempsensor: tempsensor@148a000 {
> +               compatible = "zte,zx296718-thermal";
> +               reg = <0x0148a000 0x20>;
> +               clocks = <&topcrm TEMPSENSOR_GATE>, <&audiocrm
> AUDIO_TS_PCLK>;
> +               clock-names = "gate", "pclk";
> +               #thermal-sensor-cells = <0>;
> +       };
> +
> +Example for cooling device:
> +
> +       cooling_dev: cooling_dev {
> +               cluster0_cooling_dev: cluster0-cooling-dev {
> +                       #cooling-cells = <2>;
> +                       cpumask = <0xf>;
> +                       capacitance = <1500>;
> +               };
> +
> +       cluster1_cooling_dev: cluster1-cooling-dev {
> +                       #cooling-cells = <2>;
> +                       cpumask = <0x30>;
> +                       capacitance = <2000>;
> +               };
> +       };
> +
> +Example for thermal zones:
> +
> +       thermal-zones {
> +               zx296718_thermal: zx296718_thermal {
> +                       polling-delay-passive = <500>;
> +                       polling-delay = <1000>;
> +                       sustainable-power = <6500>;
> +
> +                       thermal-sensors = <&tempsensor 0>;
> +                       /*
> +                        * both slope and offset need to be multiplied by
> 1000.
> +                        */
>

Sorry, this comment is invalid. only the slope field is be multiplied by
1000. I will modify it in next patch.

Please go on to review.


> +                       coefficients = <1951 (-922)>;
> +
> +                       trips {
> +                               trip0: switch_on_temperature {
> +                                       temperature = <90000>;
> +                                       hysteresis = <2000>;
> +                                       type = "passive";
> +                               };
> +
> +                               trip1: desired_temperature {
> +                                       temperature = <100000>;
> +                                       hysteresis = <2000>;
> +                                       type = "passive";
> +                               };
> +
> +                               crit: critical_temperature {
> +                                       temperature = <110000>;
> +                                       hysteresis = <2000>;
> +                                       type = "critical";
> +                               };
> +                       };
> +
> +                       cooling-maps {
> +                               map0 {
> +                                       trip = <&trip0>;
> +                                       cooling-device = <&gpu 2 5>;
> +                               };
> +
> +                               map1 {
> +                                       trip = <&trip0>;
> +                                       cooling-device =
> <&cluster0_cooling_dev 1 2>;
> +                               };
> +
> +                               map2 {
> +                                       trip = <&trip1>;
> +                                       cooling-device =
> <&cluster0_cooling_dev 1 2>;
> +                               };
> +
> +                               map3 {
> +                                       trip = <&crit>;
> +                                       cooling-device =
> <&cluster0_cooling_dev 1 2>;
> +                               };
> +
> +                               map4 {
> +                                       trip = <&trip0>;
> +                                       cooling-device =
> <&cluster1_cooling_dev 1 2>;
> +                                       contribution = <9000>;
> +                               };
> +
> +                               map5 {
> +                                       trip = <&trip1>;
> +                                       cooling-device =
> <&cluster1_cooling_dev 1 2>;
> +                                       contribution = <4096>;
> +                               };
> +
> +                               map6 {
> +                                       trip = <&crit>;
> +                                       cooling-device =
> <&cluster1_cooling_dev 1 2>;
> +                                       contribution = <4096>;
> +                               };
> +                       };
> +               };
> +       };
> --
> 2.7.4
>
>

--94eb2c0b0b9c16710d0547a97214
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX2V4dHJhIj48YnI+PGRpdiBjbGFz
cz0iZ21haWxfcXVvdGUiPk9uIDMgRmVicnVhcnkgMjAxNyBhdCAxODoxMCwgQmFveW91IFhpZSA8
c3BhbiBkaXI9Imx0ciI+Jmx0OzxhIGhyZWY9Im1haWx0bzpiYW95b3UueGllQGxpbmFyby5vcmci
IHRhcmdldD0iX2JsYW5rIj5iYW95b3UueGllQGxpbmFyby5vcmc8L2E+Jmd0Ozwvc3Bhbj4gd3Jv
dGU6PGJyPjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHgg
MHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRk
aW5nLWxlZnQ6MWV4Ij5UaGlzIHBhdGNoIGFkZHMgZHQtYmluZGluZyBkb2N1bWVudGF0aW9uIGZv
ciB6eDI5NjcgZmFtaWx5IHRoZXJtYWwgc2Vuc29yLjxicj4NCjxicj4NClNpZ25lZC1vZmYtYnk6
IEJhb3lvdSBYaWUgJmx0OzxhIGhyZWY9Im1haWx0bzpiYW95b3UueGllQGxpbmFyby5vcmciPmJh
b3lvdS54aWVAbGluYXJvLm9yZzwvYT4mZ3Q7PGJyPg0KQWNrZWQtYnk6IFJvYiBIZXJyaW5nICZs
dDs8YSBocmVmPSJtYWlsdG86cm9iaEBrZXJuZWwub3JnIj5yb2JoQGtlcm5lbC5vcmc8L2E+Jmd0
Ozxicj4NClJldmlld2VkLWJ5OiBTaGF3biBHdW8gJmx0OzxhIGhyZWY9Im1haWx0bzpzaGF3bmd1
b0BrZXJuZWwub3JnIj5zaGF3bmd1b0BrZXJuZWwub3JnPC9hPiZndDs8YnI+DQotLS08YnI+DQrC
oC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzLzx3YnI+dGhlcm1hbC96eDI5NjctdGhlcm1hbC50eHQg
fCAxMTYgKysrKysrKysrKysrKysrKysrKysrPGJyPg0KwqAxIGZpbGUgY2hhbmdlZCwgMTE2IGlu
c2VydGlvbnMoKyk8YnI+DQrCoGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvPHdicj5iaW5kaW5ncy90aGVybWFsL3p4Mjk2Ny08d2JyPnRoZXJtYWwudHh0PGJyPg0K
PGJyPg0KZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS88d2JyPmJpbmRpbmdz
L3RoZXJtYWwvengyOTY3LTx3YnI+dGhlcm1hbC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvPHdicj5iaW5kaW5ncy90aGVybWFsL3p4Mjk2Ny08d2JyPnRoZXJtYWwudHh0PGJyPg0KbmV3
IGZpbGUgbW9kZSAxMDA2NDQ8YnI+DQppbmRleCAwMDAwMDAwLi4xNjlhNjk5PGJyPg0KLS0tIC9k
ZXYvbnVsbDxicj4NCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS88d2JyPmJpbmRpbmdz
L3RoZXJtYWwvengyOTY3LTx3YnI+dGhlcm1hbC50eHQ8YnI+DQpAQCAtMCwwICsxLDExNiBAQDxi
cj4NCisqIFpURSB6eDI5NjcgZmFtaWx5IFRoZXJtYWw8YnI+DQorPGJyPg0KK1JlcXVpcmVkIFBy
b3BlcnRpZXM6PGJyPg0KKy0gY29tcGF0aWJsZTogc2hvdWxkIGJlIG9uZSBvZiB0aGUgZm9sbG93
aW5nLjxicj4NCivCoCDCoCAqIHp0ZSx6eDI5NjcxOC10aGVybWFsPGJyPg0KKy0gcmVnOiBwaHlz
aWNhbCBiYXNlIGFkZHJlc3Mgb2YgdGhlIGNvbnRyb2xsZXIgYW5kIGxlbmd0aCBvZiBtZW1vcnkg
bWFwcGVkPGJyPg0KK8KgIMKgIHJlZ2lvbi48YnI+DQorLSBjbG9ja3MgOiBQYWlycyBvZiBwaGFu
ZGxlIGFuZCBzcGVjaWZpZXIgcmVmZXJlbmNpbmcgdGhlIGNvbnRyb2xsZXImIzM5O3MgY2xvY2tz
Ljxicj4NCistIGNsb2NrLW5hbWVzOiAmcXVvdDtnYXRlJnF1b3Q7IGZvciB0aGUgdG9wY3JtIGNs
b2NrLjxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCAmcXVvdDtwY2xrJnF1b3Q7IGZvciB0aGUg
YXBiIGNsb2NrLjxicj4NCistICN0aGVybWFsLXNlbnNvci1jZWxsczogbXVzdCBiZSAwLjxicj4N
Cis8YnI+DQorUGxlYXNlIG5vdGU6IGNvZWZmaWNpZW50cyBkZWZpbmVkIGluIHRoZXJtYWwtem9u
ZXMgc2VjdGlvbiBuZWVkIHRvIGJlPGJyPg0KK211bHRpcGxpZWQgYnkgMTAwMC48YnI+DQorPGJy
Pg0KK0V4YW1wbGUgZm9yIHRlbXBzZW5zb3I6PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoHRlbXBz
ZW5zb3I6IHRlbXBzZW5zb3JAMTQ4YTAwMCB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
Y29tcGF0aWJsZSA9ICZxdW90O3p0ZSx6eDI5NjcxOC10aGVybWFsJnF1b3Q7Ozxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDAxNDhhMDAwIDB4MjAmZ3Q7Ozxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2NrcyA9ICZsdDsmYW1wO3RvcGNybSBURU1QU0VOU09S
X0dBVEUmZ3Q7LCAmbHQ7JmFtcDthdWRpb2NybSBBVURJT19UU19QQ0xLJmd0Ozs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBjbG9jay1uYW1lcyA9ICZxdW90O2dhdGUmcXVvdDssICZxdW90
O3BjbGsmcXVvdDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgI3RoZXJtYWwtc2Vuc29y
LWNlbGxzID0gJmx0OzAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCitFeGFt
cGxlIGZvciBjb29saW5nIGRldmljZTo8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgY29vbGluZ19k
ZXY6IGNvb2xpbmdfZGV2IHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjbHVzdGVyMF9j
b29saW5nX2RldjogY2x1c3RlcjAtY29vbGluZy1kZXYgezxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCNjb29saW5nLWNlbGxzID0gJmx0OzImZ3Q7Ozxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNwdW1hc2sgPSAmbHQ7MHhmJmd0Ozs8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjYXBhY2l0YW5jZSA9ICZsdDsx
NTAwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCis8YnI+DQorwqAg
wqAgwqAgwqBjbHVzdGVyMV9jb29saW5nX2RldjogY2x1c3RlcjEtY29vbGluZy1kZXYgezxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNjb29saW5nLWNlbGxzID0gJmx0
OzImZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNwdW1hc2sg
PSAmbHQ7MHgzMCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
Y2FwYWNpdGFuY2UgPSAmbHQ7MjAwMCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
fTs8YnI+DQorwqAgwqAgwqAgwqB9Ozxicj4NCis8YnI+DQorRXhhbXBsZSBmb3IgdGhlcm1hbCB6
b25lczo8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgdGhlcm1hbC16b25lcyB7PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgengyOTY3MThfdGhlcm1hbDogengyOTY3MThfdGhlcm1hbCB7PGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcG9sbGluZy1kZWxheS1wYXNz
aXZlID0gJmx0OzUwMCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgcG9sbGluZy1kZWxheSA9ICZsdDsxMDAwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBzdXN0YWluYWJsZS1wb3dlciA9ICZsdDs2NTAwJmd0Ozs8YnI+DQor
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdGhlcm1hbC1zZW5zb3Jz
ID0gJmx0OyZhbXA7dGVtcHNlbnNvciAwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAvKjxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCAqIGJvdGggc2xvcGUgYW5kIG9mZnNldCBuZWVkIHRvIGJlIG11bHRpcGxpZWQgYnkgMTAwMC48
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKi88YnI+PC9ibG9ja3F1
b3RlPjxkaXY+PGJyPjwvZGl2PjxkaXY+U29ycnksIHRoaXMgY29tbWVudCBpcyBpbnZhbGlkLiBv
bmx5IHRoZSBzbG9wZSBmaWVsZCBpcyBiZSBtdWx0aXBsaWVkIGJ5IDEwMDAuIEkgd2lsbCBtb2Rp
ZnkgaXQgaW4gbmV4dCBwYXRjaC48YnI+PGJyPjwvZGl2PjxkaXY+UGxlYXNlIGdvIG9uIHRvIHJl
dmlldy48YnI+PC9kaXY+PGRpdj7CoDwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90
ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQg
cmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGNvZWZmaWNpZW50cyA9ICZsdDsxOTUxICgtOTIyKSZndDs7PGJyPg0K
Kzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHRyaXBzIHs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0cmlwMDogc3dp
dGNoX29uX3RlbXBlcmF0dXJlIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0ZW1wZXJhdHVyZSA9ICZsdDs5MDAwMCZndDs7
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgaHlzdGVyZXNpcyA9ICZsdDsyMDAwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0eXBlID0gJnF1b3Q7
cGFzc2l2ZSZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqB9Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqB0cmlwMTogZGVzaXJlZF90ZW1wZXJhdHVyZSB7PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdGVt
cGVyYXR1cmUgPSAmbHQ7MTAwMDAwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBoeXN0ZXJlc2lzID0gJmx0OzIwMDAm
Z3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHR5cGUgPSAmcXVvdDtwYXNzaXZlJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNyaXQ6IGNyaXRpY2Fs
X3RlbXBlcmF0dXJlIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0ZW1wZXJhdHVyZSA9ICZsdDsxMTAwMDAmZ3Q7Ozxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGh5c3RlcmVzaXMgPSAmbHQ7MjAwMCZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdHlwZSA9ICZxdW90O2NyaXRp
Y2FsJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoH07PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+
DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29vbGluZy1tYXBz
IHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBt
YXAwIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqB0cmlwID0gJmx0OyZhbXA7dHJpcDAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvb2xpbmct
ZGV2aWNlID0gJmx0OyZhbXA7Z3B1IDIgNSZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbWFwMSB7PGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdHJpcCA9ICZs
dDsmYW1wO3RyaXAwJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb29saW5nLWRldmljZSA9ICZsdDsmYW1wO2NsdXN0
ZXIwX2Nvb2xpbmdfZGV2IDEgMiZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbWFwMiB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdHJpcCA9ICZsdDsmYW1w
O3RyaXAxJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBjb29saW5nLWRldmljZSA9ICZsdDsmYW1wO2NsdXN0ZXIwX2Nv
b2xpbmdfZGV2IDEgMiZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgbWFwMyB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdHJpcCA9ICZsdDsmYW1wO2NyaXQm
Z3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoGNvb2xpbmctZGV2aWNlID0gJmx0OyZhbXA7Y2x1c3RlcjBfY29vbGluZ19k
ZXYgMSAyJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqB9Ozxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBtYXA0IHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0cmlwID0gJmx0OyZhbXA7dHJpcDAmZ3Q7Ozxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGNvb2xpbmctZGV2aWNlID0gJmx0OyZhbXA7Y2x1c3RlcjFfY29vbGluZ19kZXYgMSAy
Jmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBjb250cmlidXRpb24gPSAmbHQ7OTAwMCZndDs7PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQorPGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbWFwNSB7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgdHJpcCA9ICZsdDsmYW1wO3RyaXAxJmd0Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb29saW5nLWRldmljZSA9ICZs
dDsmYW1wO2NsdXN0ZXIxX2Nvb2xpbmdfZGV2IDEgMiZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29udHJpYnV0aW9u
ID0gJmx0OzQwOTYmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoH07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoG1hcDYgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHRyaXAgPSAmbHQ7JmFtcDtjcml0Jmd0
Ozs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBjb29saW5nLWRldmljZSA9ICZsdDsmYW1wO2NsdXN0ZXIxX2Nvb2xpbmdfZGV2
IDEgMiZndDs7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgY29udHJpYnV0aW9uID0gJmx0OzQwOTYmZ3Q7Ozxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqB9Ozxicj4NCivCoCDCoCDCoCDCoH07PGJyPg0KPHNwYW4gY2xhc3M9ImdtYWlsLUhPRW5a
YiI+PGZvbnQgY29sb3I9IiM4ODg4ODgiPi0tPGJyPg0KMi43LjQ8YnI+DQo8YnI+DQo8L2ZvbnQ+
PC9zcGFuPjwvYmxvY2txdW90ZT48L2Rpdj48YnI+PC9kaXY+PC9kaXY+DQo=
--94eb2c0b0b9c16710d0547a97214--
