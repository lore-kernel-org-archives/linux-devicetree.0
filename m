From: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH v6 4/5] ARM: dts: imx7s: add i.MX7 messaging unit support
Date: Mon, 23 Jul 2018 18:57:13 +0200
Message-ID: <1532365033.3163.107.camel@pengutronix.de>
References: <20180722063923.30222-1-o.rempel@pengutronix.de>
 <20180722063923.30222-5-o.rempel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180722063923.30222-5-o.rempel@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Oleksij Rempel <o.rempel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "A.s. Dong" <aisheng.dong@nxp.com>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: kernel@pengutronix.de, devicetree@vger.kernel.org, dl-linux-imx <linux-imx@nxp.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

QW0gU29ubnRhZywgZGVuIDIyLjA3LjIwMTgsIDA4OjM5ICswMjAwIHNjaHJpZWIgT2xla3NpaiBS
ZW1wZWw6Cj4gRGVmaW5lIHRoZSBNZXNzYWdpbmcgVW5pdCAoTVUpIGZvciBpLk1YNyBpbiB0aGUg
cHJvY2Vzc29yJ3MgZHRzaS4KPiBUaGUgcmVzcGVjdGl2ZSBkcml2ZXIgaXMgYWRkZWQgaW4gdGhl
IG5leHQgY29tbWl0Lgo+IAo+ID4gUmV2aWV3ZWQtYnk6IERvbmcgQWlzaGVuZyA8YWlzaGVuZy5k
b25nQG54cC5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2lqIFJlbXBlbCA8by5yZW1wZWxA
cGVuZ3V0cm9uaXguZGU+Cj4gLS0tCj4gwqBhcmNoL2FybS9ib290L2R0cy9pbXg3cy5kdHNpIHwg
MTkgKysrKysrKysrKysrKysrKysrKwo+IMKgMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMo
KykKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvaW14N3MuZHRzaSBiL2FyY2gv
YXJtL2Jvb3QvZHRzL2lteDdzLmR0c2kKPiBpbmRleCBjZTg1YjNjYTFhNTUuLjE5MWEwMjg2ZmEz
YiAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9pbXg3cy5kdHNpCj4gKysrIGIvYXJj
aC9hcm0vYm9vdC9kdHMvaW14N3MuZHRzaQo+IEBAIC0xMDAxLDYgKzEwMDEsMjUgQEAKPiA+IMKg
CQkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4gPiDCoAkJCX07Cj4gwqAKPiA+ID4gKwkJCW11MGE6
IG1haWxib3hAMzBhYTAwMDAgewo+ICsJCQkJY29tcGF0aWJsZSA9ICJmc2wsaW14N3MtbXUiLCAi
ZnNsLGlteDZzeC1tdSI7CgpUaG9zZSBjb21wYXRpYmxlcyBhcmUgbWlzc2luZyBkb2N1bWVudGF0
aW9uIGluIHRoZSBiaW5kaW5nLgoKPiArCQkJCXJlZyA9IDwweDMwYWEwMDAwIDB4MTAwMDA+Owo+
ID4gKwkJCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgODggSVJRX1RZUEVfTEVWRUxfSElHSD47Cj4g
PiArCQkJCWNsb2NrcyA9IDwmY2xrcyBJTVg3RF9NVV9ST09UX0NMSz47Cj4gPiArCQkJCSNtYm94
LWNlbGxzID0gPDE+Owo+ID4gKwkJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwo+ID4gKwkJCX07Cj4g
Kwo+ID4gPiArCQkJbXUwYjogbWFpbGJveEAzMGFiMDAwMCB7Cj4gPiArCQkJCWNvbXBhdGlibGUg
PSAiZnNsLGlteDdzLW11IiwgImZzbCxpbXg2c3gtbXUiOwo+ID4gKwkJCQlyZWcgPSA8MHgzMGFi
MDAwMCAweDEwMDAwPjsKPiA+ICsJCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDk3IElSUV9UWVBF
X0xFVkVMX0hJR0g+Owo+ID4gKwkJCQljbG9ja3MgPSA8JmNsa3MgSU1YN0RfTVVfUk9PVF9DTEs+
Owo+ID4gKwkJCQkjbWJveC1jZWxscyA9IDwxPjsKPiA+ICsJCQkJZnNsLG11LXNpZGUtYjsKPiA+
ICsJCQkJc3RhdHVzID0gImRpc2FibGVkIjsKPiA+ICsJCQl9Owo+ICsKPiA+ID4gwqAJCQl1c2Jv
dGcxOiB1c2JAMzBiMTAwMDAgewo+ID4gwqAJCQkJY29tcGF0aWJsZSA9ICJmc2wsaW14N2QtdXNi
IiwgImZzbCxpbXgyNy11c2IiOwo+ID4gwqAJCQkJcmVnID0gPDB4MzBiMTAwMDAgMHgyMDA+OwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJt
LWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtl
cm5lbAo=
