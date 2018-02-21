From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH v2 03/10] drm/sun4i: Protect the TCON pixel clocks
Date: Wed, 21 Feb 2018 10:20:27 +0100
Message-ID: <d5224d2e81ecf73dc09f234e580ada52c00eaee3.1519204731.git-series.maxime.ripard@bootlin.com>
References: <cover.68c39205c8726547449e3df67b549d89380e51a2.1519204731.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <cover.68c39205c8726547449e3df67b549d89380e51a2.1519204731.git-series.maxime.ripard@bootlin.com>
In-Reply-To: <cover.68c39205c8726547449e3df67b549d89380e51a2.1519204731.git-series.maxime.ripard@bootlin.com>
References: <cover.68c39205c8726547449e3df67b549d89380e51a2.1519204731.git-series.maxime.ripard@bootlin.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Daniel Vetter <daniel.vetter@intel.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

RnJvbTogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBmcmVlLWVsZWN0cm9ucy5jb20+CgpC
b3RoIFRDT04gY2xvY2tzIGFyZSB2ZXJ5IHNlbnNpdGl2ZSB0byBjbG9jayBjaGFuZ2VzLCBzaW5j
ZSBhbnkgY2hhbmdlCm1pZ2h0IGxlYWQgdG8gaW1wcm9wZXIgdGltaW5ncy4KCk1ha2Ugc3VyZSBv
dXIgcmF0ZSBpcyBuZXZlciBjaGFuZ2VkLgoKU2lnbmVkLW9mZi1ieTogTWF4aW1lIFJpcGFyZCA8
bWF4aW1lLnJpcGFyZEBmcmVlLWVsZWN0cm9ucy5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3N1
bjRpL3N1bjRpX3Rjb24uYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3Vu
NGlfdGNvbi5jIGIvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX3Rjb24uYwppbmRleCBiNzNh
Y2FiNzQ4NjcuLmNiZTg3Y2VlMTNkMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3N1bjRp
L3N1bjRpX3Rjb24uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfdGNvbi5jCkBA
IC0yNjEsNyArMjYxLDcgQEAgc3RhdGljIHZvaWQgc3VuNGlfdGNvbjBfbW9kZV9zZXRfY29tbW9u
KHN0cnVjdCBzdW40aV90Y29uICp0Y29uLAogCQkJCQljb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlf
bW9kZSAqbW9kZSkKIHsKIAkvKiBDb25maWd1cmUgdGhlIGRvdCBjbG9jayAqLwotCWNsa19zZXRf
cmF0ZSh0Y29uLT5kY2xrLCBtb2RlLT5jcnRjX2Nsb2NrICogMTAwMCk7CisJY2xrX3NldF9yYXRl
X2V4Y2x1c2l2ZSh0Y29uLT5kY2xrLCBtb2RlLT5jcnRjX2Nsb2NrICogMTAwMCk7CiAKIAkvKiBT
ZXQgdGhlIHJlc29sdXRpb24gKi8KIAlyZWdtYXBfd3JpdGUodGNvbi0+cmVncywgU1VONElfVENP
TjBfQkFTSUMwX1JFRywKQEAgLTQxOSw3ICs0MTksNyBAQCBzdGF0aWMgdm9pZCBzdW40aV90Y29u
MV9tb2RlX3NldChzdHJ1Y3Qgc3VuNGlfdGNvbiAqdGNvbiwKIAlXQVJOX09OKCF0Y29uLT5xdWly
a3MtPmhhc19jaGFubmVsXzEpOwogCiAJLyogQ29uZmlndXJlIHRoZSBkb3QgY2xvY2sgKi8KLQlj
bGtfc2V0X3JhdGUodGNvbi0+c2NsazEsIG1vZGUtPmNydGNfY2xvY2sgKiAxMDAwKTsKKwljbGtf
c2V0X3JhdGVfZXhjbHVzaXZlKHRjb24tPnNjbGsxLCBtb2RlLT5jcnRjX2Nsb2NrICogMTAwMCk7
CiAKIAkvKiBBZGp1c3QgY2xvY2sgZGVsYXkgKi8KIAljbGtfZGVsYXkgPSBzdW40aV90Y29uX2dl
dF9jbGtfZGVsYXkobW9kZSwgMSk7Ci0tIApnaXQtc2VyaWVzIDAuOS4xCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
