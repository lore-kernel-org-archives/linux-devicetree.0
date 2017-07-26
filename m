Return-Path: <SRS0=0hk5=65=broadcom.com=jon.mason@kernel.org>
MIME-Version: 1.0
In-Reply-To: <6b419bfc-56e8-5a6d-e995-78fbeca02282@arm.com>
References: <1501020372-19607-1-git-send-email-jon.mason@broadcom.com>
 <1501020372-19607-2-git-send-email-jon.mason@broadcom.com> <6b419bfc-56e8-5a6d-e995-78fbeca02282@arm.com>
From: Jon Mason <jon.mason@broadcom.com>
Date: Wed, 26 Jul 2017 18:45:47 -0400
Message-ID: <CAC3K-4rTvzJtVAdXhmp9F5F9LLL4BFXPanc0gC_exiXzN1hMcw@mail.gmail.com>
Subject: Re: [PATCH 1/3] ARM: dts: NSP: Add dma-coherent to relevant DT entries
Content-Type: multipart/alternative; boundary="001a114fd14882c6030555403563"
To: Robin Murphy <robin.murphy@arm.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, open list <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-ID: <devicetree@vger.kernel.org>

--001a114fd14882c6030555403563
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 26, 2017 at 6:19 AM, Robin Murphy <robin.murphy@arm.com> wrote:

