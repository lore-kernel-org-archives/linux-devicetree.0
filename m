From: Hyungwon Hwang <human.hwang@samsung.com>
Subject: [PATCH v6 04/15] drm/exynos: fix the input prompt of Exynos7 DECON
Date: Fri, 12 Jun 2015 21:58:59 +0900
Message-ID: <1434113958-15877-5-git-send-email-human.hwang@samsung.com>
References: <1434113958-15877-1-git-send-email-human.hwang@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1434113958-15877-1-git-send-email-human.hwang@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Cc: sw0312.kim@samsung.com
List-Id: devicetree@vger.kernel.org

VGhpcyBwYXRjaCBpcyBhIHByZXBhcmF0aW9uIHBhdGNoIGZvciBhZGRpbmcgc3VwcG9ydCBmb3Ig
RXh5bm9zNTQzMwpERUNPTi4gRXh5bm9zNyBERUNPTiBoYXZlIHRvIGJlIGRpc3Rpbmd1aXNoZWQg
ZnJvbSBFeHlub3M1NDMzIERFQ09OLgoKU2lnbmVkLW9mZi1ieTogSHl1bmd3b24gSHdhbmcgPGh1
bWFuLmh3YW5nQHNhbXN1bmcuY29tPgotLS0KQ2hhbmdlcyBmb3IgdjY6Ci0gTmV3CiBkcml2ZXJz
L2dwdS9kcm0vZXh5bm9zL0tjb25maWcgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9z
L0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL0tjb25maWcKaW5kZXggZjFiMTIzOS4u
ZGRiN2M4YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9LY29uZmlnCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9leHlub3MvS2NvbmZpZwpAQCAtMjUsNyArMjUsNyBAQCBjb25maWcg
RFJNX0VYWU5PU19GSU1ECiAJICBDaG9vc2UgdGhpcyBvcHRpb24gaWYgeW91IHdhbnQgdG8gdXNl
IEV4eW5vcyBGSU1EIGZvciBEUk0uCgogY29uZmlnIERSTV9FWFlOT1M3X0RFQ09OCi0JYm9vbCAi
RXh5bm9zIERSTSBERUNPTiIKKwlib29sICJFeHlub3M3IERSTSBERUNPTiIKIAlkZXBlbmRzIG9u
IERSTV9FWFlOT1MgJiYgIUZCX1MzQwogCXNlbGVjdCBGQl9NT0RFX0hFTFBFUlMKIAloZWxwCi0t
CjEuOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
