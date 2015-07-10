Return-Path: <djkurtz@google.com>
MIME-Version: 1.0
Sender: djkurtz@google.com
In-Reply-To: <1436522405-13923-6-git-send-email-jamesjj.liao@mediatek.com>
References: <1436522405-13923-1-git-send-email-jamesjj.liao@mediatek.com>
	<1436522405-13923-6-git-send-email-jamesjj.liao@mediatek.com>
Date: Fri, 10 Jul 2015 23:02:04 +0800
Message-ID: <CAGS+omC7274iPDdfXpKuM0HvCcEscUE5e5jrDH4DhW4j_Ykt2A@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] arm64: dts: mt8173: Add subsystem clock controller
 device nodes
From: Daniel Kurtz <djkurtz@chromium.org>
Content-Type: multipart/alternative; boundary=001a113923fab81c78051a86a793
To: James Liao <jamesjj.liao@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, Mike Turquette <mturquette@baylibre.com>, Matthias Brugger <matthias.bgg@gmail.com>, Heiko Stubner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, Sascha Hauer <kernel@pengutronix.de>, devicetree@vger.kernel.org, srv_heupstream@mediatek.com, Stephen Boyd <sboyd@codeaurora.org>, linux-arm-kernel@lists.infradead.org, Ricky Liang <jcliang@chromium.org>
List-ID: <devicetree@vger.kernel.org>

--001a113923fab81c78051a86a793
Content-Type: text/plain; charset=UTF-8

On Jul 10, 2015 18:00, "James Liao" <jamesjj.liao@mediatek.com> wrote:
>
> This patch adds device nodes providing subsystem clocks on MT8173,
> includes mmsys, imgsys, vdecsys, vencsys and vencltsys.
>
> Signed-off-by: James Liao <jamesjj.liao@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8173.dtsi | 30
++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> index a2f63e4..9d74ce5 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> @@ -227,6 +227,36 @@
>                         clocks = <&uart_clk>;
>                         status = "disabled";
>                 };
> +
> +               mmsys: mmsys@14000000 {

I think we agreed previously that these should all be clock-controller@.

-Dan

> +                       compatible = "mediatek,mt8173-mmsys", "syscon";
> +                       reg = <0 0x14000000 0 0x1000>;
> +                       #clock-cells = <1>;
> +               };
> +
> +               imgsys: imgsys@15000000 {
> +                       compatible = "mediatek,mt8173-imgsys", "syscon";
> +                       reg = <0 0x15000000 0 0x1000>;
> +                       #clock-cells = <1>;
> +               };
> +
> +               vdecsys: vdecsys@16000000 {
> +                       compatible = "mediatek,mt8173-vdecsys", "syscon";
> +                       reg = <0 0x16000000 0 0x1000>;
> +                       #clock-cells = <1>;
> +               };
> +
> +               vencsys: vencsys@18000000 {
> +                       compatible = "mediatek,mt8173-vencsys", "syscon";
> +                       reg = <0 0x18000000 0 0x1000>;
> +                       #clock-cells = <1>;
> +               };
> +
> +               vencltsys: vencltsys@19000000 {
> +                       compatible = "mediatek,mt8173-vencltsys",
"syscon";
> +                       reg = <0 0x19000000 0 0x1000>;
> +                       #clock-cells = <1>;
> +               };
>         };
>  };
>
> --
> 1.8.1.1.dirty
>

