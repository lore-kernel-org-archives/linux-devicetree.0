From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v3 02/23] v4l: fwnode: Use fwnode_graph_for_each_endpoint
Date: Thu, 13 Sep 2018 00:29:21 +0300
Message-ID: <20180912212942.19641-3-sakari.ailus@linux.intel.com>
References: <20180912212942.19641-1-sakari.ailus@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180912212942.19641-1-sakari.ailus@linux.intel.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org, jacopo@jmondi.org, dri-devel@lists.freedesktop.org, slongerbeam@gmail.com, niklas.soderlund@ragnatech.se
List-Id: devicetree@vger.kernel.org

VXNlIGZ3bm9kZV9ncmFwaF9mb3JfZWFjaF9lbmRwb2ludCBpdGVyYXRvciBmb3IgYmV0dGVyIHJl
YWRhYmlsaXR5LgoKU2lnbmVkLW9mZi1ieTogU2FrYXJpIEFpbHVzIDxzYWthcmkuYWlsdXNAbGlu
dXguaW50ZWwuY29tPgpSZXZpZXdlZC1ieTogTmlrbGFzIFPDtmRlcmx1bmQgPG5pa2xhcy5zb2Rl
cmx1bmQrcmVuZXNhc0ByYWduYXRlY2guc2U+ClRlc3RlZC1ieTogU3RldmUgTG9uZ2VyYmVhbSA8
c3RldmVfbG9uZ2VyYmVhbUBtZW50b3IuY29tPgotLS0KIGRyaXZlcnMvbWVkaWEvdjRsMi1jb3Jl
L3Y0bDItZndub2RlLmMgfCAzICstLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3Y0bDIt
Zndub2RlLmMgYi9kcml2ZXJzL21lZGlhL3Y0bDItY29yZS92NGwyLWZ3bm9kZS5jCmluZGV4IGZj
OGM2M2ViYTEwYi4uYWI0NTdjZjM2YmE1IDEwMDY0NAotLS0gYS9kcml2ZXJzL21lZGlhL3Y0bDIt
Y29yZS92NGwyLWZ3bm9kZS5jCisrKyBiL2RyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3Y0bDItZndu
b2RlLmMKQEAgLTQ1Niw4ICs0NTYsNyBAQCBzdGF0aWMgaW50IF9fdjRsMl9hc3luY19ub3RpZmll
cl9wYXJzZV9md25vZGVfZW5kcG9pbnRzKAogCWlmIChXQVJOX09OKGFzZF9zdHJ1Y3Rfc2l6ZSA8
IHNpemVvZihzdHJ1Y3QgdjRsMl9hc3luY19zdWJkZXYpKSkKIAkJcmV0dXJuIC1FSU5WQUw7CiAK
LQlmb3IgKGZ3bm9kZSA9IE5VTEw7IChmd25vZGUgPSBmd25vZGVfZ3JhcGhfZ2V0X25leHRfZW5k
cG9pbnQoCi0JCQkJICAgICBkZXZfZndub2RlKGRldiksIGZ3bm9kZSkpOyApIHsKKwlmd25vZGVf
Z3JhcGhfZm9yX2VhY2hfZW5kcG9pbnQoZGV2X2Z3bm9kZShkZXYpLCBmd25vZGUpIHsKIAkJc3Ry
dWN0IGZ3bm9kZV9oYW5kbGUgKmRldl9md25vZGU7CiAJCWJvb2wgaXNfYXZhaWxhYmxlOwogCi0t
IAoyLjExLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
