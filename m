From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v4 7/9] drm/mediatek: add connection from OD1 to RDMA1
Date: Mon, 28 May 2018 15:13:29 +0800
Message-ID: <1527491609.24367.7.camel@mtksdaap41>
References: <1527489507-24453-1-git-send-email-stu.hsieh@mediatek.com>
 <1527489507-24453-8-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1527489507-24453-8-git-send-email-stu.hsieh@mediatek.com>
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

SGksIFN0dToKCk9uIE1vbiwgMjAxOC0wNS0yOCBhdCAxNDozOCArMDgwMCwgU3R1IEhzaWVoIHdy
b3RlOgo+IFRoaXMgcGF0Y2ggYWRkIHRoZSBjb25uZWN0aW9uIGZyb20gT0QxIHRvIFJETUExIGZv
ciBleHQgcGF0aC4KPiAKClJldmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPgoK
PiBTaWduZWQtb2ZmLWJ5OiBTdHUgSHNpZWggPHN0dS5oc2llaEBtZWRpYXRlay5jb20+Cj4gLS0t
Cj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jIHwgNCArKysrCj4gIDEg
ZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RybV9kZHAuYwo+IGluZGV4IDU4ZTQ0MzQ5ZTMxNS4uOGJmYzBkZWJkMmMyIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMKPiBAQCAtNzUsNiArNzUsNyBAQAo+
ICAKPiAgI2RlZmluZSBPVkwwX01PVVRfRU5fQ09MT1IwCQkweDEKPiAgI2RlZmluZSBPRF9NT1VU
X0VOX1JETUEwCQkweDEKPiArI2RlZmluZSBPRDFfTU9VVF9FTl9SRE1BMQkJQklUKDE2KQo+ICAj
ZGVmaW5lIFVGT0VfTU9VVF9FTl9EU0kwCQkweDEKPiAgI2RlZmluZSBDT0xPUjBfU0VMX0lOX09W
TDAJCTB4MQo+ICAjZGVmaW5lIE9WTDFfTU9VVF9FTl9DT0xPUjEJCTB4MQo+IEBAIC0xNTEsNiAr
MTUyLDkgQEAgc3RhdGljIHVuc2lnbmVkIGludCBtdGtfZGRwX21vdXRfZW4oZW51bSBtdGtfZGRw
X2NvbXBfaWQgY3VyLAo+ICAJfSBlbHNlIGlmIChjdXIgPT0gRERQX0NPTVBPTkVOVF9HQU1NQSAm
JiBuZXh0ID09IEREUF9DT01QT05FTlRfUkRNQTEpIHsKPiAgCQkqYWRkciA9IERJU1BfUkVHX0NP
TkZJR19ESVNQX0dBTU1BX01PVVRfRU47Cj4gIAkJdmFsdWUgPSBHQU1NQV9NT1VUX0VOX1JETUEx
Owo+ICsJfSBlbHNlIGlmIChjdXIgPT0gRERQX0NPTVBPTkVOVF9PRDEgJiYgbmV4dCA9PSBERFBf
Q09NUE9ORU5UX1JETUExKSB7Cj4gKwkJKmFkZHIgPSBESVNQX1JFR19DT05GSUdfRElTUF9PRF9N
T1VUX0VOOwo+ICsJCXZhbHVlID0gT0QxX01PVVRfRU5fUkRNQTE7Cj4gIAl9IGVsc2UgaWYgKGN1
ciA9PSBERFBfQ09NUE9ORU5UX1JETUExICYmIG5leHQgPT0gRERQX0NPTVBPTkVOVF9EUEkwKSB7
Cj4gIAkJKmFkZHIgPSBESVNQX1JFR19DT05GSUdfRElTUF9SRE1BMV9NT1VUX0VOOwo+ICAJCXZh
bHVlID0gUkRNQTFfTU9VVF9EUEkwOwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