--001a113923fab81c78051a86a793
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PHAgZGlyPSJsdHIiPjxicj4NCk9uIEp1bCAxMCwgMjAxNSAxODowMCwgJnF1b3Q7SmFtZXMgTGlh
byZxdW90OyAmbHQ7PGEgaHJlZj0ibWFpbHRvOmphbWVzamoubGlhb0BtZWRpYXRlay5jb20iPmph
bWVzamoubGlhb0BtZWRpYXRlay5jb208L2E+Jmd0OyB3cm90ZTo8YnI+DQomZ3Q7PGJyPg0KJmd0
OyBUaGlzIHBhdGNoIGFkZHMgZGV2aWNlIG5vZGVzIHByb3ZpZGluZyBzdWJzeXN0ZW0gY2xvY2tz
IG9uIE1UODE3Myw8YnI+DQomZ3Q7IGluY2x1ZGVzIG1tc3lzLCBpbWdzeXMsIHZkZWNzeXMsIHZl
bmNzeXMgYW5kIHZlbmNsdHN5cy48YnI+DQomZ3Q7PGJyPg0KJmd0OyBTaWduZWQtb2ZmLWJ5OiBK
YW1lcyBMaWFvICZsdDs8YSBocmVmPSJtYWlsdG86amFtZXNqai5saWFvQG1lZGlhdGVrLmNvbSI+
amFtZXNqai5saWFvQG1lZGlhdGVrLmNvbTwvYT4mZ3Q7PGJyPg0KJmd0OyAtLS08YnI+DQomZ3Q7
IMKgYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxNzMuZHRzaSB8IDMwICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKzxicj4NCiZndDsgwqAxIGZpbGUgY2hhbmdlZCwgMzAgaW5z
ZXJ0aW9ucygrKTxicj4NCiZndDs8YnI+DQomZ3Q7IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jv
b3QvZHRzL21lZGlhdGVrL210ODE3My5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRl
ay9tdDgxNzMuZHRzaTxicj4NCiZndDsgaW5kZXggYTJmNjNlNC4uOWQ3NGNlNSAxMDA2NDQ8YnI+
DQomZ3Q7IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTczLmR0c2k8YnI+
DQomZ3Q7ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTczLmR0c2k8YnI+
DQomZ3Q7IEBAIC0yMjcsNiArMjI3LDM2IEBAPGJyPg0KJmd0OyDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCBjbG9ja3MgPSAmbHQ7JmFtcDt1YXJ0X2NsayZndDs7PGJyPg0KJmd0
OyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBzdGF0dXMgPSAmcXVvdDtkaXNh
YmxlZCZxdW90Ozs8YnI+DQomZ3Q7IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH07PGJyPg0KJmd0
OyArPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBtbXN5czogbW1zeXNAMTQwMDAw
MDAgezwvcD4NCjxwIGRpcj0ibHRyIj5JIHRoaW5rIHdlIGFncmVlZCBwcmV2aW91c2x5IHRoYXQg
dGhlc2Ugc2hvdWxkIGFsbCBiZSBjbG9jay1jb250cm9sbGVyQC48L3A+DQo8cCBkaXI9Imx0ciI+
LURhbjwvcD4NCjxwIGRpcj0ibHRyIj4mZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDttZWRpYXRlayxtdDgxNzMtbW1zeXMmcXVvdDssICZx
dW90O3N5c2NvbiZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoHJlZyA9ICZsdDswIDB4MTQwMDAwMDAgMCAweDEwMDAmZ3Q7Ozxicj4NCiZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgI2Nsb2NrLWNlbGxzID0gJmx0OzEmZ3Q7
Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICs8YnI+DQom
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGltZ3N5czogaW1nc3lzQDE1MDAwMDAwIHs8YnI+
DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAm
cXVvdDttZWRpYXRlayxtdDgxNzMtaW1nc3lzJnF1b3Q7LCAmcXVvdDtzeXNjb24mcXVvdDs7PGJy
Pg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MCAw
eDE1MDAwMDAwIDAgMHgxMDAwJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCNjbG9jay1jZWxscyA9ICZsdDsxJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqB2ZGVjc3lzOiB2ZGVjc3lzQDE2MDAwMDAwIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDttZWRpYXRlayxtdDgx
NzMtdmRlY3N5cyZxdW90OywgJnF1b3Q7c3lzY29uJnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzAgMHgxNjAwMDAwMCAwIDB4MTAw
MCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjY2xv
Y2stY2VsbHMgPSAmbHQ7MSZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9
Ozxicj4NCiZndDsgKzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdmVuY3N5czog
dmVuY3N5c0AxODAwMDAwMCB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7bWVkaWF0ZWssbXQ4MTczLXZlbmNzeXMmcXVvdDss
ICZxdW90O3N5c2NvbiZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHJlZyA9ICZsdDswIDB4MTgwMDAwMDAgMCAweDEwMDAmZ3Q7Ozxicj4NCiZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgI2Nsb2NrLWNlbGxzID0gJmx0OzEm
Z3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICs8YnI+
DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHZlbmNsdHN5czogdmVuY2x0c3lzQDE5MDAw
MDAwIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBh
dGlibGUgPSAmcXVvdDttZWRpYXRlayxtdDgxNzMtdmVuY2x0c3lzJnF1b3Q7LCAmcXVvdDtzeXNj
b24mcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBy
ZWcgPSAmbHQ7MCAweDE5MDAwMDAwIDAgMHgxMDAwJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNjbG9jay1jZWxscyA9ICZsdDsxJmd0Ozs8YnI+DQom
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyDCoCDCoCDCoCDCoCB9Ozxi
cj4NCiZndDsgwqB9Ozxicj4NCiZndDs8YnI+DQomZ3Q7IC0tPGJyPg0KJmd0OyAxLjguMS4xLmRp
cnR5PGJyPg0KJmd0Ozxicj4NCjwvcD4NCg==
--001a113923fab81c78051a86a793--
