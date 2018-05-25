From: <stu.hsieh@mediatek.com>
Subject: [PATCH v3 5/8] drm/mediatek: add ddp component OD1
Date: Fri, 25 May 2018 10:34:22 +0800
Message-ID: <1527215665-11937-6-git-send-email-stu.hsieh@mediatek.com>
References: <1527215665-11937-1-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1527215665-11937-1-git-send-email-stu.hsieh@mediatek.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Stu Hsieh <stu.hsieh@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

RnJvbTogU3R1IEhzaWVoIDxzdHUuaHNpZWhAbWVkaWF0ZWsuY29tPgoKVGhpcyBwYXRjaCBhZGQg
dGhlIGNvbXBvbmVudCBPRDEgYW5kCnJlbmFtZSB0aGUgT0QgdG8gT0QxCgpTaWduZWQtb2ZmLWJ5
OiBTdHUgSHNpZWggPHN0dS5oc2llaEBtZWRpYXRlay5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuaCB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuaCBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZHJtX2RkcF9jb21wLmgKaW5kZXggZWVlM2MwY2MyNjMyLi45YjE5ZmM0NDIzZjEgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmgKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuaApAQCAtNTAsNyArNTAs
OCBAQCBlbnVtIG10a19kZHBfY29tcF9pZCB7CiAJRERQX0NPTVBPTkVOVF9EU0kwLAogCUREUF9D
T01QT05FTlRfRFNJMSwKIAlERFBfQ09NUE9ORU5UX0dBTU1BLAotCUREUF9DT01QT05FTlRfT0Qs
CisJRERQX0NPTVBPTkVOVF9PRDAsCisJRERQX0NPTVBPTkVOVF9PRDEsCiAJRERQX0NPTVBPTkVO
VF9PVkwwLAogCUREUF9DT01QT05FTlRfT1ZMMSwKIAlERFBfQ09NUE9ORU5UX1BXTTAsCi0tIAoy
LjEyLjUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
