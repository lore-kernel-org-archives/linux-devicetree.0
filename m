Return-Path: <f.fainelli@gmail.com>
MIME-Version: 1.0
In-Reply-To: <53C92D70.6050604@atmel.com>
References: <1405022394-8311-1-git-send-email-boris.brezillon@free-electrons.com>
	<1405022394-8311-2-git-send-email-boris.brezillon@free-electrons.com>
	<53C92D70.6050604@atmel.com>
Date: Fri, 18 Jul 2014 08:48:37 -0700
Message-ID: <CAGVrzcYQDVdaDROCEW9__LZDjRo_RWqPz2z74DnYu0S68CRPwA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] ARM: at91/dt: describe rgmii ethernet phy
 connected to sama5d3xek boards
From: Florian Fainelli <f.fainelli@gmail.com>
Content-Type: multipart/alternative; boundary=089e01184d74c85e6904fe79b082
To: Nicolas Ferre <nicolas.ferre@atmel.com>
Cc: Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Kumar Gala <galak@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Andrew Victor <linux@maxim.org.za>, "David S. Miller" <davem@davemloft.net>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, linux-kernel@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Boris BREZILLON <boris.brezillon@free-electrons.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

--089e01184d74c85e6904fe79b082
Content-Type: text/plain; charset=UTF-8

On Jul 18, 2014 7:21 AM, "Nicolas Ferre" <nicolas.ferre@atmel.com> wrote:
>
> On 10/07/2014 21:59, Boris BREZILLON :
> > Add ethernet-phy nodes and specify phy interrupt (connected to pin PB25)
> > and board specific timing configs.
> >
> > Atmel has two different HW designs for its CPU modules: the first one
> > (produced by Embest) is connecting PHYAD[0-2] pins to pull up resistors
> > and the other one (produced by Ronetix) is connecting PHYAD0 to a pull
up
> > resistor and PHYAD[1-2] to pull down resistors.
> > As a result, Ronetix design will have its PHY available at address 0x1
and
> > Embest design at 0x7.
> > By defining both phys we're letting the phy core detect the one actually
> > available on the MDIO bus.
> >
> > Signed-off-by: Boris BREZILLON <boris.brezillon@free-electrons.com>
> > ---
> >
> > Florian, I dropped your Reviewed-by tag because this patch has slightly
> > changed.
>
> Hi Florian,
>
> I would like to have your Ack on this one as we discussed this solution
> with you.

Acked-by: Florian Fainelli <f.fainelli@gmail.com>

