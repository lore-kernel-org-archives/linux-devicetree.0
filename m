From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH 23/28] drm/mediatek: add DPI1 support for mutex
Date: Wed, 13 Jun 2018 15:22:28 +0800
Message-ID: <1528874548.30263.10.camel@mtksdaap41>
References: <1528687580-549-1-git-send-email-stu.hsieh@mediatek.com>
 <1528687580-549-24-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1528687580-549-24-git-send-email-stu.hsieh@mediatek.com>
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
b3RlOgo+IFRoaXMgcGF0Y2ggYWRkIHRoZSBEUEkxIHN1cHBvcnQgZm9yIG11dGV4Cj4gCj4gU2ln
bmVkLW9mZi1ieTogU3R1IEhzaWVoIDxzdHUuaHNpZWhAbWVkaWF0ZWsuY29tPgoKUmV2aWV3ZWQt
Ynk6IENLIEh1IDxjay5odSBhdCBtZWRpYXRlay5jb20+Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYyB8IDUgKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDUg
aW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RybV9kZHAuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jCj4g
aW5kZXggNWE4NTY5ZmE2NTA1Li41OTE2ZmMxMTY5M2EgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RybV9kZHAuYwo+IEBAIC03Niw2ICs3Niw3IEBACj4gICNkZWZpbmUgTVVURVhf
U09GX0RTSTAJCQkxCj4gICNkZWZpbmUgTVVURVhfU09GX0RTSTEJCQkyCj4gICNkZWZpbmUgTVVU
RVhfU09GX0RQSTAJCQkzCj4gKyNkZWZpbmUgTVVURVhfU09GX0RQSTEJCQk0Cj4gIAo+ICAjZGVm
aW5lIE9WTDBfTU9VVF9FTl9DT0xPUjAJCTB4MQo+ICAjZGVmaW5lIE9EX01PVVRfRU5fUkRNQTAJ
CTB4MQo+IEBAIC0zODUsNiArMzg2LDkgQEAgdm9pZCBtdGtfZGlzcF9tdXRleF9hZGRfY29tcChz
dHJ1Y3QgbXRrX2Rpc3BfbXV0ZXggKm11dGV4LAo+ICAJY2FzZSBERFBfQ09NUE9ORU5UX0RQSTA6
Cj4gIAkJcmVnID0gTVVURVhfU09GX0RQSTA7Cj4gIAkJYnJlYWs7Cj4gKwljYXNlIEREUF9DT01Q
T05FTlRfRFBJMToKPiArCQlyZWcgPSBNVVRFWF9TT0ZfRFBJMTsKPiArCQlicmVhazsKPiAgCWRl
ZmF1bHQ6Cj4gIAkJaWYgKGRkcC0+bXV0ZXhfbW9kW2lkXSA8IDMyKSB7Cj4gIAkJCW9mZnNldCA9
IERJU1BfUkVHX01VVEVYX01PRChtdXRleC0+aWQpOwo+IEBAIC00MTcsNiArNDIxLDcgQEAgdm9p
ZCBtdGtfZGlzcF9tdXRleF9yZW1vdmVfY29tcChzdHJ1Y3QgbXRrX2Rpc3BfbXV0ZXggKm11dGV4
LAo+ICAJY2FzZSBERFBfQ09NUE9ORU5UX0RTSTA6Cj4gIAljYXNlIEREUF9DT01QT05FTlRfRFNJ
MToKPiAgCWNhc2UgRERQX0NPTVBPTkVOVF9EUEkwOgo+ICsJY2FzZSBERFBfQ09NUE9ORU5UX0RQ
STE6Cj4gIAkJd3JpdGVsX3JlbGF4ZWQoTVVURVhfU09GX1NJTkdMRV9NT0RFLAo+ICAJCQkgICAg
ICAgZGRwLT5yZWdzICsgRElTUF9SRUdfTVVURVhfU09GKG11dGV4LT5pZCkpOwo+ICAJCWJyZWFr
OwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
