From: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH] arm64: dts: imx8mq: Add on-chip OTP controller node
Date: Fri, 01 Feb 2019 16:54:23 +0100
Message-ID: <1549036463.6869.58.camel@pengutronix.de>
References: <20190128194343.13713-1-ccaione@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190128194343.13713-1-ccaione@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Carlo Caione <ccaione@baylibre.com>, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, abel.vesa@nxp.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

QW0gTW9udGFnLCBkZW4gMjguMDEuMjAxOSwgMTk6NDMgKzAwMDAgc2NocmllYiBDYXJsbyBDYWlv
bmU6Cj4gQWRkIHRoZSBub2RlIGZvciB0aGUgT1RQIGNvbnRyb2xsZXIuIFRoZSBJUCBpcyB0aGUg
c2FtZSBhcyBvbiB0aGUgaW14N2QuCj4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBDYXJsbyBDYWlvbmUg
PGNjYWlvbmVAYmF5bGlicmUuY29tPgo+IC0tLQo+IMKgYXJjaC9hcm02NC9ib290L2R0cy9mcmVl
c2NhbGUvaW14OG1xLmR0c2kgfCA4ICsrKysrKysrCj4gwqAxIGZpbGUgY2hhbmdlZCwgOCBpbnNl
cnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxl
L2lteDhtcS5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OG1xLmR0c2kK
PiBpbmRleCA4OTIwNjNhN2MyNmMuLjlhNTIwNWYwOGYzYSAxMDA2NDQKPiAtLS0gYS9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4bXEuZHRzaQo+ICsrKyBiL2FyY2gvYXJtNjQvYm9v
dC9kdHMvZnJlZXNjYWxlL2lteDhtcS5kdHNpCj4gQEAgLTIzNCw2ICsyMzQsMTQgQEAKPiA+IMKg
CQkJCXJlZyA9IDwweDMwMzQwMDAwIDB4MTAwMDA+Owo+ID4gwqAJCQl9Owo+IMKgCj4gPiA+ICsJ
CQlvY290cDogb2NvdHAtY3RybEAzMDM1MDAwMCB7Cj4gKwkJCQljb21wYXRpYmxlID0gImZzbCxp
bXg3ZC1vY290cCIsICJzeXNjb24iOwoKUGxlYXNlIGFkZCBhIGlteDhtcSBjb21wYXRpYmxlIGhl
cmUuCgpSZWdhcmRzLApMdWNhcwoKPiArCQkJCXJlZyA9IDwweDMwMzUwMDAwIDB4MTAwMDA+Owo+
ID4gKwkJCQljbG9ja3MgPSA8JmNsayBJTVg4TVFfQ0xLX09DT1RQX1JPT1Q+Owo+ID4gKwkJCQkj
YWRkcmVzcy1jZWxscyA9IDwxPjsKPiA+ICsJCQkJI3NpemUtY2VsbHMgPSA8MT47Cj4gPiArCQkJ
fTsKPiArCj4gPiA+IMKgCQkJYW5hdG9wOiBzeXNjb25AMzAzNjAwMDAgewo+ID4gwqAJCQkJY29t
cGF0aWJsZSA9ICJmc2wsaW14OG1xLWFuYXRvcCIsICJzeXNjb24iOwo+ID4gwqAJCQkJcmVnID0g
PDB4MzAzNjAwMDAgMHgxMDAwMD47CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2Vy
bmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