>
> Thanks, bye,
>
>
> >  arch/arm/boot/dts/sama5d3xcm.dtsi | 30 ++++++++++++++++++++++++++++++
> >  1 file changed, 30 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/sama5d3xcm.dtsi
b/arch/arm/boot/dts/sama5d3xcm.dtsi
> > index b0b1331..755369e 100644
> > --- a/arch/arm/boot/dts/sama5d3xcm.dtsi
> > +++ b/arch/arm/boot/dts/sama5d3xcm.dtsi
> > @@ -34,6 +34,36 @@
> >
> >                       macb0: ethernet@f0028000 {
> >                               phy-mode = "rgmii";
> > +                             #address-cells = <1>;
> > +                             #size-cells = <0>;
> > +
> > +                             ethernet-phy@1 {
> > +                                     reg = <0x1>;
> > +                                     interrupt-parent = <&pioB>;
> > +                                     interrupts = <25
IRQ_TYPE_EDGE_FALLING>;
> > +                                     txen-skew-ps = <800>;
> > +                                     txc-skew-ps = <3000>;
> > +                                     rxdv-skew-ps = <400>;
> > +                                     rxc-skew-ps = <3000>;
> > +                                     rxd0-skew-ps = <400>;
> > +                                     rxd1-skew-ps = <400>;
> > +                                     rxd2-skew-ps = <400>;
> > +                                     rxd3-skew-ps = <400>;
> > +                             };
> > +
> > +                             ethernet-phy@7 {
> > +                                     reg = <0x7>;
> > +                                     interrupt-parent = <&pioB>;
> > +                                     interrupts = <25
IRQ_TYPE_EDGE_FALLING>;
> > +                                     txen-skew-ps = <800>;
> > +                                     txc-skew-ps = <3000>;
> > +                                     rxdv-skew-ps = <400>;
> > +                                     rxc-skew-ps = <3000>;
> > +                                     rxd0-skew-ps = <400>;
> > +                                     rxd1-skew-ps = <400>;
> > +                                     rxd2-skew-ps = <400>;
> > +                                     rxd3-skew-ps = <400>;
> > +                             };
> >                       };
> >
> >                       pmc: pmc@fffffc00 {
> >
>
>
> --
> Nicolas Ferre

--089e01184d74c85e6904fe79b082
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PHAgZGlyPSJsdHIiPk9uIEp1bCAxOCwgMjAxNCA3OjIxIEFNLCAmcXVvdDtOaWNvbGFzIEZlcnJl
JnF1b3Q7ICZsdDs8YSBocmVmPSJtYWlsdG86bmljb2xhcy5mZXJyZUBhdG1lbC5jb20iPm5pY29s
YXMuZmVycmVAYXRtZWwuY29tPC9hPiZndDsgd3JvdGU6PGJyPg0KJmd0Ozxicj4NCiZndDsgT24g
MTAvMDcvMjAxNCAyMTo1OSwgQm9yaXMgQlJFWklMTE9OIDo8YnI+DQomZ3Q7ICZndDsgQWRkIGV0
aGVybmV0LXBoeSBub2RlcyBhbmQgc3BlY2lmeSBwaHkgaW50ZXJydXB0IChjb25uZWN0ZWQgdG8g
cGluIFBCMjUpPGJyPg0KJmd0OyAmZ3Q7IGFuZCBib2FyZCBzcGVjaWZpYyB0aW1pbmcgY29uZmln
cy48YnI+DQomZ3Q7ICZndDs8YnI+DQomZ3Q7ICZndDsgQXRtZWwgaGFzIHR3byBkaWZmZXJlbnQg
SFcgZGVzaWducyBmb3IgaXRzIENQVSBtb2R1bGVzOiB0aGUgZmlyc3Qgb25lPGJyPg0KJmd0OyAm
Z3Q7IChwcm9kdWNlZCBieSBFbWJlc3QpIGlzIGNvbm5lY3RpbmcgUEhZQURbMC0yXSBwaW5zIHRv
IHB1bGwgdXAgcmVzaXN0b3JzPGJyPg0KJmd0OyAmZ3Q7IGFuZCB0aGUgb3RoZXIgb25lIChwcm9k
dWNlZCBieSBSb25ldGl4KSBpcyBjb25uZWN0aW5nIFBIWUFEMCB0byBhIHB1bGwgdXA8YnI+DQom
Z3Q7ICZndDsgcmVzaXN0b3IgYW5kIFBIWUFEWzEtMl0gdG8gcHVsbCBkb3duIHJlc2lzdG9ycy48
YnI+DQomZ3Q7ICZndDsgQXMgYSByZXN1bHQsIFJvbmV0aXggZGVzaWduIHdpbGwgaGF2ZSBpdHMg
UEhZIGF2YWlsYWJsZSBhdCBhZGRyZXNzIDB4MSBhbmQ8YnI+DQomZ3Q7ICZndDsgRW1iZXN0IGRl
c2lnbiBhdCAweDcuPGJyPg0KJmd0OyAmZ3Q7IEJ5IGRlZmluaW5nIGJvdGggcGh5cyB3ZSYjMzk7
cmUgbGV0dGluZyB0aGUgcGh5IGNvcmUgZGV0ZWN0IHRoZSBvbmUgYWN0dWFsbHk8YnI+DQomZ3Q7
ICZndDsgYXZhaWxhYmxlIG9uIHRoZSBNRElPIGJ1cy48YnI+DQomZ3Q7ICZndDs8YnI+DQomZ3Q7
ICZndDsgU2lnbmVkLW9mZi1ieTogQm9yaXMgQlJFWklMTE9OICZsdDs8YSBocmVmPSJtYWlsdG86
Ym9yaXMuYnJlemlsbG9uQGZyZWUtZWxlY3Ryb25zLmNvbSI+Ym9yaXMuYnJlemlsbG9uQGZyZWUt
ZWxlY3Ryb25zLmNvbTwvYT4mZ3Q7PGJyPg0KJmd0OyAmZ3Q7IC0tLTxicj4NCiZndDsgJmd0Ozxi
cj4NCiZndDsgJmd0OyBGbG9yaWFuLCBJIGRyb3BwZWQgeW91ciBSZXZpZXdlZC1ieSB0YWcgYmVj
YXVzZSB0aGlzIHBhdGNoIGhhcyBzbGlnaHRseTxicj4NCiZndDsgJmd0OyBjaGFuZ2VkLjxicj4N
CiZndDs8YnI+DQomZ3Q7IEhpIEZsb3JpYW4sPGJyPg0KJmd0Ozxicj4NCiZndDsgSSB3b3VsZCBs
aWtlIHRvIGhhdmUgeW91ciBBY2sgb24gdGhpcyBvbmUgYXMgd2UgZGlzY3Vzc2VkIHRoaXMgc29s
dXRpb248YnI+DQomZ3Q7IHdpdGggeW91LjwvcD4NCjxwIGRpcj0ibHRyIj5BY2tlZC1ieTogRmxv
cmlhbiBGYWluZWxsaSAmbHQ7PGEgaHJlZj0ibWFpbHRvOmYuZmFpbmVsbGlAZ21haWwuY29tIj5m
LmZhaW5lbGxpQGdtYWlsLmNvbTwvYT4mZ3Q7PC9wPg0KPHAgZGlyPSJsdHIiPiZndDs8YnI+DQom
Z3Q7IFRoYW5rcywgYnllLDxicj4NCiZndDs8YnI+DQomZ3Q7PGJyPg0KJmd0OyAmZ3Q7IMKgYXJj
aC9hcm0vYm9vdC9kdHMvc2FtYTVkM3hjbS5kdHNpIHwgMzAgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrPGJyPg0KJmd0OyAmZ3Q7IMKgMSBmaWxlIGNoYW5nZWQsIDMwIGluc2VydGlvbnMo
Kyk8YnI+DQomZ3Q7ICZndDs8YnI+DQomZ3Q7ICZndDsgZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jv
b3QvZHRzL3NhbWE1ZDN4Y20uZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL3NhbWE1ZDN4Y20uZHRz
aTxicj4NCiZndDsgJmd0OyBpbmRleCBiMGIxMzMxLi43NTUzNjllIDEwMDY0NDxicj4NCiZndDsg
Jmd0OyAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9zYW1hNWQzeGNtLmR0c2k8YnI+DQomZ3Q7ICZn
dDsgKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvc2FtYTVkM3hjbS5kdHNpPGJyPg0KJmd0OyAmZ3Q7
IEBAIC0zNCw2ICszNCwzNiBAQDxicj4NCiZndDsgJmd0Ozxicj4NCiZndDsgJmd0OyDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBtYWNiMDogZXRoZXJuZXRAZjAwMjgwMDAgezxicj4N
CiZndDsgJmd0OyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBw
aHktbW9kZSA9ICZxdW90O3JnbWlpJnF1b3Q7Ozxicj4NCiZndDsgJmd0OyArIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICNhZGRyZXNzLWNlbGxzID0gJmx0OzEmZ3Q7
Ozxicj4NCiZndDsgJmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgICNzaXplLWNlbGxzID0gJmx0OzAmZ3Q7Ozxicj4NCiZndDsgJmd0OyArPGJyPg0KJmd0OyAm
Z3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZXRoZXJuZXQt
cGh5QDEgezxicj4NCiZndDsgJmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJlZyA9ICZsdDsweDEmZ3Q7Ozxicj4NCiZndDsgJmd0OyAr
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGlu
dGVycnVwdC1wYXJlbnQgPSAmbHQ7JmFtcDtwaW9CJmd0Ozs8YnI+DQomZ3Q7ICZndDsgKyDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBpbnRlcnJ1
cHRzID0gJmx0OzI1IElSUV9UWVBFX0VER0VfRkFMTElORyZndDs7PGJyPg0KJmd0OyAmZ3Q7ICsg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgdHhl
bi1za2V3LXBzID0gJmx0OzgwMCZndDs7PGJyPg0KJmd0OyAmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgdHhjLXNrZXctcHMgPSAmbHQ7
MzAwMCZndDs7PGJyPg0KJmd0OyAmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcnhkdi1za2V3LXBzID0gJmx0OzQwMCZndDs7PGJyPg0K
Jmd0OyAmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgcnhjLXNrZXctcHMgPSAmbHQ7MzAwMCZndDs7PGJyPg0KJmd0OyAmZ3Q7ICsgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcnhkMC1z
a2V3LXBzID0gJmx0OzQwMCZndDs7PGJyPg0KJmd0OyAmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcnhkMS1za2V3LXBzID0gJmx0OzQw
MCZndDs7PGJyPg0KJmd0OyAmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgcnhkMi1za2V3LXBzID0gJmx0OzQwMCZndDs7PGJyPg0KJmd0
OyAmZ3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgcnhkMy1za2V3LXBzID0gJmx0OzQwMCZndDs7PGJyPg0KJmd0OyAmZ3Q7ICsgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfTs8YnI+DQomZ3Q7ICZndDsgKzxi
cj4NCiZndDsgJmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IGV0aGVybmV0LXBoeUA3IHs8YnI+DQomZ3Q7ICZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCByZWcgPSAmbHQ7MHg3Jmd0Ozs8YnI+DQom
Z3Q7ICZndDsgKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCBpbnRlcnJ1cHQtcGFyZW50ID0gJmx0OyZhbXA7cGlvQiZndDs7PGJyPg0KJmd0OyAm
Z3Q7ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgaW50ZXJydXB0cyA9ICZsdDsyNSBJUlFfVFlQRV9FREdFX0ZBTExJTkcmZ3Q7Ozxicj4NCiZn
dDsgJmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIHR4ZW4tc2tldy1wcyA9ICZsdDs4MDAmZ3Q7Ozxicj4NCiZndDsgJmd0OyArIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHR4Yy1za2V3
LXBzID0gJmx0OzMwMDAmZ3Q7Ozxicj4NCiZndDsgJmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJ4ZHYtc2tldy1wcyA9ICZsdDs0MDAm
Z3Q7Ozxicj4NCiZndDsgJmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIHJ4Yy1za2V3LXBzID0gJmx0OzMwMDAmZ3Q7Ozxicj4NCiZndDsg
Jmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIHJ4ZDAtc2tldy1wcyA9ICZsdDs0MDAmZ3Q7Ozxicj4NCiZndDsgJmd0OyArIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJ4ZDEtc2tldy1w
cyA9ICZsdDs0MDAmZ3Q7Ozxicj4NCiZndDsgJmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJ4ZDItc2tldy1wcyA9ICZsdDs0MDAmZ3Q7
Ozxicj4NCiZndDsgJmd0OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIHJ4ZDMtc2tldy1wcyA9ICZsdDs0MDAmZ3Q7Ozxicj4NCiZndDsgJmd0
OyArIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH07PGJyPg0KJmd0
OyAmZ3Q7IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH07PGJyPg0KJmd0OyAmZ3Q7
PGJyPg0KJmd0OyAmZ3Q7IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHBtYzogcG1j
QGZmZmZmYzAwIHs8YnI+DQomZ3Q7ICZndDs8YnI+DQomZ3Q7PGJyPg0KJmd0Ozxicj4NCiZndDsg
LS08YnI+DQomZ3Q7IE5pY29sYXMgRmVycmU8YnI+DQo8L3A+DQo=
--089e01184d74c85e6904fe79b082--
