Return-Path: <cedric.madianga@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20151116032758.GS25173@localhost>
References: <1445003956-9150-1-git-send-email-cedric.madianga@gmail.com>
	<1445003956-9150-4-git-send-email-cedric.madianga@gmail.com>
	<20151116032758.GS25173@localhost>
Date: Mon, 16 Nov 2015 13:16:56 +0100
Message-ID: <CAOAejn01G+HKOfvxfGNzimqeOSQXidD9yY=eShkeW_fFDAC4Zw@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] ARM: dts: Add STM32 DMA support for STM32F429 MCU
From: "M'boumba Cedric Madianga" <cedric.madianga@gmail.com>
Content-Type: multipart/alternative; boundary=001a1134ae6ca54b4e0524a76235
To: Vinod Koul <vinod.koul@intel.com>
Cc: linux@arm.linux.org.uk, Kumar Gala <galak@codeaurora.org>, dmaengine@vger.kernel.org, ijc+devicetree@hellion.org.uk, mark.rutland@arm.com, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, pawel.moll@arm.com, mcoquelin.stm32@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

--001a1134ae6ca54b4e0524a76235
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Vinod,

Le 16 nov. 2015 04:24, "Vinod Koul" <vinod.koul@intel.com> a =C3=A9crit :
>
> On Fri, Oct 16, 2015 at 03:59:15PM +0200, M'boumba Cedric Madianga wrote:
> > This patch adds STM32 DMA bindings for STM32F429.
>
> I need an ACK from ARM folks on this one, and I suspect this might need
> rebase on 4.4-rc1

Maxime will take this patch and the other one about defconfig as he is the
maintainer of STM32 machine.

I think you don't need to take it into account..

BR,
Cedric
>
> >
> > Signed-off-by: M'boumba Cedric Madianga <cedric.madianga@gmail.com>
> > ---
> >  arch/arm/boot/dts/stm32f429.dtsi | 31 +++++++++++++++++++++++++++++++
> >  1 file changed, 31 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/stm32f429.dtsi
b/arch/arm/boot/dts/stm32f429.dtsi
> > index d78a481..037eb29 100644
> > --- a/arch/arm/boot/dts/stm32f429.dtsi
> > +++ b/arch/arm/boot/dts/stm32f429.dtsi
> > @@ -174,6 +174,37 @@
> >                       reg =3D <0x40023800 0x400>;
> >                       clocks =3D <&clk_hse>;
> >               };
> > +
> > +             dma1: dma-controller@40026000 {
> > +                     compatible =3D "st,stm32-dma";
> > +                     reg =3D <0x40026000 0x400>;
> > +                     interrupts =3D <11>,
> > +                                  <12>,
> > +                                  <13>,
> > +                                  <14>,
> > +                                  <15>,
> > +                                  <16>,
> > +                                  <17>,
> > +                                  <47>;
> > +                     clocks =3D <&rcc 0 21>;
> > +                     #dma-cells =3D <4>;
> > +             };
> > +
> > +             dma2: dma-controller@40026400 {
> > +                     compatible =3D "st,stm32-dma";
> > +                     reg =3D <0x40026400 0x400>;
> > +                     interrupts =3D <56>,
> > +                                  <57>,
> > +                                  <58>,
> > +                                  <59>,
> > +                                  <60>,
> > +                                  <68>,
> > +                                  <69>,
> > +                                  <70>;
> > +                     clocks =3D <&rcc 0 22>;
> > +                     #dma-cells =3D <4>;
> > +                     st,mem2mem;
> > +             };
> >       };
> >  };
> >
> > --
> > 1.9.1
> >
>
> --
> ~Vinod

