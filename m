Return-Path: <kbeldan@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20160803170627.1773-1-kbeldan@baylibre.com>
References: <20160803170627.1773-1-kbeldan@baylibre.com>
From: Karl Beldan <kbeldan@baylibre.com>
Date: Thu, 4 Aug 2016 20:42:19 +0000
Message-ID: <CAJaRCXMBi-UQaXkGNaSaKjb6eqoJwhcc9Py8vFEWpVKSn5g5bQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: da850: Adjust the pinctrl muxing for the NAND
 on CS3
Content-Type: multipart/alternative; boundary=001a11407a187313e5053944fcb8
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Karl Beldan <karl.beldan+oss@gmail.com>, Karl Beldan <kbeldan@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
List-ID: <devicetree@vger.kernel.org>

--001a11407a187313e5053944fcb8
Content-Type: text/plain; charset=UTF-8

2016-08-03 17:06 GMT+00:00 Karl Beldan <kbeldan@baylibre.com>:

> - Adjust the settings to also allow driving EMA_D[8..15] for 16bits
>   NANDs. These are shared with GPIO3[0..7] which have no in-tree user.
> - Remove the useless CS4 setting
>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Signed-off-by: Karl Beldan <kbeldan@baylibre.com>
> ---
>  arch/arm/boot/dts/da850.dtsi | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
> index 3a00978..ae5dc18 100644
> --- a/arch/arm/boot/dts/da850.dtsi
> +++ b/arch/arm/boot/dts/da850.dtsi
> @@ -43,16 +43,20 @@
>
>                         nand_cs3_pins: pinmux_nand_pins {
>                                 pinctrl-single,bits = <
> -                                       /* EMA_OE, EMA_WE */
> -                                       0x1c 0x00110000  0x00ff0000
> -                                       /* EMA_CS[4],EMA_CS[3]*/
> -                                       0x1c 0x00000110  0x00000ff0
> +                                       /* EMA_OE, EMA_WE, EMA_CS[3] */
> +                                       0x1c 0x00110010  0x00ff00f0
>                                         /*
>                                          * EMA_D[0], EMA_D[1], EMA_D[2],
>                                          * EMA_D[3], EMA_D[4], EMA_D[5],
>                                          * EMA_D[6], EMA_D[7]
>                                          */
>                                         0x24 0x11111111  0xffffffff
> +                                       /*
> +                                        * EMA_D[8],  EMA_D[9],  EMA_D[10],
> +                                        * EMA_D[11], EMA_D[12], EMA_D[13],
> +                                        * EMA_D[14], EMA_D[15]
> +                                        */
> +                                       0x20 0x11111111  0xffffffff
>                                         /* EMA_A[1], EMA_A[2] */
>                                         0x30 0x01100000  0x0ff00000
>                                 >;
> --
> 2.9.0.rc1
>
> Please discard this one I think it is better that I make groups for the
NAND.

Karl

--001a11407a187313e5053944fcb8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdiBjbGFzcz0iZ21haWxfZXh0cmEiPjxkaXYgY2xhc3M9ImdtYWls
X3F1b3RlIj4yMDE2LTA4LTAzIDE3OjA2IEdNVCswMDowMCBLYXJsIEJlbGRhbiA8c3BhbiBkaXI9
Imx0ciI+Jmx0OzxhIGhyZWY9Im1haWx0bzprYmVsZGFuQGJheWxpYnJlLmNvbSIgdGFyZ2V0PSJf
YmxhbmsiPmtiZWxkYW5AYmF5bGlicmUuY29tPC9hPiZndDs8L3NwYW4+Ojxicj48YmxvY2txdW90
ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MCAwIDAgLjhleDtib3JkZXItbGVm
dDoxcHggI2NjYyBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij4tIEFkanVzdCB0aGUgc2V0dGluZ3Mg
dG8gYWxzbyBhbGxvdyBkcml2aW5nIEVNQV9EWzguLjE1XSBmb3IgMTZiaXRzPGJyPg0KwqAgTkFO
RHMuIFRoZXNlIGFyZSBzaGFyZWQgd2l0aCBHUElPM1swLi43XSB3aGljaCBoYXZlIG5vIGluLXRy
ZWUgdXNlci48YnI+DQotIFJlbW92ZSB0aGUgdXNlbGVzcyBDUzQgc2V0dGluZzxicj4NCjxicj4N
CkNjOiBLZXZpbiBIaWxtYW4gJmx0OzxhIGhyZWY9Im1haWx0bzpraGlsbWFuQGJheWxpYnJlLmNv
bSI+a2hpbG1hbkBiYXlsaWJyZS5jb208L2E+Jmd0Ozxicj4NClNpZ25lZC1vZmYtYnk6IEthcmwg
QmVsZGFuICZsdDs8YSBocmVmPSJtYWlsdG86a2JlbGRhbkBiYXlsaWJyZS5jb20iPmtiZWxkYW5A
YmF5bGlicmUuY29tPC9hPiZndDs8YnI+DQotLS08YnI+DQrCoGFyY2gvYXJtL2Jvb3QvZHRzL2Rh
ODUwLmR0c2kgfCAxMiArKysrKysrKy0tLS08YnI+DQrCoDEgZmlsZSBjaGFuZ2VkLCA4IGluc2Vy
dGlvbnMoKyksIDQgZGVsZXRpb25zKC0pPGJyPg0KPGJyPg0KZGlmZiAtLWdpdCBhL2FyY2gvYXJt
L2Jvb3QvZHRzL2RhODUwLmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9kYTg1MC5kdHNpPGJyPg0K
aW5kZXggM2EwMDk3OC4uYWU1ZGMxOCAxMDA2NDQ8YnI+DQotLS0gYS9hcmNoL2FybS9ib290L2R0
cy9kYTg1MC5kdHNpPGJyPg0KKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvZGE4NTAuZHRzaTxicj4N
CkBAIC00MywxNiArNDMsMjAgQEA8YnI+DQo8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCBuYW5kX2NzM19waW5zOiBwaW5tdXhfbmFuZF9waW5zIHs8YnI+DQrCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBwaW5jdHJsLXNpbmdsZSxi
aXRzID0gJmx0Ozxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoC8qIEVNQV9PRSwgRU1BX1dFICovPGJyPg0KLcKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgMHgxYyAweDAw
MTEwMDAwwqAgMHgwMGZmMDAwMDxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC8qIEVNQV9DU1s0XSxFTUFfQ1NbM10qLzxicj4N
Ci3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoDB4MWMgMHgwMDAwMDExMMKgIDB4MDAwMDBmZjA8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAvKiBFTUFfT0UsIEVNQV9X
RSwgRU1BX0NTWzNdICovPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgMHgxYyAweDAwMTEwMDEwwqAgMHgwMGZmMDBmMDxicj4N
CsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIC8qPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAqIEVNQV9EWzBdLCBFTUFfRFsxXSwgRU1BX0RbMl0sPGJyPg0KwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAqIEVNQV9EWzNdLCBFTUFfRFs0XSwgRU1BX0RbNV0sPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAqIEVNQV9EWzZdLCBF
TUFfRFs3XTxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgKi88YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAweDI0IDB4MTExMTExMTHCoCAweGZmZmZmZmZm
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgLyo8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgKiBFTUFfRFs4XSzCoCBFTUFfRFs5XSzCoCBFTUFfRFsxMF0s
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgICogRU1BX0RbMTFdLCBFTUFfRFsxMl0sIEVNQV9EWzEzXSw8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKiBF
TUFfRFsxNF0sIEVNQV9EWzE1XTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAqLzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDB4MjAgMHgxMTExMTExMcKg
IDB4ZmZmZmZmZmY8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCAvKiBFTUFfQVsxXSwgRU1BX0FbMl0gKi88YnI+DQrCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAweDMw
IDB4MDExMDAwMDDCoCAweDBmZjAwMDAwPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmd0Ozs8YnI+DQo8c3BhbiBjbGFzcz0iSE9FblpiIj48Zm9u
dCBjb2xvcj0iIzg4ODg4OCI+LS08YnI+DQoyLjkuMC5yYzE8YnI+DQo8YnI+PC9mb250Pjwvc3Bh
bj48L2Jsb2NrcXVvdGU+PGRpdj5QbGVhc2UgZGlzY2FyZCB0aGlzIG9uZSBJIHRoaW5rIGl0IGlz
IGJldHRlciB0aGF0IEkgbWFrZSBncm91cHMgZm9yIHRoZSBOQU5ELjxicj7CoDxicj48L2Rpdj48
ZGl2Pkthcmw8YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PC9kaXY+PGJyPjwvZGl2PjwvZGl2Pg0K
--001a11407a187313e5053944fcb8--
