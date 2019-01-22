From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH v3 3/5] drm: rcar-du: lvds: Add r8a7744 support
Date: Tue, 22 Jan 2019 15:25:47 +0000
Message-ID: <1548170749-12773-4-git-send-email-biju.das@bp.renesas.com>
References: <1548170749-12773-1-git-send-email-biju.das@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1548170749-12773-1-git-send-email-biju.das@bp.renesas.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, dri-devel@lists.freedesktop.org, Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

VGhlIExWRFMgZW5jb2RlcnMgb24gUlovRzFOIFNvQyBpcyBzaW1pbGFyIHRvIFJaL0cxTS4gQWRk
IHN1cHBvcnQgZm9yClJaL0cxTiAoUjhBNzc0NCkgU29DIHRvIHRoZSBMVkRTIGVuY29kZXIgZHJp
dmVyLgoKU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzQGJwLnJlbmVzYXMuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfbHZkcy5jIHwgMSArCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmNhci1k
dS9yY2FyX2x2ZHMuYyBiL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfbHZkcy5jCmluZGV4
IDk2ZDc0OWEuLmNhZWEyYzUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3Jj
YXJfbHZkcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfbHZkcy5jCkBAIC03
ODUsNiArNzg1LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCByY2FyX2x2ZHNfZGV2aWNlX2luZm8g
cmNhcl9sdmRzX3I4YTc3OTk1X2luZm8gPSB7CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2
aWNlX2lkIHJjYXJfbHZkc19vZl90YWJsZVtdID0gewogCXsgLmNvbXBhdGlibGUgPSAicmVuZXNh
cyxyOGE3NzQzLWx2ZHMiLCAuZGF0YSA9ICZyY2FyX2x2ZHNfZ2VuMl9pbmZvIH0sCisJeyAuY29t
cGF0aWJsZSA9ICJyZW5lc2FzLHI4YTc3NDQtbHZkcyIsIC5kYXRhID0gJnJjYXJfbHZkc19nZW4y
X2luZm8gfSwKIAl7IC5jb21wYXRpYmxlID0gInJlbmVzYXMscjhhNzc0YzAtbHZkcyIsIC5kYXRh
ID0gJnJjYXJfbHZkc19yOGE3Nzk5MF9pbmZvIH0sCiAJeyAuY29tcGF0aWJsZSA9ICJyZW5lc2Fz
LHI4YTc3OTAtbHZkcyIsIC5kYXRhID0gJnJjYXJfbHZkc19yOGE3NzkwX2luZm8gfSwKIAl7IC5j
b21wYXRpYmxlID0gInJlbmVzYXMscjhhNzc5MS1sdmRzIiwgLmRhdGEgPSAmcmNhcl9sdmRzX2dl
bjJfaW5mbyB9LAotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
