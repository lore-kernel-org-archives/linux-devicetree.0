Return-Path: <SRS0=m20R=QU=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr20067.outbound.protection.outlook.com ([40.107.2.67]:10368
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725562AbfBMFhh (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 13 Feb 2019 00:37:37 -0500
From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH V6 1/4] dt-bindings: fsl: scu: add thermal binding
Date: Wed, 13 Feb 2019 05:35:51 +0000
Message-ID: <DB3PR0402MB39165EFE027405873E8AB4ECF5660@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1549532838-27025-1-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1549532838-27025-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "rui.zhang@intel.com" <rui.zhang@intel.com>, "edubezval@gmail.com" <edubezval@gmail.com>, "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, Aisheng Dong <aisheng.dong@nxp.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, Daniel Baluta <daniel.baluta@nxp.com>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, Andy Gross <andy.gross@linaro.org>, "heiko@sntech.de" <heiko@sntech.de>, "arnd@arndb.de" <arnd@arndb.de>, "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>, "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>, "marc.w.gonzalez@free.fr" <marc.w.gonzalez@free.fr>, "olof@lixom.net" <olof@lixom.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

R2VudGFsIHBpbmcuLi4NCg0KQmVzdCBSZWdhcmRzIQ0KQW5zb24gSHVhbmcNCg0KPiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbnNvbiBIdWFuZw0KPiBTZW50OiAyMDE5xOoy
1MI3yNUgMTc6NTMNCj4gVG86IHJvYmgrZHRAa2VybmVsLm9yZzsgbWFyay5ydXRsYW5kQGFybS5j
b207IHNoYXduZ3VvQGtlcm5lbC5vcmc7DQo+IHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU7IGtlcm5l
bEBwZW5ndXRyb25peC5kZTsgZmVzdGV2YW1AZ21haWwuY29tOw0KPiBjYXRhbGluLm1hcmluYXNA
YXJtLmNvbTsgd2lsbC5kZWFjb25AYXJtLmNvbTsgcnVpLnpoYW5nQGludGVsLmNvbTsNCj4gZWR1
YmV6dmFsQGdtYWlsLmNvbTsgZGFuaWVsLmxlemNhbm9AbGluYXJvLm9yZzsgQWlzaGVuZyBEb25n
DQo+IDxhaXNoZW5nLmRvbmdAbnhwLmNvbT47IHVsZi5oYW5zc29uQGxpbmFyby5vcmc7IERhbmll
bCBCYWx1dGENCj4gPGRhbmllbC5iYWx1dGFAbnhwLmNvbT47IGhvcm1zK3JlbmVzYXNAdmVyZ2Uu
bmV0LmF1OyBBbmR5IEdyb3NzDQo+IDxhbmR5Lmdyb3NzQGxpbmFyby5vcmc+OyBoZWlrb0BzbnRl
Y2guZGU7IGFybmRAYXJuZGIuZGU7DQo+IG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb207IGphZ2Fu
QGFtYXJ1bGFzb2x1dGlvbnMuY29tOw0KPiBiam9ybi5hbmRlcnNzb25AbGluYXJvLm9yZzsgZW5y
aWMuYmFsbGV0Ym9AY29sbGFib3JhLmNvbTsNCj4gbWFyYy53LmdvbnphbGV6QGZyZWUuZnI7IG9s
b2ZAbGl4b20ubmV0OyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsNCj4gbGludXgta2VybmVs
QHZnZXIua2VybmVsLm9yZzsgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBs
aW51eC0NCj4gcG1Admdlci5rZXJuZWwub3JnDQo+IENjOiBkbC1saW51eC1pbXggPGxpbnV4LWlt
eEBueHAuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggVjYgMS80XSBkdC1iaW5kaW5nczogZnNsOiBz
Y3U6IGFkZCB0aGVybWFsIGJpbmRpbmcNCj4gDQo+IE5YUCBpLk1YOFFYUCBpcyBhbiBBUk12OCBT
b0Mgd2l0aCBhIENvcnRleC1NNCBjb3JlIGluc2lkZSBhcyBzeXN0ZW0NCj4gY29udHJvbGxlciwg
dGhlIHN5c3RlbSBjb250cm9sbGVyIGlzIGluIGNoYXJnZSBvZiBzeXN0ZW0gcG93ZXIsIGNsb2Nr
IGFuZA0KPiB0aGVybWFsIHNlbnNvcnMgZXRjLiBtYW5hZ2VtZW50LCBMaW51eCBrZXJuZWwgaGFz
IHRvIGNvbW11bmljYXRlIHdpdGgNCj4gc3lzdGVtIGNvbnRyb2xsZXIgdmlhIE1VIChtZXNzYWdl
IHVuaXQpIElQQyB0byBnZXQgdGVtcGVyYXR1cmUgZnJvbSB0aGVybWFsDQo+IHNlbnNvcnMsIHRo
aXMgcGF0Y2ggYWRkcyBiaW5kaW5nIGRvYyBmb3IgaS5NWCBzeXN0ZW0gY29udHJvbGxlciB0aGVy
bWFsDQo+IGRyaXZlci4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFuc29uIEh1YW5nIDxBbnNvbi5I
dWFuZ0BueHAuY29tPg0KPiBSZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9y
Zz4NCj4gLS0tDQo+IENoYW5nZUxvZyBzaW5jZSBWNToNCj4gCS0gYWRkICJpbXgsc2Vuc29yLXJl
c291cmNlLWlkIiBpbiBlYWNoIHRoZXJtYWwgem9uZSB0byBwYXNzIHJlc291cmNlDQo+IElEIGZv
ciB0aGVybWFsIGRyaXZlci4NCj4gLS0tDQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0v
ZnJlZXNjYWxlL2ZzbCxzY3UudHh0ICAgIHwgMjANCj4gKysrKysrKysrKysrKysrKysrKysNCj4g
IDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9mcmVlc2NhbGUvZnNsLHNjdS50eHQN
Cj4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2ZyZWVzY2FsZS9mc2ws
c2N1LnR4dA0KPiBpbmRleCA3MmQ0ODFjLi40Yjc5NzUxIDEwMDY0NA0KPiAtLS0gYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2ZyZWVzY2FsZS9mc2wsc2N1LnR4dA0KPiAr
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2ZyZWVzY2FsZS9mc2ws
c2N1LnR4dA0KPiBAQCAtMTIyLDYgKzEyMiwyMCBAQCBSVEMgYmluZGluZ3MgYmFzZWQgb24gU0NV
IE1lc3NhZ2UgUHJvdG9jb2wNCj4gUmVxdWlyZWQgcHJvcGVydGllczoNCj4gIC0gY29tcGF0aWJs
ZTogc2hvdWxkIGJlICJmc2wsaW14OHF4cC1zYy1ydGMiOw0KPiANCj4gK1RoZXJtYWwgYmluZGlu
Z3MgYmFzZWQgb24gU0NVIE1lc3NhZ2UgUHJvdG9jb2wNCj4gKy0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiArDQo+ICtSZXF1aXJl
ZCBwcm9wZXJ0aWVzOg0KPiArLSBjb21wYXRpYmxlIDogTXVzdCBiZSAiZnNsLGlteDhxeHAtc2Mt
dGhlcm1hbCI7DQo+ICstIHRzZW5zLW51bSA6IFRvdGFsIG51bWJlciBvZiB0aGVybWFsIHNlbnNv
cnMgc3VwcG9ydGVkOw0KPiArLSAjdGhlcm1hbC1zZW5zb3ItY2VsbHMgOiBTaG91bGQgYmUgMS4g
U2VlDQo+ICsNCj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RoZXJtYWwvdGhl
cm1hbC50eHQNCj4gKwkJCSAgZm9yIGEgZGVzY3JpcHRpb24uDQo+ICstIGlteCxzZW5zb3ItcmVz
b3VyY2UtaWQgOiBUaGlzIHByb3BlcnR5IHNob3VsZCBiZSBkZWZpbmVkIGluIGVhY2ggdGhlcm1h
bA0KPiB6b25lDQo+ICsJCQkgICBvZiB0aGVybWFsLXpvbmVzIG5vZGUsIGl0IHBhc3NlcyBlYWNo
IHRoZXJtYWwNCj4gem9uZSdzDQo+ICsJCQkgICByZXNvdXJjZSBpZCBmb3IgdGhlcm1hbCBkcml2
ZXIgdG8gZ2V0IHRlbXBlcmF0dXJlDQo+IHZpYQ0KPiArCQkJICAgU0NVIElQQy4NCj4gKw0KPiAg
RXhhbXBsZSAoaW14OHF4cCk6DQo+ICAtLS0tLS0tLS0tLS0tDQo+ICBsc2lvX211MTogbWFpbGJv
eEA1ZDFjMDAwMCB7DQo+IEBAIC0xNjgsNiArMTgyLDEyIEBAIGZpcm13YXJlIHsNCj4gIAkJcnRj
OiBydGMgew0KPiAgCQkJY29tcGF0aWJsZSA9ICJmc2wsaW14OHF4cC1zYy1ydGMiOw0KPiAgCQl9
Ow0KPiArDQo+ICsJCXRzZW5zOiB0aGVybWFsLXNlbnNvciB7DQo+ICsJCQljb21wYXRpYmxlID0g
ImZzbCxpbXg4cXhwLXNjLXRoZXJtYWwiOw0KPiArCQkJdHNlbnMtbnVtID0gPDE+Ow0KPiArCQkJ
I3RoZXJtYWwtc2Vuc29yLWNlbGxzID0gPDE+Ow0KPiArCQl9Ow0KPiAgCX07DQo+ICB9Ow0KPiAN
Cj4gLS0NCj4gMi43LjQNCg0K
