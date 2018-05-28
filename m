From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v4 5/9] drm/mediatek: add ddp component PWM1
Date: Mon, 28 May 2018 15:08:52 +0800
Message-ID: <1527491332.24367.4.camel@mtksdaap41>
References: <1527489507-24453-1-git-send-email-stu.hsieh@mediatek.com>
 <1527489507-24453-6-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1527489507-24453-6-git-send-email-stu.hsieh@mediatek.com>
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
b3RlOgo+IFRoaXMgcGF0Y2ggYWRkIGNvbXBvbmVudCBQV00xIGluIG10a19kZHBfbWF0Y2hlcwo+
IAoKUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+Cgo+IFNpZ25lZC1vZmYt
Ynk6IFN0dSBIc2llaCA8c3R1LmhzaWVoQG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYyB8IDEgKwo+ICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kcm1fZGRwX2NvbXAuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJt
X2RkcF9jb21wLmMKPiBpbmRleCA4N2FjZjZiZTg3ZjYuLmE1YzdhYzJkMTYyZCAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYwo+IEBAIC0yMzIsNiAr
MjMyLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZGRwX2NvbXBfbWF0Y2ggbXRrX2RkcF9t
YXRjaGVzW0REUF9DT01QT05FTlRfSURfTUFYXSA9IHsKPiAgCVtERFBfQ09NUE9ORU5UX09WTDBd
CT0geyBNVEtfRElTUF9PVkwsCTAsIE5VTEwgfSwKPiAgCVtERFBfQ09NUE9ORU5UX09WTDFdCT0g
eyBNVEtfRElTUF9PVkwsCTEsIE5VTEwgfSwKPiAgCVtERFBfQ09NUE9ORU5UX1BXTTBdCT0geyBN
VEtfRElTUF9QV00sCTAsIE5VTEwgfSwKPiArCVtERFBfQ09NUE9ORU5UX1BXTTFdCT0geyBNVEtf
RElTUF9QV00sCTEsIE5VTEwgfSwKPiAgCVtERFBfQ09NUE9ORU5UX1JETUEwXQk9IHsgTVRLX0RJ
U1BfUkRNQSwJMCwgTlVMTCB9LAo+ICAJW0REUF9DT01QT05FTlRfUkRNQTFdCT0geyBNVEtfRElT
UF9SRE1BLAkxLCBOVUxMIH0sCj4gIAlbRERQX0NPTVBPTkVOVF9SRE1BMl0JPSB7IE1US19ESVNQ
X1JETUEsCTIsIE5VTEwgfSwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
