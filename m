From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: [PATCH v4 1/5] of: Add EXPORT_SYMBOL for of_chosen
Date: Mon, 22 Aug 2016 22:25:21 +0200
Message-ID: <1471897525-31118-2-git-send-email-noralf@tronnes.org>
References: <1471897525-31118-1-git-send-email-noralf@tronnes.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1471897525-31118-1-git-send-email-noralf@tronnes.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

RXhwb3J0IG9mX2Nob3NlbiBzbyBkcml2ZXJzIGJ1aWx0IGFzIG1vZHVsZXMgY2FuIGdldCBhY2Nl
c3MgdG8gaXQuClRoZSBzaW1wbGVkcm0gZHJpdmVyIHdpbGwgdXNlIHRoaXMgYW5kIGlzIGNvbXBh
dGlibGUgd2l0aApzaW1wbGUtZnJhbWVidWZmZXIgd2hpY2ggaXMgYSBzdWJub2RlIG9mIC9jaG9z
ZW4uCgpTaWduZWQtb2ZmLWJ5OiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4K
LS0tCiBkcml2ZXJzL29mL2Jhc2UuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9vZi9iYXNlLmMgYi9kcml2ZXJzL29mL2Jhc2UuYwpp
bmRleCA3NzkyMjY2Li40ODliZTAxIDEwMDY0NAotLS0gYS9kcml2ZXJzL29mL2Jhc2UuYworKysg
Yi9kcml2ZXJzL29mL2Jhc2UuYwpAQCAtMzgsNiArMzgsNyBAQCBMSVNUX0hFQUQoYWxpYXNlc19s
b29rdXApOwogc3RydWN0IGRldmljZV9ub2RlICpvZl9yb290OwogRVhQT1JUX1NZTUJPTChvZl9y
b290KTsKIHN0cnVjdCBkZXZpY2Vfbm9kZSAqb2ZfY2hvc2VuOworRVhQT1JUX1NZTUJPTChvZl9j
aG9zZW4pOwogc3RydWN0IGRldmljZV9ub2RlICpvZl9hbGlhc2VzOwogc3RydWN0IGRldmljZV9u
b2RlICpvZl9zdGRvdXQ7CiBzdGF0aWMgY29uc3QgY2hhciAqb2Zfc3Rkb3V0X29wdGlvbnM7Ci0t
IAoyLjguMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
