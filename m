Return-Path: <SRS0=WMlm=45=linaro.org=guodong.xu@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20170523004145.6y4x5n3leohrn7zc@rob-hp-laptop>
References: <20170517083745.24479-1-guodong.xu@linaro.org> <20170517083745.24479-7-guodong.xu@linaro.org>
 <20170523004145.6y4x5n3leohrn7zc@rob-hp-laptop>
From: Guodong Xu <guodong.xu@linaro.org>
Date: Tue, 23 May 2017 19:18:57 +0800
Message-ID: <CAFGCpxyjCJEvjP3a-huSe69ynWO1YhKBHh8q+L+65tKekhBC_w@mail.gmail.com>
Subject: Re: [PATCH 06/12] arm64: dts: hi3660: add gpio dtsi file for
 Hisilicon Hi3660 SOC
Content-Type: multipart/alternative; boundary="001a11423c325eab7305502f2706"
To: Rob Herring <robh@kernel.org>
Cc: "xuwei (O)" <xuwei5@hisilicon.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Kefeng Wang <wangkefeng.wang@huawei.com>, "Chenfeng (puck)" <puck.chen@hisilicon.com>, Xuejiancheng <xuejiancheng@hisilicon.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Wang Xiaoyin <hw.wangxiaoyin@hisilicon.com>
List-ID: <devicetree@vger.kernel.org>

--001a11423c325eab7305502f2706
Content-Type: text/plain; charset="UTF-8"

On Tue, May 23, 2017 at 8:41 AM, Rob Herring <robh@kernel.org> wrote:

