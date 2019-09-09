From: Jan Kotas <jank@cadence.com>
Subject: Re: [PATCH v2 2/3] media: Add lane checks for Cadence CSI2RX
Date: Mon, 9 Sep 2019 08:12:54 +0000
Message-ID: <6F0DAE9B-BD7F-44D6-8D5B-92B3B3099CF2@global.cadence.com>
References: <20190905105601.27034-1-jank@cadence.com>
 <20190905105601.27034-3-jank@cadence.com>
 <20190906075413.GE1586@valkosipuli.retiisi.org.uk>
 <1D1666FD-CFC6-4DE1-8A2E-1809D1BDEAAB@global.cadence.com>
 <20190909075153.GA843@valkosipuli.retiisi.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190909075153.GA843@valkosipuli.retiisi.org.uk>
Content-Language: en-US
Content-ID: <AFF097342181FD47A71D32FD1616FEFE@namprd07.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Jan Kotas <jank@cadence.com>, Maxime Ripard <maxime.ripard@bootlin.com>, "mchehab@kernel.org" <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rafal Ciepiela <rafalc@cadence.com>, linux-media <linux-media@vger.kernel.org>, linux-devicetree <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

DQoNCj4gT24gOSBTZXAgMjAxOSwgYXQgMDk6NTEsIFNha2FyaSBBaWx1cyA8c2FrYXJpLmFpbHVz
QGlraS5maT4gd3JvdGU6DQo+IA0KPiANCj4gT24gTW9uLCBTZXAgMDksIDIwMTkgYXQgMDc6NDE6
MjFBTSArMDAwMCwgSmFuIEtvdGFzIHdyb3RlOg0KPj4gDQo+PiANCj4+IEhlbGxvIFNha2FyaSwN
Cj4+IA0KPj4gVGhhbmtzIGZvciB5b3VyIHJlcGx5Lg0KPj4+IE9uIDYgU2VwIDIwMTksIGF0IDA5
OjU0LCBTYWthcmkgQWlsdXMgPHNha2FyaS5haWx1c0Bpa2kuZmk+IHdyb3RlOg0KPj4+IA0KPj4+
IEhpIEphbiwNCj4+PiANCj4+PiBUaGFua3MgZm9yIHRoZSBwYXRjaHNldC4NCj4+PiANCj4+PiBP
biBUaHUsIFNlcCAwNSwgMjAxOSBhdCAxMTo1NjowMEFNICswMTAwLCBKYW4gS290YXMgd3JvdGU6
DQo+Pj4+IC8qDQo+Pj4+ICogRHJpdmVyIGZvciBDYWRlbmNlIE1JUEktQ1NJMiBSWCBDb250cm9s
bGVyIHYxLjMNCj4+Pj4gKg0KPj4+PiAtICogQ29weXJpZ2h0IChDKSAyMDE3IENhZGVuY2UgRGVz
aWduIFN5c3RlbXMgSW5jLg0KPj4+PiArICogQ29weXJpZ2h0IChDKSAyMDE3LTIwMTkgQ2FkZW5j
ZSBEZXNpZ24gU3lzdGVtcyBJbmMuDQo+Pj4+ICovDQo+Pj4+IA0KPj4+PiArCWZvciAoaSA9IDA7
IGkgPCBjc2kycngtPm51bV9sYW5lczsgaSsrKSB7DQo+Pj4+ICsJCWlmIChjc2kycngtPmxhbmVz
W2ldIDwgMSkgew0KPj4+IA0KPj4+IERvIHlvdSBuZWVkIHRoaXM/IHY0bDJfZndub2RlX3BhcnNl
X2VuZHBvaW50KCkgYWxyZWFkeSBoYXMgYSBtb3JlIHRob3JvdWdoDQo+Pj4gY2hlY2sgZm9yIHRo
ZSBsYW5lIG51bWJlcnMuDQo+PiANCj4+IEkgbG9va2VkIGF0IHRoZSBzb3VyY2UgY29kZSBvZiB2
NGwyX2Z3bm9kZV9lbmRwb2ludF9wYXJzZV9jc2kyX2J1cw0KPj4gYW5kIHRoaXMgcGFydGljdWxh
ciBjYXNlIGRvZXNu4oCZdCBzZWVtIHRvIGJlIGNoZWNrZWQuDQo+IA0KPiBOb3Qgc3BlY2lmaWNh
bGx5LCBzaW5jZSAwIGlzIGEgdmFsaWQgbGFuZSBudW1iZXIuDQo+IA0KPiBIb3dldmVyLCB0aGUg
ZHJpdmVyIG9ubHkgYXBwZWFycyB0byBiZSB1c2luZyB0aGUgaW5mb3JtYXRpb24gb24gaG93IG1h
bnkNCj4gbGFuZXMgdGhlcmUgYXJlLiBJZiB0aGUgaGFyZHdhcmUgZG9lc24ndCBzdXBwb3J0IGxh
bmUgcm91dGluZywgdGhlbiB0aGlzIGlzDQo+IGFsbCB5b3UgbmVlZC4gT3RoZXJ3aXNlIGFkZGl0
aW9uYWwgY2hlY2tzIHNob3VsZCBiZSBhZGRlZCBpbiBjYXNlIHRoZXJlIGFyZQ0KPiBsaW1pdGF0
aW9ucyBob3cgdGhlIGxhbmVzIGNhbiBiZSByb3V0ZWQuDQoNClRoZSBDU0kyUlggdjEuMyBkb2Vz
IHN1cHBvcnQgdGhhdCAoQ1NJMlJYX1NUQVRJQ19DRkdfUkVHKQ0KYW5kIGFzc3VtZXMgdGhlIGZp
cnN0IGRhdGEgbGFuZSBoYXMgbnVtYmVyIDEuDQoNClJlZ3JhZHMsDQpKYW4NCg0KPiAtLSANCj4g
U2FrYXJpIEFpbHVzDQoNCg==
