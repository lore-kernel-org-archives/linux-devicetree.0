From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v3 4/8] drm/mediatek: add ddp component AAL1
Date: Fri, 25 May 2018 12:23:58 +0800
Message-ID: <1527222238.27165.12.camel@mtksdaap41>
References: <1527215665-11937-1-git-send-email-stu.hsieh@mediatek.com>
 <1527215665-11937-5-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1527215665-11937-5-git-send-email-stu.hsieh@mediatek.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: stu.hsieh@mediatek.com
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

SGksIFN0dToKCk9uIEZyaSwgMjAxOC0wNS0yNSBhdCAxMDozNCArMDgwMCwgc3R1LmhzaWVoQG1l
ZGlhdGVrLmNvbSB3cm90ZToKPiBGcm9tOiBTdHUgSHNpZWggPHN0dS5oc2llaEBtZWRpYXRlay5j
b20+Cj4gCj4gVGhpcyBwYXRjaCBhZGQgY29tcG9uZW50IEFBTDEgYW5kCj4gcmVuYW1lIEFBTCB0
byBBQUwwCj4gCj4gU2lnbmVkLW9mZi1ieTogU3R1IEhzaWVoIDxzdHUuaHNpZWhAbWVkaWF0ZWsu
Y29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5o
IHwgMyArKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBf
Y29tcC5oIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuaAo+IGlu
ZGV4IDA4MjhjZjhiZjg1Yy4uZWVlM2MwY2MyNjMyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5oCj4gQEAgLTQxLDcgKzQxLDggQEAgZW51bSBtdGtf
ZGRwX2NvbXBfdHlwZSB7Cj4gIH07Cj4gIAo+ICBlbnVtIG10a19kZHBfY29tcF9pZCB7Cj4gLQlE
RFBfQ09NUE9ORU5UX0FBTCwKPiArCUREUF9DT01QT05FTlRfQUFMMCwKPiArCUREUF9DT01QT05F
TlRfQUFMMSwKCkJlIHN1cmUgY29tcGlsaW5nIGlzIHN1Y2Nlc3Mgd2hlbiB5b3UgYXBwbHkgZWFj
aCBwYXRjaCBvZiBhIHNlcmllcy4gSQp0aGluayB3aGVuIHlvdSBhcHBseSB0byB0aGlzIHBhdGNo
LCBpdCB3b3VsZCBjYXVzZSBjb21waWxpbmcgZXJyb3IKYmVjYXVzZSBzb21lIHJlbGF0ZWQgbW9k
aWZpY2F0aW9uIGlzIGluIHRoZSBwYXRjaCAnQWRkIHN1cHBvcnQgZm9yCm1lZGlhdGVrIFNPQyBN
VDI3MTInLiBTbyBtb3ZlIHRoZSBtb2RpZmljYXRpb24gZnJvbSB0aGF0IHBhdGNoIHRvIHRoaXMK
cGF0Y2guCgpSZWdhcmRzLApDSwoKPiAgCUREUF9DT01QT05FTlRfQkxTLAo+ICAJRERQX0NPTVBP
TkVOVF9DT0xPUjAsCj4gIAlERFBfQ09NUE9ORU5UX0NPTE9SMSwKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
