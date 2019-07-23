From: Vijay Khemka <vijaykhemka@fb.com>
Subject: Re: [PATCH] dt-bindings: hwmon: Add binding for pxe1610
Date: Tue, 23 Jul 2019 00:12:13 +0000
Message-ID: <6E2B35D8-B538-4C96-B289-27A87ECD74DB@fb.com>
References: <20190722192451.1947348-1-vijaykhemka@fb.com>
 <20190722192451.1947348-2-vijaykhemka@fb.com>
 <20190722200622.GA20435@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190722200622.GA20435@roeck-us.net>
Content-Language: en-US
Content-ID: <2A0644FACC1CCC41A9BAC7C4FFF2F7F5@namprd15.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Mark Rutland <mark.rutland@arm.com>, "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, Jean Delvare <jdelvare@suse.com>, Sai Dasari <sdasari@fb.com>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Andrew Jeffery <andrew@aj.id.au>, "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

DQoNCu+7v09uIDcvMjIvMTksIDE6MDYgUE0sICJHdWVudGVyIFJvZWNrIiA8Z3JvZWNrN0BnbWFp
bC5jb20gb24gYmVoYWxmIG9mIGxpbnV4QHJvZWNrLXVzLm5ldD4gd3JvdGU6DQoNCiAgICBPbiBN
b24sIEp1bCAyMiwgMjAxOSBhdCAxMjoyNDo0OFBNIC0wNzAwLCBWaWpheSBLaGVta2Egd3JvdGU6
DQogICAgPiBBZGRlZCBuZXcgRFQgYmluZGluZyBkb2N1bWVudCBmb3IgSW5maW5lb24gUFhFMTYx
MCBkZXZpY2VzLg0KICAgID4gDQogICAgPiBTaWduZWQtb2ZmLWJ5OiBWaWpheSBLaGVta2EgPHZp
amF5a2hlbWthQGZiLmNvbT4NCiAgICA+IC0tLQ0KICAgID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2h3bW9uL3B4ZTE2MTAudHh0ICAgICAgICAgfCAxNSArKysrKysrKysrKysrKysNCiAgICA+
ICAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKQ0KICAgID4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaHdtb24vcHhlMTYxMC50eHQN
CiAgICA+IA0KICAgID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9od21vbi9weGUxNjEwLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9od21vbi9weGUxNjEwLnR4dA0KICAgID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCiAgICA+IGlu
ZGV4IDAwMDAwMDAwMDAwMC4uNjM1ZGFmNDk1NWRiDQogICAgPiAtLS0gL2Rldi9udWxsDQogICAg
PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaHdtb24vcHhlMTYxMC50
eHQNCiAgICA+IEBAIC0wLDAgKzEsMTUgQEANCiAgICA+ICtweGUxNjEwIHByb3BlcnRpZXMNCiAg
ICA+ICsNCiAgICA+ICtSZXF1aXJlZCBwcm9wZXJ0aWVzOg0KICAgID4gKy0gY29tcGF0aWJsZTog
TXVzdCBiZSBvbmUgb2YgdGhlIGZvbGxvd2luZzoNCiAgICA+ICsJLSAiaW5maW5lb24scHhlMTYx
MCIgZm9yIHB4ZTE2MTANCiAgICA+ICsJLSAiaW5maW5lb24scHhlMTExMCIgZm9yIHB4ZTE2MTAN
CiAgICA+ICsJLSAiaW5maW5lb24scHhtMTMxMCIgZm9yIHB4bTEzMTANCiAgICA+ICstIHJlZzog
STJDIGFkZHJlc3MNCiAgICA+ICsNCiAgICA+ICtFeGFtcGxlOg0KICAgID4gKw0KICAgID4gK3Zy
QDQ4IHsNCiAgICA+ICsJY29tcGF0aWJsZSA9ICJpbmZpbmVvbixweGUxNjEwIjsNCiAgICA+ICsJ
cmVnID0gPDB4NDg+Ow0KICAgID4gK307DQogICAgDQogICAgV291bGRuJ3QgaXQgYmUgYmV0dGVy
IHRvIGFkZCB0aGlzIHRvDQogICAgLi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
dHJpdmlhbC1kZXZpY2VzLnR4dCA/DQpTdXJlLCBJIGRpZG4ndCBrbm93IGFib3V0IHRoaXMgZmls
ZS4gSSB3aWxsIGFkZCBhbmQgc2VuZCBhbm90aGVyIHBhdGNoLiBJdCBpcyANCkRvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy90cml2aWFsLWRldmljZXMueWFtbC4gSG93IGRvIEkgYWJh
bmRvbiANCnRoaXMgcGF0Y2ggb3IganVzdCBsZWF2ZSBpdC4NCiAgICANCiAgICBUaGFua3MsDQog
ICAgR3VlbnRlcg0KICAgIA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVs
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
