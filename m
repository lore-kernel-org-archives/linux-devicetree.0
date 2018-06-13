From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH 25/28] drm/mediatek: add DSI3 support for mutex
Date: Wed, 13 Jun 2018 15:22:58 +0800
Message-ID: <1528874578.30263.12.camel@mtksdaap41>
References: <1528687580-549-1-git-send-email-stu.hsieh@mediatek.com>
 <1528687580-549-26-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1528687580-549-26-git-send-email-stu.hsieh@mediatek.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Stu Hsieh <stu.hsieh@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

SGksIFN0dToKCk9uIE1vbiwgMjAxOC0wNi0xMSBhdCAxMToyNiArMDgwMCwgU3R1IEhzaWVoIHdy
b3RlOgo+IFRoaXMgcGF0Y2ggYWRkIHRoZSBEU0kzIHN1cHBvcnQgZm9yIG11dGV4Cj4gCj4gU2ln
bmVkLW9mZi1ieTogU3R1IEhzaWVoIDxzdHUuaHNpZWhAbWVkaWF0ZWsuY29tPgoKUmV2aWV3ZWQt
Ynk6IENLIEh1IDxjay5odSBhdCBtZWRpYXRlay5jb20+Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYyB8IDUgKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDUg
aW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RybV9kZHAuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jCj4g
aW5kZXggMWU3ZTM4NzJlY2NjLi4yOGRkODUzMWE3ZGUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RybV9kZHAuYwo+IEBAIC03OCw2ICs3OCw3IEBACj4gICNkZWZpbmUgTVVURVhf
U09GX0RQSTAJCQkzCj4gICNkZWZpbmUgTVVURVhfU09GX0RQSTEJCQk0Cj4gICNkZWZpbmUgTVVU
RVhfU09GX0RTSTIJCQk1Cj4gKyNkZWZpbmUgTVVURVhfU09GX0RTSTMJCQk2Cj4gIAo+ICAjZGVm
aW5lIE9WTDBfTU9VVF9FTl9DT0xPUjAJCTB4MQo+ICAjZGVmaW5lIE9EX01PVVRfRU5fUkRNQTAJ
CTB4MQo+IEBAIC0zODcsNiArMzg4LDkgQEAgdm9pZCBtdGtfZGlzcF9tdXRleF9hZGRfY29tcChz
dHJ1Y3QgbXRrX2Rpc3BfbXV0ZXggKm11dGV4LAo+ICAJY2FzZSBERFBfQ09NUE9ORU5UX0RTSTI6
Cj4gIAkJcmVnID0gTVVURVhfU09GX0RTSTI7Cj4gIAkJYnJlYWs7Cj4gKwljYXNlIEREUF9DT01Q
T05FTlRfRFNJMzoKPiArCQlyZWcgPSBNVVRFWF9TT0ZfRFNJMzsKPiArCQlicmVhazsKPiAgCWNh
c2UgRERQX0NPTVBPTkVOVF9EUEkwOgo+ICAJCXJlZyA9IE1VVEVYX1NPRl9EUEkwOwo+ICAJCWJy
ZWFrOwo+IEBAIC00MjUsNiArNDI5LDcgQEAgdm9pZCBtdGtfZGlzcF9tdXRleF9yZW1vdmVfY29t
cChzdHJ1Y3QgbXRrX2Rpc3BfbXV0ZXggKm11dGV4LAo+ICAJY2FzZSBERFBfQ09NUE9ORU5UX0RT
STA6Cj4gIAljYXNlIEREUF9DT01QT05FTlRfRFNJMToKPiAgCWNhc2UgRERQX0NPTVBPTkVOVF9E
U0kyOgo+ICsJY2FzZSBERFBfQ09NUE9ORU5UX0RTSTM6Cj4gIAljYXNlIEREUF9DT01QT05FTlRf
RFBJMDoKPiAgCWNhc2UgRERQX0NPTVBPTkVOVF9EUEkxOgo+ICAJCXdyaXRlbF9yZWxheGVkKE1V
VEVYX1NPRl9TSU5HTEVfTU9ERSwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
