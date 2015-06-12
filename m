From: Hyungwon Hwang <human.hwang@samsung.com>
Subject: Re: [PATCH 1/2] drm/exynos: ipp: fix wrong index referencing a config
 element
Date: Fri, 12 Jun 2015 22:02:17 +0900
Message-ID: <20150612220217.481d938e@hwh-ubuntu>
References: <1434113958-15877-1-git-send-email-human.hwang@samsung.com>
 <1434113958-15877-17-git-send-email-human.hwang@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1434113958-15877-17-git-send-email-human.hwang@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Hyungwon Hwang <human.hwang@samsung.com>
Cc: devicetree@vger.kernel.org, sw0312.kim@samsung.com, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

UGxlYXNlIGlnbm9yZSB0aGlzIG1haWwuIEkgZGlkbid0IGtub3cgdGhhdCAiZ2l0IHNlbmQgKiIg
aW5jbHVkZXMgYWxsCmZpbGVzIGluIHRoZSBzdWJkaXJlY3Rvcmllcy4gSSBhbSB2ZXJ5IHNvcnJ5
IGZvciBkaXN0dXJiaW5nIHlvdS4KCkJlc3QgcmVnYXJkcywKSHl1bmd3b24gSHdhbmcKCk9uIEZy
aSwgMTIgSnVuIDIwMTUgMjE6NTk6MTEgKzA5MDAKSHl1bmd3b24gSHdhbmcgPGh1bWFuLmh3YW5n
QHNhbXN1bmcuY29tPiB3cm90ZToKCj4gQ29uZmlnIGRlcGVuZHMgb24gdGhlIG9wcmVhdGlvbi4g
U28gaXQgbXVzdCBiZSByZWZlcmVuY2VkIGJ5IGFuCj4gb3BlcmF0aW9uIGlkLCBub3QgYSBwcm9w
ZXJ0eSBpZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBIeXVuZ3dvbiBId2FuZyA8aHVtYW4uaHdhbmdA
c2Ftc3VuZy5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9p
cHAuYyB8IDMgKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlv
bnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJt
X2lwcC5jCj4gYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1faXBwLmMgaW5kZXgg
YjdmMWNiYy4uNTRjNWNmNAo+IDEwMDY0NCAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4
eW5vc19kcm1faXBwLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1f
aXBwLmMKPiBAQCAtNDg2LDggKzQ4Niw3IEBAIHN0YXRpYyBpbnQgaXBwX3ZhbGlkYXRlX21lbV9u
b2RlKHN0cnVjdAo+IGRybV9kZXZpY2UgKmRybV9kZXYsIHVuc2lnbmVkIGludCBicHA7Cj4gIAlp
bnQgaTsKPiAgCj4gLQkvKiBUaGUgcHJvcGVydHkgaWQgc2hvdWxkIGFscmVhZHkgYmUgdmFyaWZp
ZWQgKi8KPiAtCWlwcF9jZmcgPSAmY19ub2RlLT5wcm9wZXJ0eS5jb25maWdbbV9ub2RlLT5wcm9w
X2lkXTsKPiArCWlwcF9jZmcgPSAmY19ub2RlLT5wcm9wZXJ0eS5jb25maWdbbV9ub2RlLT5vcHNf
aWRdOwo+ICAJbnVtX3BsYW5lID0gZHJtX2Zvcm1hdF9udW1fcGxhbmVzKGlwcF9jZmctPmZtdCk7
Cj4gIAo+ICAJLyoqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
