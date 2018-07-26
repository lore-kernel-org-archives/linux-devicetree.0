From: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH v7 5/6] ARM: dts: imx7s: add i.MX7 messaging unit support
Date: Thu, 26 Jul 2018 10:11:05 +0200
Message-ID: <1532592665.32306.20.camel@pengutronix.de>
References: <20180726065331.6186-1-o.rempel@pengutronix.de>
 <20180726065331.6186-6-o.rempel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180726065331.6186-6-o.rempel@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Oleksij Rempel <o.rempel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "A.s. Dong" <aisheng.dong@nxp.com>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, Jassi Brar <jassisinghbrar@gmail.com>
Cc: kernel@pengutronix.de, devicetree@vger.kernel.org, dl-linux-imx <linux-imx@nxp.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

QW0gRG9ubmVyc3RhZywgZGVuIDI2LjA3LjIwMTgsIDA4OjUzICswMjAwIHNjaHJpZWIgT2xla3Np
aiBSZW1wZWw6Cj4gRGVmaW5lIHRoZSBNZXNzYWdpbmcgVW5pdCAoTVUpIGZvciBpLk1YNyBpbiB0
aGUgcHJvY2Vzc29yJ3MgZHRzaS4KPiBUaGUgcmVzcGVjdGl2ZSBkcml2ZXIgaXMgYWRkZWQgaW4g
dGhlIG5leHQgY29tbWl0Lgo+IAo+ID4gUmV2aWV3ZWQtYnk6IERvbmcgQWlzaGVuZyA8YWlzaGVu
Zy5kb25nQG54cC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogT2xla3NpaiBSZW1wZWwgPG8ucmVtcGVs
QHBlbmd1dHJvbml4LmRlPgoKUmV2aWV3ZWQtYnk6IEx1Y2FzIFN0YWNoIDxsLnN0YWNoQHBlbmd1
dHJvbml4LmRlPgoKPiAtLS0KPiDCoGFyY2gvYXJtL2Jvb3QvZHRzL2lteDdzLmR0c2kgfCAxOSAr
KysrKysrKysrKysrKysrKysrCj4gwqAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKQo+
IAo+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9pbXg3cy5kdHNpIGIvYXJjaC9hcm0v
Ym9vdC9kdHMvaW14N3MuZHRzaQo+IGluZGV4IGNlODViM2NhMWE1NS4uMTkxYTAyODZmYTNiIDEw
MDY0NAo+IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDdzLmR0c2kKPiArKysgYi9hcmNoL2Fy
bS9ib290L2R0cy9pbXg3cy5kdHNpCj4gQEAgLTEwMDEsNiArMTAwMSwyNSBAQAo+ID4gwqAJCQkJ
c3RhdHVzID0gImRpc2FibGVkIjsKPiA+IMKgCQkJfTsKPiDCoAo+ID4gPiArCQkJbXUwYTogbWFp
bGJveEAzMGFhMDAwMCB7Cj4gPiArCQkJCWNvbXBhdGlibGUgPSAiZnNsLGlteDdzLW11IiwgImZz
bCxpbXg2c3gtbXUiOwo+ID4gKwkJCQlyZWcgPSA8MHgzMGFhMDAwMCAweDEwMDAwPjsKPiA+ICsJ
CQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDg4IElSUV9UWVBFX0xFVkVMX0hJR0g+Owo+ID4gKwkJ
CQljbG9ja3MgPSA8JmNsa3MgSU1YN0RfTVVfUk9PVF9DTEs+Owo+ID4gKwkJCQkjbWJveC1jZWxs
cyA9IDwxPjsKPiA+ICsJCQkJc3RhdHVzID0gImRpc2FibGVkIjsKPiA+ICsJCQl9Owo+ICsKPiA+
ID4gKwkJCW11MGI6IG1haWxib3hAMzBhYjAwMDAgewo+ID4gKwkJCQljb21wYXRpYmxlID0gImZz
bCxpbXg3cy1tdSIsICJmc2wsaW14NnN4LW11IjsKPiA+ICsJCQkJcmVnID0gPDB4MzBhYjAwMDAg
MHgxMDAwMD47Cj4gPiArCQkJCWludGVycnVwdHMgPSA8R0lDX1NQSSA5NyBJUlFfVFlQRV9MRVZF
TF9ISUdIPjsKPiA+ICsJCQkJY2xvY2tzID0gPCZjbGtzIElNWDdEX01VX1JPT1RfQ0xLPjsKPiA+
ICsJCQkJI21ib3gtY2VsbHMgPSA8MT47Cj4gPiArCQkJCWZzbCxtdS1zaWRlLWI7Cj4gPiArCQkJ
CXN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4gPiArCQkJfTsKPiArCj4gPiA+IMKgCQkJdXNib3RnMTog
dXNiQDMwYjEwMDAwIHsKPiA+IMKgCQkJCWNvbXBhdGlibGUgPSAiZnNsLGlteDdkLXVzYiIsICJm
c2wsaW14MjctdXNiIjsKPiA+IMKgCQkJCXJlZyA9IDwweDMwYjEwMDAwIDB4MjAwPjsKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJu
ZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
