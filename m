From: YT Shen <yt.shen@mediatek.com>
Subject: [PATCH v12 10/12] drm/mediatek: add non-continuous clock mode and EOT
 packet control
Date: Mon, 23 Jan 2017 19:05:23 +0800
Message-ID: <1485169525-22163-11-git-send-email-yt.shen@mediatek.com>
References: <1485169525-22163-1-git-send-email-yt.shen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1485169525-22163-1-git-send-email-yt.shen@mediatek.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org, Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, srv_heupstream@mediatek.com, emil.l.velikov@gmail.com, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com, shaoming chen <shaoming.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

VGhpcyBwYXRjaCB3aWxsIHVwZGF0ZSBkc2kgY2xvY2sgY29udHJvbCBtZXRob2QuCjEuIGRzaSBu
b24tY29udGludWUgY2xvY2sgbW9kZSB3aWxsIGVuaGFuY2UgYW50aXN0YXRpYyBlZmZlY3QgZm9y
IHBhbmVsCjIuIEVPVCBwYWNrZXQgY29udHJvbCB3aWxsIGp1ZGdlIHdoZXRoZXIgZHNpIHNlbmQg
ZW5kIG9mIHBhY2tldCBvciBub3QKYnkgY3VzdG9taXplCgpTaWduZWQtb2ZmLWJ5OiBzaGFvbWlu
ZyBjaGVuIDxzaGFvbWluZy5jaGVuQG1lZGlhdGVrLmNvbT4KU2lnbmVkLW9mZi1ieTogWVQgU2hl
biA8eXQuc2hlbkBtZWRpYXRlay5jb20+CkFja2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgfCAzICsrKwogMSBm
aWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5j
CmluZGV4IGIzYzdmZDguLjg1ZjIyZDIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHNpLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwpA
QCAtNDMxLDYgKzQzMSw5IEBAIHN0YXRpYyB2b2lkIG10a19kc2lfcnh0eF9jb250cm9sKHN0cnVj
dCBtdGtfZHNpICpkc2kpCiAJCWJyZWFrOwogCX0KIAorCXRtcF9yZWcgfD0gKGRzaS0+bW9kZV9m
bGFncyAmIE1JUElfRFNJX0NMT0NLX05PTl9DT05USU5VT1VTKSA8PCA2OworCXRtcF9yZWcgfD0g
KGRzaS0+bW9kZV9mbGFncyAmIE1JUElfRFNJX01PREVfRU9UX1BBQ0tFVCkgPj4gMzsKKwogCXdy
aXRlbCh0bXBfcmVnLCBkc2ktPnJlZ3MgKyBEU0lfVFhSWF9DVFJMKTsKIH0KIAotLSAKMS45LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
