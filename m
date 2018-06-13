From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH 24/28] drm/mediatek: add DSI2 support for mutex
Date: Wed, 13 Jun 2018 15:22:43 +0800
Message-ID: <1528874563.30263.11.camel@mtksdaap41>
References: <1528687580-549-1-git-send-email-stu.hsieh@mediatek.com>
 <1528687580-549-25-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1528687580-549-25-git-send-email-stu.hsieh@mediatek.com>
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
b3RlOgo+IFRoaXMgcGF0Y2ggYWRkIHRoZSBEU0kyIHN1cHBvcnQgZm9yIG11dGV4Cj4gCj4gU2ln
bmVkLW9mZi1ieTogU3R1IEhzaWVoIDxzdHUuaHNpZWhAbWVkaWF0ZWsuY29tPgoKUmV2aWV3ZWQt
Ynk6IENLIEh1IDxjay5odSBhdCBtZWRpYXRlay5jb20+Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYyB8IDUgKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDUg
aW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RybV9kZHAuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jCj4g
aW5kZXggNTkxNmZjMTE2OTNhLi4xZTdlMzg3MmVjY2MgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RybV9kZHAuYwo+IEBAIC03Nyw2ICs3Nyw3IEBACj4gICNkZWZpbmUgTVVURVhf
U09GX0RTSTEJCQkyCj4gICNkZWZpbmUgTVVURVhfU09GX0RQSTAJCQkzCj4gICNkZWZpbmUgTVVU
RVhfU09GX0RQSTEJCQk0Cj4gKyNkZWZpbmUgTVVURVhfU09GX0RTSTIJCQk1Cj4gIAo+ICAjZGVm
aW5lIE9WTDBfTU9VVF9FTl9DT0xPUjAJCTB4MQo+ICAjZGVmaW5lIE9EX01PVVRfRU5fUkRNQTAJ
CTB4MQo+IEBAIC0zODMsNiArMzg0LDkgQEAgdm9pZCBtdGtfZGlzcF9tdXRleF9hZGRfY29tcChz
dHJ1Y3QgbXRrX2Rpc3BfbXV0ZXggKm11dGV4LAo+ICAJY2FzZSBERFBfQ09NUE9ORU5UX0RTSTE6
Cj4gIAkJcmVnID0gTVVURVhfU09GX0RTSTA7Cj4gIAkJYnJlYWs7Cj4gKwljYXNlIEREUF9DT01Q
T05FTlRfRFNJMjoKPiArCQlyZWcgPSBNVVRFWF9TT0ZfRFNJMjsKPiArCQlicmVhazsKPiAgCWNh
c2UgRERQX0NPTVBPTkVOVF9EUEkwOgo+ICAJCXJlZyA9IE1VVEVYX1NPRl9EUEkwOwo+ICAJCWJy
ZWFrOwo+IEBAIC00MjAsNiArNDI0LDcgQEAgdm9pZCBtdGtfZGlzcF9tdXRleF9yZW1vdmVfY29t
cChzdHJ1Y3QgbXRrX2Rpc3BfbXV0ZXggKm11dGV4LAo+ICAJc3dpdGNoIChpZCkgewo+ICAJY2Fz
ZSBERFBfQ09NUE9ORU5UX0RTSTA6Cj4gIAljYXNlIEREUF9DT01QT05FTlRfRFNJMToKPiArCWNh
c2UgRERQX0NPTVBPTkVOVF9EU0kyOgo+ICAJY2FzZSBERFBfQ09NUE9ORU5UX0RQSTA6Cj4gIAlj
YXNlIEREUF9DT01QT05FTlRfRFBJMToKPiAgCQl3cml0ZWxfcmVsYXhlZChNVVRFWF9TT0ZfU0lO
R0xFX01PREUsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
