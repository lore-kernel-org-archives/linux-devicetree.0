Return-Path: <SRS0=KKmW=IE=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr20066.outbound.protection.outlook.com ([40.107.2.66]:4704
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751356AbeEQNRH (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 17 May 2018 09:17:07 -0400
From: Jun Li <jun.li@nxp.com>
Subject: RE: [PATCH v5 12/14] staging: typec: tcpci: keep the not connecting
 cc line open
Date: Thu, 17 May 2018 13:17:02 +0000
Message-ID: <VI1PR0402MB39172BABA0C43F0F8BD3824F89910@VI1PR0402MB3917.eurprd04.prod.outlook.com>
References: <1525307094-27402-1-git-send-email-jun.li@nxp.com>
 <1525307094-27402-13-git-send-email-jun.li@nxp.com>
 <HE1PR04MB1450507C65FD86DA4BE46F7B8B920@HE1PR04MB1450.eurprd04.prod.outlook.com>
In-Reply-To: <HE1PR04MB1450507C65FD86DA4BE46F7B8B920@HE1PR04MB1450.eurprd04.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Peter Chen <peter.chen@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "linux@roeck-us.net" <linux@roeck-us.net>
Cc: "a.hajda@samsung.com" <a.hajda@samsung.com>, "cw00.choi@samsung.com" <cw00.choi@samsung.com>, "shufan_lee@richtek.com" <shufan_lee@richtek.com>, "gsomlo@gmail.com" <gsomlo@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGV0ZXIgQ2hlbg0KPiBT
ZW50OiAyMDE4xOo11MIxNsjVIDE2OjM2DQo+IFRvOiBKdW4gTGkgPGp1bi5saUBueHAuY29tPjsg
cm9iaCtkdEBrZXJuZWwub3JnOyBncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZzsNCj4gaGVpa2tp
Lmtyb2dlcnVzQGxpbnV4LmludGVsLmNvbTsgbGludXhAcm9lY2stdXMubmV0DQo+IENjOiBhLmhh
amRhQHNhbXN1bmcuY29tOyBjdzAwLmNob2lAc2Ftc3VuZy5jb207DQo+IHNodWZhbl9sZWVAcmlj
aHRlay5jb207IGdzb21sb0BnbWFpbC5jb207IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOw0K
PiBsaW51eC11c2JAdmdlci5rZXJuZWwub3JnOyBkbC1saW51eC1pbXggPGxpbnV4LWlteEBueHAu
Y29tPg0KPiBTdWJqZWN0OiBSRTogW1BBVENIIHY1IDEyLzE0XSBzdGFnaW5nOiB0eXBlYzogdGNw
Y2k6IGtlZXAgdGhlIG5vdCBjb25uZWN0aW5nIGNjDQo+IGxpbmUgb3Blbg0KPiANCj4gDQo+ID4N
Cj4gPiBXaGlsZSBzZXQgcG9sYXJpdHksIHdlIHNob3VsZCBrZWVwIHRoZSBub3QgY29ubmVjdGlu
ZyBjYyBsaW5lIHRvIGJlIG9wZW4uDQo+ID4NCj4gDQo+IGtlZXAgdGhlIGRpc2Nvbm5lY3RlZCBj
YyBsaW5lIG9wZW4/DQoNCk9rYXksIEkgd2lsbCBjaGFuZ2UuDQoNClRoYW5rcw0KTGkgSnVuDQo+
IA0KPiBQZXRlcg0KPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBMaSBKdW4gPGp1bi5saUBueHAuY29t
Pg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL3N0YWdpbmcvdHlwZWMvdGNwY2kuYyB8IDE4ICsrKysr
KysrKysrKysrLS0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgNCBk
ZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvdHlwZWMv
dGNwY2kuYyBiL2RyaXZlcnMvc3RhZ2luZy90eXBlYy90Y3BjaS5jIGluZGV4DQo+ID4gNWM0ODgx
MC4uNWMwYzVlMyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3N0YWdpbmcvdHlwZWMvdGNwY2ku
Yw0KPiA+ICsrKyBiL2RyaXZlcnMvc3RhZ2luZy90eXBlYy90Y3BjaS5jDQo+ID4gQEAgLTE4NSwx
NSArMTg1LDI1IEBAIHN0YXRpYyBpbnQgdGNwY2lfc2V0X3BvbGFyaXR5KHN0cnVjdCB0Y3BjX2Rl
diAqdGNwYywNCj4gPiAgCQkJICAgICAgZW51bSB0eXBlY19jY19wb2xhcml0eSBwb2xhcml0eSkg
IHsNCj4gPiAgCXN0cnVjdCB0Y3BjaSAqdGNwY2kgPSB0Y3BjX3RvX3RjcGNpKHRjcGMpOw0KPiA+
ICsJdW5zaWduZWQgaW50IHJlZzsNCj4gPiAgCWludCByZXQ7DQo+ID4NCj4gPiAtCXJldCA9IHJl
Z21hcF93cml0ZSh0Y3BjaS0+cmVnbWFwLCBUQ1BDX1RDUENfQ1RSTCwNCj4gPiAtCQkJICAgKHBv
bGFyaXR5ID09IFRZUEVDX1BPTEFSSVRZX0NDMikgPw0KPiA+IC0JCQkgICBUQ1BDX1RDUENfQ1RS
TF9PUklFTlRBVElPTiA6IDApOw0KPiA+ICsJLyogS2VlcCB0aGUgZGlzY29ubmVjdCBjYyBsaW5l
IG9wZW4gKi8NCj4gPiArCXJldCA9IHJlZ21hcF9yZWFkKHRjcGNpLT5yZWdtYXAsIFRDUENfUk9M
RV9DVFJMLCAmcmVnKTsNCj4gPiAgCWlmIChyZXQgPCAwKQ0KPiA+ICAJCXJldHVybiByZXQ7DQo+
ID4NCj4gPiAtCXJldHVybiAwOw0KPiA+ICsJaWYgKHBvbGFyaXR5ID09IFRZUEVDX1BPTEFSSVRZ
X0NDMikNCj4gPiArCQlyZWcgfD0gVENQQ19ST0xFX0NUUkxfQ0NfT1BFTiA8PA0KPiA+IFRDUENf
Uk9MRV9DVFJMX0NDMV9TSElGVDsNCj4gPiArCWVsc2UNCj4gPiArCQlyZWcgfD0gVENQQ19ST0xF
X0NUUkxfQ0NfT1BFTiA8PA0KPiA+IFRDUENfUk9MRV9DVFJMX0NDMl9TSElGVDsNCj4gPiArCXJl
dCA9IHJlZ21hcF93cml0ZSh0Y3BjaS0+cmVnbWFwLCBUQ1BDX1JPTEVfQ1RSTCwgcmVnKTsNCj4g
PiArCWlmIChyZXQgPCAwKQ0KPiA+ICsJCXJldHVybiByZXQ7DQo+ID4gKw0KPiA+ICsJcmV0dXJu
IHJlZ21hcF93cml0ZSh0Y3BjaS0+cmVnbWFwLCBUQ1BDX1RDUENfQ1RSTCwNCj4gPiArCQkJICAg
KHBvbGFyaXR5ID09IFRZUEVDX1BPTEFSSVRZX0NDMikgPw0KPiA+ICsJCQkgICBUQ1BDX1RDUENf
Q1RSTF9PUklFTlRBVElPTiA6IDApOw0KPiA+ICB9DQo+ID4NCj4gPiAgc3RhdGljIGludCB0Y3Bj
aV9zZXRfdmNvbm4oc3RydWN0IHRjcGNfZGV2ICp0Y3BjLCBib29sIGVuYWJsZSkNCj4gPiAtLQ0K
PiA+IDIuNy40DQoNCg==
