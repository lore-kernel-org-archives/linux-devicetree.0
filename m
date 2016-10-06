From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH v6 1/5] drm/sun4i: rgb: Remove the bridge enable/disable
 functions
Date: Thu,  6 Oct 2016 09:57:05 +0200
Message-ID: <5100ee37c9bbb53f8227bd38f1d3160e507c489d.1475740611.git-series.maxime.ripard@free-electrons.com>
References: <cover.2ec28e2292f37131839babc08427ef9f1aece26a.1475740611.git-series.maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <cover.2ec28e2292f37131839babc08427ef9f1aece26a.1475740611.git-series.maxime.ripard@free-electrons.com>
In-Reply-To: <cover.2ec28e2292f37131839babc08427ef9f1aece26a.1475740611.git-series.maxime.ripard@free-electrons.com>
References: <cover.2ec28e2292f37131839babc08427ef9f1aece26a.1475740611.git-series.maxime.ripard@free-electrons.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, Archit Taneja <architt@codeaurora.org>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

VGhlIGF0b21pYyBoZWxwZXJzIGFscmVhZHkgY2FsbCB0aGUgZHJtX2JyaWRnZV9lbmFibGUgb24g
b3VyIGJlaGFsZiwKdGhlcmUncyBubyBuZWVkIHRvIGRvIGl0IGEgc2Vjb25kIHRpbWUuCgpSZXBv
cnRlZC1ieTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+ClNpZ25lZC1vZmYtYnk6
IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAZnJlZS1lbGVjdHJvbnMuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV9yZ2IuYyB8IDYgLS0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9zdW40aS9zdW40aV9yZ2IuYyBiL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV9y
Z2IuYwppbmRleCA0ZTRiZWE2ZjM5NWMuLmQxOThhZDdlNTMyMyAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3N1bjRpL3N1bjRpX3JnYi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9z
dW40aV9yZ2IuYwpAQCAtMTU1LDkgKzE1NSw2IEBAIHN0YXRpYyB2b2lkIHN1bjRpX3JnYl9lbmNv
ZGVyX2VuYWJsZShzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIpCiAJaWYgKCFJU19FUlIodGNv
bi0+cGFuZWwpKQogCQlkcm1fcGFuZWxfcHJlcGFyZSh0Y29uLT5wYW5lbCk7CiAKLQkvKiBlbmNv
ZGVyLT5icmlkZ2UgY2FuIGJlIE5VTEw7IGRybV9icmlkZ2VfZW5hYmxlIGNoZWNrcyBmb3IgaXQg
Ki8KLQlkcm1fYnJpZGdlX2VuYWJsZShlbmNvZGVyLT5icmlkZ2UpOwotCiAJc3VuNGlfdGNvbl9j
aGFubmVsX2VuYWJsZSh0Y29uLCAwKTsKIAogCWlmICghSVNfRVJSKHRjb24tPnBhbmVsKSkKQEAg
LTE3Nyw5ICsxNzQsNiBAQCBzdGF0aWMgdm9pZCBzdW40aV9yZ2JfZW5jb2Rlcl9kaXNhYmxlKHN0
cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcikKIAogCXN1bjRpX3Rjb25fY2hhbm5lbF9kaXNhYmxl
KHRjb24sIDApOwogCi0JLyogZW5jb2Rlci0+YnJpZGdlIGNhbiBiZSBOVUxMOyBkcm1fYnJpZGdl
X2Rpc2FibGUgY2hlY2tzIGZvciBpdCAqLwotCWRybV9icmlkZ2VfZGlzYWJsZShlbmNvZGVyLT5i
cmlkZ2UpOwotCiAJaWYgKCFJU19FUlIodGNvbi0+cGFuZWwpKQogCQlkcm1fcGFuZWxfdW5wcmVw
YXJlKHRjb24tPnBhbmVsKTsKIH0KLS0gCmdpdC1zZXJpZXMgMC44LjEwCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
