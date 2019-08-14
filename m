From: Robert Chiras <robert.chiras@nxp.com>
Subject: Re: [EXT] Re: [PATCH v2 09/15] dt-bindings: display: Add max-res
 property for mxsfb
Date: Wed, 14 Aug 2019 11:14:03 +0000
Message-ID: <1565781243.3209.55.camel@nxp.com>
References: <1565779731-1300-1-git-send-email-robert.chiras@nxp.com>
 <1565779731-1300-10-git-send-email-robert.chiras@nxp.com>
 <491aff3d08f24ab4d79a4f8c139d2e44@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <491aff3d08f24ab4d79a4f8c139d2e44@agner.ch>
Content-Language: en-US
Content-ID: <F9C4CA47FB2C2D4F9A249683358F1BBF@eurprd04.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "stefan@agner.ch" <stefan@agner.ch>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>
Cc: "marex@denx.de" <marex@denx.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "airlied@linux.ie" <airlied@linux.ie>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "agx@sigxcpu.org" <agx@sigxcpu.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, dl-linux-imx <linux-imx@nxp.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, "festevam@gmail.com" <festevam@gmail.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

SGkgU3RlZmFuLA0KT24gTWksIDIwMTktMDgtMTQgYXQgMTM6MDMgKzAyMDAsIFN0ZWZhbiBBZ25l
ciB3cm90ZToNCj4gT24gMjAxOS0wOC0xNCAxMjo0OCwgUm9iZXJ0IENoaXJhcyB3cm90ZToNCj4g
PiANCj4gPiBBZGQgbmV3IG9wdGlvbmFsIHByb3BlcnR5ICdtYXgtcmVzJywgdG8gbGltaXQgdGhl
IG1heGltdW0gc3VwcG9ydGVkDQo+ID4gcmVzb2x1dGlvbiBieSB0aGUgTVhTRkJfRFJNIGRyaXZl
ci4NCj4gSSB3b3VsZCBhbHNvIG1lbnRpb24gdGhlIHJlYXNvbiB3aHkgd2UgbmVlZCB0aGlzLg0K
PiANCj4gSSBndWVzcyB0aGlzIG5lZWRzIGEgdmVuZG9yIHByZWZpeCBhcyB3ZWxsIChmc2wsbWF4
LXJlcykuIEkgYWxzbw0KPiB3b3VsZA0KPiBsaWtlIHRvIGhhdmUgdGhlIGFjayBvZiB0aGUgZGV2
aWNlIHRyZWUgZm9sa3MgaGVyZS4NClJvYiBIZXJyaW5nIGFsc28gYWtlZCBiZSBhYm91dCB0aGlz
LCBhbmQgSSdsbCBjb3B5IGhlcmUgdGhlIHJlcGx5LCB3aXRoDQpleHBsYW5hdGlvbnM6DQoNCklu
ZGVlZCwgdGhpcyBsaW1pdGF0aW9uIGlzIGFjdHVhbGx5IGR1ZSB0byBiYW5kd2lkdGggbGltaXRh
dGlvbiwgYnV0DQp0aGUgcHJvYmxlbSBpcyB0aGF0IHRoaXMgbGltaXRhdGlvbiBjb21lcyBvbiBp
Lk1YOE0gKGtub3duIGFzIG1TY2FsZQ0KODUwRCksIHdoZXJlIHRoZSBtZW1vcnkgYmFuZHdpZHRo
IGNhbm5vdCBzdXBwb3J0OiBHUFUvVlBVIHdvcmtsb2FkIGluDQp0aGUgc2FtZSB0aW1lIHdpdGgg
Ym90aCBEQ1NTIGRyaXZpbmcgNGtANjAgYW5kIGVMQ0RJRiBkcml2aW5nIDEwODBwQDYwLg0KU2lu
Y2UgZUxDRElGIGlzIGEgc2Vjb25kYXJ5IGRpc3BsYXkgd2UgdGhvdWdoIHRvIGFkZCB0aGUgcG9z
aWJpbGl0eSB0bw0KbGltaXQgaXQncyBiYW5kd2lkdGggYnkgbGltaXRpbmcgdGhlIHJlc29sdXRp
b24uDQpJZiB5b3Ugc2F5IHRoYXQgbW9yZSBkZXRhaWxzIGFyZSBuZWVkZWQsIEkgY2FuIGFkZCB0
aGVtIGluIHRoZQ0KZGVzY3JpcHRpb24uDQo+IA0KPiAtLQ0KPiBTdGVmYW4NCj4gDQo+ID4gDQo+
ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogUm9iZXJ0IENoaXJhcyA8cm9iZXJ0LmNoaXJhc0BueHAu
Y29tPg0KPiA+IC0tLQ0KPiA+IMKgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvbXhzZmIudHh0IHwgNiArKysrKysNCj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCA2IGluc2Vy
dGlvbnMoKykNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvbXhzZmIudHh0DQo+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9teHNmYi50eHQNCj4gPiBpbmRleCA0NzJlMWVhLi41NWUyMmVk
IDEwMDY0NA0KPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L214c2ZiLnR4dA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L214c2ZiLnR4dA0KPiA+IEBAIC0xNyw2ICsxNywxMiBAQCBSZXF1aXJlZCBwcm9w
ZXJ0aWVzOg0KPiA+IMKgUmVxdWlyZWQgc3ViLW5vZGVzOg0KPiA+IMKgwqDCoC0gcG9ydDogVGhl
IGNvbm5lY3Rpb24gdG8gYW4gZW5jb2RlciBjaGlwLg0KPiA+IA0KPiA+ICtPcHRpb25hbCBwcm9w
ZXJ0aWVzOg0KPiA+ICstIG1heC1yZXM6wqDCoMKgYW4gYXJyYXkgd2l0aCBhIG1heGltdW0gb2Yg
dHdvIGludGVnZXJzLCByZXByZXNlbnRpbmcNCj4gPiB0aGUNCj4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBtYXhpbXVtIHN1cHBvcnRlZCByZXNvbHV0aW9uLCBpbiB0aGUgZm9ybSBvZg0K
PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoDxtYXhYPiwgPG1heFk+OyBpZiBvbmUgb2Yg
dGhlIGl0ZW0gaXMgPDA+LCB0aGUNCj4gPiBkZWZhdWx0DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgZHJpdmVyLWRlZmluZWQgbWF4aW11bSByZXNvbHV0aW9uIGZvciB0aGF0IGF4aXMg
aXMNCj4gPiB1c2VkDQo+ID4gKw0KPiA+IMKgRXhhbXBsZToNCj4gPiANCj4gPiDCoMKgwqDCoMKg
wqBsY2RpZjE6IGRpc3BsYXktY29udHJvbGxlckAyMjIwMDAwIHsNCg0KVGhhbmtzLA0KUm9iZXJ0
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFy
bS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1r
ZXJuZWwK