> Hi Jon,
>
> On 25/07/17 23:06, Jon Mason wrote:
> > Cache related issues with DMA rings and performance issues related to
> > caching are being caused by not properly setting the "dma-coherent" flag
> > in the device tree entries.  Adding it here to correct the issue.
> >
> > Signed-off-by: Jon Mason <jon.mason@broadcom.com>
> > Fixes: 5fa1026a3e4d ("ARM: dts: NSP: Add PL330 support")
> > Fixes: 3107fa5bcfb2 ("ARM: dts: NSP: Add SD/MMC support")
> > Fixes: 13d04f20935c ("ARM: dts: NSP: Add AMAC entries")
> > Fixes: 5aeda7bf8a1e ("ARM: dts: NSP: Add and enable amac2")
> > Fixes: 17d517172300 ("ARM: dts: NSP: Add mailbox (PDC) to NSP")
> > Fixes: 1d8ece6639e1 ("ARM: dts: NSP: Add EHCI/OHCI USB nodes to device
> tree")
> > Fixes: bf2289bedef4 ("ARM: dts: NSP: Add Switch Register Access Block
> node")
> > Fixes: 0f9f27a36d09 ("ARM: dts: NSP: Add I2C support to the DT")
> > Fixes: 8dbcad020f2e ("ARM: dts: nsp: Add sata device tree entry")
> > Fixes: 522199029fdc ("ARM: dts: NSP: Fix PCIE DT issue")
> > ---
> >  arch/arm/boot/dts/bcm-nsp.dtsi | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/bcm-nsp.dtsi b/arch/arm/boot/dts/bcm-nsp.
> dtsi
> > index 7204d1def23d..c8d734d9f5fc 100644
> > --- a/arch/arm/boot/dts/bcm-nsp.dtsi
> > +++ b/arch/arm/boot/dts/bcm-nsp.dtsi
> > @@ -207,6 +207,7 @@
> >                       clocks = <&iprocslow>;
> >                       clock-names = "apb_pclk";
> >                       #dma-cells = <1>;
> > +                     dma-coherent;
>
> Just to check, does this actually work? I ask because the pl330 driver
> currently never sets src_cache_ctrl/dst_cache_ctrl to anything other
> than noncacheable nonbufferable, so if your interconnect respects those
> attributes this seems liable to make things go wrong under current
> kernels, even if it is an accurate description of the hardware. If on
> the other hand the interconnect does its own magic and will manage to
> snoop caches appropriately regardless of AXI attributes, then I guess
> it's fine, if a little scary ;)
>

This is what we've being using in-house for some time without any noticed
side effects, though it is possible there are some.

We've been basing the dma-coherent enablement on an internal register on
each IP block that enables/disables the coherency for it.  It could be
possible that we've made the block coherent in this register in the
bootloader (or the power-on default is enabled).  However, your comment
above concerns me greatly.  I will remove this portion from this patch for
v2, and bottom out internally on whether this is a bug or not.

Thanks for the eyeballs :)

Thanks,
Jon


>
> Robin.
>
> >               };
> >
> >               sdio: sdhci@21000 {
> > @@ -215,6 +216,7 @@
> >                       interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>;
> >                       sdhci,auto-cmd12;
> >                       clocks = <&lcpll0 BCM_NSP_LCPLL0_SDIO_CLK>;
> > +                     dma-coherent;
> >                       status = "disabled";
> >               };
> >
> > @@ -224,6 +226,7 @@
> >                             <0x110000 0x1000>;
> >                       reg-names = "amac_base", "idm_base";
> >                       interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
> > +                     dma-coherent;
> >                       status = "disabled";
> >               };
> >
> > @@ -233,6 +236,7 @@
> >                             <0x111000 0x1000>;
> >                       reg-names = "amac_base", "idm_base";
> >                       interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
> > +                     dma-coherent;
> >                       status = "disabled";
> >               };
> >
> > @@ -242,6 +246,7 @@
> >                             <0x112000 0x1000>;
> >                       reg-names = "amac_base", "idm_base";
> >                       interrupts = <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
> > +                     dma-coherent;
> >                       status = "disabled";
> >               };
> >
> > @@ -252,6 +257,7 @@
> >                       #mbox-cells = <1>;
> >                       brcm,rx-status-len = <32>;
> >                       brcm,use-bcm-hdr;
> > +                     dma-coherent;
> >               };
> >
> >               nand: nand@26000 {
> > @@ -325,6 +331,7 @@
> >                       compatible = "generic-ehci";
> >                       reg = <0x2a000 0x100>;
> >                       interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
> > +                     dma-coherent;
> >                       status = "disabled";
> >               };
> >
> > @@ -332,6 +339,7 @@
> >                       compatible = "generic-ohci";
> >                       reg = <0x2b000 0x100>;
> >                       interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
> > +                     dma-coherent;
> >                       status = "disabled";
> >               };
> >
> > @@ -364,6 +372,7 @@
> >                       #address-cells = <1>;
> >                       #size-cells = <0>;
> >
> > +                     dma-coherent;
> >                       status = "disabled";
> >
> >                       /* ports are defined in board DTS */
> > @@ -376,6 +385,7 @@
> >                       #size-cells = <0>;
> >                       interrupts = <GIC_SPI 89 IRQ_TYPE_NONE>;
> >                       clock-frequency = <100000>;
> > +                     dma-coherent;
> >                       status = "disabled";
> >               };
> >
> > @@ -446,6 +456,7 @@
> >                       interrupts = <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
> >                       #address-cells = <1>;
> >                       #size-cells = <0>;
> > +                     dma-coherent;
> >                       status = "disabled";
> >
> >                       sata0: sata-port@0 {
> > @@ -483,6 +494,7 @@
> >                */
> >               ranges = <0x82000000 0 0x08000000 0x08000000 0 0x8000000>;
> >
> > +             dma-coherent;
> >               status = "disabled";
> >
> >               msi-parent = <&msi0>;
> > @@ -519,6 +531,7 @@
> >                */
> >               ranges = <0x82000000 0 0x40000000 0x40000000 0 0x8000000>;
> >
> > +             dma-coherent;
> >               status = "disabled";
> >
> >               msi-parent = <&msi1>;
> > @@ -555,6 +568,7 @@
> >                */
> >               ranges = <0x82000000 0 0x48000000 0x48000000 0 0x8000000>;
> >
> > +             dma-coherent;
> >               status = "disabled";
> >
> >               msi-parent = <&msi2>;
> >
>
>

--001a114fd14882c6030555403563
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX2V4dHJhIj48YnI+PGRpdiBjbGFz
cz0iZ21haWxfcXVvdGUiPk9uIFdlZCwgSnVsIDI2LCAyMDE3IGF0IDY6MTkgQU0sIFJvYmluIE11
cnBoeSA8c3BhbiBkaXI9Imx0ciI+Jmx0OzxhIGhyZWY9Im1haWx0bzpyb2Jpbi5tdXJwaHlAYXJt
LmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnJvYmluLm11cnBoeUBhcm0uY29tPC9hPiZndDs8L3NwYW4+
IHdyb3RlOjxicj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46
MCAwIDAgLjhleDtib3JkZXItbGVmdDoxcHggI2NjYyBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij5I
aSBKb24sPGJyPg0KPGRpdj48ZGl2IGNsYXNzPSJoNSI+PGJyPg0KT24gMjUvMDcvMTcgMjM6MDYs
IEpvbiBNYXNvbiB3cm90ZTo8YnI+DQomZ3Q7IENhY2hlIHJlbGF0ZWQgaXNzdWVzIHdpdGggRE1B
IHJpbmdzIGFuZCBwZXJmb3JtYW5jZSBpc3N1ZXMgcmVsYXRlZCB0bzxicj4NCiZndDsgY2FjaGlu
ZyBhcmUgYmVpbmcgY2F1c2VkIGJ5IG5vdCBwcm9wZXJseSBzZXR0aW5nIHRoZSAmcXVvdDtkbWEt
Y29oZXJlbnQmcXVvdDsgZmxhZzxicj4NCiZndDsgaW4gdGhlIGRldmljZSB0cmVlIGVudHJpZXMu
wqAgQWRkaW5nIGl0IGhlcmUgdG8gY29ycmVjdCB0aGUgaXNzdWUuPGJyPg0KJmd0Ozxicj4NCiZn
dDsgU2lnbmVkLW9mZi1ieTogSm9uIE1hc29uICZsdDs8YSBocmVmPSJtYWlsdG86am9uLm1hc29u
QGJyb2FkY29tLmNvbSI+am9uLm1hc29uQGJyb2FkY29tLmNvbTwvYT4mZ3Q7PGJyPg0KJmd0OyBG
aXhlczogNWZhMTAyNmEzZTRkICgmcXVvdDtBUk06IGR0czogTlNQOiBBZGQgUEwzMzAgc3VwcG9y
dCZxdW90Oyk8YnI+DQomZ3Q7IEZpeGVzOiAzMTA3ZmE1YmNmYjIgKCZxdW90O0FSTTogZHRzOiBO
U1A6IEFkZCBTRC9NTUMgc3VwcG9ydCZxdW90Oyk8YnI+DQomZ3Q7IEZpeGVzOiAxM2QwNGYyMDkz
NWMgKCZxdW90O0FSTTogZHRzOiBOU1A6IEFkZCBBTUFDIGVudHJpZXMmcXVvdDspPGJyPg0KJmd0
OyBGaXhlczogNWFlZGE3YmY4YTFlICgmcXVvdDtBUk06IGR0czogTlNQOiBBZGQgYW5kIGVuYWJs
ZSBhbWFjMiZxdW90Oyk8YnI+DQomZ3Q7IEZpeGVzOiAxN2Q1MTcxNzIzMDAgKCZxdW90O0FSTTog
ZHRzOiBOU1A6IEFkZCBtYWlsYm94IChQREMpIHRvIE5TUCZxdW90Oyk8YnI+DQomZ3Q7IEZpeGVz
OiAxZDhlY2U2NjM5ZTEgKCZxdW90O0FSTTogZHRzOiBOU1A6IEFkZCBFSENJL09IQ0kgVVNCIG5v
ZGVzIHRvIGRldmljZSB0cmVlJnF1b3Q7KTxicj4NCiZndDsgRml4ZXM6IGJmMjI4OWJlZGVmNCAo
JnF1b3Q7QVJNOiBkdHM6IE5TUDogQWRkIFN3aXRjaCBSZWdpc3RlciBBY2Nlc3MgQmxvY2sgbm9k
ZSZxdW90Oyk8YnI+DQomZ3Q7IEZpeGVzOiAwZjlmMjdhMzZkMDkgKCZxdW90O0FSTTogZHRzOiBO
U1A6IEFkZCBJMkMgc3VwcG9ydCB0byB0aGUgRFQmcXVvdDspPGJyPg0KJmd0OyBGaXhlczogOGRi
Y2FkMDIwZjJlICgmcXVvdDtBUk06IGR0czogbnNwOiBBZGQgc2F0YSBkZXZpY2UgdHJlZSBlbnRy
eSZxdW90Oyk8YnI+DQomZ3Q7IEZpeGVzOiA1MjIxOTkwMjlmZGMgKCZxdW90O0FSTTogZHRzOiBO
U1A6IEZpeCBQQ0lFIERUIGlzc3VlJnF1b3Q7KTxicj4NCiZndDsgLS0tPGJyPg0KJmd0O8KgIGFy
Y2gvYXJtL2Jvb3QvZHRzL2JjbS1uc3AuZHRzaSB8IDE0ICsrKysrKysrKysrKysrPGJyPg0KJmd0
O8KgIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspPGJyPg0KJmd0Ozxicj4NCiZndDsg
ZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2JjbS1uc3AuPHdicj5kdHNpIGIvYXJjaC9h
cm0vYm9vdC9kdHMvYmNtLW5zcC48d2JyPmR0c2k8YnI+DQomZ3Q7IGluZGV4IDcyMDRkMWRlZjIz
ZC4uYzhkNzM0ZDlmNWZjIDEwMDY0NDxicj4NCiZndDsgLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMv
YmNtLW5zcC48d2JyPmR0c2k8YnI+DQomZ3Q7ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2JjbS1u
c3AuPHdicj5kdHNpPGJyPg0KJmd0OyBAQCAtMjA3LDYgKzIwNyw3IEBAPGJyPg0KJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xvY2tzID0gJmx0OyZhbXA7aXByb2NzbG93
Jmd0Ozs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjbG9jay1u
YW1lcyA9ICZxdW90O2FwYl9wY2xrJnF1b3Q7Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCNkbWEtY2VsbHMgPSAmbHQ7MSZndDs7PGJyPg0KJmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBkbWEtY29oZXJlbnQ7PGJyPg0KPGJyPg0KPC9kaXY+
PC9kaXY+SnVzdCB0byBjaGVjaywgZG9lcyB0aGlzIGFjdHVhbGx5IHdvcms/IEkgYXNrIGJlY2F1
c2UgdGhlIHBsMzMwIGRyaXZlcjxicj4NCmN1cnJlbnRseSBuZXZlciBzZXRzIHNyY19jYWNoZV9j
dHJsL2RzdF9jYWNoZV9jdHJsIHRvIGFueXRoaW5nIG90aGVyPGJyPg0KdGhhbiBub25jYWNoZWFi
bGUgbm9uYnVmZmVyYWJsZSwgc28gaWYgeW91ciBpbnRlcmNvbm5lY3QgcmVzcGVjdHMgdGhvc2U8
YnI+DQphdHRyaWJ1dGVzIHRoaXMgc2VlbXMgbGlhYmxlIHRvIG1ha2UgdGhpbmdzIGdvIHdyb25n
IHVuZGVyIGN1cnJlbnQ8YnI+DQprZXJuZWxzLCBldmVuIGlmIGl0IGlzIGFuIGFjY3VyYXRlIGRl
c2NyaXB0aW9uIG9mIHRoZSBoYXJkd2FyZS4gSWYgb248YnI+DQp0aGUgb3RoZXIgaGFuZCB0aGUg
aW50ZXJjb25uZWN0IGRvZXMgaXRzIG93biBtYWdpYyBhbmQgd2lsbCBtYW5hZ2UgdG88YnI+DQpz
bm9vcCBjYWNoZXMgYXBwcm9wcmlhdGVseSByZWdhcmRsZXNzIG9mIEFYSSBhdHRyaWJ1dGVzLCB0
aGVuIEkgZ3Vlc3M8YnI+DQppdCYjMzk7cyBmaW5lLCBpZiBhIGxpdHRsZSBzY2FyeSA7KTxicj48
L2Jsb2NrcXVvdGU+PGRpdj48YnI+PC9kaXY+PGRpdj5UaGlzIGlzIHdoYXQgd2UmIzM5O3ZlIGJl
aW5nIHVzaW5nIGluLWhvdXNlIGZvciBzb21lIHRpbWUgd2l0aG91dCBhbnkgbm90aWNlZCBzaWRl
IGVmZmVjdHMsIHRob3VnaCBpdCBpcyBwb3NzaWJsZSB0aGVyZSBhcmUgc29tZS48L2Rpdj48ZGl2
Pjxicj48L2Rpdj48ZGl2PldlJiMzOTt2ZSBiZWVuIGJhc2luZyB0aGUgZG1hLWNvaGVyZW50IGVu
YWJsZW1lbnQgb24gYW4gaW50ZXJuYWwgcmVnaXN0ZXIgb24gZWFjaCBJUCBibG9jayB0aGF0IGVu
YWJsZXMvZGlzYWJsZXMgdGhlIGNvaGVyZW5jeSBmb3IgaXQuwqAgSXQgY291bGQgYmUgcG9zc2li
bGUgdGhhdCB3ZSYjMzk7dmUgbWFkZSB0aGUgYmxvY2sgY29oZXJlbnQgaW4gdGhpcyByZWdpc3Rl
ciBpbiB0aGUgYm9vdGxvYWRlciAob3IgdGhlIHBvd2VyLW9uIGRlZmF1bHQgaXMgZW5hYmxlZCku
wqAgSG93ZXZlciwgeW91ciBjb21tZW50IGFib3ZlIGNvbmNlcm5zIG1lIGdyZWF0bHkuwqAgSSB3
aWxsIHJlbW92ZSB0aGlzIHBvcnRpb24gZnJvbSB0aGlzIHBhdGNoIGZvciB2MiwgYW5kIGJvdHRv
bSBvdXQgaW50ZXJuYWxseSBvbiB3aGV0aGVyIHRoaXMgaXMgYSBidWcgb3Igbm90LjwvZGl2Pjxk
aXY+PGJyPjwvZGl2PjxkaXY+VGhhbmtzIGZvciB0aGUgZXllYmFsbHMgOik8L2Rpdj48ZGl2Pjxi
cj48L2Rpdj48ZGl2PlRoYW5rcyw8L2Rpdj48ZGl2PkpvbjwvZGl2PjxkaXY+wqA8L2Rpdj48Ymxv
Y2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MCAwIDAgLjhleDtib3Jk
ZXItbGVmdDoxcHggI2NjYyBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij4NCjxzcGFuIGNsYXNzPSJI
T0VuWmIiPjxmb250IGNvbG9yPSIjODg4ODg4Ij48YnI+DQpSb2Jpbi48YnI+DQo8L2ZvbnQ+PC9z
cGFuPjxkaXYgY2xhc3M9IkhPRW5aYiI+PGRpdiBjbGFzcz0iaDUiPjxicj4NCiZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHNkaW86IHNkaGNpQDIxMDAwIHs8YnI+DQomZ3Q7IEBAIC0yMTUsNiArMjE2LDcgQEA8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpbnRlcnJ1cHRzID0gJmx0
O0dJQ19TUEkgMTQ1IElSUV9UWVBFX0xFVkVMX0hJR0gmZ3Q7Ozxicj4NCiZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHNkaGNpLGF1dG8tY21kMTI7PGJyPg0KJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xvY2tzID0gJmx0OyZhbXA7bGNwbGwwIEJD
TV9OU1BfTENQTEwwX1NESU9fQ0xLJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoGRtYS1jb2hlcmVudDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBzdGF0dXMgPSAmcXVvdDtkaXNhYmxlZCZxdW90Ozs8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDs8YnI+DQomZ3Q7IEBAIC0yMjQsNiArMjI2
LDcgQEA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAmbHQ7MHgxMTAwMDAgMHgxMDAwJmd0Ozs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqByZWctbmFtZXMgPSAmcXVvdDthbWFjX2Jhc2UmcXVvdDssICZxdW90O2lk
bV9iYXNlJnF1b3Q7Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGludGVycnVwdHMgPSAmbHQ7R0lDX1NQSSAxNDcgSVJRX1RZUEVfTEVWRUxfSElHSCZndDs7PGJy
Pg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBkbWEtY29oZXJlbnQ7PGJy
Pg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3RhdHVzID0gJnF1b3Q7
ZGlzYWJsZWQmcXVvdDs7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQom
Z3Q7PGJyPg0KJmd0OyBAQCAtMjMzLDYgKzIzNiw3IEBAPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmx0OzB4MTExMDAwIDB4MTAwMCZndDs7PGJy
Pg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnLW5hbWVzID0gJnF1
b3Q7YW1hY19iYXNlJnF1b3Q7LCAmcXVvdDtpZG1fYmFzZSZxdW90Ozs8YnI+DQomZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpbnRlcnJ1cHRzID0gJmx0O0dJQ19TUEkgMTQ4
IElSUV9UWVBFX0xFVkVMX0hJR0gmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgZG1hLWNvaGVyZW50Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90O2Rpc2FibGVkJnF1b3Q7Ozxicj4NCiZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0Ozxicj4NCiZndDsgQEAgLTI0Miw2ICsyNDYs
NyBAQDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCZsdDsweDExMjAwMCAweDEwMDAmZ3Q7Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHJlZy1uYW1lcyA9ICZxdW90O2FtYWNfYmFzZSZxdW90OywgJnF1b3Q7aWRt
X2Jhc2UmcXVvdDs7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
aW50ZXJydXB0cyA9ICZsdDtHSUNfU1BJIDE0OSBJUlFfVFlQRV9MRVZFTF9ISUdIJmd0Ozs8YnI+
DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGRtYS1jb2hlcmVudDs8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdGF0dXMgPSAmcXVvdDtk
aXNhYmxlZCZxdW90Ozs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZn
dDs8YnI+DQomZ3Q7IEBAIC0yNTIsNiArMjU3LDcgQEA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAjbWJveC1jZWxscyA9ICZsdDsxJmd0Ozs8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBicmNtLHJ4LXN0YXR1cy1sZW4gPSAmbHQ7
MzImZ3Q7Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJyY20s
dXNlLWJjbS1oZHI7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBk
bWEtY29oZXJlbnQ7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7
PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbmFuZDogbmFuZEAyNjAwMCB7PGJyPg0K
Jmd0OyBAQCAtMzI1LDYgKzMzMSw3IEBAPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O2dlbmVyaWMtZWhjaSZxdW90Ozs8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgyYTAwMCAw
eDEwMCZndDs7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaW50
ZXJydXB0cyA9ICZsdDtHSUNfU1BJIDc5IElSUV9UWVBFX0xFVkVMX0hJR0gmZ3Q7Ozxicj4NCiZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZG1hLWNvaGVyZW50Ozxicj4NCiZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90O2Rpc2Fi
bGVkJnF1b3Q7Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0Ozxi
cj4NCiZndDsgQEAgLTMzMiw2ICszMzksNyBAQDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDtnZW5lcmljLW9oY2kmcXVvdDs7PGJy
Pg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4MmIw
MDAgMHgxMDAmZ3Q7Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGludGVycnVwdHMgPSAmbHQ7R0lDX1NQSSA3OSBJUlFfVFlQRV9MRVZFTF9ISUdIJmd0Ozs8YnI+
DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGRtYS1jb2hlcmVudDs8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdGF0dXMgPSAmcXVvdDtk
aXNhYmxlZCZxdW90Ozs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZn
dDs8YnI+DQomZ3Q7IEBAIC0zNjQsNiArMzcyLDcgQEA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAjYWRkcmVzcy1jZWxscyA9ICZsdDsxJmd0Ozs8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjc2l6ZS1jZWxscyA9ICZsdDswJmd0
Ozs8YnI+DQomZ3Q7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBk
bWEtY29oZXJlbnQ7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
c3RhdHVzID0gJnF1b3Q7ZGlzYWJsZWQmcXVvdDs7PGJyPg0KJmd0Ozxicj4NCiZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC8qIHBvcnRzIGFyZSBkZWZpbmVkIGluIGJvYXJk
IERUUyAqLzxicj4NCiZndDsgQEAgLTM3Niw2ICszODUsNyBAQDxicj4NCiZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNzaXplLWNlbGxzID0gJmx0OzAmZ3Q7Ozxicj4NCiZn
dDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7R0lD
X1NQSSA4OSBJUlFfVFlQRV9OT05FJmd0Ozs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBjbG9jay1mcmVxdWVuY3kgPSAmbHQ7MTAwMDAwJmd0Ozs8YnI+DQomZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGRtYS1jb2hlcmVudDs8YnI+DQomZ3Q7
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdGF0dXMgPSAmcXVvdDtkaXNhYmxl
ZCZxdW90Ozs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDs8YnI+
DQomZ3Q7IEBAIC00NDYsNiArNDU2LDcgQEA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBpbnRlcnJ1cHRzID0gJmx0O0dJQ19TUEkgMTU5IElSUV9UWVBFX0xFVkVM
X0hJR0gmZ3Q7Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNh
ZGRyZXNzLWNlbGxzID0gJmx0OzEmZ3Q7Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCNzaXplLWNlbGxzID0gJmx0OzAmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZG1hLWNvaGVyZW50Ozxicj4NCiZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90O2Rpc2FibGVkJnF1b3Q7Ozxi
cj4NCiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzYXRh
MDogc2F0YS1wb3J0QDAgezxicj4NCiZndDsgQEAgLTQ4Myw2ICs0OTQsNyBAQDxicj4NCiZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAqLzxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oHJhbmdlcyA9ICZsdDsweDgyMDAwMDAwIDAgMHgwODAwMDAwMCAweDA4MDAwMDAwIDAgMHg4MDAw
MDAwJmd0Ozs8YnI+DQomZ3Q7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBkbWEtY29o
ZXJlbnQ7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3RhdHVzID0gJnF1b3Q7ZGlz
YWJsZWQmcXVvdDs7PGJyPg0KJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG1z
aS1wYXJlbnQgPSAmbHQ7JmFtcDttc2kwJmd0Ozs8YnI+DQomZ3Q7IEBAIC01MTksNiArNTMxLDcg
QEA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKi88YnI+DQomZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqByYW5nZXMgPSAmbHQ7MHg4MjAwMDAwMCAwIDB4NDAwMDAwMDAgMHg0MDAw
MDAwMCAwIDB4ODAwMDAwMCZndDs7PGJyPg0KJmd0Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgZG1hLWNvaGVyZW50Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0YXR1
cyA9ICZxdW90O2Rpc2FibGVkJnF1b3Q7Ozxicj4NCiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBtc2ktcGFyZW50ID0gJmx0OyZhbXA7bXNpMSZndDs7PGJyPg0KJmd0OyBAQCAt
NTU1LDYgKzU2OCw3IEBAPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICovPGJyPg0K
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmFuZ2VzID0gJmx0OzB4ODIwMDAwMDAgMCAweDQ4
MDAwMDAwIDB4NDgwMDAwMDAgMCAweDgwMDAwMDAmZ3Q7Ozxicj4NCiZndDs8YnI+DQomZ3Q7ICvC
oCDCoCDCoCDCoCDCoCDCoCDCoGRtYS1jb2hlcmVudDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBzdGF0dXMgPSAmcXVvdDtkaXNhYmxlZCZxdW90Ozs8YnI+DQomZ3Q7PGJyPg0KJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbXNpLXBhcmVudCA9ICZsdDsmYW1wO21zaTImZ3Q7Ozxi
cj4NCiZndDs8YnI+DQo8YnI+DQo8L2Rpdj48L2Rpdj48L2Jsb2NrcXVvdGU+PC9kaXY+PGJyPjwv
ZGl2PjwvZGl2Pg0K
--001a114fd14882c6030555403563--
