From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v2 1/3] mtd: nand: Cleanup/rework the atmel_nand driver
Date: Fri, 24 Feb 2017 09:27:42 +0100
Message-ID: <20170224092742.3ce205e2@bbrezillon>
References: <CAHp75VfZfj-8ih3vg63w_dAq8xXE2Whu1bANXRcXS1_EGNq43A@mail.gmail.com>
 <20170221112641.6276c001@bbrezillon>
 <CAHp75Vcb9gtzF7LvH74JwL4dTUyQvKmg=dnTXKfjhVHuyK3WXg@mail.gmail.com>
 <20170221112720.ynehsryprhrhzjla@piout.net>
 <CAHp75VcKjYYAw8gw8yYXrd-vzZo50WOQ06AzPx+0g9Zakzjm-w@mail.gmail.com>
 <20170221162133.jch6yzpotj4s7zob@piout.net>
 <CAHp75VeB4eVuN5NMfAfQUtssuHezTyAM8FUswuR8FheUk1V-oA@mail.gmail.com>
 <CAHp75Vc54+GR99qM8vUDfQnehFx0g5q137k-w5XY3023UZyr5w@mail.gmail.com>
 <20170221171438.e5hvruoixafpcdps@piout.net>
 <CACiLriSdRM4ZfoDsxFhf6ZVwAtacJOJ28M8CvOg6kC_XN0T-Mw@mail.gmail.com>
 <20170224081430.GB19663@samfundet.no>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170224081430.GB19663@samfundet.no>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Hans-Christian Noren Egtvedt <egtvedt@samfundet.no>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Richard Weinberger <richard@nod.at>, Kumar Gala <galak@codeaurora.org>, Nicolas Ferre <nicolas.ferre@atmel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Wenyou Yang <wenyou.yang@atmel.com>, Marek Vasut <marek.vasut@gmail.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Josh Wu <rainyfeeling@outlook.com>, "open
 list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, =?UTF-8?B?SMOldmFyZA==?= Skinnemoen <hskinne>
List-Id: devicetree@vger.kernel.org

