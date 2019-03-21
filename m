From: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Subject: Re: [PATCH v3 1/3] devicetree: bindings: bd718x7: document HW state
 related ROHM specific properties
Date: Thu, 21 Mar 2019 12:50:30 +0000
Message-ID: <74b5d125c5cac75b3ab37ff2202966fb3f3395a1.camel@fi.rohmeurope.com>
References: <cover.1550135853.git.matti.vaittinen@fi.rohmeurope.com>
         <6ed4238fb083f52de0f5f013647b2334bad8ebe4.1550135853.git.matti.vaittinen@fi.rohmeurope.com>
         <20190320130259.GN4731@dell> <20190320141701.GA6208@localhost.localdomain>
         <20190321082338.GT4731@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190321082338.GT4731@dell>
Content-Language: de-DE
Content-ID: <5A9EDC7EB113F94184FBFE7E244C0153@de.rohmeurope.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "lee.jones@linaro.org" <lee.jones@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "elven.wang@nxp.com" <elven.wang@nxp.com>, "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Mutanen, Mikko" <Mikko.Mutanen@fi.rohmeurope.com>, "broonie@kernel.org" <broonie@kernel.org>, "angus.ainslie@puri.sm" <angus.ainslie@puri.sm>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "anson.huang@nxp.com" <anson.huang@nxp.com>, "matt.vaittinen@fi.rohmeurope.com" <matt.vaittinen@fi.rohmeurope.com>, "yibin.gong@nxp.com" <yibin.gong@nxp.com>, "Haikola, Heikki" <Heikki.Haikola@fi.rohmeurope.com>
List-Id: devicetree@vger.kernel.org

T24gVGh1LCAyMDE5LTAzLTIxIGF0IDA4OjIzICswMDAwLCBMZWUgSm9uZXMgd3JvdGU6DQo+IE9u
IFdlZCwgMjAgTWFyIDIwMTksIE1hdHRpIFZhaXR0aW5lbiB3cm90ZToNCj4gDQo+ID4gSGVsbG8g
TGVlLCBBbGwNCj4gPiANCj4gPiBPbiBXZWQsIE1hciAyMCwgMjAxOSBhdCAwMTowMjo1OVBNICsw
MDAwLCBMZWUgSm9uZXMgd3JvdGU6DQo+ID4gPiBPbiBUaHUsIDE0IEZlYiAyMDE5LCBNYXR0aSBW
YWl0dGluZW4gd3JvdGU6DQo+ID4gPiANCj4gPiA+ID4gQWRkIFJPSE0gQkQ3MTgzNyAvIEJENzE4
NDcgc3BlY2lmaWMgZGV2aWNlIHRyZWUgYmluZGluZ3MgZm9yDQo+ID4gPiA+IGNvbnRyb2xsaW5n
IHRoZSBQTUlDIHNodXRkb3duL3Jlc2V0IHN0YXRlcyBhbmQgdm9sdGFnZXMgZm9yDQo+ID4gPiA+
IGRpZmZlcmVudCBIVyBzdGF0ZXMuIFRoZSBQTUlDIHdhcyBkZXNpZ25lZCB0byBiZSB1c2VkIHdp
dGggTlhQDQo+ID4gPiA+IGkuTVg4IFNvQyBhbmQgaXQgc3VwcG9ydHMgU05WUyBsb3cgcG93ZXIg
c3RhdGUgd2hpY2ggc2VlbXMgdG8NCj4gPiA+ID4gYmUgdHlwaWNhbCBmb3IgTlhQIGkuTVggU29D
cy4gSG93ZXZlciwgd2hlbiBTTlZTIGlzIHVzZWQgd2UNCj4gPiA+ID4gbXVzdA0KPiA+ID4gPiBu
b3QgYWxsb3cgU1cgdG8gY29udHJvbCBlbmFibGluZy9kaXNhYmxpbmcgdGhvc2UgcmVndWxhdG9y
cw0KPiA+ID4gPiB3aGljaA0KPiA+ID4gPiBhcmUgY3J1Y2lhbCBmb3Igc3lzdGVtIHRvIGJvb3Qg
YXMgdGhlcmUgaXMgYSBIVyBsaW1pdGF0aW9uDQo+ID4gPiA+IHdoaWNoDQo+ID4gPiA+IGNhdXNl
cyBTVyBjb250cm9sbGVkIHJlZ3VsYXRvcnMgdG8gYmUga2VwdCBzaHV0IGRvd24gYWZ0ZXIgU05W
Uw0KPiA+ID4gPiByZXNldC4NCj4gPiA+ID4gDQo+ID4gPiA+IEFsbG93IHNldHRpbmcgdGhlIFNO
VlMgdG8gYmUgdXNlZCBhcyByZXNldCB0YXJnZXQgc3RhdGUgYW5kDQo+ID4gPiA+IGFsbG93DQo+
ID4gPiA+IG1hcmtpbmcgdGhvc2UgcmVndWxhdG9ycyB3aGljaCBhcmUgY3JpdGljYWwgZm9yIGJv
b3QuDQo+ID4gPiA+IA0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aSBWYWl0dGluZW4gPA0K
PiA+ID4gPiBtYXR0aS52YWl0dGluZW5AZmkucm9obWV1cm9wZS5jb20+DQo+ID4gPiA+IC0tLQ0K
PiA+ID4gPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL3JvaG0sYmQ3MTgzNy1wbWljLnR4
dCAgfCAxNw0KPiA+ID4gPiArKysrKysrKysrDQo+ID4gPiA+ICAuLi4vYmluZGluZ3MvcmVndWxh
dG9yL3JvaG0sYmQ3MTgzNy1yZWd1bGF0b3IudHh0ICB8IDM4DQo+ID4gPiA+ICsrKysrKysrKysr
KysrKysrKysrKysNCj4gPiA+ID4gIDIgZmlsZXMgY2hhbmdlZCwgNTUgaW5zZXJ0aW9ucygrKQ0K
PiA+ID4gDQo+ID4gPiBOZWVkcyBhIERUIEFjay4NCj4gPiANCj4gPiBJIHRoaW5rIHRoaXMgd2Fz
IGFscmVhZHkgYXBwbGllZCB0byByZWd1bGF0b3IgdHJlZSBieSBNYXJrOg0KPiA+IA0KaHR0cHM6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvYnJvb25pZS9yZWd1bGF0
b3IuZ2l0L2NvbW1pdC8/aD1mb3ItbmV4dCZpZD1mNDNkMWIzODhmOWJlNGFhNDdlZDQyYzMzNjU5
MjQzYTY3NWM1Yzc2DQo+ID4gRG9lcyBpdCBnbyBpbiB2aWEgaGlzIHRyZWUgb3IgZG8gd2UgbmVl
ZCB0byBhcHBseSBpdCBpbiBMZWUncyB0cmVlDQo+ID4gdG9vPw0KPiANCj4gV2h5IGRvbid0IEkg
c2VlIGFuIGVtYWlsIGZyb20gTWFyaz8NCj4gDQoNCg0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGttbC8yMDE5MDIxNDE2MDAyNS42NUI4RTExMjZGNzhAZGVidXRhbnRlLnNpcmVuYS5vcmcudWsv
DQoNCk1heWJlIHRoYXQncyB3aGF0IHlvdSdyZSBsb29raW5nIGZvcj8NCg0KQnIsDQoJTWF0dGkg
VmFpdHRpbmVuDQo=
