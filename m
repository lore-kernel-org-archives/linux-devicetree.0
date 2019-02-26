From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE: [PATCH RESEND V2 1/4] dt-bindings: fsl: scu: add watchdog binding
Date: Tue, 26 Feb 2019 11:56:09 +0000
Message-ID: <VI1PR04MB422289A63E04FFC163265FEB807B0@VI1PR04MB4222.eurprd04.prod.outlook.com>
References: <1550472539-16590-1-git-send-email-Anson.Huang@nxp.com>
 <1550472539-16590-2-git-send-email-Anson.Huang@nxp.com>
 <20190222195217.GA22194@bogus>
 <bb19470c-1590-f8dd-72e6-b382444d7902@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <bb19470c-1590-f8dd-72e6-b382444d7902@roeck-us.net>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, Anson Huang <anson.huang@nxp.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "wim@linux-watchdog.org" <wim@linux-watchdog.org>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, Daniel Baluta <daniel.baluta@nxp.com>, Andy Gross <andy.gross@linaro.org>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "heiko@sntech.de" <heiko@sntech.de>, "arnd@arndb.de" <arnd@arndb.de>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>, enric.ball
List-Id: devicetree@vger.kernel.org

PiBGcm9tOiBHdWVudGVyIFJvZWNrIFttYWlsdG86Z3JvZWNrN0BnbWFpbC5jb21dIE9uIEJlaGFs
ZiBPZiBHdWVudGVyDQo+IFJvZWNrPiANCj4gT24gMi8yMi8xOSAxMTo1MiBBTSwgUm9iIEhlcnJp
bmcgd3JvdGU6DQo+ID4gT24gTW9uLCBGZWIgMTgsIDIwMTkgYXQgMDY6NTM6NDhBTSArMDAwMCwg
QW5zb24gSHVhbmcgd3JvdGU6DQo+ID4+IEFkZCBpLk1YOFFYUCBzeXN0ZW0gY29udHJvbGxlciB3
YXRjaGRvZyBiaW5kaW5nLg0KPiA+Pg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBBbnNvbiBIdWFuZyA8
QW5zb24uSHVhbmdAbnhwLmNvbT4NCj4gPj4gLS0tDQo+ID4+IENoYW5nZXMgc2luY2UgVjE6DQo+
ID4+IAktIHVwZGF0ZSBkdHMgbm9kZSBuYW1lIHRvICJ3YXRjaGRvZyI7DQo+ID4+IC0tLQ0KPiA+
PiAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vZnJlZXNjYWxlL2ZzbCxz
Y3UudHh0IHwgMTANCj4gKysrKysrKysrKw0KPiA+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNl
cnRpb25zKCspDQo+ID4+DQo+ID4+IGRpZmYgLS1naXQNCj4gPj4gYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvYXJtL2ZyZWVzY2FsZS9mc2wsc2N1LnR4dA0KPiA+PiBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vZnJlZXNjYWxlL2ZzbCxzY3UudHh0DQo+
ID4+IGluZGV4IDRiNzk3NTEuLmYzODhlYzYgMTAwNjQ0DQo+ID4+IC0tLSBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vZnJlZXNjYWxlL2ZzbCxzY3UudHh0DQo+ID4+ICsr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vZnJlZXNjYWxlL2ZzbCxz
Y3UudHh0DQo+ID4+IEBAIC0xMzYsNiArMTM2LDEyIEBAIFJlcXVpcmVkIHByb3BlcnRpZXM6DQo+
ID4+ICAgCQkJICAgcmVzb3VyY2UgaWQgZm9yIHRoZXJtYWwgZHJpdmVyIHRvIGdldCB0ZW1wZXJh
dHVyZSB2aWENCj4gPj4gICAJCQkgICBTQ1UgSVBDLg0KPiA+Pg0KPiA+PiArV2F0Y2hkb2cgYmlu
ZGluZ3MgYmFzZWQgb24gU0NVIE1lc3NhZ2UgUHJvdG9jb2wNCj4gPj4gKy0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+PiArDQo+
ID4+ICtSZXF1aXJlZCBwcm9wZXJ0aWVzOg0KPiA+PiArLSBjb21wYXRpYmxlOiBzaG91bGQgYmUg
ImZzbCxpbXg4cXhwLXNjLXdkdCI7DQo+ID4+ICsNCj4gPj4gICBFeGFtcGxlIChpbXg4cXhwKToN
Cj4gPj4gICAtLS0tLS0tLS0tLS0tDQo+ID4+ICAgbHNpb19tdTE6IG1haWxib3hANWQxYzAwMDAg
ew0KPiA+PiBAQCAtMTg4LDYgKzE5NCwxMCBAQCBmaXJtd2FyZSB7DQo+ID4+ICAgCQkJdHNlbnMt
bnVtID0gPDE+Ow0KPiA+PiAgIAkJCSN0aGVybWFsLXNlbnNvci1jZWxscyA9IDwxPjsNCj4gPj4g
ICAJCX07DQo+ID4+ICsNCj4gPj4gKwkJd2F0Y2hkb2c6IHdhdGNoZG9nIHsNCj4gPj4gKwkJCWNv
bXBhdGlibGUgPSAiZnNsLGlteDhxeHAtc2Mtd2R0IjsNCj4gPg0KPiA+IEFzLWlzLCB0aGVyZSdz
IG5vIHJlYXNvbiBmb3IgdGhpcyB0byBiZSBpbiBEVC4gVGhlIHBhcmVudCBub2RlJ3MNCj4gPiBk
cml2ZXIgY2FuIGluc3RhbnRpYXRlIHRoZSB3ZG9nLg0KPiA+DQo+IA0KPiBBcyB0aGUgZHJpdmVy
IGlzIGN1cnJlbnRseSB3cml0dGVuLCB5b3UgYXJlIGNvcnJlY3QsIHNpbmNlIGl0IGRvZXNuJ3Qg
YWNjZXB0DQo+IHdhdGNoZG9nIHRpbWVvdXQgY29uZmlndXJhdGlvbiB0aHJvdWdoIGRldmljZXRy
ZWUuDQo+IA0KPiBRdWVzdGlvbiBpcyBpZiB0aGF0IGlzIGludGVuZGVkLiBJcyBpdCA/DQo+IA0K
DQpQZXIgbXkgdW5kZXJzdGFuZGluZywgaWYgdGhlIHByb3RvY29sIGlzIHVubGlrZSB0byBjaGFu
Z2UsIGl0IGNhbiBiZSBpbnN0YW50aWF0ZWQNCmJ5IHBvcnRlbnQgbm9kZSdzIGRyaXZlci4NCg0K
SG9wZSBSb2IgY2FuIGhlbHAgZ2l2ZSBhIG1vcmUgZ2VuZXJhbCBleHBsYW5hdGlvbi4NCg0KUmVn
YXJkcw0KRG9uZyBBaXNoZW5nDQoNCj4gVGhhbmtzLA0KPiBHdWVudGVyDQo=
