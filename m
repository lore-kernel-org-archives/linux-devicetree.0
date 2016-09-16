From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: Re: [PATCH v1 2/3] ARM: dts: imx6q-apalis-ixora: Remove use of
 pwm-leds
Date: Fri, 16 Sep 2016 13:38:45 +0000
Message-ID: <1474033125.3103.26.camel@toradex.com>
References: <9d2c17aa2e00e6ff4349a53de8247860d2382607.1473833908.git.maitysanchayan@gmail.com>
 <6111feb57b5fbaa29eeb6ba089bb2824bbf2f8ff.1473833908.git.maitysanchayan@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <6111feb57b5fbaa29eeb6ba089bb2824bbf2f8ff.1473833908.git.maitysanchayan@gmail.com>
Content-Language: en-US
Content-ID: <116FFB44BE3BEB4793C8B9ACA9BDA161@eurprd05.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "shawnguo@kernel.org" <shawnguo@kernel.org>, "maitysanchayan@gmail.com" <maitysanchayan@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "stefan@agner.ch" <stefan@agner.ch>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

T24gV2VkLCAyMDE2LTA5LTE0IGF0IDEyOjA1ICswNTMwLCBTYW5jaGF5YW4gTWFpdHkgd3JvdGU6
DQo+IFJlbW92ZSB1c2Ugb2YgcHdtLWxlZHMgYW5kIHVzZSB0aGUgc3RhbmRhcmQgL3N5cy9jbGFz
cy9wd20NCj4gaW50ZXJmYWNlIGZyb20gUFdNIHN1YnN5c3RlbS4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IFNhbmNoYXlhbiBNYWl0eSA8bWFpdHlzYW5jaGF5YW5AZ21haWwuY29tPg0KDQpBY2tlZC1i
eTogTWFyY2VsIFppc3dpbGVyIDxtYXJjZWwuemlzd2lsZXJAdG9yYWRleC5jb20+DQoNCj4gLS0t
DQo+IMKgYXJjaC9hcm0vYm9vdC9kdHMvaW14NnEtYXBhbGlzLWl4b3JhLmR0cyB8IDIyIC0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0NCj4gwqAxIGZpbGUgY2hhbmdlZCwgMjIgZGVsZXRpb25zKC0pDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvaW14NnEtYXBhbGlzLWl4b3JhLmR0
cw0KPiBiL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDZxLWFwYWxpcy1peG9yYS5kdHMNCj4gaW5kZXgg
ZDk5OTc5ZS4uNzBhM2RhMCAxMDA2NDQNCj4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvaW14NnEt
YXBhbGlzLWl4b3JhLmR0cw0KPiArKysgYi9hcmNoL2FybS9ib290L2R0cy9pbXg2cS1hcGFsaXMt
aXhvcmEuZHRzDQo+IEBAIC0xNDYsMjggKzE0Niw2IEBADQo+IMKgCQkJZ3Bpb3MgPSA8JmdwaW8y
IDIgR1BJT19BQ1RJVkVfSElHSD47DQo+IMKgCQl9Ow0KPiDCoAl9Ow0KPiAtDQo+IC0JcHdtbGVk
cyB7DQo+IC0JCWNvbXBhdGlibGUgPSAicHdtLWxlZHMiOw0KPiAtDQo+IC0JCWxlZHB3bTEgew0K
PiAtCQkJbGFiZWwgPSAiUFdNMSI7DQo+IC0JCQlwd21zID0gPCZwd20xIDAgNTAwMDA+Ow0KPiAt
CQkJbWF4LWJyaWdodG5lc3MgPSA8MjU1PjsNCj4gLQkJfTsNCj4gLQ0KPiAtCQlsZWRwd20yIHsN
Cj4gLQkJCWxhYmVsID0gIlBXTTIiOw0KPiAtCQkJcHdtcyA9IDwmcHdtMiAwIDUwMDAwPjsNCj4g
LQkJCW1heC1icmlnaHRuZXNzID0gPDI1NT47DQo+IC0JCX07DQo+IC0NCj4gLQkJbGVkcHdtMyB7
DQo+IC0JCQlsYWJlbCA9ICJQV00zIjsNCj4gLQkJCXB3bXMgPSA8JnB3bTMgMCA1MDAwMD47DQo+
IC0JCQltYXgtYnJpZ2h0bmVzcyA9IDwyNTU+Ow0KPiAtCQl9Ow0KPiAtCX07DQo+IMKgfTsNCj4g
wqANCj4gwqAmYmFja2xpZ2h0IHsNCg0KVGVzdGVkIHdvcmtpbmcgZmluZSBhbmFsb2dvdXMgdG8g
d2hhdCB3ZSBkb2N1bWVudGVkIGZvciBWeWJyaWQ6DQoNCmh0dHA6Ly9kZXZlbG9wZXIudG9yYWRl
eC5jb20va25vd2xlZGdlLWJhc2UvcHdtLShsaW51eCkjQ29saWJyaV9WRnh4Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFp
bGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
