From: Phil Edworthy <phil.edworthy@renesas.com>
Subject: RE: [PATCH] gpio: dwapb: Add support for 32 interrupts
Date: Tue, 10 Apr 2018 15:00:31 +0000
Message-ID: <TY1PR01MB17693D030D9B4BEC6D4C58BFF5BE0@TY1PR01MB1769.jpnprd01.prod.outlook.com>
References: <1522246950-9110-1-git-send-email-phil.edworthy@renesas.com>
 <20180409192013.5rytwgoixtyraow3@rob-hp-laptop>
 <TY1PR01MB1769EC6963CFB3D720D1B9EEF5BE0@TY1PR01MB1769.jpnprd01.prod.outlook.com>
 <TY1PR01MB17691846E8DFA86DA831B8B9F5BE0@TY1PR01MB1769.jpnprd01.prod.outlook.com>
 <CAMuHMdUjYT466uPAHSoAWwQL2KaRUfM1njwpBkHwSK9fbGZTag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdUjYT466uPAHSoAWwQL2KaRUfM1njwpBkHwSK9fbGZTag@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh@kernel.org>, Hoan Tran <hotran@apm.com>, Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Michel Pollet <michel.pollet@bp.renesas.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

SGkgR2VlcnQsDQoNCk9uIDEwIEFwcmlsIDIwMTggMTU6MjkgR2VlcnQgVXl0dGVyaG9ldmVuIHdy
b3RlOg0KPiBPbiBUdWUsIEFwciAxMCwgMjAxOCBhdCA0OjIzIFBNLCBQaGlsIEVkd29ydGh5IHdy
b3RlOg0KPiA+IE9uIDEwIEFwcmlsIDIwMTggMDc6MjQgUGhpbCBFZHdvcnRoeSB3cm90ZToNCj4g
Pj4gT24gMDkgQXByaWwgMjAxOCAyMDoyMCBSb2IgSGVycmluZyB3cm90ZToNCj4gPj4gPiBPbiBX
ZWQsIE1hciAyOCwgMjAxOCBhdCAwMzoyMjozMFBNICswMTAwLCBQaGlsIEVkd29ydGh5IHdyb3Rl
Og0KPiA+IFsuLi5dDQo+ID4+ID4gPiArLSBpbnRlcnJ1cHQtbWFzayA6IGEgMzItYml0IGJpdCBt
YXNrIHRoYXQgc3BlY2lmaWVzIHdoaWNoDQo+ID4+ID4gPiAraW50ZXJydXB0cyBpbiB0aGUgbGlz
dA0KPiA+PiA+ID4gKyAgb2YgaW50ZXJydXB0cyBpcyB2YWxpZCwgYml0IGlzIDEgZm9yIGEgdmFs
aWQgaXJxLg0KPiA+PiA+DQo+ID4+ID4gVGhpcyBpcyBub3QgYSBzdGFuZGFyZCBwcm9wZXJ0eSBh
bmQgd291bGQgbmVlZCBhIHZlbmRvciBwcmVmaXguDQo+ID4+ID4gSG93ZXZlciwNCj4gPj4gSSdk
DQo+ID4+ID4gcHJlZmVyIHlvdSBqdXN0IHNraXAgYW55IG5vdCBjb25uZWN0ZWQgaW50ZXJydXB0
cyB3aXRoIGFuIGludmFsaWQNCj4gPj4gPiBpbnRlcnJ1cHQgbnVtYmVyLiBUaGVuIHRoZSBHUElP
IG51bWJlciBpcyB0aGUgaW5kZXggaW50byAiaW50ZXJydXB0cyIuDQo+ID4+IE1ha2VzIHNlbnNl
LCBJJ2xsIHJld29yayBpdCB0byBkbyB0aGlzLg0KPiA+IEVyciwgd2hhdCB3b3VsZCBhbiBpbnZh
bGlkIGludGVycnVwdCBudW1iZXIgYmU/DQo+ID4gSWYgSSB1c2UgLTEsIEkgZ2V0IGEgRFQgcGFy
c2luZyBlcnJvciBhbmQgMCBpcyBjZXJ0YWlubHkgdmFsaWQuIElmIHRoZQ0KPiA+IG51bWJlciBp
cyBsYXJnZXIgdGhhbiB0aGUgdmFsaWQgaW50ZXJydXB0IHJhbmdlIEkgZ2V0IGVycm9ycyBkdXJp
bmcgcHJvYmUuDQo+IA0KPiBQZXJoYXBzIHVzaW5nIGludGVycnVwdHMtZXh0ZW5kZWQgaW5zdGVh
ZCBvZiBpbnRlcnJ1cHRzPw0KPiANCj4gRS5nLg0KPiANCj4gICAgIGludGVycnVwdHMtZXh0ZW5k
ZWQgPSA8JmludGMxIDUgMT4sIDwwPiwgPCZpbnRjMiAxIDA+Ow0KDQpUaGFua3MgZm9yIHRoZSBw
b2ludGVyLCBJJ2xsIGhhdmUgYSBsb29rLg0KUGhpbA0K
