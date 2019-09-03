Return-Path: <SRS0=x5b/=W6=nxp.com=anson.huang@kernel.org>
From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH V2 1/5] dt-bindings: fsl: scu: add scu power key binding
Date: Tue, 3 Sep 2019 06:55:56 +0000
Message-ID: 
 <DB3PR0402MB39166F389FA13B290F357C80F5B90@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1567519424-32271-1-git-send-email-Anson.Huang@nxp.com>
 <21d2e400-976a-35c3-6875-4cc0c476fdf2@pengutronix.de>
 <DB3PR0402MB391656FC3603B30300ADBF27F5B90@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <7c3b6ae3-9f22-11f8-2464-79d02ac656f3@pengutronix.de>
In-Reply-To: <7c3b6ae3-9f22-11f8-2464-79d02ac656f3@pengutronix.de>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
To: Oleksij Rempel <o.rempel@pengutronix.de>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>, "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>, Aisheng Dong <aisheng.dong@nxp.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, Andy Duan <fugang.duan@nxp.com>, Peng Fan <peng.fan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, Leonard Crestez <leonard.crestez@nxp.com>, "mripard@kernel.org" <mripard@kernel.org>, "olof@lixom.net" <olof@lixom.net>, "arnd@arndb.de" <arnd@arndb.de>, "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "dinguyen@kernel.org" <dinguyen@kernel.org>, "marcin.juszkiewicz@linaro.org" <marcin.juszkiewicz@linaro.org>, "stefan@agner.ch" <stefan@agner.ch>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, "yuehaibing@huawei.com" <yuehaibing@huawei.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "ronald@innovation.ch" <ronald@innovation.ch>, "m.felsch@pengutronix.de" <m.felsch@pengutronix.de>, Jacky Bai <ping.bai@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