> On Wed, May 17, 2017 at 04:37:39PM +0800, Guodong Xu wrote:
> > From: Wang Xiaoyin <hw.wangxiaoyin@hisilicon.com>
> >
> > This patch adds pl061 device nodes for Hi3660 SoC.
> >
> > Signed-off-by: Wang Xiaoyin <hw.wangxiaoyin@hisilicon.com>
> > ---
> >  arch/arm64/boot/dts/hisilicon/hi3660.dtsi | 409
> ++++++++++++++++++++++++++++++
> >  1 file changed, 409 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
> b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
> > index f217c9d..3bea0d2 100644
> > --- a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
> > +++ b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
> > @@ -251,5 +251,414 @@
> >                       clock-names = "uartclk", "apb_pclk";
> >                       status = "disabled";
> >               };
> > +
> > +             gpio0: gpio@e8a0b000 {
> > +                     compatible = "arm,pl061", "arm,primecell";
> > +                     reg = <0 0xe8a0b000 0 0x1000>;
> > +                     interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
> > +                     gpio-controller;
> > +                     #gpio-cells = <2>;
> > +                     gpio-ranges = <&pmx0 1 0 7>;
> > +                     interrupt-controller;
> > +                     #interrupt-cells = <2>;
> > +                     clocks = <&crg_ctrl HI3660_PCLK_GPIO0>;
> > +                     clock-names = "apb_pclk";
> > +                     status = "ok";
>
> You don't need "ok" here if these are default enabled.
>
> > +             };
> > +
> > +             gpio1: gpio@e8a0c000 {
> > +                     compatible = "arm,pl061", "arm,primecell";
> > +                     reg = <0 0xe8a0c000 0 0x1000>;
> > +                     interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
> > +                     gpio-controller;
> > +                     #gpio-cells = <2>;
> > +                     gpio-ranges = <&pmx0 1 7 7>;
> > +                     interrupt-controller;
> > +                     #interrupt-cells = <2>;
> > +                     clocks = <&crg_ctrl HI3660_PCLK_GPIO1>;
> > +                     clock-names = "apb_pclk";
> > +                     status = "ok";
>
> ditto...
>
> > +             };
> > +
> > +             gpio2: gpio@e8a0d000 {
> > +                     compatible = "arm,pl061", "arm,primecell";
> > +                     reg = <0 0xe8a0d000 0 0x1000>;
> > +                     interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
> > +                     gpio-controller;
> > +                     #gpio-cells = <2>;
> > +                     gpio-ranges = <&pmx0 0 14 8>;
> > +                     interrupt-controller;
> > +                     #interrupt-cells = <2>;
> > +                     clocks = <&crg_ctrl HI3660_PCLK_GPIO2>;
> > +                     clock-names = "apb_pclk";
> > +                     status = "ok";
> > +             };
> > +
> > +             gpio3: gpio@e8a0e000 {
> > +                     compatible = "arm,pl061", "arm,primecell";
> > +                     reg = <0 0xe8a0e000 0 0x1000>;
> > +                     interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
> > +                     gpio-controller;
> > +                     #gpio-cells = <2>;
> > +                     gpio-ranges = <&pmx0 0 22 8>;
> > +                     interrupt-controller;
> > +                     #interrupt-cells = <2>;
> > +                     clocks = <&crg_ctrl HI3660_PCLK_GPIO3>;
> > +                     clock-names = "apb_pclk";
> > +                     status = "ok";
> > +             };
> > +
> > +             gpio4: gpio@e8a0f000 {
> > +                     compatible = "arm,pl061", "arm,primecell";
> > +                     reg = <0 0xe8a0f000 0 0x1000>;
> > +                     interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>;
> > +                     gpio-controller;
> > +                     #gpio-cells = <2>;
> > +                     gpio-ranges = <&pmx0 0 30 8>;
> > +                     interrupt-controller;
> > +                     #interrupt-cells = <2>;
> > +                     clocks = <&crg_ctrl HI3660_PCLK_GPIO4>;
> > +                     clock-names = "apb_pclk";
> > +                     status = "ok";
> > +             };
> > +
> > +             gpio5: gpio@e8a10000 {
> > +                     compatible = "arm,pl061", "arm,primecell";
> > +                     reg = <0 0xe8a10000 0 0x1000>;
> > +                     interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
> > +                     gpio-controller;
> > +                     #gpio-cells = <2>;
> > +                     gpio-ranges = <&pmx0 0 38 8>;
> > +                     interrupt-controller;
> > +                     #interrupt-cells = <2>;
> > +                     clocks = <&crg_ctrl HI3660_PCLK_GPIO5>;
> > +                     clock-names = "apb_pclk";
> > +                     status = "ok";
> > +             };
> > +
> > +             gpio6: gpio@e8a11000 {
> > +                     compatible = "arm,pl061", "arm,primecell";
> > +                     reg = <0 0xe8a11000 0 0x1000>;
> > +                     interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
> > +                     gpio-controller;
> > +                     #gpio-cells = <2>;
> > +                     gpio-ranges = <&pmx0 0 46 8>;
> > +                     interrupt-controller;
> > +                     #interrupt-cells = <2>;
> > +                     clocks = <&crg_ctrl HI3660_PCLK_GPIO6>;
> > +                     clock-names = "apb_pclk";
> > +                     status = "ok";
> > +             };
> > +
> > +             gpio7: gpio@e8a12000 {
> > +                     compatible = "arm,pl061", "arm,primecell";
> > +                     reg = <0 0xe8a12000 0 0x1000>;
> > +                     interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
> > +                     gpio-controller;
> > +                     #gpio-cells = <2>;
> > +                     gpio-ranges = <&pmx0 0 54 8>;
> > +                     interrupt-controller;
> > +                     #interrupt-cells = <2>;
> > +                     clocks = <&crg_ctrl HI3660_PCLK_GPIO7>;
> > +                     clock-names = "apb_pclk";
> > +                     status = "ok";
> > +             };
> > +
> > +             gpio8: gpio@e8a13000 {
> > +                     compatible = "arm,pl061", "arm,primecell";
> > +                     reg = <0 0xe8a13000 0 0x1000>;
> > +                     interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
> > +                     gpio-controller;
> > +                     #gpio-cells = <2>;
> > +                     gpio-ranges = <&pmx0 0 62 8>;
> > +                     interrupt-controller;
> > +                     #interrupt-cells = <2>;
> > +                     clocks = <&crg_ctrl HI3660_PCLK_GPIO8>;
> > +                     clock-names = "apb_pclk";
> > +                     status = "ok";
> > +             };
> > +
> > +             gpio9: gpio@e8a14000 {
> > +                     compatible = "arm,pl061", "arm,primecell";
> > +                     reg = <0 0xe8a14000 0 0x1000>;
> > +                     interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
> > +                     gpio-controller;
> > +                     #gpio-cells = <2>;
> > +                     gpio-ranges = <&pmx0 0 70 8>;
> > +                     interrupt-controller;
> > +                     #interrupt-cells = <2>;
> > +                     clocks = <&crg_ctrl HI3660_PCLK_GPIO9>;
> > +                     clock-names = "apb_pclk";
> > +                     status = "ok";
> > +             };
> > +
> > +             gpio10: gpio@e8a15000 {
> > +                     compatible = "arm,pl061", "arm,primecell";
> > +                     reg = <0 0xe8a15000 0 0x1000>;
> > +                     interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
> > +                     gpio-controller;
> > +                     #gpio-cells = <2>;
> > +                     gpio-ranges = <&pmx0 0 78 8>;
> > +                     interrupt-controller;
> > +                     #interrupt-cells = <2>;
> > +                     clocks = <&crg_ctrl HI3660_PCLK_GPIO10>;
> > +                     clock-names = "apb_pclk";
> > +                     status = "ok";
> > +             };
> > +
> > +             gpio11: gpio@e8a16000 {
> > +                     compatible = "arm,pl061", "arm,primecell";
> > +                     reg = <0 0xe8a16000 0 0x1000>;
> > +                     interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
> > +                     gpio-controller;
> > +                     #gpio-cells = <2>;
> > +                     gpio-ranges = <&pmx0 0 86 8>;
> > +                     interrupt-controller;
> > +                     #interrupt-cells = <2>;
> > +                     clocks = <&crg_ctrl HI3660_PCLK_GPIO11>;
> > +                     clock-names = "apb_pclk";
> > +                     status = "ok";
> > +             };
> > +
> > +             gpio12: gpio@e8a17000 {
> > +                     compatible = "arm,pl061", "arm,primecell";
> > +                     reg = <0 0xe8a17000 0 0x1000>;
> > +                     interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
> > +                     gpio-controller;
> > +                     #gpio-cells = <2>;
> > +                     gpio-ranges = <&pmx0 0 94 3 &pmx0 7 101 1>;
> > +                     interrupt-controller;
> > +                     #interrupt-cells = <2>;
> > +                     clocks = <&crg_ctrl HI3660_PCLK_GPIO12>;
> > +                     clock-names = "apb_pclk";
> > +                     status = "ok";
> > +             };
> > +
> > +             gpio13: gpio@e8a18000 {
> > +                     compatible = "arm,pl061", "arm,primecell";
> > +                     reg = <0 0xe8a18000 0 0x1000>;
> > +                     interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
> > +                     gpio-controller;
> > +                     #gpio-cells = <2>;
> > +                     gpio-ranges = <&pmx0 0 102 8>;
> > +                     interrupt-controller;
> > +                     #interrupt-cells = <2>;
> > +                     clocks = <&crg_ctrl HI3660_PCLK_GPIO13>;
> > +                     clock-names = "apb_pclk";
> > +                     status = "ok";
> > +             };
> > +
> > +             gpio14: gpio@e8a19000 {
> > +                     compatible = "arm,pl061", "arm,primecell";
> > +                     reg = <0 0xe8a19000 0 0x1000>;
> > +                     interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
> > +                     gpio-controller;
> > +                     #gpio-cells = <2>;
> > +                     gpio-ranges = <&pmx0 0 110 8>;
> > +                     interrupt-controller;
> > +                     #interrupt-cells = <2>;
> > +                     clocks = <&crg_ctrl HI3660_PCLK_GPIO14>;
> > +                     clock-names = "apb_pclk";
> > +                     status = "ok";
> > +             };
> > +
> > +             gpio15: gpio@e8a1a000 {
> > +                     compatible = "arm,pl061", "arm,primecell";
> > +                     reg = <0 0xe8a1a000 0 0x1000>;
> > +                     interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
> > +                     gpio-controller;
> > +                     #gpio-cells = <2>;
> > +                     gpio-ranges = <&pmx0 0 118 6>;
> > +                     interrupt-controller;
> > +                     #interrupt-cells = <2>;
> > +                     clocks = <&crg_ctrl HI3660_PCLK_GPIO15>;
> > +                     clock-names = "apb_pclk";
> > +                     status = "ok";
> > +             };
> > +
> > +             gpio16: gpio@e8a1b000 {
> > +                     compatible = "arm,pl061", "arm,primecell";
> > +                     reg = <0 0xe8a1b000 0 0x1000>;
> > +                     interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
> > +                     gpio-controller;
> > +                     #gpio-cells = <2>;
> > +                     interrupt-controller;
> > +                     #interrupt-cells = <2>;
> > +                     clocks = <&crg_ctrl HI3660_PCLK_GPIO16>;
> > +                     clock-names = "apb_pclk";
> > +                     status = "ok";
> > +             };
> > +
> > +             gpio17: gpio@e8a1c000 {
> > +                     compatible = "arm,pl061", "arm,primecell";
> > +                     reg = <0 0xe8a1c000 0 0x1000>;
> > +                     interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
> > +                     gpio-controller;
> > +                     #gpio-cells = <2>;
> > +                     interrupt-controller;
> > +                     #interrupt-cells = <2>;
> > +                     clocks = <&crg_ctrl HI3660_PCLK_GPIO17>;
> > +                     clock-names = "apb_pclk";
> > +                     status = "ok";
> > +             };
> > +
> > +             gpio18: gpio@ff3b4000 {
> > +                     compatible = "arm,pl061", "arm,primecell";
> > +                     reg = <0 0xff3b4000 0 0x1000>;
> > +                     interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
> > +                     gpio-controller;
> > +                     #gpio-cells = <2>;
> > +                     gpio-ranges = <&pmx2 0 0 8>;
> > +                     interrupt-controller;
> > +                     #interrupt-cells = <2>;
> > +                     clocks = <&crg_ctrl HI3660_PCLK_GPIO18>;
> > +                     clock-names = "apb_pclk";
> > +                     status = "ok";
> > +             };
> > +
> > +             gpio19: gpio@ff3b5000 {
> > +                     compatible = "arm,pl061", "arm,primecell";
> > +                     reg = <0 0xff3b5000 0 0x1000>;
> > +                     interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
> > +                     gpio-controller;
> > +                     #gpio-cells = <2>;
> > +                     gpio-ranges = <&pmx2 0 8 4>;
> > +                     interrupt-controller;
> > +                     #interrupt-cells = <2>;
> > +                     clocks = <&crg_ctrl HI3660_PCLK_GPIO19>;
> > +                     clock-names = "apb_pclk";
> > +                     status = "ok";
> > +             };
> > +
> > +             gpio20: gpio@e8a1f000 {
> > +                     compatible = "arm,pl061", "arm,primecell";
> > +                     reg = <0 0xe8a1f000 0 0x1000>;
> > +                     interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
> > +                     gpio-controller;
> > +                     #gpio-cells = <2>;
> > +                     gpio-ranges = <&pmx1 0 0 6>;
> > +                     interrupt-controller;
> > +                     #interrupt-cells = <2>;
> > +                     clocks = <&crg_ctrl HI3660_PCLK_GPIO20>;
> > +                     clock-names = "apb_pclk";
> > +                     status = "ok";
> > +             };
> > +
> > +             gpio21: gpio@e8a20000 {
> > +                     compatible = "arm,pl061", "arm,primecell";
> > +                     reg = <0 0xe8a20000 0 0x1000>;
> > +                     interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
> > +                     gpio-controller;
> > +                     #gpio-cells = <2>;
> > +                     interrupt-controller;
> > +                     #interrupt-cells = <2>;
> > +                     gpio-ranges = <&pmx3 0 0 6>;
> > +                     clocks = <&crg_ctrl HI3660_PCLK_GPIO21>;
> > +                     clock-names = "apb_pclk";
> > +                     status = "ok";
> > +             };
> > +
> > +             gpio22: gpio@fff0b000 {
> > +                     compatible = "arm,pl061", "arm,primecell";
> > +                     reg = <0 0xfff0b000 0 0x1000>;
> > +                     interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
> > +                     gpio-controller;
> > +                     #gpio-cells = <2>;
> > +                     /* GPIO176 */
> > +                     gpio-ranges = <&pmx4 2 0 6>;
> > +                     interrupt-controller;
> > +                     #interrupt-cells = <2>;
> > +                     clocks = <&sctrl HI3660_PCLK_AO_GPIO0>;
> > +                     clock-names = "apb_pclk";
> > +                     status = "ok";
> > +             };
> > +
> > +             gpio23: gpio@fff0c000 {
> > +                     compatible = "arm,pl061", "arm,primecell";
> > +                     reg = <0 0xfff0c000 0 0x1000>;
> > +                     interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
> > +                     gpio-controller;
> > +                     #gpio-cells = <2>;
> > +                     /* GPIO184 */
> > +                     gpio-ranges = <&pmx4 0 6 7>;
> > +                     interrupt-controller;
> > +                     #interrupt-cells = <2>;
> > +                     clocks = <&sctrl HI3660_PCLK_AO_GPIO1>;
> > +                     clock-names = "apb_pclk";
> > +                     status = "ok";
> > +             };
> > +
> > +              gpio24: gpio@fff0d000 {
>
> extra space     ^
>

Thanks, Rob. I will fix.

--001a11423c325eab7305502f2706
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX2V4dHJhIj48YnI+PGRpdiBjbGFz
cz0iZ21haWxfcXVvdGUiPk9uIFR1ZSwgTWF5IDIzLCAyMDE3IGF0IDg6NDEgQU0sIFJvYiBIZXJy
aW5nIDxzcGFuIGRpcj0ibHRyIj4mbHQ7PGEgaHJlZj0ibWFpbHRvOnJvYmhAa2VybmVsLm9yZyIg
dGFyZ2V0PSJfYmxhbmsiPnJvYmhAa2VybmVsLm9yZzwvYT4mZ3Q7PC9zcGFuPiB3cm90ZTo8YnI+
PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7
Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mgc29saWQ7cGFkZGluZy1sZWZ0OjFleCI+PGRpdiBjbGFzcz0i
SE9FblpiIj48ZGl2IGNsYXNzPSJoNSI+T24gV2VkLCBNYXkgMTcsIDIwMTcgYXQgMDQ6Mzc6MzlQ
TSArMDgwMCwgR3VvZG9uZyBYdSB3cm90ZTo8YnI+DQomZ3Q7IEZyb206IFdhbmcgWGlhb3lpbiAm
bHQ7PGEgaHJlZj0ibWFpbHRvOmh3Lndhbmd4aWFveWluQGhpc2lsaWNvbi5jb20iPmh3Lndhbmd4
aWFveWluQGhpc2lsaWNvbi5jb208L2E+Jmd0Ozxicj4NCiZndDs8YnI+DQomZ3Q7IFRoaXMgcGF0
Y2ggYWRkcyBwbDA2MSBkZXZpY2Ugbm9kZXMgZm9yIEhpMzY2MCBTb0MuPGJyPg0KJmd0Ozxicj4N
CiZndDsgU2lnbmVkLW9mZi1ieTogV2FuZyBYaWFveWluICZsdDs8YSBocmVmPSJtYWlsdG86aHcu
d2FuZ3hpYW95aW5AaGlzaWxpY29uLmNvbSI+aHcud2FuZ3hpYW95aW5AaGlzaWxpY29uLmNvbTwv
YT4mZ3Q7PGJyPg0KJmd0OyAtLS08YnI+DQomZ3Q7wqAgYXJjaC9hcm02NC9ib290L2R0cy9oaXNp
bGljb24vPHdicj5oaTM2NjAuZHRzaSB8IDQwOSArKysrKysrKysrKysrKysrKysrKysrKysrKysr
Kys8YnI+DQomZ3Q7wqAgMSBmaWxlIGNoYW5nZWQsIDQwOSBpbnNlcnRpb25zKCspPGJyPg0KJmd0
Ozxicj4NCiZndDsgZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvPHdicj5oaXNpbGlj
b24vaGkzNjYwLmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzLzx3YnI+aGlzaWxpY29uL2hpMzY2
MC5kdHNpPGJyPg0KJmd0OyBpbmRleCBmMjE3YzlkLi4zYmVhMGQyIDEwMDY0NDxicj4NCiZndDsg
LS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy88d2JyPmhpc2lsaWNvbi9oaTM2NjAuZHRzaTxicj4N
CiZndDsgKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy88d2JyPmhpc2lsaWNvbi9oaTM2NjAuZHRz
aTxicj4NCiZndDsgQEAgLTI1MSw1ICsyNTEsNDE0IEBAPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xvY2stbmFtZXMgPSAmcXVvdDt1YXJ0Y2xrJnF1b3Q7LCAm
cXVvdDthcGJfcGNsayZxdW90Ozs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBzdGF0dXMgPSAmcXVvdDtkaXNhYmxlZCZxdW90Ozs8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsgKzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgZ3BpbzA6IGdwaW9AZThhMGIwMDAgezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O2FybSxwbDA2MSZxdW90OywgJnF1b3Q7YXJt
LHByaW1lY2VsbCZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHJlZyA9ICZsdDswIDB4ZThhMGIwMDAgMCAweDEwMDAmZ3Q7Ozxicj4NCiZndDsgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaW50ZXJydXB0cyA9ICZsdDtHSUNfU1BJIDg0IElS
UV9UWVBFX0xFVkVMX0hJR0gmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgZ3Bpby1jb250cm9sbGVyOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgI2dwaW8tY2VsbHMgPSAmbHQ7MiZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncGlvLXJhbmdlcyA9ICZsdDsmYW1wO3BteDAgMSAwIDcm
Z3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaW50ZXJydXB0
LWNvbnRyb2xsZXI7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAj
aW50ZXJydXB0LWNlbGxzID0gJmx0OzImZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgY2xvY2tzID0gJmx0OyZhbXA7Y3JnX2N0cmwgSEkzNjYwX1BDTEtfR1BJ
TzAmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xvY2st
bmFtZXMgPSAmcXVvdDthcGJfcGNsayZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90O29rJnF1b3Q7Ozxicj4NCjxicj4NCjwvZGl2
PjwvZGl2PllvdSBkb24mIzM5O3QgbmVlZCAmcXVvdDtvayZxdW90OyBoZXJlIGlmIHRoZXNlIGFy
ZSBkZWZhdWx0IGVuYWJsZWQuPGJyPg0KPHNwYW4gY2xhc3M9IiI+PGJyPg0KJmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsgKzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgZ3BpbzE6IGdwaW9AZThhMGMwMDAgezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O2FybSxwbDA2MSZxdW90OywgJnF1b3Q7YXJt
LHByaW1lY2VsbCZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHJlZyA9ICZsdDswIDB4ZThhMGMwMDAgMCAweDEwMDAmZ3Q7Ozxicj4NCiZndDsgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaW50ZXJydXB0cyA9ICZsdDtHSUNfU1BJIDg1IElS
UV9UWVBFX0xFVkVMX0hJR0gmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgZ3Bpby1jb250cm9sbGVyOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgI2dwaW8tY2VsbHMgPSAmbHQ7MiZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncGlvLXJhbmdlcyA9ICZsdDsmYW1wO3BteDAgMSA3IDcm
Z3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaW50ZXJydXB0
LWNvbnRyb2xsZXI7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAj
aW50ZXJydXB0LWNlbGxzID0gJmx0OzImZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgY2xvY2tzID0gJmx0OyZhbXA7Y3JnX2N0cmwgSEkzNjYwX1BDTEtfR1BJ
TzEmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xvY2st
bmFtZXMgPSAmcXVvdDthcGJfcGNsayZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90O29rJnF1b3Q7Ozxicj4NCjxicj4NCjwvc3Bh
bj5kaXR0by4uLjxicj4NCjxkaXY+PGRpdiBjbGFzcz0iaDUiPjxicj4NCiZndDsgK8KgIMKgIMKg
IMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oGdwaW8yOiBncGlvQGU4YTBkMDAwIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDthcm0scGwwNjEmcXVvdDssICZxdW90O2FybSxw
cmltZWNlbGwmcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqByZWcgPSAmbHQ7MCAweGU4YTBkMDAwIDAgMHgxMDAwJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7R0lDX1NQSSA4NiBJUlFf
VFlQRV9MRVZFTF9ISUdIJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGdwaW8tY29udHJvbGxlcjs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCNncGlvLWNlbGxzID0gJmx0OzImZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgZ3Bpby1yYW5nZXMgPSAmbHQ7JmFtcDtwbXgwIDAgMTQgOCZn
dDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpbnRlcnJ1cHQt
Y29udHJvbGxlcjs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNp
bnRlcnJ1cHQtY2VsbHMgPSAmbHQ7MiZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBjbG9ja3MgPSAmbHQ7JmFtcDtjcmdfY3RybCBISTM2NjBfUENMS19HUElP
MiZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjbG9jay1u
YW1lcyA9ICZxdW90O2FwYl9wY2xrJnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgc3RhdHVzID0gJnF1b3Q7b2smcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsgKzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgZ3BpbzM6IGdwaW9AZThhMGUwMDAgezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O2FybSxwbDA2MSZxdW90OywgJnF1b3Q7YXJt
LHByaW1lY2VsbCZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHJlZyA9ICZsdDswIDB4ZThhMGUwMDAgMCAweDEwMDAmZ3Q7Ozxicj4NCiZndDsgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaW50ZXJydXB0cyA9ICZsdDtHSUNfU1BJIDg3IElS
UV9UWVBFX0xFVkVMX0hJR0gmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgZ3Bpby1jb250cm9sbGVyOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgI2dwaW8tY2VsbHMgPSAmbHQ7MiZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncGlvLXJhbmdlcyA9ICZsdDsmYW1wO3BteDAgMCAyMiA4
Jmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVw
dC1jb250cm9sbGVyOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
I2ludGVycnVwdC1jZWxscyA9ICZsdDsyJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGNsb2NrcyA9ICZsdDsmYW1wO2NyZ19jdHJsIEhJMzY2MF9QQ0xLX0dQ
SU8zJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2Nr
LW5hbWVzID0gJnF1b3Q7YXBiX3BjbGsmcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBzdGF0dXMgPSAmcXVvdDtvayZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqBncGlvNDogZ3Bpb0BlOGEwZjAwMCB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7YXJtLHBsMDYxJnF1b3Q7LCAmcXVvdDth
cm0scHJpbWVjZWxsJnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgcmVnID0gJmx0OzAgMHhlOGEwZjAwMCAwIDB4MTAwMCZndDs7PGJyPg0KJmd0OyArwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpbnRlcnJ1cHRzID0gJmx0O0dJQ19TUEkgODgg
SVJRX1RZUEVfTEVWRUxfSElHSCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBncGlvLWNvbnRyb2xsZXI7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAjZ3Bpby1jZWxscyA9ICZsdDsyJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdwaW8tcmFuZ2VzID0gJmx0OyZhbXA7cG14MCAwIDMw
IDgmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaW50ZXJy
dXB0LWNvbnRyb2xsZXI7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAjaW50ZXJydXB0LWNlbGxzID0gJmx0OzImZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgY2xvY2tzID0gJmx0OyZhbXA7Y3JnX2N0cmwgSEkzNjYwX1BDTEtf
R1BJTzQmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xv
Y2stbmFtZXMgPSAmcXVvdDthcGJfcGNsayZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90O29rJnF1b3Q7Ozxicj4NCiZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoGdwaW81OiBncGlvQGU4YTEwMDAwIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDthcm0scGwwNjEmcXVvdDssICZxdW90
O2FybSxwcmltZWNlbGwmcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqByZWcgPSAmbHQ7MCAweGU4YTEwMDAwIDAgMHgxMDAwJmd0Ozs8YnI+DQomZ3Q7ICvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7R0lDX1NQSSA4
OSBJUlFfVFlQRV9MRVZFTF9ISUdIJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoGdwaW8tY29udHJvbGxlcjs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCNncGlvLWNlbGxzID0gJmx0OzImZ3Q7Ozxicj4NCiZndDsgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ3Bpby1yYW5nZXMgPSAmbHQ7JmFtcDtwbXgwIDAg
MzggOCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpbnRl
cnJ1cHQtY29udHJvbGxlcjs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCNpbnRlcnJ1cHQtY2VsbHMgPSAmbHQ7MiZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBjbG9ja3MgPSAmbHQ7JmFtcDtjcmdfY3RybCBISTM2NjBfUENM
S19HUElPNSZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBj
bG9jay1uYW1lcyA9ICZxdW90O2FwYl9wY2xrJnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgc3RhdHVzID0gJnF1b3Q7b2smcXVvdDs7PGJyPg0KJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsgKzxicj4NCiZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgZ3BpbzY6IGdwaW9AZThhMTEwMDAgezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O2FybSxwbDA2MSZxdW90OywgJnF1
b3Q7YXJtLHByaW1lY2VsbCZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHJlZyA9ICZsdDswIDB4ZThhMTEwMDAgMCAweDEwMDAmZ3Q7Ozxicj4NCiZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaW50ZXJydXB0cyA9ICZsdDtHSUNfU1BJ
IDkwIElSUV9UWVBFX0xFVkVMX0hJR0gmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgZ3Bpby1jb250cm9sbGVyOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgI2dwaW8tY2VsbHMgPSAmbHQ7MiZndDs7PGJyPg0KJmd0OyArwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncGlvLXJhbmdlcyA9ICZsdDsmYW1wO3BteDAg
MCA0NiA4Jmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlu
dGVycnVwdC1jb250cm9sbGVyOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgI2ludGVycnVwdC1jZWxscyA9ICZsdDsyJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2NrcyA9ICZsdDsmYW1wO2NyZ19jdHJsIEhJMzY2MF9Q
Q0xLX0dQSU82Jmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGNsb2NrLW5hbWVzID0gJnF1b3Q7YXBiX3BjbGsmcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdGF0dXMgPSAmcXVvdDtvayZxdW90Ozs8YnI+DQomZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqBncGlvNzogZ3Bpb0BlOGExMjAwMCB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7YXJtLHBsMDYxJnF1b3Q7LCAm
cXVvdDthcm0scHJpbWVjZWxsJnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgcmVnID0gJmx0OzAgMHhlOGExMjAwMCAwIDB4MTAwMCZndDs7PGJyPg0KJmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpbnRlcnJ1cHRzID0gJmx0O0dJQ19T
UEkgOTEgSVJRX1RZUEVfTEVWRUxfSElHSCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBncGlvLWNvbnRyb2xsZXI7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAjZ3Bpby1jZWxscyA9ICZsdDsyJmd0Ozs8YnI+DQomZ3Q7ICvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdwaW8tcmFuZ2VzID0gJmx0OyZhbXA7cG14
MCAwIDU0IDgmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
aW50ZXJydXB0LWNvbnRyb2xsZXI7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAjaW50ZXJydXB0LWNlbGxzID0gJmx0OzImZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xvY2tzID0gJmx0OyZhbXA7Y3JnX2N0cmwgSEkzNjYw
X1BDTEtfR1BJTzcmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgY2xvY2stbmFtZXMgPSAmcXVvdDthcGJfcGNsayZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90O29rJnF1b3Q7Ozxicj4NCiZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICvCoCDCoCDC
oCDCoCDCoCDCoCDCoGdwaW84OiBncGlvQGU4YTEzMDAwIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDthcm0scGwwNjEmcXVvdDss
ICZxdW90O2FybSxwcmltZWNlbGwmcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MCAweGU4YTEzMDAwIDAgMHgxMDAwJmd0Ozs8YnI+DQom
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7R0lD
X1NQSSA5MiBJUlFfVFlQRV9MRVZFTF9ISUdIJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoGdwaW8tY29udHJvbGxlcjs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNncGlvLWNlbGxzID0gJmx0OzImZ3Q7Ozxicj4NCiZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ3Bpby1yYW5nZXMgPSAmbHQ7JmFtcDtw
bXgwIDAgNjIgOCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBpbnRlcnJ1cHQtY29udHJvbGxlcjs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCNpbnRlcnJ1cHQtY2VsbHMgPSAmbHQ7MiZndDs7PGJyPg0KJmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjbG9ja3MgPSAmbHQ7JmFtcDtjcmdfY3RybCBISTM2
NjBfUENMS19HUElPOCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBjbG9jay1uYW1lcyA9ICZxdW90O2FwYl9wY2xrJnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3RhdHVzID0gJnF1b3Q7b2smcXVvdDs7PGJyPg0K
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsgKzxicj4NCiZndDsgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgZ3Bpbzk6IGdwaW9AZThhMTQwMDAgezxicj4NCiZndDsgK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O2FybSxwbDA2MSZxdW90
OywgJnF1b3Q7YXJtLHByaW1lY2VsbCZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDswIDB4ZThhMTQwMDAgMCAweDEwMDAmZ3Q7Ozxicj4N
CiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaW50ZXJydXB0cyA9ICZsdDtH
SUNfU1BJIDkzIElSUV9UWVBFX0xFVkVMX0hJR0gmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgZ3Bpby1jb250cm9sbGVyOzxicj4NCiZndDsgK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgI2dwaW8tY2VsbHMgPSAmbHQ7MiZndDs7PGJyPg0KJmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncGlvLXJhbmdlcyA9ICZsdDsmYW1w
O3BteDAgMCA3MCA4Jmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGludGVycnVwdC1jb250cm9sbGVyOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgI2ludGVycnVwdC1jZWxscyA9ICZsdDsyJmd0Ozs8YnI+DQomZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2NrcyA9ICZsdDsmYW1wO2NyZ19jdHJsIEhJ
MzY2MF9QQ0xLX0dQSU85Jmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGNsb2NrLW5hbWVzID0gJnF1b3Q7YXBiX3BjbGsmcXVvdDs7PGJyPg0KJmd0OyArwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdGF0dXMgPSAmcXVvdDtvayZxdW90Ozs8YnI+
DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAg
wqAgwqAgwqAgwqAgwqAgwqBncGlvMTA6IGdwaW9AZThhMTUwMDAgezxicj4NCiZndDsgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O2FybSxwbDA2MSZx
dW90OywgJnF1b3Q7YXJtLHByaW1lY2VsbCZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDswIDB4ZThhMTUwMDAgMCAweDEwMDAmZ3Q7Ozxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaW50ZXJydXB0cyA9ICZs
dDtHSUNfU1BJIDk0IElSUV9UWVBFX0xFVkVMX0hJR0gmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ3Bpby1jb250cm9sbGVyOzxicj4NCiZndDsgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgI2dwaW8tY2VsbHMgPSAmbHQ7MiZndDs7PGJyPg0K
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncGlvLXJhbmdlcyA9ICZsdDsm
YW1wO3BteDAgMCA3OCA4Jmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGludGVycnVwdC1jb250cm9sbGVyOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgI2ludGVycnVwdC1jZWxscyA9ICZsdDsyJmd0Ozs8YnI+DQomZ3Q7ICvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2NrcyA9ICZsdDsmYW1wO2NyZ19jdHJs
IEhJMzY2MF9QQ0xLX0dQSU8xMCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBjbG9jay1uYW1lcyA9ICZxdW90O2FwYl9wY2xrJnF1b3Q7Ozxicj4NCiZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3RhdHVzID0gJnF1b3Q7b2smcXVvdDs7
PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsgKzxicj4NCiZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgZ3BpbzExOiBncGlvQGU4YTE2MDAwIHs8YnI+DQomZ3Q7ICvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDthcm0scGww
NjEmcXVvdDssICZxdW90O2FybSxwcmltZWNlbGwmcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MCAweGU4YTE2MDAwIDAgMHgxMDAwJmd0
Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMg
PSAmbHQ7R0lDX1NQSSA5NSBJUlFfVFlQRV9MRVZFTF9ISUdIJmd0Ozs8YnI+DQomZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdwaW8tY29udHJvbGxlcjs8YnI+DQomZ3Q7ICvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNncGlvLWNlbGxzID0gJmx0OzImZ3Q7Ozxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ3Bpby1yYW5nZXMgPSAm
bHQ7JmFtcDtwbXgwIDAgODYgOCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBpbnRlcnJ1cHQtY29udHJvbGxlcjs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCNpbnRlcnJ1cHQtY2VsbHMgPSAmbHQ7MiZndDs7PGJyPg0KJmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjbG9ja3MgPSAmbHQ7JmFtcDtjcmdf
Y3RybCBISTM2NjBfUENMS19HUElPMTEmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgY2xvY2stbmFtZXMgPSAmcXVvdDthcGJfcGNsayZxdW90Ozs8YnI+DQom
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90O29rJnF1
b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICs8YnI+DQom
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoGdwaW8xMjogZ3Bpb0BlOGExNzAwMCB7PGJyPg0KJmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7YXJt
LHBsMDYxJnF1b3Q7LCAmcXVvdDthcm0scHJpbWVjZWxsJnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzAgMHhlOGExNzAwMCAwIDB4MTAw
MCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpbnRlcnJ1
cHRzID0gJmx0O0dJQ19TUEkgOTYgSVJRX1RZUEVfTEVWRUxfSElHSCZndDs7PGJyPg0KJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncGlvLWNvbnRyb2xsZXI7PGJyPg0KJmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjZ3Bpby1jZWxscyA9ICZsdDsyJmd0
Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdwaW8tcmFuZ2Vz
ID0gJmx0OyZhbXA7cG14MCAwIDk0IDMgJmFtcDtwbXgwIDcgMTAxIDEmZ3Q7Ozxicj4NCiZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaW50ZXJydXB0LWNvbnRyb2xsZXI7PGJy
Pg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjaW50ZXJydXB0LWNlbGxz
ID0gJmx0OzImZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
Y2xvY2tzID0gJmx0OyZhbXA7Y3JnX2N0cmwgSEkzNjYwX1BDTEtfR1BJTzEyJmd0Ozs8YnI+DQom
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2NrLW5hbWVzID0gJnF1b3Q7
YXBiX3BjbGsmcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBzdGF0dXMgPSAmcXVvdDtvayZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oH07PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBncGlvMTM6IGdw
aW9AZThhMTgwMDAgezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
Y29tcGF0aWJsZSA9ICZxdW90O2FybSxwbDA2MSZxdW90OywgJnF1b3Q7YXJtLHByaW1lY2VsbCZx
dW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZs
dDswIDB4ZThhMTgwMDAgMCAweDEwMDAmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgaW50ZXJydXB0cyA9ICZsdDtHSUNfU1BJIDk3IElSUV9UWVBFX0xFVkVM
X0hJR0gmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ3Bp
by1jb250cm9sbGVyOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
I2dwaW8tY2VsbHMgPSAmbHQ7MiZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBncGlvLXJhbmdlcyA9ICZsdDsmYW1wO3BteDAgMCAxMDIgOCZndDs7PGJyPg0K
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpbnRlcnJ1cHQtY29udHJvbGxl
cjs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNpbnRlcnJ1cHQt
Y2VsbHMgPSAmbHQ7MiZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBjbG9ja3MgPSAmbHQ7JmFtcDtjcmdfY3RybCBISTM2NjBfUENMS19HUElPMTMmZ3Q7Ozxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xvY2stbmFtZXMgPSAm
cXVvdDthcGJfcGNsayZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoHN0YXR1cyA9ICZxdW90O29rJnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgfTs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoGdwaW8x
NDogZ3Bpb0BlOGExOTAwMCB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7YXJtLHBsMDYxJnF1b3Q7LCAmcXVvdDthcm0scHJpbWVj
ZWxsJnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVn
ID0gJmx0OzAgMHhlOGExOTAwMCAwIDB4MTAwMCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBpbnRlcnJ1cHRzID0gJmx0O0dJQ19TUEkgOTggSVJRX1RZUEVf
TEVWRUxfSElHSCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBncGlvLWNvbnRyb2xsZXI7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAjZ3Bpby1jZWxscyA9ICZsdDsyJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGdwaW8tcmFuZ2VzID0gJmx0OyZhbXA7cG14MCAwIDExMCA4Jmd0Ozs8
YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdC1jb250
cm9sbGVyOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgI2ludGVy
cnVwdC1jZWxscyA9ICZsdDsyJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGNsb2NrcyA9ICZsdDsmYW1wO2NyZ19jdHJsIEhJMzY2MF9QQ0xLX0dQSU8xNCZn
dDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjbG9jay1uYW1l
cyA9ICZxdW90O2FwYl9wY2xrJnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgc3RhdHVzID0gJnF1b3Q7b2smcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqB9Ozxicj4NCiZndDsgKzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
Z3BpbzE1OiBncGlvQGU4YTFhMDAwIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDthcm0scGwwNjEmcXVvdDssICZxdW90O2FybSxw
cmltZWNlbGwmcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqByZWcgPSAmbHQ7MCAweGU4YTFhMDAwIDAgMHgxMDAwJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7R0lDX1NQSSA5OSBJUlFf
VFlQRV9MRVZFTF9ISUdIJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGdwaW8tY29udHJvbGxlcjs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCNncGlvLWNlbGxzID0gJmx0OzImZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgZ3Bpby1yYW5nZXMgPSAmbHQ7JmFtcDtwbXgwIDAgMTE4IDYm
Z3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaW50ZXJydXB0
LWNvbnRyb2xsZXI7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAj
aW50ZXJydXB0LWNlbGxzID0gJmx0OzImZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgY2xvY2tzID0gJmx0OyZhbXA7Y3JnX2N0cmwgSEkzNjYwX1BDTEtfR1BJ
TzE1Jmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2Nr
LW5hbWVzID0gJnF1b3Q7YXBiX3BjbGsmcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBzdGF0dXMgPSAmcXVvdDtvayZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqBncGlvMTY6IGdwaW9AZThhMWIwMDAgezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O2FybSxwbDA2MSZxdW90OywgJnF1b3Q7
YXJtLHByaW1lY2VsbCZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoHJlZyA9ICZsdDswIDB4ZThhMWIwMDAgMCAweDEwMDAmZ3Q7Ozxicj4NCiZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaW50ZXJydXB0cyA9ICZsdDtHSUNfU1BJIDEw
MCBJUlFfVFlQRV9MRVZFTF9ISUdIJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoGdwaW8tY29udHJvbGxlcjs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCNncGlvLWNlbGxzID0gJmx0OzImZ3Q7Ozxicj4NCiZndDsgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaW50ZXJydXB0LWNvbnRyb2xsZXI7PGJyPg0KJmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjaW50ZXJydXB0LWNlbGxzID0gJmx0
OzImZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xvY2tz
ID0gJmx0OyZhbXA7Y3JnX2N0cmwgSEkzNjYwX1BDTEtfR1BJTzE2Jmd0Ozs8YnI+DQomZ3Q7ICvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2NrLW5hbWVzID0gJnF1b3Q7YXBiX3Bj
bGsmcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdGF0
dXMgPSAmcXVvdDtvayZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJy
Pg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBncGlvMTc6IGdwaW9AZThh
MWMwMDAgezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0
aWJsZSA9ICZxdW90O2FybSxwbDA2MSZxdW90OywgJnF1b3Q7YXJtLHByaW1lY2VsbCZxdW90Ozs8
YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDswIDB4
ZThhMWMwMDAgMCAweDEwMDAmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgaW50ZXJydXB0cyA9ICZsdDtHSUNfU1BJIDEwMSBJUlFfVFlQRV9MRVZFTF9ISUdI
Jmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdwaW8tY29u
dHJvbGxlcjs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNncGlv
LWNlbGxzID0gJmx0OzImZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgaW50ZXJydXB0LWNvbnRyb2xsZXI7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAjaW50ZXJydXB0LWNlbGxzID0gJmx0OzImZ3Q7Ozxicj4NCiZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xvY2tzID0gJmx0OyZhbXA7Y3JnX2N0cmwg
SEkzNjYwX1BDTEtfR1BJTzE3Jmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGNsb2NrLW5hbWVzID0gJnF1b3Q7YXBiX3BjbGsmcXVvdDs7PGJyPg0KJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdGF0dXMgPSAmcXVvdDtvayZxdW90Ozs8
YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyArPGJyPg0KJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqBncGlvMTg6IGdwaW9AZmYzYjQwMDAgezxicj4NCiZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O2FybSxwbDA2
MSZxdW90OywgJnF1b3Q7YXJtLHByaW1lY2VsbCZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDswIDB4ZmYzYjQwMDAgMCAweDEwMDAmZ3Q7
Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaW50ZXJydXB0cyA9
ICZsdDtHSUNfU1BJIDEwMiBJUlFfVFlQRV9MRVZFTF9ISUdIJmd0Ozs8YnI+DQomZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdwaW8tY29udHJvbGxlcjs8YnI+DQomZ3Q7ICvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNncGlvLWNlbGxzID0gJmx0OzImZ3Q7Ozxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ3Bpby1yYW5nZXMgPSAm
bHQ7JmFtcDtwbXgyIDAgMCA4Jmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGludGVycnVwdC1jb250cm9sbGVyOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgI2ludGVycnVwdC1jZWxscyA9ICZsdDsyJmd0Ozs8YnI+DQomZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2NrcyA9ICZsdDsmYW1wO2NyZ19j
dHJsIEhJMzY2MF9QQ0xLX0dQSU8xOCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBjbG9jay1uYW1lcyA9ICZxdW90O2FwYl9wY2xrJnF1b3Q7Ozxicj4NCiZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3RhdHVzID0gJnF1b3Q7b2smcXVv
dDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsgKzxicj4NCiZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgZ3BpbzE5OiBncGlvQGZmM2I1MDAwIHs8YnI+DQomZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDthcm0s
cGwwNjEmcXVvdDssICZxdW90O2FybSxwcmltZWNlbGwmcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MCAweGZmM2I1MDAwIDAgMHgxMDAw
Jmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVw
dHMgPSAmbHQ7R0lDX1NQSSAxMDMgSVJRX1RZUEVfTEVWRUxfSElHSCZndDs7PGJyPg0KJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncGlvLWNvbnRyb2xsZXI7PGJyPg0KJmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjZ3Bpby1jZWxscyA9ICZsdDsyJmd0
Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdwaW8tcmFuZ2Vz
ID0gJmx0OyZhbXA7cG14MiAwIDggNCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBpbnRlcnJ1cHQtY29udHJvbGxlcjs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNpbnRlcnJ1cHQtY2VsbHMgPSAmbHQ7MiZndDs7PGJyPg0K
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjbG9ja3MgPSAmbHQ7JmFtcDtj
cmdfY3RybCBISTM2NjBfUENMS19HUElPMTkmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgY2xvY2stbmFtZXMgPSAmcXVvdDthcGJfcGNsayZxdW90Ozs8YnI+
DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90O29r
JnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICs8YnI+
DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoGdwaW8yMDogZ3Bpb0BlOGExZjAwMCB7PGJyPg0K
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7
YXJtLHBsMDYxJnF1b3Q7LCAmcXVvdDthcm0scHJpbWVjZWxsJnF1b3Q7Ozxicj4NCiZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzAgMHhlOGExZjAwMCAwIDB4
MTAwMCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpbnRl
cnJ1cHRzID0gJmx0O0dJQ19TUEkgMTA0IElSUV9UWVBFX0xFVkVMX0hJR0gmZ3Q7Ozxicj4NCiZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZ3Bpby1jb250cm9sbGVyOzxicj4N
CiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgI2dwaW8tY2VsbHMgPSAmbHQ7
MiZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncGlvLXJh
bmdlcyA9ICZsdDsmYW1wO3BteDEgMCAwIDYmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgaW50ZXJydXB0LWNvbnRyb2xsZXI7PGJyPg0KJmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjaW50ZXJydXB0LWNlbGxzID0gJmx0OzImZ3Q7Ozxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xvY2tzID0gJmx0OyZh
bXA7Y3JnX2N0cmwgSEkzNjYwX1BDTEtfR1BJTzIwJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2NrLW5hbWVzID0gJnF1b3Q7YXBiX3BjbGsmcXVvdDs7
PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdGF0dXMgPSAmcXVv
dDtvayZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyAr
PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBncGlvMjE6IGdwaW9AZThhMjAwMDAgezxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZx
dW90O2FybSxwbDA2MSZxdW90OywgJnF1b3Q7YXJtLHByaW1lY2VsbCZxdW90Ozs8YnI+DQomZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDswIDB4ZThhMjAwMDAg
MCAweDEwMDAmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
aW50ZXJydXB0cyA9ICZsdDtHSUNfU1BJIDEwNSBJUlFfVFlQRV9MRVZFTF9ISUdIJmd0Ozs8YnI+
DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdwaW8tY29udHJvbGxlcjs8
YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNncGlvLWNlbGxzID0g
Jmx0OzImZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaW50
ZXJydXB0LWNvbnRyb2xsZXI7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAjaW50ZXJydXB0LWNlbGxzID0gJmx0OzImZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgZ3Bpby1yYW5nZXMgPSAmbHQ7JmFtcDtwbXgzIDAgMCA2Jmd0
Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2NrcyA9ICZs
dDsmYW1wO2NyZ19jdHJsIEhJMzY2MF9QQ0xLX0dQSU8yMSZndDs7PGJyPg0KJmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjbG9jay1uYW1lcyA9ICZxdW90O2FwYl9wY2xrJnF1
b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3RhdHVzID0g
JnF1b3Q7b2smcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZn
dDsgKzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgZ3BpbzIyOiBncGlvQGZmZjBiMDAw
IHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUg
PSAmcXVvdDthcm0scGwwNjEmcXVvdDssICZxdW90O2FybSxwcmltZWNlbGwmcXVvdDs7PGJyPg0K
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MCAweGZmZjBi
MDAwIDAgMHgxMDAwJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGludGVycnVwdHMgPSAmbHQ7R0lDX1NQSSAxMDYgSVJRX1RZUEVfTEVWRUxfSElHSCZndDs7
PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncGlvLWNvbnRyb2xs
ZXI7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjZ3Bpby1jZWxs
cyA9ICZsdDsyJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oC8qIEdQSU8xNzYgKi88YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGdwaW8tcmFuZ2VzID0gJmx0OyZhbXA7cG14NCAyIDAgNiZndDs7PGJyPg0KJmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpbnRlcnJ1cHQtY29udHJvbGxlcjs8YnI+DQomZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNpbnRlcnJ1cHQtY2VsbHMgPSAmbHQ7
MiZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjbG9ja3Mg
PSAmbHQ7JmFtcDtzY3RybCBISTM2NjBfUENMS19BT19HUElPMCZndDs7PGJyPg0KJmd0OyArwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjbG9jay1uYW1lcyA9ICZxdW90O2FwYl9wY2xr
JnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3RhdHVz
ID0gJnF1b3Q7b2smcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4N
CiZndDsgKzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgZ3BpbzIzOiBncGlvQGZmZjBj
MDAwIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGli
bGUgPSAmcXVvdDthcm0scGwwNjEmcXVvdDssICZxdW90O2FybSxwcmltZWNlbGwmcXVvdDs7PGJy
Pg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MCAweGZm
ZjBjMDAwIDAgMHgxMDAwJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGludGVycnVwdHMgPSAmbHQ7R0lDX1NQSSAxMDcgSVJRX1RZUEVfTEVWRUxfSElHSCZn
dDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncGlvLWNvbnRy
b2xsZXI7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjZ3Bpby1j
ZWxscyA9ICZsdDsyJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoC8qIEdQSU8xODQgKi88YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGdwaW8tcmFuZ2VzID0gJmx0OyZhbXA7cG14NCAwIDYgNyZndDs7PGJyPg0KJmd0OyArwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpbnRlcnJ1cHQtY29udHJvbGxlcjs8YnI+DQom
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNpbnRlcnJ1cHQtY2VsbHMgPSAm
bHQ7MiZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjbG9j
a3MgPSAmbHQ7JmFtcDtzY3RybCBISTM2NjBfUENMS19BT19HUElPMSZndDs7PGJyPg0KJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjbG9jay1uYW1lcyA9ICZxdW90O2FwYl9w
Y2xrJnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3Rh
dHVzID0gJnF1b3Q7b2smcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxi
cj4NCiZndDsgKzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIGdwaW8yNDogZ3Bpb0Bm
ZmYwZDAwMCB7PGJyPg0KPGJyPg0KPC9kaXY+PC9kaXY+ZXh0cmEgc3BhY2XCoCDCoCDCoF48YnI+
PC9ibG9ja3F1b3RlPjxkaXY+PGJyPjwvZGl2PjxkaXY+VGhhbmtzLCBSb2IuIEkgd2lsbCBmaXgu
wqA8L2Rpdj48L2Rpdj48YnI+PC9kaXY+PC9kaXY+DQo=
--001a11423c325eab7305502f2706--
