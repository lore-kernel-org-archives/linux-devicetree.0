From: "Philip, Avinash" <avinashphilip@ti.com>
Subject: RE: [PATCH v2 0/3] mtd: nand: OMAP: ELM error correction support
 for BCH ecc
Date: Tue, 4 Dec 2012 13:20:50 +0000
Message-ID: <518397C60809E147AF5323E0420B992E3EA108CE@DBDE01.ent.ti.com>
References: <1351667307-447-1-git-send-email-avinashphilip@ti.com>
	 <1352978534.2221.33.camel@sauron.fi.intel.com>
	 <518397C60809E147AF5323E0420B992E3E9EC70D@DBDE01.ent.ti.com>
	 <1353581032.2701.34.camel@sauron.fi.intel.com>
	 <518397C60809E147AF5323E0420B992E3E9EE329@DBDE01.ent.ti.com>
 <1354278498.30168.117.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1354278498.30168.117.camel@sauron.fi.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>
Cc: "ivan.djelic@parrot.com" <ivan.djelic@parrot.com>, "Mohammed, Afzal" <afzal@ti.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "tony@atomide.com" <tony@atomide.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "broonie@opensource.wolfsonmicro.com" <broonie@opensource.wolfsonmicro.com>, "Nori, Sekhar" <nsekhar@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Hebbar, Gururaja" <gururaja.hebbar@ti.com>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "rmk+kernel@arm.linux.org.uk" <rmk+kernel@arm.linux.org.uk>, "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

T24gRnJpLCBOb3YgMzAsIDIwMTIgYXQgMTc6NTg6MTgsIEFydGVtIEJpdHl1dHNraXkgd3JvdGU6
DQo+IE9uIFRodSwgMjAxMi0xMS0yMiBhdCAxNDozNyArMDAwMCwgUGhpbGlwLCBBdmluYXNoIHdy
b3RlOg0KPiA+IElkZWEgaGVyZSBpcyB0byBtYWtlIGZhc3RlciBzY2FubmluZyBvZiBlcmFzZWQg
cGFnZSB3aXRob3V0IGJpdCBmbGlwcy4NCj4gPiBGb3Igb21hcCBuYW5kIGRyaXZlciBlY2MgcmVw
b3J0ZWQgYnkgaGFyZHdhcmUgaXMgbm9uLXplcm8gYW5kIG5vbg0KPiA+IDB4ZmYuDQo+ID4gU28g
Y29tcGFyaW5nIHdpdGggdGhlIHN0YW5kYXJkIHZlY3RvciBmb3IgZXJhc2VkIHBhZ2UgYW5kIHNr
aXBwaW5nDQo+ID4gZXJyb3INCj4gPiBjb3JyZWN0aW9uIGZvciBlcmFzZWQgcGFnZSB3aXRob3V0
IGJpdCBmbGlwcy4NCj4gDQo+IFNvIHlvdSBtZWFuIHRoYXQgd2hlbiB5b3UgcmVhZCBhIHBhZ2Us
IGFuZCB5b3Ugc2VlIHRoZXJlIGFyZSBiaXQtZmxpcHMsDQo+IHlvdSBzdGFydCBjb3JyZWN0aW5n
IHRoZW0uIEJ1dCBpZiB5b3Ugbm90aWNlIHRoYXQgdGhlIHBhZ2UgaXMgYWN0dWFsbHkNCj4gYW4g
ZXJhc2VkIHBhZ2UsIHlvdSBvcHRpbWl6ZSB0aGlzIGNhc2UgYnkgbm90IHJ1bm5pbmcgdGhlIGNv
cnJlY3Rpb24NCj4gbWFjaGluZXJ5LCBidXQganVzdCBmaWxsaW5nIHRoZSBidWZmZXIgd2l0aCAw
eEZGcy4gUmlnaHQ/DQoNClllcyBpdCBpcyBhbiBvcHRpbWl6YXRpb24gZm9yIGVyYXNlZCBwYWdl
IGJpdCBmbGlwIGhhbmRsaW5nLg0KT24gZXJhc2VkIHBhZ2UsIGVjYyBieXRlcyBub3QgdmFsaWQu
ICBTbyBubyBkaXJlY3QgY29ycmVjdGlvbiBtYWNoaW5lcnkNCmF2YWlsYWJsZSBmb3IgYml0IGZs
aXBzIGluIGVyYXNlZCBwYWdlLiBIZW5jZSBJIHdhcyBjaGVja2luZyBpZiBhbnkgYml0IGZsaXBz
DQpyZXBvcnRlZCBpbiBlcmFzZWQgcGFnZS4gSWYgYml0IGZsaXAgcHJlc2VudCBpbiBlcmFzZWQg
cGFnZSBhbmQgZmFsbHMgdW5kZXINCmNvcnJlY3RhYmxlIGxldmVsLCByZXBvcnQgdGhlIHBhZ2Ug
d2l0aCAweGZmIHdpdGggY29ycmVjdGFibGUgZXJyb3JzLg0KDQoNClRoYW5rcw0KQXZpbmFzaA0K
DQo+ID4gDQo+IC0tIA0KPiBCZXN0IFJlZ2FyZHMsDQo+IEFydGVtIEJpdHl1dHNraXkNCj4gDQoN
Cg==
