From: Atish Patra <Atish.Patra@wdc.com>
Subject: Re: [PATCH v3 3/5] RISC-V: Fix unsupported isa string info.
Date: Wed, 7 Aug 2019 17:31:51 +0000
Message-ID: <a2795337bd86ff22ae9618d7ccae22e7482be332.camel@wdc.com>
References: <20190801005843.10343-1-atish.patra@wdc.com>
         <20190801005843.10343-4-atish.patra@wdc.com>
         <alpine.DEB.2.21.9999.1908061625190.13971@viisi.sifive.com>
         <1e23ef1face9d323fda4b756811f922caa5f7689.camel@wdc.com>
         <alpine.DEB.2.21.9999.1908061818360.13971@viisi.sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.21.9999.1908061818360.13971@viisi.sifive.com>
Content-Language: en-US
Content-ID: <AB926A394B57D04583BF73AC1DC978FA@namprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>
Cc: "info@metux.net" <info@metux.net>, "allison@lohutok.net" <allison@lohutok.net>, "palmer@sifive.com" <palmer@sifive.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, Anup Patel <Anup.Patel@wdc.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "johan@kernel.org" <johan@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "tiny.windzz@gmail.com" <tiny.windzz@gmail.com>, "gary@garyguo.net" <gary@garyguo.net>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

T24gVHVlLCAyMDE5LTA4LTA2IGF0IDE4OjI2IC0wNzAwLCBQYXVsIFdhbG1zbGV5IHdyb3RlOg0K
PiBPbiBXZWQsIDcgQXVnIDIwMTksIEF0aXNoIFBhdHJhIHdyb3RlOg0KPiANCj4gPiBPbiBUdWUs
IDIwMTktMDgtMDYgYXQgMTY6MjcgLTA3MDAsIFBhdWwgV2FsbXNsZXkgd3JvdGU6DQo+ID4gDQo+
ID4gPiBTZWVtcyBsaWtlIHRoZSAic3UiIHNob3VsZCBiZSBkcm9wcGVkIGZyb20gbWFuZGF0b3J5
X2V4dC4gIFdoYXQNCj4gPiA+IGRvIHlvdSANCj4gPiA+IHRoaW5rPw0KPiA+ID4gDQo+ID4gDQo+
ID4gWXVwLiBBcyBEVCBiaW5kaW5nIG9ubHkgbWVudGlvbiBpbWFmZGMsIG1hbmRhdG9yeSBleHRl
bnNpb25zIHNob3VsZA0KPiA+IGNvbnRhaW4gb25seSB0aGF0IGFuZCBqdXN0IGNvbnNpZGVyICJz
dSIgZXh0ZW5zaW9ucyBhcmUgY29uc2lkZXJlZA0KPiA+IGFzDQo+ID4gaW1wbGljaXQgYXMgd2Ug
YXJlIHJ1bm5pbmcgTGludXguIA0KPiANCj4gRGlzY3Vzc2luZyB0aGlzIHdpdGggQW5kcmV3IGFu
ZCBQYWxtZXIsIGl0IGxvb2tzIGxpa2UgInN1IiBpcw0KPiBjdXJyZW50bHkgDQo+IG5vbi1jb21w
bGlhbnQuICBTZWN0aW9uIDIyLjYgb2YgdGhlIHVzZXItbGV2ZWwgc3BlY2lmaWNhdGlvbiBzdGF0
ZXMNCj4gdGhhdCANCj4gdGhlICJzIiBjaGFyYWN0ZXIgaW5kaWNhdGVzIHRoYXQgYSBsb25nZXIg
c3RhbmRhcmQgc3VwZXJ2aXNvcg0KPiBleHRlbnNpb24gDQo+IG5hbWUgd2lsbCBmb2xsb3cuICBT
byBmYXIgSSBkb24ndCB0aGluayBhbnkgb2YgdGhlc2UgaGF2ZSBiZWVuDQo+IGRlZmluZWQuDQo+
IA0KPiA+IERvIHlvdSB0aGluayBRRU1VIERUIHNob3VsZCBiZSB1cGRhdGVkIHRvIHJlZmxlY3Qg
dGhhdCA/DQo+IA0KPiBZZXMuDQo+IA0KPiA+ID4gVGhlcmUncyBubyBLY29uZmlnIG9wdGlvbiBi
eSB0aGlzIG5hbWUsIGFuZCB3ZSdyZSByZXF1aXJpbmcNCj4gPiA+IGNvbXByZXNzZWQgDQo+ID4g
DQo+ID4gU29ycnkuIFRoaXMgd2FzIGEgdHlwby4gSXQgc2hvdWxkIGhhdmUgYmVlbiBDT05GSUdf
UklTQ1ZfSVNBX0MuDQo+ID4gDQo+ID4gPiBpbnN0cnVjdGlvbiBzdXBwb3J0IGFzIHBhcnQgb2Yg
dGhlIFJJU0MtViBMaW51eCBiYXNlbGluZS4gIENvdWxkDQo+ID4gPiB5b3UgDQo+ID4gPiBzaGFy
ZSB0aGUgcmF0aW9uYWxlIGJlaGluZCB0aGlzPw0KPiA+IA0KPiA+IEkgdGhpbmsgSSBhZGRlZCB0
aGlzIGNoZWNrIGF0IHRoZSBjb25maWcgZmlsZS4gTG9va2luZyBhdCB0aGUNCj4gPiBLY29uZmln
LA0KPiA+IFJJU0NWX0lTQV9DIGlzIGFsd2F5cyBlbmFibGVkLiBTbyB3ZSBjYW4gZHJvcCB0aGlz
Lg0KPiANCj4gT0sgZ3JlYXQuICBEbyB5b3Ugd2FudCB0byByZXNlbmQgYW4gdXBkYXRlZCBwYXRj
aCwgb3Igd291bGQgeW91IGxpa2UNCj4gbWUgdG8gDQo+IGZpeCBpdCB1cCBoZXJlPw0KPiANCg0K
SSBhbSBzZW5kaW5nIHRoZSBwYXRjaCByaWdodCBub3cuIFdlIGNhbiByZW1vdmUgdGhlICdTJyBt
b2RlIGNoZWNrIGFzDQpwYWxtZXIgaGF2ZSBhbHJlYWR5IHNlbnQgdGhlIFFFTVUgcGF0Y2ggYXMg
d2VsbCwgLg0KDQpSZWdhcmRzLA0KQXRpc2gNCj4gSSdsbCBhbHNvIHNlbmQgYSBwYXRjaCB0byBk
cm9wIENPTkZJR19SSVNDVl9JU0FfQy4NCj4gDQo+IA0KPiAtIFBhdWwNCg0K
