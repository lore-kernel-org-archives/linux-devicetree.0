From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: Re: [PATCH v2 4/6] dt-bindings: soc/fsl: qe: document new
 fsl,qe-snums binding
Date: Wed, 1 May 2019 18:47:10 +0000
Message-ID: <12a4abf5-2a56-c5d3-dc43-59b1473c0829@prevas.dk>
References: <20190430133615.25721-1-rasmus.villemoes@prevas.dk>
 <20190501092841.9026-1-rasmus.villemoes@prevas.dk>
 <20190501092841.9026-5-rasmus.villemoes@prevas.dk>
 <4c3aef881393398ca18efac99b1f76e7dbd19acf.camel@infinera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4c3aef881393398ca18efac99b1f76e7dbd19acf.camel@infinera.com>
Content-Language: en-US
Content-ID: <8D3C3DDBAB3D4847BB37F9D538B0407B@EURPRD10.PROD.OUTLOOK.COM>
Sender: linux-kernel-owner@vger.kernel.org
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>, "leoyang.li@nxp.com" <leoyang.li@nxp.com>, "qiang.zhao@nxp.com" <qiang.zhao@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "oss@buserror.net" <oss@buserror.net>, Rasmus Villemoes <Rasmus.Villemoes@prevas.se>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

T24gMDEvMDUvMjAxOSAxNy4xMiwgSm9ha2ltIFRqZXJubHVuZCB3cm90ZToNCj4gT24gV2VkLCAy
MDE5LTA1LTAxIGF0IDA5OjI5ICswMDAwLCBSYXNtdXMgVmlsbGVtb2VzIHdyb3RlOg0KPj4gQ0FV
VElPTjogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSBvZiB0aGUgb3JnYW5pemF0
aW9uLiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IHJl
Y29nbml6ZSB0aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuDQo+Pg0KPj4N
Cj4+IFJlYWRpbmcgdGFibGUgNC0zMCwgYW5kIGl0cyBmb290bm90ZXMsIG9mIHRoZSBRVUlDQyBF
bmdpbmUgQmxvY2sNCj4+IFJlZmVyZW5jZSBNYW51YWwgc2hvd3MgdGhhdCB0aGUgc2V0IG9mIHNu
dW0gX3ZhbHVlc18gaXMgbm90DQo+PiBuZWNlc3NhcmlseSBqdXN0IGEgZnVuY3Rpb24gb2YgdGhl
IF9udW1iZXJfIG9mIHNudW1zLCBhcyBnaXZlbiBpbiB0aGUNCj4+IGZzbCxxZS1udW0tc251bXMg
cHJvcGVydHkuDQo+Pg0KPj4gQXMgYW4gYWx0ZXJuYXRpdmUsIHRvIG1ha2UgaXQgZWFzaWVyIHRv
IGFkZCBzdXBwb3J0IGZvciBvdGhlciB2YXJpYW50cw0KPj4gb2YgdGhlIFFVSUNDIGVuZ2luZSBJ
UCwgdGhpcyBpbnRyb2R1Y2VzIGEgbmV3IGJpbmRpbmcgZnNsLHFlLXNudW1zLA0KPj4gd2hpY2gg
YXV0b21hdGljYWxseSBlbmNvZGVzIGJvdGggdGhlIG51bWJlciBvZiBzbnVtcyBhbmQgdGhlIGFj
dHVhbA0KPj4gdmFsdWVzIHRvIHVzZS4NCj4+DQo+PiBGb3IgZXhhbXBsZSwgZm9yIHRoZSBNUEM4
MzA5LCBvbmUgd291bGQgc3BlY2lmeSB0aGUgcHJvcGVydHkgYXMNCj4+DQo+PiAgICAgICAgICAg
ICAgICBmc2wscWUtc251bXMgPSAvYml0cy8gOCA8DQo+PiAgICAgICAgICAgICAgICAgICAgICAg
IDB4ODggMHg4OSAweDk4IDB4OTkgMHhhOCAweGE5IDB4YjggMHhiOQ0KPj4gICAgICAgICAgICAg
ICAgICAgICAgICAweGM4IDB4YzkgMHhkOCAweGQ5IDB4ZTggMHhlOT47DQo+IA0KPiBJIHRoaW5r
IHlvdSBuZWVkIGFkZCB0aGlzIGV4YW1wbGUgdG8gdGhlIHFlLnR4dCBkb2MgaXRzZWxmdC4NCg0K
U3VyZSwgY2FuIGRvLg0KDQo+IEJUVywgd2hhdCBpcyAvYml0cy8gPw0KDQpUaGF0IGluZGljYXRl
cyB0aGF0IHRoZSBudW1iZXJzIHNob3VsZCBiZSBzdG9yZWQgYXMgYW4gYXJyYXkgb2YgdTgsIGFu
ZA0Kbm90IGFzIGJ5IGRlZmF1bHQgYW4gYXJyYXkgb2YgKGJpZy1lbmRpYW4pIDMyLWJpdCBudW1i
ZXJzLiBTZWUNCg0KaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL3V0aWxzL2R0Yy9kdGMu
Z2l0L3RyZWUvRG9jdW1lbnRhdGlvbi9kdHMtZm9ybWF0LnR4dCNuNDYNCg0KVGhpcyBpcyBhbHJl
YWR5IHVzZWQgaW4gc29tZSBiaW5kaW5ncyBhbmQgZXhpc3RpbmcgLmR0cyAoZS5nLg0KaHdtb24v
YXNwZWVkLXB3bS10YWNoby50eHQsIGJ1dCBnaXQgZ3JlcCBzaG93cyBtYW55IG1vcmUpLg0KDQpS
YXNtdXMNCg==
