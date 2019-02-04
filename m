From: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH v2 1/2] arm64: dts: imx8mq: Add on-chip OTP controller node
Date: Mon, 04 Feb 2019 11:26:30 +0100
Message-ID: <1549275990.2544.3.camel@pengutronix.de>
References: <20190202150638.13672-1-ccaione@baylibre.com>
 <20190202150638.13672-2-ccaione@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190202150638.13672-2-ccaione@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Carlo Caione <ccaione@baylibre.com>, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

QW0gU2Ftc3RhZywgZGVuIDAyLjAyLjIwMTksIDE1OjA2ICswMDAwIHNjaHJpZWIgQ2FybG8gQ2Fp
b25lOgo+IEFkZCB0aGUgbm9kZSBmb3IgdGhlIE9UUCBjb250cm9sbGVyLiBUaGUgSVAgaXMgdGhl
IHNhbWUgYXMgb24gdGhlIGlteDdkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENhcmxvIENhaW9uZSA8
Y2NhaW9uZUBiYXlsaWJyZS5jb20+CgpSZXZpZXdlZC1ieTogTHVjYXMgU3RhY2ggPGwuc3RhY2hA
cGVuZ3V0cm9uaXguZGU+Cgo+IC0tLQo+IMKgYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUv
aW14OG1xLmR0c2kgfCA4ICsrKysrKysrCj4gwqAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25z
KCspCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDht
cS5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OG1xLmR0c2kKPiBpbmRl
eCBjMzRjYWJlOWIzNTYuLmYzN2YxN2I3MTE1MSAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybTY0L2Jv
b3QvZHRzL2ZyZWVzY2FsZS9pbXg4bXEuZHRzaQo+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMv
ZnJlZXNjYWxlL2lteDhtcS5kdHNpCj4gQEAgLTI0MSw2ICsyNDEsMTQgQEAKPiDCoAkJCQlyZWcg
PSA8MHgzMDM0MDAwMCAweDEwMDAwPjsKPiDCoAkJCX07Cj4gwqAKPiArCQkJb2NvdHA6IG9jb3Rw
LWN0cmxAMzAzNTAwMDAgewo+ICsJCQkJY29tcGF0aWJsZSA9ICJmc2wsaW14OG1xLW9jb3RwIiwg
ImZzbCxpbXg3ZC1vY290cCIsICJzeXNjb24iOwo+ICsJCQkJcmVnID0gPDB4MzAzNTAwMDAgMHgx
MDAwMD47Cj4gKwkJCQljbG9ja3MgPSA8JmNsayBJTVg4TVFfQ0xLX09DT1RQX1JPT1Q+Owo+ICsJ
CQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4gKwkJCQkjc2l6ZS1jZWxscyA9IDwxPjsKPiArCQkJ
fTsKPiArCj4gwqAJCQlhbmF0b3A6IHN5c2NvbkAzMDM2MDAwMCB7Cj4gwqAJCQkJY29tcGF0aWJs
ZSA9ICJmc2wsaW14OG1xLWFuYXRvcCIsICJzeXNjb24iOwo+IMKgCQkJCXJlZyA9IDwweDMwMzYw
MDAwIDB4MTAwMDA+OwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtYXJtLWtlcm5lbAo=
