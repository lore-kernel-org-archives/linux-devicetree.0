Return-Path: <jon.mason@broadcom.com>
MIME-Version: 1.0
In-Reply-To: <57353761.5020409@huawei.com>
References: <1463007369-13071-1-git-send-email-jonmason@broadcom.com>
	<57341FCE.6050403@huawei.com>
	<CAC3K-4qbkt3DCgd6qurNo3V+++x70bbFC--aunR0DbCTBvBNZg@mail.gmail.com>
	<57353761.5020409@huawei.com>
Date: Fri, 13 May 2016 12:49:34 -0400
Message-ID: <CAC3K-4oXcwR--879sCFR=MCG1Uman7DoGvaHLVXWr+0QH2WeJg@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: NS2: Add all of the UARTs
From: Jon Mason <jon.mason@broadcom.com>
Content-Type: multipart/alternative; boundary=089e013cc03043840b0532bc0fb2
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

--089e013cc03043840b0532bc0fb2
Content-Type: text/plain; charset=UTF-8

On Thu, May 12, 2016 at 10:09 PM, Kefeng Wang <wangkefeng.wang@huawei.com>
wrote:

>
>
> On 2016/5/12 22:46, Jon Mason wrote:
> >
> >
> > On Thu, May 12, 2016 at 2:16 AM, Kefeng Wang <wangkefeng.wang@huawei.com
> <mailto:wangkefeng.wang@huawei.com>> wrote:
> >
> >
> >
> >     On 2016/5/12 6:56, Jon Mason wrote:
> >     > Add all of the UARTs present on NS2 and enable them in the SVK
> device
> >     > tree file.  Also, do some magic to make sure that uart3 is
> discovered as
> >     > ttyS0 (as that is the console UART).
> >     >
> >     > Signed-off-by: Jon Mason <jonmason@broadcom.com <mailto:
> jonmason@broadcom.com>>
> >     > ---
> >     >  arch/arm64/boot/dts/broadcom/ns2-svk.dts | 16 ++++++++++++++++
> >     >  arch/arm64/boot/dts/broadcom/ns2.dtsi    | 30
> ++++++++++++++++++++++++++++++
> >     >  2 files changed, 46 insertions(+)
> >     >
> >     > diff --git a/arch/arm64/boot/dts/broadcom/ns2-svk.dts
> b/arch/arm64/boot/dts/broadcom/ns2-svk.dts
> >     > index 7cd3640..b062a44 100644
> >     > --- a/arch/arm64/boot/dts/broadcom/ns2-svk.dts
> >     > +++ b/arch/arm64/boot/dts/broadcom/ns2-svk.dts
> >     > @@ -40,10 +40,14 @@
> >     >
> >     >       aliases {
> >     >               serial0 = &uart3;
> >     > +             serial1 = &uart0;
> >     > +             serial2 = &uart1;
> >     > +             serial3 = &uart2;
> >     >       };
> >     >
> >     >       chosen {
> >     >               stdout-path = "serial0:115200n8";
> >     > +             bootargs = "earlycon=uart8250,mmio32,0x66130000";
> >
> >     Hi Jon,
> >
> >     I submit a patch[1], with it, we can use earlycon without option to
> enable early console
> >     for "snps,dw-apb-uart", could you help me to test it, thanks.
> >
> >
> > Adding your change and removing the line above does not cause earlycon
> to work for me.  Is there any additional changes necessary for this to work?
> With my patch, the bootargs still need contain earlycon, but no need
> uart8250,mmio32,0x66130000;
>
> chosen {
>         stdout-path = "serial0:115200n8";
>         bootargs = "earlycon";
> }
>
> Hope it would work.
>

I can confirm that with your change and the change to the bootargs you
describe above, it works as desired.  Was your change already accepted?

Thanks,
Jon


>
> BRs,
> Kefeng
>
> >
> > Thanks,
> > Jon
> >
> >
> >
> >     BRs,
> >     Kefeng
> >
> >
> >     [1] https://lkml.org/lkml/2016/5/11/34
> >
> >     >       };
> >     >
> >     >       memory {
> >     > @@ -68,6 +72,18 @@
> >     >       status = "ok";
> >     >  };
> >     >
> >     > +&uart0 {
> >     > +     status = "ok";
> >     > +};
> >     > +
> >     > +&uart1 {
> >     > +     status = "ok";
> >     > +};
> >     > +
> >     > +&uart2 {
> >     > +     status = "ok";
> >     > +};
> >     > +
> >     >  &uart3 {
> >     >       status = "ok";
> >     >  };
> >     > diff --git a/arch/arm64/boot/dts/broadcom/ns2.dtsi
> b/arch/arm64/boot/dts/broadcom/ns2.dtsi
> >     > index 788ed8f..c77a9e8 100644
> >     > --- a/arch/arm64/boot/dts/broadcom/ns2.dtsi
> >     > +++ b/arch/arm64/boot/dts/broadcom/ns2.dtsi
> >     > @@ -357,6 +357,36 @@
> >     >                       status = "disabled";
> >     >               };
> >     >
> >     > +             uart0: serial@66100000 {
> >     > +                     compatible = "snps,dw-apb-uart";
> >     > +                     reg = <0x66100000 0x100>;
> >     > +                     interrupts = <GIC_SPI 390
> IRQ_TYPE_LEVEL_HIGH>;
> >     > +                     clocks = <&iprocslow>;
> >     > +                     reg-shift = <2>;
> >     > +                     reg-io-width = <4>;
> >     > +                     status = "disabled";
> >     > +             };
> >     > +
> >     > +             uart1: serial@66110000 {
> >     > +                     compatible = "snps,dw-apb-uart";
> >     > +                     reg = <0x66110000 0x100>;
> >     > +                     interrupts = <GIC_SPI 391
> IRQ_TYPE_LEVEL_HIGH>;
> >     > +                     clocks = <&iprocslow>;
> >     > +                     reg-shift = <2>;
> >     > +                     reg-io-width = <4>;
> >     > +                     status = "disabled";
> >     > +             };
> >     > +
> >     > +             uart2: serial@66120000 {
> >     > +                     compatible = "snps,dw-apb-uart";
> >     > +                     reg = <0x66120000 0x100>;
> >     > +                     interrupts = <GIC_SPI 392
> IRQ_TYPE_LEVEL_HIGH>;
> >     > +                     clocks = <&iprocslow>;
> >     > +                     reg-shift = <2>;
> >     > +                     reg-io-width = <4>;
> >     > +                     status = "disabled";
> >     > +             };
> >     > +
> >     >               uart3: serial@66130000 {
> >     >                       compatible = "snps,dw-apb-uart";
> >     >                       reg = <0x66130000 0x100>;
> >     >
> >
> >
>
>

--089e013cc03043840b0532bc0fb2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX2V4dHJhIj48YnI+PGRpdiBjbGFz
cz0iZ21haWxfcXVvdGUiPk9uIFRodSwgTWF5IDEyLCAyMDE2IGF0IDEwOjA5IFBNLCBLZWZlbmcg
V2FuZyA8c3BhbiBkaXI9Imx0ciI+Jmx0OzxhIGhyZWY9Im1haWx0bzp3YW5na2VmZW5nLndhbmdA
aHVhd2VpLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPndhbmdrZWZlbmcud2FuZ0BodWF3ZWkuY29tPC9h
PiZndDs8L3NwYW4+IHdyb3RlOjxicj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0
eWxlPSJtYXJnaW46MCAwIDAgLjhleDtib3JkZXItbGVmdDoxcHggI2NjYyBzb2xpZDtwYWRkaW5n
LWxlZnQ6MWV4Ij48ZGl2IGNsYXNzPSJIT0VuWmIiPjxkaXYgY2xhc3M9Img1Ij48YnI+DQo8YnI+
DQpPbiAyMDE2LzUvMTIgMjI6NDYsIEpvbiBNYXNvbiB3cm90ZTo8YnI+DQomZ3Q7PGJyPg0KJmd0
Ozxicj4NCiZndDsgT24gVGh1LCBNYXkgMTIsIDIwMTYgYXQgMjoxNiBBTSwgS2VmZW5nIFdhbmcg
Jmx0OzxhIGhyZWY9Im1haWx0bzp3YW5na2VmZW5nLndhbmdAaHVhd2VpLmNvbSI+d2FuZ2tlZmVu
Zy53YW5nQGh1YXdlaS5jb208L2E+ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOndhbmdrZWZl
bmcud2FuZ0BodWF3ZWkuY29tIj53YW5na2VmZW5nLndhbmdAaHVhd2VpLmNvbTwvYT4mZ3Q7Jmd0
OyB3cm90ZTo8YnI+DQomZ3Q7PGJyPg0KJmd0Ozxicj4NCiZndDs8YnI+DQomZ3Q7wqAgwqAgwqBP
biAyMDE2LzUvMTIgNjo1NiwgSm9uIE1hc29uIHdyb3RlOjxicj4NCiZndDvCoCDCoCDCoCZndDsg
QWRkIGFsbCBvZiB0aGUgVUFSVHMgcHJlc2VudCBvbiBOUzIgYW5kIGVuYWJsZSB0aGVtIGluIHRo
ZSBTVksgZGV2aWNlPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyB0cmVlIGZpbGUuwqAgQWxzbywgZG8g
c29tZSBtYWdpYyB0byBtYWtlIHN1cmUgdGhhdCB1YXJ0MyBpcyBkaXNjb3ZlcmVkIGFzPGJyPg0K
Jmd0O8KgIMKgIMKgJmd0OyB0dHlTMCAoYXMgdGhhdCBpcyB0aGUgY29uc29sZSBVQVJUKS48YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyBTaWduZWQtb2ZmLWJ5OiBK
b24gTWFzb24gJmx0OzxhIGhyZWY9Im1haWx0bzpqb25tYXNvbkBicm9hZGNvbS5jb20iPmpvbm1h
c29uQGJyb2FkY29tLmNvbTwvYT4gJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86am9ubWFzb25A
YnJvYWRjb20uY29tIj5qb25tYXNvbkBicm9hZGNvbS5jb208L2E+Jmd0OyZndDs8YnI+DQomZ3Q7
wqAgwqAgwqAmZ3Q7IC0tLTxicj4NCiZndDvCoCDCoCDCoCZndDvCoCBhcmNoL2FybTY0L2Jvb3Qv
ZHRzL2Jyb2FkY29tL25zMi1zdmsuZHRzIHwgMTYgKysrKysrKysrKysrKysrKzxicj4NCiZndDvC
oCDCoCDCoCZndDvCoCBhcmNoL2FybTY0L2Jvb3QvZHRzL2Jyb2FkY29tL25zMi5kdHNpwqAgwqAg
fCAzMCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKys8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7
wqAgMiBmaWxlcyBjaGFuZ2VkLCA0NiBpbnNlcnRpb25zKCspPGJyPg0KJmd0O8KgIMKgIMKgJmd0
Ozxicj4NCiZndDvCoCDCoCDCoCZndDsgZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMv
YnJvYWRjb20vbnMyLXN2ay5kdHMgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2Jyb2FkY29tL25zMi1z
dmsuZHRzPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyBpbmRleCA3Y2QzNjQwLi5iMDYyYTQ0IDEwMDY0
NDxicj4NCiZndDvCoCDCoCDCoCZndDsgLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9icm9hZGNv
bS9uczItc3ZrLmR0czxicj4NCiZndDvCoCDCoCDCoCZndDsgKysrIGIvYXJjaC9hcm02NC9ib290
L2R0cy9icm9hZGNvbS9uczItc3ZrLmR0czxicj4NCiZndDvCoCDCoCDCoCZndDsgQEAgLTQwLDEw
ICs0MCwxNCBAQDxicj4NCiZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAg
wqAgwqAgwqBhbGlhc2VzIHs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBzZXJpYWwwID0gJmFtcDt1YXJ0Mzs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDC
oCDCoCDCoCDCoCDCoHNlcmlhbDEgPSAmYW1wO3VhcnQwOzxicj4NCiZndDvCoCDCoCDCoCZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgc2VyaWFsMiA9ICZhbXA7dWFydDE7PGJyPg0KJmd0O8KgIMKg
IMKgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBzZXJpYWwzID0gJmFtcDt1YXJ0Mjs8YnI+DQom
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqB9Ozxicj4NCiZndDvCoCDCoCDCoCZndDs8YnI+DQom
Z3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBjaG9zZW4gezxicj4NCiZndDvCoCDCoCDCoCZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0ZG91dC1wYXRoID0gJnF1b3Q7c2VyaWFsMDoxMTUyMDBu
OCZxdW90Ozs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoGJvb3Rh
cmdzID0gJnF1b3Q7ZWFybHljb249dWFydDgyNTAsbW1pbzMyLDB4NjYxMzAwMDAmcXVvdDs7PGJy
Pg0KJmd0Ozxicj4NCiZndDvCoCDCoCDCoEhpIEpvbiw8YnI+DQomZ3Q7PGJyPg0KJmd0O8KgIMKg
IMKgSSBzdWJtaXQgYSBwYXRjaFsxXSwgd2l0aCBpdCwgd2UgY2FuIHVzZSBlYXJseWNvbiB3aXRo
b3V0IG9wdGlvbiB0byBlbmFibGUgZWFybHkgY29uc29sZTxicj4NCiZndDvCoCDCoCDCoGZvciAm
cXVvdDtzbnBzLGR3LWFwYi11YXJ0JnF1b3Q7LCBjb3VsZCB5b3UgaGVscCBtZSB0byB0ZXN0IGl0
LCB0aGFua3MuPGJyPg0KJmd0Ozxicj4NCiZndDs8YnI+DQomZ3Q7IEFkZGluZyB5b3VyIGNoYW5n
ZSBhbmQgcmVtb3ZpbmcgdGhlIGxpbmUgYWJvdmUgZG9lcyBub3QgY2F1c2UgZWFybHljb24gdG8g
d29yayBmb3IgbWUuwqAgSXMgdGhlcmUgYW55IGFkZGl0aW9uYWwgY2hhbmdlcyBuZWNlc3Nhcnkg
Zm9yIHRoaXMgdG8gd29yaz88YnI+DQo8L2Rpdj48L2Rpdj5XaXRoIG15IHBhdGNoLCB0aGUgYm9v
dGFyZ3Mgc3RpbGwgbmVlZCBjb250YWluIGVhcmx5Y29uLCBidXQgbm8gbmVlZCB1YXJ0ODI1MCxt
bWlvMzIsMHg2NjEzMDAwMDs8YnI+DQo8c3BhbiBjbGFzcz0iIj48YnI+DQpjaG9zZW4gezxicj4N
CsKgIMKgIMKgIMKgIHN0ZG91dC1wYXRoID0gJnF1b3Q7c2VyaWFsMDoxMTUyMDBuOCZxdW90Ozs8
YnI+DQo8L3NwYW4+wqAgwqAgwqAgwqAgYm9vdGFyZ3MgPSAmcXVvdDtlYXJseWNvbiZxdW90Ozs8
YnI+DQp9PGJyPg0KPGJyPg0KSG9wZSBpdCB3b3VsZCB3b3JrLjxicj48L2Jsb2NrcXVvdGU+PGRp
dj48YnI+PC9kaXY+PGRpdj5JIGNhbiBjb25maXJtIHRoYXQgd2l0aCB5b3VyIGNoYW5nZSBhbmQg
dGhlIGNoYW5nZSB0byB0aGUgYm9vdGFyZ3MgeW91IGRlc2NyaWJlIGFib3ZlLCBpdCB3b3JrcyBh
cyBkZXNpcmVkLsKgIFdhcyB5b3VyIGNoYW5nZSBhbHJlYWR5IGFjY2VwdGVkPzwvZGl2PjxkaXY+
PGJyPjwvZGl2PjxkaXY+VGhhbmtzLDwvZGl2PjxkaXY+Sm9uPC9kaXY+PGRpdj7CoDwvZGl2Pjxi
bG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowIDAgMCAuOGV4O2Jv
cmRlci1sZWZ0OjFweCAjY2NjIHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPg0KPGJyPg0KQlJzLDxi
cj4NCktlZmVuZzxicj4NCjxicj4NCiZndDs8YnI+DQomZ3Q7IFRoYW5rcyw8YnI+DQomZ3Q7IEpv
bjxicj4NCiZndDs8YnI+DQomZ3Q7PGJyPg0KJmd0Ozxicj4NCiZndDvCoCDCoCDCoEJScyw8YnI+
DQomZ3Q7wqAgwqAgwqBLZWZlbmc8YnI+DQomZ3Q7PGJyPg0KJmd0Ozxicj4NCiZndDvCoCDCoCDC
oFsxXSA8YSBocmVmPSJodHRwczovL2xrbWwub3JnL2xrbWwvMjAxNi81LzExLzM0IiByZWw9Im5v
cmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2xrbWwub3JnL2xrbWwvMjAxNi81LzEx
LzM0PC9hPjxicj4NCiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqB9Ozxicj4N
CiZndDvCoCDCoCDCoCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7wqAgwqAgwqAgwqBtZW1vcnkg
ezxicj4NCiZndDvCoCDCoCDCoCZndDsgQEAgLTY4LDYgKzcyLDE4IEBAPGJyPg0KJmd0O8KgIMKg
IMKgJmd0O8KgIMKgIMKgIMKgc3RhdHVzID0gJnF1b3Q7b2smcXVvdDs7PGJyPg0KJmd0O8KgIMKg
IMKgJmd0O8KgIH07PGJyPg0KJmd0O8KgIMKgIMKgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCZndDsg
KyZhbXA7dWFydDAgezxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgc3RhdHVzID0gJnF1
b3Q7b2smcXVvdDs7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArfTs8YnI+DQomZ3Q7wqAgwqAgwqAm
Z3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICsmYW1wO3VhcnQxIHs8YnI+DQomZ3Q7wqAgwqAg
wqAmZ3Q7ICvCoCDCoCDCoHN0YXR1cyA9ICZxdW90O29rJnF1b3Q7Ozxicj4NCiZndDvCoCDCoCDC
oCZndDsgK307PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyAr
JmFtcDt1YXJ0MiB7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqBzdGF0dXMgPSAmcXVv
dDtvayZxdW90Ozs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICt9Ozxicj4NCiZndDvCoCDCoCDCoCZn
dDsgKzxicj4NCiZndDvCoCDCoCDCoCZndDvCoCAmYW1wO3VhcnQzIHs8YnI+DQomZ3Q7wqAgwqAg
wqAmZ3Q7wqAgwqAgwqAgwqBzdGF0dXMgPSAmcXVvdDtvayZxdW90Ozs8YnI+DQomZ3Q7wqAgwqAg
wqAmZ3Q7wqAgfTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0
L2Jvb3QvZHRzL2Jyb2FkY29tL25zMi5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9icm9hZGNv
bS9uczIuZHRzaTxicj4NCiZndDvCoCDCoCDCoCZndDsgaW5kZXggNzg4ZWQ4Zi4uYzc3YTllOCAx
MDA2NDQ8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYnJv
YWRjb20vbnMyLmR0c2k8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICsrKyBiL2FyY2gvYXJtNjQvYm9v
dC9kdHMvYnJvYWRjb20vbnMyLmR0c2k8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7IEBAIC0zNTcsNiAr
MzU3LDM2IEBAPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgc3RhdHVzID0gJnF1b3Q7ZGlzYWJsZWQmcXVvdDs7PGJyPg0KJmd0O8KgIMKgIMKg
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqB1YXJ0MDogc2VyaWFsQDY2MTAw
MDAwIHs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGNvbXBhdGlibGUgPSAmcXVvdDtzbnBzLGR3LWFwYi11YXJ0JnF1b3Q7Ozxicj4NCiZndDvC
oCDCoCDCoCZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4
NjYxMDAwMDAgMHgxMDAmZ3Q7Ozxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgaW50ZXJydXB0cyA9ICZsdDtHSUNfU1BJIDM5MCBJUlFfVFlQRV9M
RVZFTF9ISUdIJmd0Ozs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoGNsb2NrcyA9ICZsdDsmYW1wO2lwcm9jc2xvdyZndDs7PGJyPg0KJmd0O8Kg
IMKgIMKgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWctc2hpZnQgPSAm
bHQ7MiZndDs7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqByZWctaW8td2lkdGggPSAmbHQ7NCZndDs7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdGF0dXMgPSAmcXVvdDtkaXNhYmxlZCZx
dW90Ozs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0K
Jmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqB1YXJ0MTogc2VyaWFsQDY2MTEwMDAwIHs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDtzbnBzLGR3LWFw
Yi11YXJ0JnF1b3Q7Ozxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4NjYxMTAwMDAgMHgxMDAmZ3Q7Ozxicj4NCiZndDvCoCDC
oCDCoCZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaW50ZXJydXB0cyA9ICZs
dDtHSUNfU1BJIDM5MSBJUlFfVFlQRV9MRVZFTF9ISUdIJmd0Ozs8YnI+DQomZ3Q7wqAgwqAgwqAm
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2NrcyA9ICZsdDsmYW1wO2lw
cm9jc2xvdyZndDs7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqByZWctc2hpZnQgPSAmbHQ7MiZndDs7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWctaW8td2lkdGggPSAmbHQ7NCZndDs7
PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBz
dGF0dXMgPSAmcXVvdDtkaXNhYmxlZCZxdW90Ozs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArPGJyPg0KJmd0O8KgIMKg
IMKgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqB1YXJ0Mjogc2VyaWFsQDY2MTIwMDAwIHs8YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBh
dGlibGUgPSAmcXVvdDtzbnBzLGR3LWFwYi11YXJ0JnF1b3Q7Ozxicj4NCiZndDvCoCDCoCDCoCZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4NjYxMjAwMDAg
MHgxMDAmZ3Q7Ozxicj4NCiZndDvCoCDCoCDCoCZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgaW50ZXJydXB0cyA9ICZsdDtHSUNfU1BJIDM5MiBJUlFfVFlQRV9MRVZFTF9ISUdI
Jmd0Ozs8YnI+DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGNsb2NrcyA9ICZsdDsmYW1wO2lwcm9jc2xvdyZndDs7PGJyPg0KJmd0O8KgIMKgIMKgJmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWctc2hpZnQgPSAmbHQ7MiZndDs7
PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBy
ZWctaW8td2lkdGggPSAmbHQ7NCZndDs7PGJyPg0KJmd0O8KgIMKgIMKgJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdGF0dXMgPSAmcXVvdDtkaXNhYmxlZCZxdW90Ozs8YnI+
DQomZ3Q7wqAgwqAgwqAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0O8KgIMKg
IMKgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdWFy
dDM6IHNlcmlhbEA2NjEzMDAwMCB7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O3NucHMsZHctYXBiLXVhcnQm
cXVvdDs7PGJyPg0KJmd0O8KgIMKgIMKgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgcmVnID0gJmx0OzB4NjYxMzAwMDAgMHgxMDAmZ3Q7Ozxicj4NCiZndDvCoCDCoCDCoCZn
dDs8YnI+DQomZ3Q7PGJyPg0KJmd0Ozxicj4NCjxicj4NCjwvYmxvY2txdW90ZT48L2Rpdj48YnI+
PC9kaXY+PC9kaXY+DQo=
--089e013cc03043840b0532bc0fb2--
