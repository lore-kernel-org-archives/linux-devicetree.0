From: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH v2 1/2] arm64: dts: imx8mq: Add on-chip OTP controller node
Date: Mon, 11 Feb 2019 13:03:17 +0100
Message-ID: <1549886597.2546.5.camel@pengutronix.de>
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
IHNhbWUgYXMgb24gdGhlIGlteDdkLgoKVGhpcyBpcyBub3QgdHJ1ZS4gQWNjb3JkaW5nIHRvIHRo
ZSByZWZlcmVuY2UgbWFudWFsLCB0aGUgT0NPVFAKY29udHJvbGxlciBvbiBpLk1YOE1RIHVzZXMg
dGhlIG5vbi1iYW5rZWQgd3JpdGUgbW9kZSwgc2FtZSBhcyBpLk1YNi4KVGh1cyBpdCBpcyBpbmNv
bXBhdGlibGUgdG8gdGhlIGkuTVg3IE9DT1RQLgoKQWxzbyB0aGUgbnVtYmVyIG9mIGZ1c2VzIGlz
IGRpZmZlcmVudCwgc28gd2UgcmVhbGx5IG5lZWQgc29tZSBkcml2ZXIKc3VwcG9ydCBmb3IgdGhl
IGlteDhtcSBjb21wYXRpYmxlIGFuZCBjYW4ndCBkZWNsYXJlIHRoZSBjb250cm9sbGVyCmNvbXBh
dGlibGUgdG8gc29tZSBvbGRlciBpbnN0YW5jZS4KClJlZ2FyZHMsCkx1Y2FzCgo+IFNpZ25lZC1v
ZmYtYnk6IENhcmxvIENhaW9uZSA8Y2NhaW9uZUBiYXlsaWJyZS5jb20+Cj4gLS0tCj4gwqBhcmNo
L2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4bXEuZHRzaSB8IDggKysrKysrKysKPiDCoDEg
ZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02
NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OG1xLmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2Zy
ZWVzY2FsZS9pbXg4bXEuZHRzaQo+IGluZGV4IGMzNGNhYmU5YjM1Ni4uZjM3ZjE3YjcxMTUxIDEw
MDY0NAo+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhtcS5kdHNpCj4g
KysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OG1xLmR0c2kKPiBAQCAtMjQx
LDYgKzI0MSwxNCBAQAo+IMKgCQkJCXJlZyA9IDwweDMwMzQwMDAwIDB4MTAwMDA+Owo+IMKgCQkJ
fTsKPiDCoAo+ICsJCQlvY290cDogb2NvdHAtY3RybEAzMDM1MDAwMCB7Cj4gKwkJCQljb21wYXRp
YmxlID0gImZzbCxpbXg4bXEtb2NvdHAiLCAiZnNsLGlteDdkLW9jb3RwIiwgInN5c2NvbiI7Cj4g
KwkJCQlyZWcgPSA8MHgzMDM1MDAwMCAweDEwMDAwPjsKPiArCQkJCWNsb2NrcyA9IDwmY2xrIElN
WDhNUV9DTEtfT0NPVFBfUk9PVD47Cj4gKwkJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKPiArCQkJ
CSNzaXplLWNlbGxzID0gPDE+Owo+ICsJCQl9Owo+ICsKPiDCoAkJCWFuYXRvcDogc3lzY29uQDMw
MzYwMDAwIHsKPiDCoAkJCQljb21wYXRpYmxlID0gImZzbCxpbXg4bXEtYW5hdG9wIiwgInN5c2Nv
biI7Cj4gwqAJCQkJcmVnID0gPDB4MzAzNjAwMDAgMHgxMDAwMD47CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcg
bGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
