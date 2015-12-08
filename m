From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 0/3] drm/bridge: add Silicon Image SiI8620 driver
Date: Tue, 08 Dec 2015 14:49:03 +0100
Message-ID: <1449582546-18667-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Thierry Reding <treding@nvidia.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: devicetree@vger.kernel.org

SGksCgpUaGlzIHBhdGNoc2V0IGFkZHMgTUhMIGJyaWRnZSBkcml2ZXIgZm9yIFNpbGljb24gSW1h
Z2UgU2lJODYyMCBjaGlwLgpUaGUgY2hpcCBpcyBxdWl0ZSBwb3dlcmZ1bCwgc3VwcG9ydHMgTUhM
IHZlcnNpb25zIHVwIHRvIDMuMC4gSXQgaXMgcHJlc2VudAppbiBtdWx0aXBsZSBtb2JpbGUgZGV2
aWNlcy4KCkkgaGF2ZSBwdXQgY29tbW9uIE1ITCBkZWZpbml0aW9ucyBpbnRvIGluY2x1ZGUvbGlu
dXgvbWhsLmggaGVhZGVyIGZpbGUsCnNpbWlsYXJpbHkgdG8gaW5jbHVkZS9saW51eC9oZG1pLmgu
CgpUaGUgcGF0Y2hzZXQgaXMgYmFzZWQgb24gbGF0ZXN0IGV4eW5vcy1kcm0tbmV4dCBicmFuY2gu
CgpSZWdhcmRzCkFuZHJ6ZWoKCgpBbmRyemVqIEhhamRhICgzKToKICB2aWRlbzogYWRkIGhlYWRl
ciBmaWxlIGZvciBNb2JpbGUgSGlnaC1EZWZpbml0aW9uIExpbmsgKE1ITCkgaW50ZXJmYWNlCiAg
ZHQtYmluZGluZ3M6IGFkZCBTaWxpY29uIEltYWdlIFNpSTg2MjAgYnJpZGdlIGJpbmRpbmdzCiAg
ZHJtL2JyaWRnZTogYWRkIFNpbGljb24gSW1hZ2UgU2lJODYyMCBkcml2ZXIKCiAuLi4vYmluZGlu
Z3MvdmlkZW8vYnJpZGdlL3NpbC1zaWk4NjIwLnR4dCAgICAgICAgICB8ICAgMzQgKwogZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgfCAgICA3ICsKIGRy
aXZlcnMvZ3B1L2RybS9icmlkZ2UvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgIHwgICAgMSAr
CiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NpbC1zaWk4NjIwLmMgICAgICAgICAgICAgICB8IDE1
NjcgKysrKysrKysrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lsLXNpaTg2
MjAuaCAgICAgICAgICAgICAgIHwgMTUxNyArKysrKysrKysrKysrKysrKysrCiBpbmNsdWRlL2xp
bnV4L21obC5oICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyOTIgKysrKwogNiBm
aWxlcyBjaGFuZ2VkLCAzNDE4IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmlkZW8vYnJpZGdlL3NpbC1zaWk4NjIwLnR4
dAogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lsLXNpaTg2MjAu
YwogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lsLXNpaTg2MjAu
aAogY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvbGludXgvbWhsLmgKCi0tIAoxLjkuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
