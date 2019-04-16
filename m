From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v2 24/25] drm/mediatek: respect page offset for PRIME
 mmap calls
Date: Tue, 16 Apr 2019 16:33:54 +0800
Message-ID: <1555403634.11519.11.camel@mtksdaap41>
References: <1553667561-25447-1-git-send-email-yongqiang.niu@mediatek.com>
 <1553667561-25447-25-git-send-email-yongqiang.niu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1553667561-25447-25-git-send-email-yongqiang.niu@mediatek.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: yongqiang.niu@mediatek.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

SGksIFlvbmdxaWFuZzoKCk9uIFdlZCwgMjAxOS0wMy0yNyBhdCAxNDoxOSArMDgwMCwgeW9uZ3Fp
YW5nLm5pdUBtZWRpYXRlay5jb20gd3JvdGU6Cj4gRnJvbTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3Fp
YW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gCj4gUmVzcGVjdCBwYWdlIG9mZnNldCBmb3IgUFJJTUUg
bW1hcCBjYWxscwoKUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+Cgo+IAo+
IFNpZ25lZC1vZmYtYnk6IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
Pgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9nZW0uYyB8IDcgKysr
KysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2dlbS5jIGIv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZ2VtLmMKPiBpbmRleCBjMjMwMjM3Li41
MjRlNDk0IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2dl
bS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZ2VtLmMKPiBAQCAt
MTQ0LDcgKzE0NCw2IEBAIHN0YXRpYyBpbnQgbXRrX2RybV9nZW1fb2JqZWN0X21tYXAoc3RydWN0
IGRybV9nZW1fb2JqZWN0ICpvYmosCj4gIAkgKiBWTV9QRk5NQVAgZmxhZyB0aGF0IHdhcyBzZXQg
YnkgZHJtX2dlbV9tbWFwX29iaigpL2RybV9nZW1fbW1hcCgpLgo+ICAJICovCj4gIAl2bWEtPnZt
X2ZsYWdzICY9IH5WTV9QRk5NQVA7Cj4gLQl2bWEtPnZtX3Bnb2ZmID0gMDsKPiAgCj4gIAlyZXQg
PSBkbWFfbW1hcF9hdHRycyhwcml2LT5kbWFfZGV2LCB2bWEsIG10a19nZW0tPmNvb2tpZSwKPiAg
CQkJICAgICBtdGtfZ2VtLT5kbWFfYWRkciwgb2JqLT5zaXplLCBtdGtfZ2VtLT5kbWFfYXR0cnMp
Owo+IEBAIC0xODMsNiArMTgyLDEyIEBAIGludCBtdGtfZHJtX2dlbV9tbWFwKHN0cnVjdCBmaWxl
ICpmaWxwLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKPiAgCj4gIAlvYmogPSB2bWEtPnZt
X3ByaXZhdGVfZGF0YTsKPiAgCj4gKwkvKgo+ICsJICogU2V0IHZtX3Bnb2ZmICh1c2VkIGFzIGEg
ZmFrZSBidWZmZXIgb2Zmc2V0IGJ5IERSTSkgdG8gMCBhbmQgbWFwIHRoZQo+ICsJICogd2hvbGUg
YnVmZmVyIGZyb20gdGhlIHN0YXJ0Lgo+ICsJICovCj4gKwl2bWEtPnZtX3Bnb2ZmID0gMDsKPiAr
Cj4gIAlyZXR1cm4gbXRrX2RybV9nZW1fb2JqZWN0X21tYXAob2JqLCB2bWEpOwo+ICB9Cj4gIAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
