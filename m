From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH 03/20] clk: sunxi: tcon-ch1: Do not return a negative error in
 get_parent
Date: Mon, 16 May 2016 14:47:03 +0200
Message-ID: <1463402840-17062-4-git-send-email-maxime.ripard@free-electrons.com>
References: <1463402840-17062-1-git-send-email-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1463402840-17062-1-git-send-email-maxime.ripard@free-electrons.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Z2V0X3BhcmVudCBpcyBzdXBwb3NlZCB0byByZXR1cm4gYW4gdW5zaWduZWQgOCBiaXQgaW50ZWdl
ciwgc28gcmV0dXJuaW5nCi1FSU5WQUwgaXMgYSBiYWQgaWRlYS4KClJlbW92ZSBpdC4KClJlcG9y
dGVkLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+ClNpZ25lZC1v
ZmYtYnk6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAZnJlZS1lbGVjdHJvbnMuY29tPgot
LS0KIGRyaXZlcnMvY2xrL3N1bnhpL2Nsay1zdW40aS10Y29uLWNoMS5jIHwgMyAtLS0KIDEgZmls
ZSBjaGFuZ2VkLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL3N1bnhp
L2Nsay1zdW40aS10Y29uLWNoMS5jIGIvZHJpdmVycy9jbGsvc3VueGkvY2xrLXN1bjRpLXRjb24t
Y2gxLmMKaW5kZXggOThhNDU4MmRlNTZhLi4yNDg1ODUyMzhiMWMgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvY2xrL3N1bnhpL2Nsay1zdW40aS10Y29uLWNoMS5jCisrKyBiL2RyaXZlcnMvY2xrL3N1bnhp
L2Nsay1zdW40aS10Y29uLWNoMS5jCkBAIC04NSw5ICs4NSw2IEBAIHN0YXRpYyB1OCB0Y29uX2No
MV9nZXRfcGFyZW50KHN0cnVjdCBjbGtfaHcgKmh3KQogCXJlZyA9IHJlYWRsKHRjbGstPnJlZykg
Pj4gVENPTl9DSDFfU0NMSzJfTVVYX1NISUZUOwogCXJlZyAmPSByZWcgPj4gVENPTl9DSDFfU0NM
SzJfTVVYX01BU0s7CiAKLQlpZiAocmVnID49IG51bV9wYXJlbnRzKQotCQlyZXR1cm4gLUVJTlZB
TDsKLQogCXJldHVybiByZWc7CiB9CiAKLS0gCjIuOC4yCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
