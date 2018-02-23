From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Subject: Re: [v2,03/10] drm/sun4i: Protect the TCON pixel clocks
Date: Fri, 23 Feb 2018 15:05:26 +0100
Message-ID: <287984f8-bcac-3789-d573-2f0c54fb537d@micronovasrl.com>
References: <d5224d2e81ecf73dc09f234e580ada52c00eaee3.1519204731.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <d5224d2e81ecf73dc09f234e580ada52c00eaee3.1519204731.git-series.maxime.ripard@bootlin.com>
Content-Language: it
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Maxime Ripard <maxime.ripard@bootlin.com>, Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Daniel Vetter <daniel.vetter@intel.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

RnJvbTogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBmcmVlLWVsZWN0cm9ucy5jb20+CgpC
b3RoIFRDT04gY2xvY2tzIGFyZSB2ZXJ5IHNlbnNpdGl2ZSB0byBjbG9jayBjaGFuZ2VzLCBzaW5j
ZSBhbnkgY2hhbmdlCm1pZ2h0IGxlYWQgdG8gaW1wcm9wZXIgdGltaW5ncy4KCk1ha2Ugc3VyZSBv
dXIgcmF0ZSBpcyBuZXZlciBjaGFuZ2VkLgoKVGVzdGVkLWJ5OiBHaXVsaW8gQmVuZXR0aSA8Z2l1
bGlvLmJlbmV0dGlAbWljcm9ub3Zhc3JsLmNvbT4KU2lnbmVkLW9mZi1ieTogTWF4aW1lIFJpcGFy
ZCA8bWF4aW1lLnJpcGFyZEBmcmVlLWVsZWN0cm9ucy5jb20+Ci0tLQogIGRyaXZlcnMvZ3B1L2Ry
bS9zdW40aS9zdW40aV90Y29uLmMgfCA0ICsrLS0KICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zdW40
aS9zdW40aV90Y29uLmMgCmIvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX3Rjb24uYwppbmRl
eCBiNzNhY2FiNzQ4NjcuLmNiZTg3Y2VlMTNkMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3N1bjRpL3N1bjRpX3Rjb24uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfdGNv
bi5jCkBAIC0yNjEsNyArMjYxLDcgQEAgc3RhdGljIHZvaWQgc3VuNGlfdGNvbjBfbW9kZV9zZXRf
Y29tbW9uKHN0cnVjdCAKc3VuNGlfdGNvbiAqdGNvbiwKICAJCQkJCWNvbnN0IHN0cnVjdCBkcm1f
ZGlzcGxheV9tb2RlICptb2RlKQogIHsKICAJLyogQ29uZmlndXJlIHRoZSBkb3QgY2xvY2sgKi8K
LQljbGtfc2V0X3JhdGUodGNvbi0+ZGNsaywgbW9kZS0+Y3J0Y19jbG9jayAqIDEwMDApOworCWNs
a19zZXRfcmF0ZV9leGNsdXNpdmUodGNvbi0+ZGNsaywgbW9kZS0+Y3J0Y19jbG9jayAqIDEwMDAp
OwoKICAJLyogU2V0IHRoZSByZXNvbHV0aW9uICovCiAgCXJlZ21hcF93cml0ZSh0Y29uLT5yZWdz
LCBTVU40SV9UQ09OMF9CQVNJQzBfUkVHLApAQCAtNDE5LDcgKzQxOSw3IEBAIHN0YXRpYyB2b2lk
IHN1bjRpX3Rjb24xX21vZGVfc2V0KHN0cnVjdCBzdW40aV90Y29uIAoqdGNvbiwKICAJV0FSTl9P
TighdGNvbi0+cXVpcmtzLT5oYXNfY2hhbm5lbF8xKTsKCiAgCS8qIENvbmZpZ3VyZSB0aGUgZG90
IGNsb2NrICovCi0JY2xrX3NldF9yYXRlKHRjb24tPnNjbGsxLCBtb2RlLT5jcnRjX2Nsb2NrICog
MTAwMCk7CisJY2xrX3NldF9yYXRlX2V4Y2x1c2l2ZSh0Y29uLT5zY2xrMSwgbW9kZS0+Y3J0Y19j
bG9jayAqIDEwMDApOwoKICAJLyogQWRqdXN0IGNsb2NrIGRlbGF5ICovCiAgCWNsa19kZWxheSA9
IHN1bjRpX3Rjb25fZ2V0X2Nsa19kZWxheShtb2RlLCAxKTsKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
