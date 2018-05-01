From: Jun Li <jun.li@nxp.com>
Subject: RE: [PATCH v4 01/13] dt-bindings: connector: add properties for typec
Date: Tue, 1 May 2018 07:57:47 +0000
Message-ID: <VI1PR0402MB39172598EFBD55753FE14B9C89810@VI1PR0402MB3917.eurprd04.prod.outlook.com>
References: <1522253178-32414-1-git-send-email-jun.li@nxp.com>
 <1522253178-32414-2-git-send-email-jun.li@nxp.com>
 <20180430112354.GA12870@kuha.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20180430112354.GA12870@kuha.fi.intel.com>
Content-Language: en-US
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Peter Chen <peter.chen@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "a.hajda@samsung.com" <a.hajda@samsung.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "linux@roeck-us.net" <linux@roeck-us.net>, "shufan_lee@richtek.com" <shufan_lee@richtek.com>
List-Id: devicetree@vger.kernel.org

SGkNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSGVpa2tpIEtyb2dlcnVz
IFttYWlsdG86aGVpa2tpLmtyb2dlcnVzQGxpbnV4LmludGVsLmNvbV0NCj4gU2VudDogMjAxOMTq
NNTCMzDI1SAxOToyNA0KPiBUbzogSnVuIExpIDxqdW4ubGlAbnhwLmNvbT4NCj4gQ2M6IHJvYmgr
ZHRAa2VybmVsLm9yZzsgZ3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc7IGxpbnV4QHJvZWNrLXVz
Lm5ldDsNCj4gYS5oYWpkYUBzYW1zdW5nLmNvbTsgc2h1ZmFuX2xlZUByaWNodGVrLmNvbTsgUGV0
ZXIgQ2hlbg0KPiA8cGV0ZXIuY2hlbkBueHAuY29tPjsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5v
cmc7DQo+IGxpbnV4LXVzYkB2Z2VyLmtlcm5lbC5vcmc7IGRsLWxpbnV4LWlteCA8bGludXgtaW14
QG54cC5jb20+Ow0KPiBkZXZlbEBkcml2ZXJkZXYub3N1b3NsLm9yZw0KPiBTdWJqZWN0OiBSZTog
W1BBVENIIHY0IDAxLzEzXSBkdC1iaW5kaW5nczogY29ubmVjdG9yOiBhZGQgcHJvcGVydGllcyBm
b3IgdHlwZWMNCj4gDQo+IEhpLA0KPiANCj4gT24gVGh1LCBNYXIgMjksIDIwMTggYXQgMTI6MDY6
MDZBTSArMDgwMCwgTGkgSnVuIHdyb3RlOg0KPiA+ICtPcHRpb25hbCBwcm9wZXJ0aWVzIGZvciB1
c2ItYy1jb25uZWN0b3I6DQo+ID4gKy0gcG93ZXItdHlwZTogc2hvdWxkIGJlIG9uZSBvZiAic291
cmNlIiwgInNpbmsiIG9yICJkdWFsIihEUlApIGlmIHR5cGVjDQo+ID4gKyAgY29ubmVjdG9yIGhh
cyBwb3dlciBzdXBwb3J0Lg0KPiA+ICstIHRyeS1wb3dlci1yb2xlOiBwcmVmZXJyZWQgcG93ZXIg
cm9sZSBpZiAiZHVhbCIoRFJQKSBjYW4gc3VwcG9ydCBUcnkuU05LDQo+ID4gKyAgb3IgVHJ5LlNS
Qywgc2hvdWxkIGJlICJzaW5rIiBmb3IgVHJ5LlNOSyBvciAic291cmNlIiBmb3IgVHJ5LlNSQy4N
Cj4gPiArLSBkYXRhLXR5cGU6IHNob3VsZCBiZSBvbmUgb2YgImhvc3QiLCAiZGV2aWNlIiwgImR1
YWwiKERSRCkgaWYgdHlwZWMNCj4gPiArICBjb25uZWN0b3Igc3VwcG9ydHMgVVNCIGRhdGEuDQo+
IA0KPiBQbGVhc2UgdXNlICJwb3dlci1yb2xlIiBhbmQgImRhdGEtcm9sZSIuDQoNCk9LLiBJIHdp
bGwgdXBkYXRlIHRoZXNlIDIgcHJvcGVydHkgbmFtZXMgYXMgeW91IHN1Z2dlc3RlZC4NCg0KTGkg
SnVuDQo+IA0KPiANCj4gVGhhbmtzLA0KPiANCj4gLS0NCj4gaGVpa2tpDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkZXZlbCBtYWlsaW5nIGxpc3QKZGV2
ZWxAbGludXhkcml2ZXJwcm9qZWN0Lm9yZwpodHRwOi8vZHJpdmVyZGV2LmxpbnV4ZHJpdmVycHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcml2ZXJkZXYtZGV2ZWwK
