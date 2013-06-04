From: "J, KEERTHY" <j-keerthy@ti.com>
Subject: RE: [PATCH] mfd: DT bindings for the palmas family MFD
Date: Tue, 4 Jun 2013 06:24:45 +0000
Message-ID: <DC88CAD03C0052499C1907B327FC63229E8AFE@DBDE04.ent.ti.com>
References: <1370261333-5121-1-git-send-email-j-keerthy@ti.com>
 <20130603141851.GG3370@gmail.com> <51ACFECA.10209@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <51ACFECA.10209@wwwdotorg.org>
Content-Language: en-US
Sender: linux-doc-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee.jones@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "broonie@opensource.wolfsonmicro.com" <broonie@opensource.wolfsonmicro.com>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "rob@landley.net" <rob@landley.net>, "sameo@linux.intel.com" <sameo@linux.intel.com>, "wim@iguana.be" <wim@iguana.be>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "gg@slimlogic.co.uk" <gg@slimlogic.co.uk>, "Kristo, Tero" <t-kristo@ti.com>, Ian Lartey <ian@slimlogic.co.uk>
List-Id: devicetree@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU3RlcGhlbiBXYXJyZW4g
W21haWx0bzpzd2FycmVuQHd3d2RvdG9yZy5vcmddDQo+IFNlbnQ6IFR1ZXNkYXksIEp1bmUgMDQs
IDIwMTMgMjowOSBBTQ0KPiBUbzogTGVlIEpvbmVzDQo+IENjOiBKLCBLRUVSVEhZOyBsaW51eC1r
ZXJuZWxAdmdlci5rZXJuZWwub3JnOyBsaW51eC0NCj4gZG9jQHZnZXIua2VybmVsLm9yZzsgZGV2
aWNldHJlZS1kaXNjdXNzQGxpc3RzLm96bGFicy5vcmc7DQo+IGJyb29uaWVAb3BlbnNvdXJjZS53
b2xmc29ubWljcm8uY29tOyByb2IuaGVycmluZ0BjYWx4ZWRhLmNvbTsNCj4gcm9iQGxhbmRsZXku
bmV0OyBtdHVycXVldHRlQGxpbmFyby5vcmc7IHNhbWVvQGxpbnV4LmludGVsLmNvbTsNCj4gd2lt
QGlndWFuYS5iZTsgbGdpcmR3b29kQGdtYWlsLmNvbTsgZ2dAc2xpbWxvZ2ljLmNvLnVrOyBLcmlz
dG8sIFRlcm87DQo+IElhbiBMYXJ0ZXkNCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gbWZkOiBEVCBi
aW5kaW5ncyBmb3IgdGhlIHBhbG1hcyBmYW1pbHkgTUZEDQo+IA0KPiBPbiAwNi8wMy8yMDEzIDA4
OjE4IEFNLCBMZWUgSm9uZXMgd3JvdGU6DQo+ID4gT24gTW9uLCAwMyBKdW4gMjAxMywgSiBLZWVy
dGh5IHdyb3RlOg0KPiA+PiBBZGQgdGhlIHZhcmlvdXMgYmluZGluZyBmaWxlcyBmb3IgdGhlIHBh
bG1hcyBmYW1pbHkgb2YgY2hpcHMuIFRoZXJlDQo+ID4+IGlzIGEgdG9wIGxldmVsIE1GRCBiaW5k
aW5nIHRoZW4gYSBzZXBlcmF0ZSBiaW5kaW5nIGZvciByZWd1bGF0b3JzIElQDQo+IGJsb2NrcyBv
biBjaGlwcy4NCj4gDQo+ID4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbWZkL3BhbG1hcy50eHQNCj4gPj4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbWZkL3BhbG1hcy50eHQNCj4gDQo+ID4+ICtFeGFtcGxlOg0KPiA+PiArDQo+ID4+
ICtwYWxtYXMgew0KPiA+DQo+ID4gU2hvdWxkIHRoaXMgYmUgJ3BhbG1hc0A0OCB7JywgYXMgaXQg
aGFzIGFuIGFkZHJlc3M/DQo+IA0KPiBJdCdzIGNvbW1vbiB0byBvbmx5IGluY2x1ZGUgdGhlIHVu
aXQtYWRkcmVzcyAoQDQ4KSBpZiBpdCdzIG5lZWRlZCB0bw0KPiBtYWtlIHRoZSBub2RlIG5hbWUg
dW5pcXVlIChpLmUuIGlmIHlvdSBoYWQgbXVsdGlwbGUgcGFsbWFzIGRldmljZXMpLg0KDQpZZWFo
LiBXZSBnZW5lcmFsbHkgaGF2ZSBvbmUgUGFsbWFzIGRldmljZS4NCg0KPiANCj4gPj4gZGlmZiAt
LWdpdA0KPiA+PiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZWd1bGF0b3Iv
cGFsbWFzLXBtaWMudHh0DQo+ID4+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3JlZ3VsYXRvci9wYWxtYXMtcG1pYy50eHQNCj4gDQo+ID4gU2VlOiBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvcmVndWxhdG9yL2dwaW8tcmVndWxhdG9yLnR4dA0KPiA+DQo+ID4+
ICsJICAgICAgIHRpLHNsZWVwLW1vZGUgLSBtb2RlIHRvIGFkb3B0IGluIHBtaWMgc2xlZXAgMCAt
IG9mZiwgMSAtDQo+IGF1dG8sDQo+ID4+ICsJICAgICAgIDIgLSBlY28sIDMgLSBmb3JjZWQgcHdt
DQo+ID4NCj4gPiBJJ3ZlIHNlZW4gbG90cyBvZiBzbGVlcC1tb2RlIHByb3BlcnRpZXMsIGNhbid0
IHdlIGRlZmluZSBhIGdlbmVyaWMNCj4gPiBvbmU/DQo+IA0KPiBJc24ndCBpdCBIVy1zcGVjaWZp
Yz8NCg0KWWVhaC4gSGVuY2UgaXQgaXMgdGksc2xlZXAtbW9kZS4NCg0KUmVnYXJkcywNCktlZXJ0
aHkNCg==
