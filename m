From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v3 03/23] v4l: fwnode: The CSI-2 clock is continuous if it's
 not non-continuous
Date: Thu, 13 Sep 2018 00:29:22 +0300
Message-ID: <20180912212942.19641-4-sakari.ailus@linux.intel.com>
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

VGhlIGNvbnRpbnVvdXMgY2xvY2sgZmxhZyB3YXMgb25seSBzZXQgaWYgdGhlcmUgd2FzIGEgY2xv
Y2sgb3IgZGF0YSBsYW5lcy4KVGhpcyBpc24ndCBuZWVkZWQgYXMgc3VjaCBhIGNvbmZpZ3VyYXRp
b24gaXMgaW52YWxpZCB0byBiZWdpbiB3aXRoLiBBbHdheXMKc2V0IHRoZSBjb250aW51b3VzIGNs
b2NrIGZsYWcgaWYgdGhlIG5vbi1jb250aW51b3VzIHByb3BlcnR5IGlzIG5vdCBmb3VuZC4KClNp
Z25lZC1vZmYtYnk6IFNha2FyaSBBaWx1cyA8c2FrYXJpLmFpbHVzQGxpbnV4LmludGVsLmNvbT4K
VGVzdGVkLWJ5OiBTdGV2ZSBMb25nZXJiZWFtIDxzdGV2ZV9sb25nZXJiZWFtQG1lbnRvci5jb20+
Ci0tLQogZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdjRsMi1md25vZGUuYyB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbWVkaWEvdjRsMi1jb3JlL3Y0bDItZndub2RlLmMgYi9kcml2ZXJzL21lZGlhL3Y0bDIt
Y29yZS92NGwyLWZ3bm9kZS5jCmluZGV4IGFiNDU3Y2YzNmJhNS4uY2Y5MGRkYjVjNDMwIDEwMDY0
NAotLS0gYS9kcml2ZXJzL21lZGlhL3Y0bDItY29yZS92NGwyLWZ3bm9kZS5jCisrKyBiL2RyaXZl
cnMvbWVkaWEvdjRsMi1jb3JlL3Y0bDItZndub2RlLmMKQEAgLTEwNyw3ICsxMDcsNyBAQCBzdGF0
aWMgaW50IHY0bDJfZndub2RlX2VuZHBvaW50X3BhcnNlX2NzaTJfYnVzKHN0cnVjdCBmd25vZGVf
aGFuZGxlICpmd25vZGUsCiAJaWYgKGZ3bm9kZV9wcm9wZXJ0eV9wcmVzZW50KGZ3bm9kZSwgImNs
b2NrLW5vbmNvbnRpbnVvdXMiKSkgewogCQlmbGFncyB8PSBWNEwyX01CVVNfQ1NJMl9OT05DT05U
SU5VT1VTX0NMT0NLOwogCQlwcl9kZWJ1Zygibm9uLWNvbnRpbnVvdXMgY2xvY2tcbiIpOwotCX0g
ZWxzZSBpZiAoaGF2ZV9jbGtfbGFuZSB8fCBidXMtPm51bV9kYXRhX2xhbmVzID4gMCkgeworCX0g
ZWxzZSB7CiAJCWZsYWdzIHw9IFY0TDJfTUJVU19DU0kyX0NPTlRJTlVPVVNfQ0xPQ0s7CiAJfQog
Ci0tIAoyLjExLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
