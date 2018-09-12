From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v3 05/23] v4l: fwnode: Add definitions for CSI-2 D-PHY,
 parallel and Bt.656 busses
Date: Thu, 13 Sep 2018 00:29:24 +0300
Message-ID: <20180912212942.19641-6-sakari.ailus@linux.intel.com>
References: <20180912212942.19641-1-sakari.ailus@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180912212942.19641-1-sakari.ailus@linux.intel.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org, jacopo@jmondi.org, dri-devel@lists.freedesktop.org, slongerbeam@gmail.com, niklas.soderlund@ragnatech.se
List-Id: devicetree@vger.kernel.org

QWRkIGRlZmluaXRpb25zIGNvcnJlc3BvbmRpbmcgdG8gRFQgYmluZGluZ3MgdG8gdGhlIENTSS0y
IEQtUEhZLCBwYXJhbGxlbAphbmQgQnQuNjU2IGJ1c3Nlcy4KClNpZ25lZC1vZmYtYnk6IFNha2Fy
aSBBaWx1cyA8c2FrYXJpLmFpbHVzQGxpbnV4LmludGVsLmNvbT4KVGVzdGVkLWJ5OiBTdGV2ZSBM
b25nZXJiZWFtIDxzdGV2ZV9sb25nZXJiZWFtQG1lbnRvci5jb20+Ci0tLQogZHJpdmVycy9tZWRp
YS92NGwyLWNvcmUvdjRsMi1md25vZGUuYyB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdjRsMi1md25v
ZGUuYyBiL2RyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3Y0bDItZndub2RlLmMKaW5kZXggY2Y5MGRk
YjVjNDMwLi4xMDRlZjdmMTc1NGQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbWVkaWEvdjRsMi1jb3Jl
L3Y0bDItZndub2RlLmMKKysrIGIvZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdjRsMi1md25vZGUu
YwpAQCAtMzYsNiArMzYsOSBAQCBlbnVtIHY0bDJfZndub2RlX2J1c190eXBlIHsKIAlWNEwyX0ZX
Tk9ERV9CVVNfVFlQRV9DU0kyX0NQSFksCiAJVjRMMl9GV05PREVfQlVTX1RZUEVfQ1NJMSwKIAlW
NEwyX0ZXTk9ERV9CVVNfVFlQRV9DQ1AyLAorCVY0TDJfRldOT0RFX0JVU19UWVBFX0NTSTJfRFBI
WSwKKwlWNEwyX0ZXTk9ERV9CVVNfVFlQRV9QQVJBTExFTCwKKwlWNEwyX0ZXTk9ERV9CVVNfVFlQ
RV9CVDY1NiwKIAlOUl9PRl9WNEwyX0ZXTk9ERV9CVVNfVFlQRSwKIH07CiAKLS0gCjIuMTEuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