SGksIE9sZWtzaWoNCg0KPiBPbiAwMy4wOS4xOSAwODozNywgQW5zb24gSHVhbmcgd3JvdGU6DQo+
ID4gSGksIE9sZWtzaWoNCj4gPg0KPiA+PiBPbiAwMy4wOS4xOSAxNjowMywgQW5zb24gSHVhbmcg
d3JvdGU6DQo+ID4+PiBOWFAgaS5NWDhRWFAgaXMgYW4gQVJNdjggU29DIHdpdGggYSBDb3J0ZXgt
TTQgY29yZSBpbnNpZGUgYXMgc3lzdGVtDQo+ID4+PiBjb250cm9sbGVyLCB0aGUgc3lzdGVtIGNv
bnRyb2xsZXIgaXMgaW4gY2hhcmdlIG9mIHN5c3RlbSBwb3dlciwNCj4gPj4+IGNsb2NrIGFuZCBw
b3dlciBrZXkgZXZlbnQgZXRjLiBtYW5hZ2VtZW50LCBMaW51eCBrZXJuZWwgaGFzIHRvDQo+ID4+
PiBjb21tdW5pY2F0ZSB3aXRoIHN5c3RlbSBjb250cm9sbGVyIHZpYSBNVSAobWVzc2FnZSB1bml0
KSBJUEMgdG8gZ2V0DQo+ID4+PiBwb3dlciBrZXkgZXZlbnQsIGFkZCBiaW5kaW5nIGRvYyBmb3Ig
aS5NWCBzeXN0ZW0gY29udHJvbGxlciBwb3dlciBrZXkNCj4gZHJpdmVyLg0KPiA+Pj4NCj4gPj4+
IFNpZ25lZC1vZmYtYnk6IEFuc29uIEh1YW5nIDxBbnNvbi5IdWFuZ0BueHAuY29tPg0KPiA+Pj4g
LS0tDQo+ID4+PiBDaGFuZ2VzIHNpbmNlIFYxOg0KPiA+Pj4gCS0gcmVtb3ZlICJ3YWtldXAtc291
cmNlIiBwcm9wZXJ0eSwgYXMgaXQgaXMgTk9UIG5lZWRlZCBmb3IgU0NVDQo+ID4+IGludGVycnVw
dDsNCj4gPj4+IAktIHJlbW92ZSAic3RhdHVzIiBpbiBleGFtcGxlLg0KPiA+Pj4gLS0tDQo+ID4+
PiAgICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vZnJlZXNjYWxlL2ZzbCxzY3UudHh0ICAg
ICAgICAgIHwgMTQNCj4gPj4gKysrKysrKysrKysrKysNCj4gPj4+ICAgIDEgZmlsZSBjaGFuZ2Vk
LCAxNCBpbnNlcnRpb25zKCspDQo+ID4+Pg0KPiA+Pj4gZGlmZiAtLWdpdA0KPiA+Pj4gYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2ZyZWVzY2FsZS9mc2wsc2N1LnR4dA0K
PiA+Pj4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2ZyZWVzY2FsZS9m
c2wsc2N1LnR4dA0KPiA+Pj4gaW5kZXggYzE0OWZhZC4uZjkzZTJlNCAxMDA2NDQNCj4gPj4+IC0t
LSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vZnJlZXNjYWxlL2ZzbCxz
Y3UudHh0DQo+ID4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJt
L2ZyZWVzY2FsZS9mc2wsc2N1LnR4dA0KPiA+Pj4gQEAgLTE1Nyw2ICsxNTcsMTUgQEAgUmVxdWly
ZWQgcHJvcGVydGllczoNCj4gPj4+ICAgIE9wdGlvbmFsIHByb3BlcnRpZXM6DQo+ID4+PiAgICAt
IHRpbWVvdXQtc2VjOiBjb250YWlucyB0aGUgd2F0Y2hkb2cgdGltZW91dCBpbiBzZWNvbmRzLg0K
PiA+Pj4NCj4gPj4+ICtQb3dlciBrZXkgYmluZGluZ3MgYmFzZWQgb24gU0NVIE1lc3NhZ2UgUHJv
dG9jb2wNCj4gPj4+ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0NCj4gPj4+ICsNCj4gPj4+ICtSZXF1aXJlZCBwcm9wZXJ0aWVzOg0K
PiA+Pj4gKy0gY29tcGF0aWJsZTogc2hvdWxkIGJlOg0KPiA+Pj4gKyAgICAgICAgICAgICAgImZz
bCxpbXg4cXhwLXNjLXB3cmtleSINCj4gPj4+ICsgICAgICAgICAgICAgIGZvbGxvd2VkIGJ5ICJm
c2wsaW14LXNjLXB3cmtleSI7DQo+ID4+PiArLSBsaW51eCxrZXljb2RlczogU2VlDQo+ID4+PiAr
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lucHV0L2tleXMudHh0DQo+ID4+DQo+
ID4+IGxpbnV4LGtleWNvZGVzIGlzIHJlcXVpcmVkIHBhcmFtZXRlci4gU28sIHRoaXMga2F5IGNh
YiBiZSBhbnl0aGluZy4NCj4gPj4gV2h5IHRoZSBjb21wYXRpYmxlIGlzIGNhbGxlZCBwd3JrZXk/
IFByb2JhYmx5IGl0IGlzIGJldHRlciB0byBjYWxsIGl0ICIqLXNjLQ0KPiBrZXkiDQo+ID4NCj4g
PiBUaGlzIGtleSBpcyBraW5kIG9mIHNwZWNpYWwsIGl0IGlzIE9OL09GRiBidXR0b24gd2hpY2gg
aXMgZGVzaWduZWQgZm9yDQo+ID4gcG93ZXIga2V5IHB1cnBvc2UsIGl0IGhhcyBIVyBmdW5jdGlv
biBzdWNoIGFzIGxvbmcgcHJlc3NpbmcgaXQgd291bGQNCj4gPiBzaHV0ZG93biB0aGUgc3lzdGVt
IHBvd2VyLCBzbyB3ZSBhbHdheXMgdXNlIGl0IGFzIHBvd2VyIGtleSwgTk9UDQo+IGdlbmVyYWwg
a2V5LCBkb2VzIGl0IG1ha2Ugc2Vuc2U/DQo+IA0KPiBJIGFzc3VtZSwgT0YgZGV2cyB3aWxsIGFy
Z3VlOiBEVCBpcyBkZXNjcmliaW5nIGhhcmR3YXJlIG5vdCBzb2Z0d2FyZS4NCj4gT24gb3RoZXIg
aGFuZCwgc29mdHdhcmUgd2lsbCBnZXQgbm90aWZpY2F0aW9uIGFib3V0IGFzc2VydGlvbi9kZWFz
c2VydGlvbiBvZg0KPiB0aGlzIGtleS4gU28sIGl0IGlzIGp1c3Qgbm9ybWFsIGtleS4gSWYsIGZv
ciBzb21lIHJlYXNvbiwgaXQgd2lsbCB0cmlnZ2VyIHdvcmxkDQo+IGRlc3RydWN0aW9uLCBpZiBp
dCBpcyBwcmVzc2VkIHRvbyBsb25nLi4uIHByb2JhYmx5IG5vIGJvZHkgY2FyZXMuDQo+IFlvdSBj
YW4gcHJvdmlkZSBmc2wsaW14LXNjLWtleSBhcyBhZGRpdGlvbmFsIGNvbXBhdGlibGUuIEluIGNh
c2UgbGludXggd2lsbA0KPiBuZWVkIHNvbWUgcXVpcmtzLCB3ZSBzdGlsbCBjYW4gZmFsbCBiYWNr
IHRvIG1vcmUgcHJlY2lzZSBjb21wYXRpYmxlDQo+ICJmc2wsaW14OHF4cC1zYy1wd3JrZXkiLg0K
DQpJIGFtIE9LIHdpdGggdGhhdCwgc28gSSB3aWxsIHVzZSAiZnNsLGlteC1zYy1rZXkiIGFzIGFk
ZGl0aW9uYWwgY29tcGF0aWJsZSBhbmQgYWxzbw0KcHJlc2VudCBpbiBkcml2ZXIuIA0KDQpBbnNv
bi4NCg==