--001a1134ae6ca54b4e0524a76235
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PHAgZGlyPSJsdHIiPkhpIFZpbm9kLDwvcD4NCjxwIGRpcj0ibHRyIj5MZcKgMTYgbm92LiAyMDE1
IDA0OjI0LCAmcXVvdDtWaW5vZCBLb3VsJnF1b3Q7ICZsdDs8YSBocmVmPSJtYWlsdG86dmlub2Qu
a291bEBpbnRlbC5jb20iPnZpbm9kLmtvdWxAaW50ZWwuY29tPC9hPiZndDsgYSDDqWNyaXTCoDo8
YnI+DQomZ3Q7PGJyPg0KJmd0OyBPbiBGcmksIE9jdCAxNiwgMjAxNSBhdCAwMzo1OToxNVBNICsw
MjAwLCBNJiMzOTtib3VtYmEgQ2VkcmljIE1hZGlhbmdhIHdyb3RlOjxicj4NCiZndDsgJmd0OyBU
aGlzIHBhdGNoIGFkZHMgU1RNMzIgRE1BIGJpbmRpbmdzIGZvciBTVE0zMkY0MjkuPGJyPg0KJmd0
Ozxicj4NCiZndDsgSSBuZWVkIGFuIEFDSyBmcm9tIEFSTSBmb2xrcyBvbiB0aGlzIG9uZSwgYW5k
IEkgc3VzcGVjdCB0aGlzIG1pZ2h0IG5lZWQ8YnI+DQomZ3Q7IHJlYmFzZSBvbiA0LjQtcmMxPC9w
Pg0KPHAgZGlyPSJsdHIiPk1heGltZSB3aWxsIHRha2UgdGhpcyBwYXRjaCBhbmQgdGhlIG90aGVy
IG9uZSBhYm91dCBkZWZjb25maWcgYXMgaGUgaXMgdGhlIG1haW50YWluZXIgb2YgU1RNMzIgbWFj
aGluZS48L3A+DQo8cCBkaXI9Imx0ciI+SSB0aGluayB5b3UgZG9uJiMzOTt0IG5lZWQgdG8gdGFr
ZSBpdCBpbnRvIGFjY291bnQuLiA8L3A+DQo8cCBkaXI9Imx0ciI+QlIsPGJyPg0KQ2VkcmljPGJy
Pg0KJmd0Ozxicj4NCiZndDsgJmd0Ozxicj4NCiZndDsgJmd0OyBTaWduZWQtb2ZmLWJ5OiBNJiMz
OTtib3VtYmEgQ2VkcmljIE1hZGlhbmdhICZsdDs8YSBocmVmPSJtYWlsdG86Y2VkcmljLm1hZGlh
bmdhQGdtYWlsLmNvbSI+Y2VkcmljLm1hZGlhbmdhQGdtYWlsLmNvbTwvYT4mZ3Q7PGJyPg0KJmd0
OyAmZ3Q7IC0tLTxicj4NCiZndDsgJmd0O8KgIGFyY2gvYXJtL2Jvb3QvZHRzL3N0bTMyZjQyOS5k
dHNpIHwgMzEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKzxicj4NCiZndDsgJmd0O8Kg
IDEgZmlsZSBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspPGJyPg0KJmd0OyAmZ3Q7PGJyPg0KJmd0
OyAmZ3Q7IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMmY0MjkuZHRzaSBiL2Fy
Y2gvYXJtL2Jvb3QvZHRzL3N0bTMyZjQyOS5kdHNpPGJyPg0KJmd0OyAmZ3Q7IGluZGV4IGQ3OGE0
ODEuLjAzN2ViMjkgMTAwNjQ0PGJyPg0KJmd0OyAmZ3Q7IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRz
L3N0bTMyZjQyOS5kdHNpPGJyPg0KJmd0OyAmZ3Q7ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0
bTMyZjQyOS5kdHNpPGJyPg0KJmd0OyAmZ3Q7IEBAIC0xNzQsNiArMTc0LDM3IEBAPGJyPg0KJmd0
OyAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHg0MDAy
MzgwMCAweDQwMCZndDs7PGJyPg0KJmd0OyAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBjbG9ja3MgPSAmbHQ7JmFtcDtjbGtfaHNlJmd0Ozs8YnI+DQomZ3Q7ICZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyAmZ3Q7ICs8YnI+DQomZ3Q7ICZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgZG1hMTogZG1hLWNvbnRyb2xsZXJANDAwMjYwMDAgezxicj4NCiZn
dDsgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1
b3Q7c3Qsc3RtMzItZG1hJnF1b3Q7Ozxicj4NCiZndDsgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHg0MDAyNjAwMCAweDQwMCZndDs7PGJyPg0KJmd0OyAm
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7MTEm
Z3Q7LDxicj4NCiZndDsgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgJmx0OzEyJmd0Oyw8YnI+DQomZ3Q7ICZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICZsdDsxMyZndDssPGJyPg0KJmd0
OyAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCAmbHQ7MTQmZ3Q7LDxicj4NCiZndDsgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgJmx0OzE1Jmd0Oyw8YnI+DQomZ3Q7ICZndDsgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICZsdDsxNiZndDss
PGJyPg0KJmd0OyAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCAmbHQ7MTcmZ3Q7LDxicj4NCiZndDsgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgJmx0OzQ3Jmd0Ozs8YnI+DQomZ3Q7ICZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xvY2tzID0gJmx0OyZhbXA7cmNj
IDAgMjEmZ3Q7Ozxicj4NCiZndDsgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAjZG1hLWNlbGxzID0gJmx0OzQmZ3Q7Ozxicj4NCiZndDsgJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqB9Ozxicj4NCiZndDsgJmd0OyArPGJyPg0KJmd0OyAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoGRtYTI6IGRtYS1jb250cm9sbGVyQDQwMDI2NDAwIHs8YnI+DQomZ3Q7ICZndDsgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O3N0LHN0bTMyLWRt
YSZxdW90Ozs8YnI+DQomZ3Q7ICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
cmVnID0gJmx0OzB4NDAwMjY0MDAgMHg0MDAmZ3Q7Ozxicj4NCiZndDsgJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpbnRlcnJ1cHRzID0gJmx0OzU2Jmd0Oyw8YnI+DQomZ3Q7
ICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
ICZsdDs1NyZndDssPGJyPg0KJmd0OyAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAmbHQ7NTgmZ3Q7LDxicj4NCiZndDsgJmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgJmx0OzU5Jmd0Oyw8
YnI+DQomZ3Q7ICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgICZsdDs2MCZndDssPGJyPg0KJmd0OyAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAmbHQ7NjgmZ3Q7LDxicj4NCiZndDsgJmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgJmx0
OzY5Jmd0Oyw8YnI+DQomZ3Q7ICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgICZsdDs3MCZndDs7PGJyPg0KJmd0OyAmZ3Q7ICvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb2NrcyA9ICZsdDsmYW1wO3JjYyAwIDIyJmd0Ozs8YnI+
DQomZ3Q7ICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgI2RtYS1jZWxscyA9
ICZsdDs0Jmd0Ozs8YnI+DQomZ3Q7ICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgc3QsbWVtMm1lbTs8YnI+DQomZ3Q7ICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+
DQomZ3Q7ICZndDvCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyAmZ3Q7wqAgfTs8YnI+DQomZ3Q7ICZn
dDs8YnI+DQomZ3Q7ICZndDsgLS08YnI+DQomZ3Q7ICZndDsgMS45LjE8YnI+DQomZ3Q7ICZndDs8
YnI+DQomZ3Q7PGJyPg0KJmd0OyAtLTxicj4NCiZndDsgflZpbm9kPGJyPg0KPC9wPg0K
--001a1134ae6ca54b4e0524a76235--
