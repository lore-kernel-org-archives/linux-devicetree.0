From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v3 3/8] drm/mediatek: add connection from OD1 to RDMA1
Date: Fri, 25 May 2018 11:26:16 +0800
Message-ID: <1527218776.27165.5.camel@mtksdaap41>
References: <1527215665-11937-1-git-send-email-stu.hsieh@mediatek.com>
 <1527215665-11937-4-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1527215665-11937-4-git-send-email-stu.hsieh@mediatek.com>
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
b20+Cj4gCj4gVGhpcyBwYXRjaCBhZGQgdGhlIGNvbm5lY3Rpb24gZnJvbSBPRDEgdG8gUkRNQTEg
Zm9yIGV4dCBwYXRoLgo+IAoKUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+
Cgo+IFNpZ25lZC1vZmYtYnk6IFN0dSBIc2llaCA8c3R1LmhzaWVoQG1lZGlhdGVrLmNvbT4KPiAt
LS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMgfCAzICsrKwo+ICAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kcm1fZGRwLmMKPiBpbmRleCA0N2ZmYTI0MGJkMjUuLjBmNTY4ZGQ4NTNkOCAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYwo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jCj4gQEAgLTE1MSw2ICsxNTEsOSBA
QCBzdGF0aWMgdW5zaWduZWQgaW50IG10a19kZHBfbW91dF9lbihlbnVtIG10a19kZHBfY29tcF9p
ZCBjdXIsCj4gIAl9IGVsc2UgaWYgKGN1ciA9PSBERFBfQ09NUE9ORU5UX0dBTU1BICYmIG5leHQg
PT0gRERQX0NPTVBPTkVOVF9SRE1BMSkgewo+ICAJCSphZGRyID0gRElTUF9SRUdfQ09ORklHX0RJ
U1BfR0FNTUFfTU9VVF9FTjsKPiAgCQl2YWx1ZSA9IEdBTU1BX01PVVRfRU5fUkRNQTE7Cj4gKwl9
IGVsc2UgaWYgKGN1ciA9PSBERFBfQ09NUE9ORU5UX09EMSAmJiBuZXh0ID09IEREUF9DT01QT05F
TlRfUkRNQTEpIHsKPiArCQkqYWRkciA9IERJU1BfUkVHX0NPTkZJR19ESVNQX09EX01PVVRfRU47
Cj4gKwkJdmFsdWUgPSBPRDFfTU9VVF9FTl9SRE1BMTsKPiAgCX0gZWxzZSBpZiAoY3VyID09IERE
UF9DT01QT05FTlRfUkRNQTEgJiYgbmV4dCA9PSBERFBfQ09NUE9ORU5UX0RQSTApIHsKPiAgCQkq
YWRkciA9IERJU1BfUkVHX0NPTkZJR19ESVNQX1JETUExX01PVVRfRU47Cj4gIAkJdmFsdWUgPSBS
RE1BMV9NT1VUX0RQSTA7CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