SGkgSGFucy1DcmlzdHJpYW4sCgpPbiBGcmksIDI0IEZlYiAyMDE3IDA5OjE0OjMwICswMTAwCkhh
bnMtQ2hyaXN0aWFuIE5vcmVuIEVndHZlZHQgPGVndHZlZHRAc2FtZnVuZGV0Lm5vPiB3cm90ZToK
Cj4gQXJvdW5kIFRodSAyMyBGZWIgMjAxNyAyMToxODoxMyAtMDgwMCBvciB0aGVyZWFib3V0LCBI
w6V2YXJkIFNraW5uZW1vZW4gd3JvdGU6Cj4gPiBPbiBUdWUsIEZlYiAyMSwgMjAxNyBhdCA5OjE0
IEFNLCBBbGV4YW5kcmUgQmVsbG9uaQo+ID4gPGFsZXhhbmRyZS5iZWxsb25pQGZyZWUtZWxlY3Ry
b25zLmNvbT4gd3JvdGU6ICAKPiA+PiBPbiAyMS8wMi8yMDE3IGF0IDE4OjQzOjM1ICswMjAwLCBB
bmR5IFNoZXZjaGVua28gd3JvdGU6ICAKPiAKPiA8c25pcHA+Cj4gCj4gPj4gQSBmZXcgd2Vla3Mg
YWdvLCBJIHdhcyB0ZWxsaW5nIEJvcmlzIHRvIGxldCBpdCBub3QgYnVpbGQgZm9yIGEgd2hpbGUg
YW5kCj4gPj4gdGhlbiByZW1vdmUgaXQuIFlvdSBhbHJlYWR5IHdlbnQgb3V0IG9mIHlvdXIgd2F5
IHRvIG1ha2UgaXQgd29yay4gQWdhaW4sCj4gPj4gZmVlbCBmcmVlIHRvIHNlbmQgYSBwYXRjaCBy
ZW1vdmluZyBhdnIzMi4gSSBjYW4gb25seSBzZWUgYSBsb3Qgb2YKPiA+PiBiZW5lZml0cyBmb3Ig
dGhlIEF0bWVsIEFSTSBTb0NzIGFuZCB0aGUgbWFueSBjbGVhbnVwcyB0aGF0IHdpbGwgZm9sbG93
LiAgCj4gPiAKPiA+IEFncmVlLCBJIGNhbid0IGhlbHAgYnV0IGZlZWwgdGhhdCB0aGUgQVZSMzIg
c3VwcG9ydCBpcyBkb2luZyBtb3JlIGhhcm0KPiA+IHRoYW4gZ29vZCBhdCB0aGlzIHBvaW50LiAg
Cj4gCj4gSSBhbHNvIGFncmVlIG9uIHRoaXMsIEkgY2FuIHJlbGF0ZSB0byBOaWNvbGFzIChhbmQg
QXRtZWwgZnJpZW5kcykgaGF2aW5nIHRvCj4gYWx3YXlzIHRoaW5rIGFib3V0IHRoZSBsZXNzLW1h
aW50YWluZWQgQVZSMzIgcGFydHMgd2hlbiBpbXByb3ZpbmcgZHJpdmVycy4KCkluZGVlZCwgdGhh
dCBzaG91bGQgbWFrZSBhdG1lbCBkcml2ZXJzIG1haW50YWluYW5jZSBhIGJpdCBlYXNpZXIuCgo+
IAo+ID4+IElmIG5vYm9keSBjb21wbGFpbnMgYWJvdXQgdGhlIDQuMTAgYnJlYWthZ2UsIFlvdSds
bCBoYXZlIHBsZW50eSBvZiB0aW1lCj4gPj4gdG8gcmVtb3ZlIGl0IGZvciA0LjEyICAKPiA+IAo+
ID4gSSdtIGZpbmUgd2l0aCB0aGF0LCBidXQgSSBoYXZlbid0IHB1dCBtdWNoIGVmZm9ydCBpbnRv
IGtlZXBpbmcgaXQKPiA+IGFsaXZlIGxhdGVseS4gSWYgSGFucy1DaHJpc3RpYW4gYWdyZWVzLCBJ
J20gd2lsbGluZyB0byBwb3N0IGEgcGF0Y2ggdG8KPiA+IHJlbW92ZSBpdCwgb3IgYWNrIHNvbWVv
bmUgZWxzZSdzIHBhdGNoLiAgCj4gCj4gVGhlbiBsZXRzIHBsYW4gdGhpcyBmb3IgNC4xMiwgZWl0
aGVyIHlvdSBIw6V2YXJkIHdoaXAgdXAgYSBwYXRjaCBvciBJIGNhbgo+IGV2ZW50dWFsbHkgZG8g
aXQuCj4gCj4gSSBjYW4gcHVzaCBpdCB0aHJvdWdoIHRoZSBsaW51eC1hdnIzMiBnaXQgdHJlZSBv
biBrZXJuZWwub3JnLgo+IAoKQ2FuIHlvdSBkbyB0aGF0IGp1c3QgYWZ0ZXIgNC4xMS1yYzEgaXMg
cmVsZWFzZWQgYW5kIHByb3ZpZGUgYSB0b3BpYwpicmFuY2ggSSBjYW4gcHVsbCBpbiBteSBuYW5k
L25leHQgYnJhbmNoLCBzbyB0aGF0IEkgY2FuIHJld29yayB0aGlzCnBhdGNoIGFuZCBkcm9wIGFs
bCB0aGUgcGRhdGEtY29tcGF0IGNvZGUgKGFzIHN1Z2dlc3RlZCBieSBBbmR5KS4KClRoYW5rcywK
CkJvcmlzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hcm0ta2VybmVsCg==
