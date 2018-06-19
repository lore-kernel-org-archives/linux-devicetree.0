From: Stu Hsieh <stu.hsieh@mediatek.com>
Subject: [PATCH v6 05/29] drm/mediatek: add ddp component PWM1
Date: Tue, 19 Jun 2018 15:34:06 +0800
Message-ID: <1529393670-26862-6-git-send-email-stu.hsieh@mediatek.com>
References: <1529393670-26862-1-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1529393670-26862-1-git-send-email-stu.hsieh@mediatek.com>
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

VGhpcyBwYXRjaCBhZGQgY29tcG9uZW50IFBXTTEgaW4gbXRrX2RkcF9tYXRjaGVzCgpTaWduZWQt
b2ZmLWJ5OiBTdHUgSHNpZWggPHN0dS5oc2llaEBtZWRpYXRlay5jb20+ClJldmlld2VkLWJ5OiBD
SyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZHJtX2RkcF9jb21wLmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jCmluZGV4IDg3YWNm
NmJlODdmNi4uYTVjN2FjMmQxNjJkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RybV9kZHBfY29tcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHJtX2RkcF9jb21wLmMKQEAgLTIzMiw2ICsyMzIsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG10
a19kZHBfY29tcF9tYXRjaCBtdGtfZGRwX21hdGNoZXNbRERQX0NPTVBPTkVOVF9JRF9NQVhdID0g
ewogCVtERFBfQ09NUE9ORU5UX09WTDBdCT0geyBNVEtfRElTUF9PVkwsCTAsIE5VTEwgfSwKIAlb
RERQX0NPTVBPTkVOVF9PVkwxXQk9IHsgTVRLX0RJU1BfT1ZMLAkxLCBOVUxMIH0sCiAJW0REUF9D
T01QT05FTlRfUFdNMF0JPSB7IE1US19ESVNQX1BXTSwJMCwgTlVMTCB9LAorCVtERFBfQ09NUE9O
RU5UX1BXTTFdCT0geyBNVEtfRElTUF9QV00sCTEsIE5VTEwgfSwKIAlbRERQX0NPTVBPTkVOVF9S
RE1BMF0JPSB7IE1US19ESVNQX1JETUEsCTAsIE5VTEwgfSwKIAlbRERQX0NPTVBPTkVOVF9SRE1B
MV0JPSB7IE1US19ESVNQX1JETUEsCTEsIE5VTEwgfSwKIAlbRERQX0NPTVBPTkVOVF9SRE1BMl0J
PSB7IE1US19ESVNQX1JETUEsCTIsIE5VTEwgfSwKLS0gCjIuMTIuNQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
