From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH v3 11/21] drm/sun4i: tcon: Switch mux on only for composite
Date: Wed, 17 May 2017 09:40:40 +0200
Message-ID: <c67a3f59ba50aace65f2c9b28330826944e682ce.1495006350.git-series.maxime.ripard@free-electrons.com>
References: <cover.463df61c38224ecbfb5bf1cf192deeb63718b693.1495006350.git-series.maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <cover.463df61c38224ecbfb5bf1cf192deeb63718b693.1495006350.git-series.maxime.ripard@free-electrons.com>
In-Reply-To: <cover.463df61c38224ecbfb5bf1cf192deeb63718b693.1495006350.git-series.maxime.ripard@free-electrons.com>
References: <cover.463df61c38224ecbfb5bf1cf192deeb63718b693.1495006350.git-series.maxime.ripard@free-electrons.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

RXZlbiB0aG91Z2ggdGhhdCBtdXggaXMgdW5kb2N1bWVudGVkLCBpdCBzZWVtcyBsaWtlIGl0IG5l
ZWRzIHRvIGJlIHNldCB0byAxCndoZW4gdXNpbmcgY29tcG9zaXRlLCBhbmQgMCB3aGVuIHVzaW5n
IEhETUkuCgpTaWduZWQtb2ZmLWJ5OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGZyZWUt
ZWxlY3Ryb25zLmNvbT4KQWNrZWQtYnk6IENoZW4tWXUgVHNhaSA8d2Vuc0Bjc2llLm9yZz4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfdGNvbi5jIHwgIDkgKysrKysrKystCiAxIGZp
bGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX3Rjb24uYyBiL2RyaXZlcnMvZ3B1L2RybS9zdW40
aS9zdW40aV90Y29uLmMKaW5kZXggYTNmYzZhYjNjMTRiLi43NGFhMDFlNzVlMzIgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV90Y29uLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3N1bjRpL3N1bjRpX3Rjb24uYwpAQCAtMTEyLDE2ICsxMTIsMjMgQEAgRVhQT1JUX1NZTUJP
TChzdW40aV90Y29uX2VuYWJsZV92YmxhbmspOwogdm9pZCBzdW40aV90Y29uX3NldF9tdXgoc3Ry
dWN0IHN1bjRpX3Rjb24gKnRjb24sIGludCBjaGFubmVsLAogCQkJc3RydWN0IGRybV9lbmNvZGVy
ICplbmNvZGVyKQogeworCXUzMiB2YWw7CisKIAlpZiAoIXRjb24tPnF1aXJrcy0+aGFzX3Vua25v
d25fbXV4KQogCQlyZXR1cm47CiAKIAlpZiAoY2hhbm5lbCAhPSAxKQogCQlyZXR1cm47CiAKKwlp
ZiAoZW5jb2Rlci0+ZW5jb2Rlcl90eXBlID09IERSTV9NT0RFX0VOQ09ERVJfVFZEQUMpCisJCXZh
bCA9IDE7CisJZWxzZQorCQl2YWwgPSAwOworCiAJLyoKIAkgKiBGSVhNRTogVW5kb2N1bWVudGVk
IGJpdHMKIAkgKi8KLQlyZWdtYXBfd3JpdGUodGNvbi0+cmVncywgU1VONElfVENPTl9NVVhfQ1RS
TF9SRUcsIDEpOworCXJlZ21hcF93cml0ZSh0Y29uLT5yZWdzLCBTVU40SV9UQ09OX01VWF9DVFJM
X1JFRywgdmFsKTsKIH0KIEVYUE9SVF9TWU1CT0woc3VuNGlfdGNvbl9zZXRfbXV4KTsKIAotLSAK
Z2l0LXNlcmllcyAwLjkuMQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
