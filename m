From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v5, 27/32] drm/mediatek: add connection from RDMA1 to DSI0
Date: Fri, 30 Aug 2019 14:25:29 +0800
Message-ID: <1567146329.5942.18.camel@mtksdaap41>
References: <1567090254-15566-1-git-send-email-yongqiang.niu@mediatek.com>
 <1567090254-15566-28-git-send-email-yongqiang.niu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1567090254-15566-28-git-send-email-yongqiang.niu@mediatek.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

SGksIFlvbmdxaWFuZzoKCk9uIFRodSwgMjAxOS0wOC0yOSBhdCAyMjo1MCArMDgwMCwgeW9uZ3Fp
YW5nLm5pdUBtZWRpYXRlay5jb20gd3JvdGU6Cj4gRnJvbTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3Fp
YW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gCj4gVGhpcyBwYXRjaCBhZGQgY29ubmVjdGlvbiBmcm9t
IFJETUExIHRvIERTSTAKClJldmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPgoK
PiAKPiBTaWduZWQtb2ZmLWJ5OiBZb25ncWlhbmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVr
LmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMgfCA0
ICsrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jCj4gaW5kZXggMDNhNDZlYy4uYWE2MTczYiAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYwo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jCj4gQEAgLTE3NSw2ICsxNzUsNyBA
QCBzdHJ1Y3QgbXRrX21tc3lzX3JlZ19kYXRhIHsKPiAgCXUzMiByZG1hMF9zb3V0X2NvbG9yMDsK
PiAgCXUzMiByZG1hMV9zb3V0X3NlbF9pbjsKPiAgCXUzMiByZG1hMV9zb3V0X2RwaTA7Cj4gKwl1
MzIgcmRtYTFfc291dF9kc2kwOwo+ICAJdTMyIGRwaTBfc2VsX2luOwo+ICAJdTMyIGRwaTBfc2Vs
X2luX3JkbWExOwo+ICAJdTMyIGRzaTBfc2VsX2luOwo+IEBAIC00MzMsNiArNDM0LDkgQEAgc3Rh
dGljIHVuc2lnbmVkIGludCBtdGtfZGRwX3NvdXRfc2VsKGNvbnN0IHN0cnVjdCBtdGtfbW1zeXNf
cmVnX2RhdGEgKmRhdGEsCj4gIAl9IGVsc2UgaWYgKGN1ciA9PSBERFBfQ09NUE9ORU5UX1JETUEw
ICYmIG5leHQgPT0gRERQX0NPTVBPTkVOVF9DT0xPUjApIHsKPiAgCQkqYWRkciA9IGRhdGEtPnJk
bWEwX3NvdXRfc2VsX2luOwo+ICAJCXZhbHVlID0gZGF0YS0+cmRtYTBfc291dF9jb2xvcjA7Cj4g
Kwl9IGVsc2UgaWYgKGN1ciA9PSBERFBfQ09NUE9ORU5UX1JETUExICYmIG5leHQgPT0gRERQX0NP
TVBPTkVOVF9EU0kwKSB7Cj4gKwkJKmFkZHIgPSBkYXRhLT5yZG1hMV9zb3V0X3NlbF9pbjsKPiAr
CQl2YWx1ZSA9IGRhdGEtPnJkbWExX3NvdXRfZHNpMDsKPiAgCX0gZWxzZSB7Cj4gIAkJdmFsdWUg
PSAwOwo+ICAJfQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
