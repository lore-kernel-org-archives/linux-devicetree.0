From: Trent Piepho <tpiepho@impinj.com>
Subject: Re: [1/3] rtc/fsl: support flextimer for lx2160a
Date: Fri, 23 Aug 2019 16:56:28 +0000
Message-ID: <1566579388.5029.8.camel@impinj.com>
References: <20190823095740.12280-1-biwen.li@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190823095740.12280-1-biwen.li@nxp.com>
Content-Language: en-US
Content-ID: <3C3797AA81BCF84B8CB1E3A7DE501830@namprd06.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "leoyang.li@nxp.com" <leoyang.li@nxp.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "a.zummo@towertech.it" <a.zummo@towertech.it>, "biwen.li@nxp.com" <biwen.li@nxp.com>, "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>
Cc: "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

T24gRnJpLCAyMDE5LTA4LTIzIGF0IDE3OjU3ICswODAwLCBCaXdlbiBMaSB3cm90ZToNCj4gVGhl
IHBhdGNoIHN1cHBvcnRzIGZsZXh0aW1lciBmb3IgbHgyMTYwYQ0KPiANCj4gU2lnbmVkLW9mZi1i
eTogQml3ZW4gTGkgPGJpd2VuLmxpQG54cC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ydGMvcnRj
LWZzbC1mdG0tYWxhcm0uYyB8IDEgKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ydGMvcnRjLWZzbC1mdG0tYWxhcm0uYyBiL2Ry
aXZlcnMvcnRjL3J0Yy1mc2wtDQo+IGZ0bS1hbGFybS5jDQo+IGluZGV4IDRmNzI1OWMyZDZhMy4u
MmI4MTUyNWY2ZGI4IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3J0Yy9ydGMtZnNsLWZ0bS1hbGFy
bS5jDQo+ICsrKyBiL2RyaXZlcnMvcnRjL3J0Yy1mc2wtZnRtLWFsYXJtLmMNCj4gQEAgLTMxMyw2
ICszMTMsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBmdG1fcnRjX21hdGNo
W10NCj4gPSB7DQo+ICAJeyAuY29tcGF0aWJsZSA9ICJmc2wsbHMxMDg4YS1mdG0tYWxhcm0iLCB9
LA0KPiAgCXsgLmNvbXBhdGlibGUgPSAiZnNsLGxzMjA4eGEtZnRtLWFsYXJtIiwgfSwNCj4gIAl7
IC5jb21wYXRpYmxlID0gImZzbCxsczEwMjhhLWZ0bS1hbGFybSIsIH0sDQo+ICsJeyAuY29tcGF0
aWJsZSA9ICJmc2wsbHgyMTYwYS1mdG0tYWxhcm0iLCB9LA0KPiAgCXsgfSwNCj4gIH07DQo+ICAN
Cg0KU2luY2UgdGhlcmUncyBubyBkYXRhIGFzc29jaWF0ZWQgd2l0aCBlYWNoIGNvbXBhdGlibGUs
IGl0IGRvZXNuJ3Qgc2VlbQ0KbGlrZSB0aGVyZSdzIGFueSBuZWVkIHRvIGFkZCBhIG5ldyBvbmUu
DQoNCldoYXQncyBub3JtYWxseSBkb25lIGlzIGFkZCB0d28gY29tcGF0aWJsZXMgaW4gdGhlIGR0
cywgdGhlIGJhc2UNCnZlcnNpb24gYW5kIHRoZSBzcGVjaWZpYyB2ZXJzaW9uLCBlLmcuOg0KDQor
CQlyY3BtOiByY3BtQDFlMzQwNDAgew0KKwkJCWNvbXBhdGlibGUgPSAiZnNsLGx4MjE2MGEtcmNw
bSIsICJmc2wscW9yaXEtY3BtLTIuMSsiOw0KDQpPciBpbiB0aGlzIGNhc2UsIGNvbXBhdGlibGUg
PSAiZnNsLGx4MjE2MGEtZnRtLWFsYXJtIiwgImZzbCxsczEwODhhLWZ0bS1hbGFybSI7DQoNClRo
ZW4gdGhlcmUncyBubyBuZWVkIHRvIGFkZCB0byB0aGUgZHJpdmVyIGxpc3Qu
