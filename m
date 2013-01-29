From: "Katepallewar, Mrugesh" <mrugesh.mk@ti.com>
Subject: RE: [PATCH V2] ARM: davinci: da850: add RTC DT entries
Date: Tue, 29 Jan 2013 07:35:07 +0000
Message-ID: <4232EB8829679242B82E712C3DB3149D42355C@DBDE01.ent.ti.com>
References: <1359359268-9781-1-git-send-email-mrugesh.mk@ti.com>
 <5106A105.6030004@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <5106A105.6030004@ti.com>
Content-Language: en-US
Sender: linux-doc-owner@vger.kernel.org
To: "Nori, Sekhar" <nsekhar@ti.com>
Cc: "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "davinci-linux-open-source@linux.davincidsp.com" <davinci-linux-open-source@linux.davincidsp.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "rob@landley.net" <rob@landley.net>, "hs@denx.de" <hs@denx.de>
List-Id: devicetree@vger.kernel.org

T24gTW9uLCBKYW4gMjgsIDIwMTMgYXQgMjE6MzI6MTMsIE5vcmksIFNla2hhciB3cm90ZToNCj4g
SGkgTXJ1Z2VzaCwNCj4gDQo+IE9uIDEvMjgvMjAxMyAxOjE3IFBNLCBNcnVnZXNoIEthdGVwYWxs
ZXdhciB3cm90ZToNCj4gPiBBZGQgUlRDIERUIGVudHJpZXMgaW4gZGE4NTAgZHRzIGZpbGUuDQo+
ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogTXJ1Z2VzaCBLYXRlcGFsbGV3YXIgPG1ydWdlc2gubWtA
dGkuY29tPg0KPiA+IC0tLQ0KPiA+IEFwcGxpZXMgb24gdG9wIG9mIHYzLjgtcmM0IG9mIGxpbnVz
IHRyZWUuDQo+ID4gDQo+ID4gVGhpcyBwYXRjaCBpcyBkZXBlbmRpbmcgb24NCj4gPiAiQVJNOiBk
YXZpbmNpOiBkYTg1MDogYWRkIGludGVycnVwdC1wYXJlbnQgcHJvcGVydHkgaW4gc29jIG5vZGUi
DQo+ID4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8yMDQ0MTAxLw0KPiANCj4g
PiBUZXN0ZWQgb24gZGE4NTAtZXZtIGRldmljZS4NCj4gPiANCj4gPiBUZXN0IFByb2NlZHVyZToN
Cj4gPiBkYXRlIDIwMTMuMDEuMjgtMTA6MDA6MDAgKHVzYWdlOiBkYXRlW1lZWVkuXU1NLkRELWho
Om1tWzpzc10pIGh3Y2xvY2sgDQo+ID4gLXcgcmVzZXQgYm9hcmQgYW5kIGNoZWNrIHN5c3RlbSB0
aW1lLg0KPiANCj4gUXVldWluZyB0aGlzIGZvciB2My45LiBUaGUgdGVzdGluZyBpbmZvcm1hdGlv
biBhYm92ZSBpcyB1c2VmdWwgYW5kIHNob3VsZCBiZSBwYXJ0IG9mIHRoZSBjaGFuZ2Vsb2cuIEkg
bW92ZWQgaXQgdGhlcmUgd2hpbGUgY29tbWl0dGluZy4NCj4gDQo+IEl0IHdpbGwgYmUgbmljZSB0
byBjaGVjayB0aGUgYWxhcm0gZnVuY3Rpb25hbGl0eSBhcyB3ZWxsLiBDYW4geW91IGNoZWNrIHRo
YXQgYW5kIGxldCBtZSBrbm93IHRoYXQgd29ya3MgYXMgd2VsbD8NCg0KSSB0cmllZCB0byB0ZXN0
IFJUQyBhbGFybSB1c2luZyAicnRjd2FrZSIgY29tbWFuZCwgaG93ZXZlciBpdCBpcyBub3Qgd29y
a2luZyBhbmQgcmV0dXJuaW5nIGZvbGxvd2luZyBlcnJvciANCiJydGN3YWtlOiAvZGV2L3J0YzAg
bm90IGVuYWJsZWQgZm9yIHdha2V1cCBldmVudHMiDQpUaGlzIGlzIGNvbWluZyBiZWNhdXNlIHdl
IGhhdmUgbm90IHJlZ2lzdGVyZWQgUlRDIGRldmljZSBhcyBhIHdha2V1cCBzb3VyY2UgeWV0LiAN
Cg0KRm9yIGNoZWNraW5nIFJUQyBhbGFybSBpbnRlcnJ1cHQsIEkgZGV2ZWxvcGVkIG9uZSBzaW1w
bGUgcHJvZ3JhbSB3aGljaCBvcGVucyBSVEMgZGV2aWNlLCBzZXQgYWxhcm0gYW5kIGV4aXRzLg0K
VGhlbiBieSBlbnRlcmluZyAiY2F0IC9wcm9jL2ludGVycnVwdHMiIGNoZWNrZWQgUlRDIGludGVy
cnVwdCBjb3VudC4NCg0KVXNpbmcgYWJvdmUgdGVzdCBpdCBjb25maXJtcyB0aGF0IFJUQyBhbGFy
bSBmdW5jdGlvbmFsaXR5IGlzIHdvcmtpbmcgZmluZS4gDQoNCj4gDQo+IFRoYW5rcywNCj4gU2Vr
aGFyDQo+IA0KDQoNClJlZ2FyZHMsIA0KTXJ1Z2VzaA0K
