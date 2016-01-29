From: "Yang, Wenyou" <Wenyou.Yang@atmel.com>
Subject: RE: [PATCH v4 1/2] regulator: act8945a: add regulator driver for
 ACT8945A
Date: Fri, 29 Jan 2016 01:20:08 +0000
Message-ID: <B256D81BAE5131468A838E5D7A243641D63FBF8B@penmbx01>
References: <1453863463-30515-1-git-send-email-wenyou.yang@atmel.com>
 <1453863463-30515-2-git-send-email-wenyou.yang@atmel.com>
 <20160129001603.GM4130@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160129001603.GM4130@sirena.org.uk>
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
To: Mark Brown <broonie@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "Ferre,
 Nicolas" <Nicolas.FERRE@atmel.com>, Liam Girdwood <lgirdwood@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Peter Korsgaard <jacmet@gmail.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Javier Martinez Canillas <javier@dowhile0.org>, Lee Jones <lee.jones@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

SGkgTWFyaywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNYXJrIEJy
b3duIFttYWlsdG86YnJvb25pZUBrZXJuZWwub3JnXQ0KPiBTZW50OiAyMDE2xOox1MIyOcjVIDg6
MTYNCj4gVG86IFlhbmcsIFdlbnlvdSA8V2VueW91LllhbmdAYXRtZWwuY29tPg0KPiBDYzogTGlh
bSBHaXJkd29vZCA8bGdpcmR3b29kQGdtYWlsLmNvbT47IFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtl
cm5lbC5vcmc+Ow0KPiBQYXdlbCBNb2xsIDxwYXdlbC5tb2xsQGFybS5jb20+OyBJYW4gQ2FtcGJl
bGwNCj4gPGlqYytkZXZpY2V0cmVlQGhlbGxpb24ub3JnLnVrPjsgS3VtYXIgR2FsYSA8Z2FsYWtA
Y29kZWF1cm9yYS5vcmc+Ow0KPiBLcnp5c3p0b2YgS296bG93c2tpIDxrLmtvemxvd3NraUBzYW1z
dW5nLmNvbT47IEphdmllciBNYXJ0aW5leiBDYW5pbGxhcw0KPiA8amF2aWVyQGRvd2hpbGUwLm9y
Zz47IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+OyBQZXRlciBLb3JzZ2FhcmQNCj4g
PGphY21ldEBnbWFpbC5jb20+OyBGZXJyZSwgTmljb2xhcyA8Tmljb2xhcy5GRVJSRUBhdG1lbC5j
b20+OyBsaW51eC1hcm0tDQo+IGtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBsaW51eC1rZXJu
ZWxAdmdlci5rZXJuZWwub3JnOw0KPiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZw0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIIHY0IDEvMl0gcmVndWxhdG9yOiBhY3Q4OTQ1YTogYWRkIHJlZ3VsYXRv
ciBkcml2ZXIgZm9yDQo+IEFDVDg5NDVBDQo+IA0KPiBPbiBXZWQsIEphbiAyNywgMjAxNiBhdCAx
MDo1Nzo0MkFNICswODAwLCBXZW55b3UgWWFuZyB3cm90ZToNCj4gDQo+ID4gK3N0YXRpYyBjb25z
dCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGFjdDg5NDVhX3BtaWNfb2ZfbWF0Y2hbXSA9IHsNCj4gPiAr
CXsgLmNvbXBhdGlibGUgPSAiYWN0aXZlLXNlbWksYWN0ODk0NWEtcmVndWxhdG9yIiB9LA0KPiA+
ICsJeyB9LA0KPiA+ICt9Ow0KPiA+ICtNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBhY3Q4OTQ1YV9w
bWljX29mX21hdGNoKTsNCj4gDQo+IFRoaXMgc2VlbXMgbW9zdGx5IE9LIGJ1dCB3aHkgZG8gd2Ug
aGF2ZSBhIGNvbXBhdGlibGUgc3RyaW5nIGhlcmUgLSBzaG91bGRuJ3QNCj4gdGhlIE1GRCBiZSBh
YmxlIHRvIGluc3RhbnRpYXRlIHRoZSByZWd1bGF0b3IgZnVuY3Rpb24gd2l0aG91dCBuZWVkaW5n
IHRoaXM/DQoNCkJlY2F1c2UgSSBnb3QgZmVlZGJhY2sgZnJvbSBKYXZpZXIgZm9yIHRoZSBhY3Q4
OTQ1YS1jaGFyZ2VyIHBhdGNoZXMgb2YgdGhpcyBNRkQgc2VyaWVzLA0KSGUgc2FpZCBtaXNzaW5n
IHRoZSBPRiBtYXRjaCB0YWJsZSB3aWxsIGNhdXNlIHRoZSBtb2R1bGUgYXV0b2xvYWRpbmcgYnJv
a2VuLiANCg0KaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvcGlwZXJtYWlsL2xpbnV4LWFybS1r
ZXJuZWwvMjAxNi1KYW51YXJ5LzM5ODExMy5odG1sDQoNCldoYXQgZG8geW91IHRoaW5rIGFib3V0
IGl0Pw0KDQoNCkJlc3QgUmVnYXJkcywNCldlbnlvdSBZYW5nDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlz
dApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
