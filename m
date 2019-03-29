From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH V9 1/4] dt-bindings: watchdog: add i.MX system controller
 watchdog
Date: Fri, 29 Mar 2019 07:44:21 +0000
Message-ID: <DB3PR0402MB39161467D49348DC550CA28AF55A0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1553134884-1720-1-git-send-email-Anson.Huang@nxp.com>
 <1553134884-1720-2-git-send-email-Anson.Huang@nxp.com>
 <20190325203727.GA27661@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190325203727.GA27661@bogus>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "shawnguo@kernel.org" <shawnguo@kernel.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "heiko@sntech.de" <heiko@sntech.de>, "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "festevam@gmail.com" <festevam@gmail.com>, "stefan.wahren@i2se.com" <stefan.wahren@i2se.com>, Daniel Baluta <daniel.baluta@nxp.com>, "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>, Andy Gross <andy.gross@linaro.org>, "linux@roeck-us.net" <linux@roeck-us.net>, dl-linux-imx <linux-imx@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, "marc.w.gonzalez@free.fr" <marc.w.gonzalez@free.fr>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "olof@lixom.net" <olof@lixom.net>, horms+rene
List-Id: devicetree@vger.kernel.org

SGksIEd1ZW50ZXIvU2hhd24NCglTaW5jZSBEVCBoYXMgYmVlbiBhY2tlZCwgd291bGQgeW91IHBp
Y2sgdXAgdGhpcyBwYXRjaCBzZXJpZXMgaWYgbm8gYWRkaXRpb25hbCBjb21tZW50cz8NCg0KQmVz
dCBSZWdhcmRzIQ0KQW5zb24gSHVhbmcNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiBGcm9tOiBSb2IgSGVycmluZyBbbWFpbHRvOnJvYmhAa2VybmVsLm9yZ10NCj4gU2VudDogMjAx
OcTqM9TCMjbI1SA0OjM3DQo+IFRvOiBBbnNvbiBIdWFuZyA8YW5zb24uaHVhbmdAbnhwLmNvbT4N
Cj4gQ2M6IHdpbUBsaW51eC13YXRjaGRvZy5vcmc7IGxpbnV4QHJvZWNrLXVzLm5ldDsgbWFyay5y
dXRsYW5kQGFybS5jb207DQo+IHNoYXduZ3VvQGtlcm5lbC5vcmc7IHMuaGF1ZXJAcGVuZ3V0cm9u
aXguZGU7IGtlcm5lbEBwZW5ndXRyb25peC5kZTsNCj4gZmVzdGV2YW1AZ21haWwuY29tOyBjYXRh
bGluLm1hcmluYXNAYXJtLmNvbTsgd2lsbC5kZWFjb25AYXJtLmNvbTsNCj4gQWlzaGVuZyBEb25n
IDxhaXNoZW5nLmRvbmdAbnhwLmNvbT47IERhbmllbCBCYWx1dGENCj4gPGRhbmllbC5iYWx1dGFA
bnhwLmNvbT47IGhvcm1zK3JlbmVzYXNAdmVyZ2UubmV0LmF1OyBoZWlrb0BzbnRlY2guZGU7DQo+
IG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb207IEFuZHkgR3Jvc3MgPGFuZHkuZ3Jvc3NAbGluYXJv
Lm9yZz47DQo+IGphZ2FuQGFtYXJ1bGFzb2x1dGlvbnMuY29tOyBiam9ybi5hbmRlcnNzb25AbGlu
YXJvLm9yZzsNCj4gZW5yaWMuYmFsbGV0Ym9AY29sbGFib3JhLmNvbTsgZXplcXVpZWxAY29sbGFi
b3JhLmNvbTsNCj4gc3RlZmFuLndhaHJlbkBpMnNlLmNvbTsgbWFyYy53LmdvbnphbGV6QGZyZWUu
ZnI7IG9sb2ZAbGl4b20ubmV0OyBsaW51eC0NCj4gd2F0Y2hkb2dAdmdlci5rZXJuZWwub3JnOyBk
ZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGludXgtYXJtLQ0KPiBrZXJuZWxAbGlzdHMuaW5m
cmFkZWFkLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgZGwtbGludXgtaW14DQo+
IDxsaW51eC1pbXhAbnhwLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCBWOSAxLzRdIGR0LWJp
bmRpbmdzOiB3YXRjaGRvZzogYWRkIGkuTVggc3lzdGVtDQo+IGNvbnRyb2xsZXIgd2F0Y2hkb2cN
Cj4gDQo+IE9uIFRodSwgTWFyIDIxLCAyMDE5IGF0IDAyOjI2OjM4QU0gKzAwMDAsIEFuc29uIEh1
YW5nIHdyb3RlOg0KPiA+IEFkZCBpLk1YIHN5c3RlbSBjb250cm9sbGVyIHdhdGNoZG9nIGJpbmRp
bmcgZG9jLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQW5zb24gSHVhbmcgPEFuc29uLkh1YW5n
QG54cC5jb20+DQo+ID4gLS0tDQo+ID4gQ2hhbmdlcyBzaW5jZSBWODoNCj4gPiAJLSBhZGQgb3B0
aW9uYWwgcHJvcGVydHkgInRpbWVvdXQtc2VjIiBhY2NvcmRpbmcgdG8gZHJpdmVyIGNoYW5nZS4N
Cj4gPiAtLS0NCj4gPiAgLi4uL2JpbmRpbmdzL3dhdGNoZG9nL2ZzbC1pbXgtc2Mtd2R0LnR4dCAg
ICAgICAgICAgfCAyNA0KPiArKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFu
Z2VkLCAyNCBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvd2F0Y2hkb2cvZnNsLQ0KPiBpbXgtc2Mtd2R0LnR4dA0K
PiANCj4gSSBzdGlsbCB0aGluayB3aGF0J3MgaW4gQVRGIHNob3VsZCBiZSBkaXNjb3ZlcmFibGUs
IGJ1dDoNCj4gDQo+IEFja2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPg0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtl
cm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5l
bAo=
