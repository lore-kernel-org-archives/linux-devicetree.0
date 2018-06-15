From: Jolly Shah <JOLLYS@xilinx.com>
Subject: RE: [PATCH v8 03/10] firmware: xilinx: Add zynqmp IOCTL API for
 device control
Date: Fri, 15 Jun 2018 16:45:43 +0000
Message-ID: <BL0PR02MB374784B711D2D2AF9773CA6DB87C0@BL0PR02MB3747.namprd02.prod.outlook.com>
References: <1529000862-11510-1-git-send-email-jollys@xilinx.com>
 <1529000862-11510-4-git-send-email-jollys@xilinx.com>
 <3044c2b9-2268-dfcb-2d45-0117c6f91a8d@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3044c2b9-2268-dfcb-2d45-0117c6f91a8d@infradead.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>, "ard.biesheuvel@linaro.org" <ard.biesheuvel@linaro.org>, "mingo@kernel.org" <mingo@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "matt@codeblueprint.co.uk" <matt@codeblueprint.co.uk>, "sudeep.holla@arm.com" <sudeep.holla@arm.com>, "hkallweit1@gmail.com" <hkallweit1@gmail.com>, "keescook@chromium.org" <keescook@chromium.org>, "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@codeaurora.org" <sboyd@codeaurora.org>, Michal Simek <michals@xilinx.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Cc: Rajan Vaja <RAJANV@xilinx.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

SGkgUmFuZHksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmFuZHkg
RHVubGFwIFttYWlsdG86cmR1bmxhcEBpbmZyYWRlYWQub3JnXQ0KPiBTZW50OiBUaHVyc2RheSwg
SnVuZSAxNCwgMjAxOCAxOjQ1IFBNDQo+IFRvOiBKb2xseSBTaGFoIDxKT0xMWVNAeGlsaW54LmNv
bT47IGFyZC5iaWVzaGV1dmVsQGxpbmFyby5vcmc7DQo+IG1pbmdvQGtlcm5lbC5vcmc7IGdyZWdr
aEBsaW51eGZvdW5kYXRpb24ub3JnOyBtYXR0QGNvZGVibHVlcHJpbnQuY28udWs7DQo+IHN1ZGVl
cC5ob2xsYUBhcm0uY29tOyBoa2FsbHdlaXQxQGdtYWlsLmNvbTsga2Vlc2Nvb2tAY2hyb21pdW0u
b3JnOw0KPiBkbWl0cnkudG9yb2tob3ZAZ21haWwuY29tOyBtdHVycXVldHRlQGJheWxpYnJlLmNv
bTsNCj4gc2JveWRAY29kZWF1cm9yYS5vcmc7IG1pY2hhbC5zaW1la0B4aWxpbnguY29tOyByb2Jo
K2R0QGtlcm5lbC5vcmc7DQo+IG1hcmsucnV0bGFuZEBhcm0uY29tOyBsaW51eC1jbGtAdmdlci5r
ZXJuZWwub3JnDQo+IENjOiBSYWphbiBWYWphIDxSQUpBTlZAeGlsaW54LmNvbT47IGxpbnV4LWFy
bS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsNCj4gbGludXgta2VybmVsQHZnZXIua2VybmVs
Lm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IEpvbGx5IFNoYWgNCj4gPEpPTExZU0B4
aWxpbnguY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY4IDAzLzEwXSBmaXJtd2FyZTogeGls
aW54OiBBZGQgenlucW1wIElPQ1RMIEFQSSBmb3IgZGV2aWNlDQo+IGNvbnRyb2wNCj4gDQo+IE9u
IDA2LzE0LzIwMTggMTE6MjcgQU0sIEpvbGx5IFNoYWggd3JvdGU6DQo+ID4gRnJvbTogUmFqYW4g
VmFqYSA8cmFqYW52QHhpbGlueC5jb20+DQo+ID4NCj4gPiBBZGQgWnlucU1QIGZpcm13YXJlIElP
Q1RMIEFQSSB0byBjb250cm9sIGFuZCBjb25maWd1cmUgZGV2aWNlcyBsaWtlDQo+ID4gUExMcywg
U0QsIEdlbSwgZXRjLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUmFqYW4gVmFqYSA8cmFqYW52
QHhpbGlueC5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogSm9sbHkgU2hhaCA8am9sbHlzQHhpbGlu
eC5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvZmlybXdhcmUveGlsaW54L3p5bnFtcC5jICAg
ICB8IDIwICsrKysrKysrKysrKysrKysrKysrDQo+ID4gIGluY2x1ZGUvbGludXgvZmlybXdhcmUv
eGxueC16eW5xbXAuaCB8ICAyICsrDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9u
cygrKQ0KPiANCj4gSGksDQo+IA0KPiBEb2VzIHRoaXMgZHJpdmVyIGNsYWltIChpbXBsZW1lbnQp
IHNvbWUgc3BlY2lmaWMgaW9jdGwgY29kZSBvciBJRD8NCj4gDQo+IElmIHNvLCBpdHMgaW9jdGwg
bnVtYmVycyBzaG91bGQgYmUgZG9jdW1lbnRlZCBpbiBEb2N1bWVudGF0aW9uL2lvY3RsL2lvY3Rs
LQ0KPiBudW1iZXIudHh0Lg0KPiANCg0KVGhpcyBpcyBub3Qgc3lzdGVtIElPQ1RMLiBUaGlzIGlz
IHBhcmFtZXRlciB0byBaeW5xTVAgc3BlY2lmaWMgQVBJLg0KDQpUaGFua3MsDQpKb2xseSBTaGFo
DQoNCj4gdGhhbmtzLA0KPiAtLQ0KPiB+UmFuZHkNCg==
