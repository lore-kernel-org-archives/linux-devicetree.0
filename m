From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v4 2/2] drm: bridge: add sii902x DT bindings doc
Date: Mon, 16 May 2016 16:04:29 +0200
Message-ID: <1463407469-21819-2-git-send-email-boris.brezillon@free-electrons.com>
References: <1463407469-21819-1-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1463407469-21819-1-git-send-email-boris.brezillon@free-electrons.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Mark Rutland <mark.rutland@arm.com>, Meng Yi <meng.yi@nxp.com>, Xiubo Li <lixiubo@cmss.chinamobile.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Alison Wang <alison.wang@nxp.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Kumar Gala <galak@codeaurora.org>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Jianwei Wang <jianwei.wang.chn@gmail.com>
List-Id: devicetree@vger.kernel.org

QWRkIFNpaTkwMjIgRFQgYmluZGluZ3MgZGVzY3JpcHRpb24uCgpTaWduZWQtb2ZmLWJ5OiBCb3Jp
cyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBmcmVlLWVsZWN0cm9ucy5jb20+Ci0tLQpDaGFu
Z2VzIHNpbmNlIHYxOgotIHJlbmFtZSBkb2MgZmlsZQotIHMvc2lsOTAyL3NpaTkwMi8KLS0tCiAu
Li4vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9zaWk5MDJ4LnR4dCB8IDM1ICsr
KysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAzNSBpbnNlcnRpb25zKCspCiBj
cmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvYnJpZGdlL3NpaTkwMngudHh0CgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3NpaTkwMngudHh0IGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3NpaTkwMngudHh0Cm5ldyBmaWxlIG1v
ZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAuLmU4ZDBmZmEKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2Uvc2lpOTAyeC50eHQK
QEAgLTAsMCArMSwzNSBAQAorc2lpOTAyeCBIRE1JIGJyaWRnZSBiaW5kaW5ncworCitSZXF1aXJl
ZCBwcm9wZXJ0aWVzOgorCS0gY29tcGF0aWJsZTogInNpbCxzaWk5MDIyIgorCS0gcmVnOiBpMmMg
YWRkcmVzcyBvZiB0aGUgYnJpZGdlCisJLSByZXNldC1ncGlvczogT0YgZGV2aWNlLXRyZWUgZ3Bp
byBzcGVjaWZpY2F0aW9uIGZvciBSU1RfTiBwaW4uCisKK09wdGlvbmFsIHByb3BlcnRpZXM6CisJ
LSBpbnRlcnJ1cHRzLWV4dGVuZGVkIG9yIGludGVycnVwdC1wYXJlbnQgKyBpbnRlcnJ1cHRzOiBk
ZXNjcmliZQorCSAgdGhlIGludGVycnVwdCBsaW5lIHVzZWQgdG8gaW5mb3JtIHRoZSBob3N0IGFi
b3V0IGhvdHBsdWcgZXZlbnRzLgorCitPcHRpb25hbCBzdWJub2RlczoKKwktIHZpZGVvIGlucHV0
OiB0aGlzIHN1Ym5vZGUgY2FuIGNvbnRhaW4gYSB2aWRlbyBpbnB1dCBwb3J0IG5vZGUKKwkgIHRv
IGNvbm5lY3QgdGhlIGJyaWRnZSB0byBhIGRpc3BsYXkgY29udHJvbGxlciBvdXRwdXQgKFNlZSB0
aGlzCisJICBkb2N1bWVudGF0aW9uIFsxXSkuCisKK1sxXTogRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL21lZGlhL3ZpZGVvLWludGVyZmFjZXMudHh0CisKK0V4YW1wbGU6CisJaGRt
aS1icmlkZ2VAMzkgeworCQljb21wYXRpYmxlID0gInNpbCxzaWk5MDIyIjsKKwkJcmVnID0gPDB4
Mzk+OworCQlyZXNldC1ncGlvcyA9IDwmcGlvQSAxIDA+OworCQlwb3J0cyB7CisJCQkjYWRkcmVz
cy1jZWxscyA9IDwxPjsKKwkJCSNzaXplLWNlbGxzID0gPDA+OworCisJCQlwb3J0QDAgeworCQkJ
CXJlZyA9IDwwPjsKKwkJCQlicmlkZ2VfaW46IGVuZHBvaW50IHsKKwkJCQkJcmVtb3RlLWVuZHBv
aW50ID0gPCZkY19vdXQ+OworCQkJCX07CisJCQl9OworCQl9OworCX07Ci0tIAoyLjcuNAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
