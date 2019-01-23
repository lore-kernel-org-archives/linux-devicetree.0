From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v3 3/5] drm: rcar-du: lvds: Add r8a7744 support
Date: Wed, 23 Jan 2019 09:59:31 +0100
Message-ID: <20190123085931.sn4yvolhit2gfcku@verge.net.au>
References: <1548170749-12773-1-git-send-email-biju.das@bp.renesas.com>
 <1548170749-12773-4-git-send-email-biju.das@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <1548170749-12773-4-git-send-email-biju.das@bp.renesas.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

T24gVHVlLCBKYW4gMjIsIDIwMTkgYXQgMDM6MjU6NDdQTSArMDAwMCwgQmlqdSBEYXMgd3JvdGU6
Cj4gVGhlIExWRFMgZW5jb2RlcnMgb24gUlovRzFOIFNvQyBpcyBzaW1pbGFyIHRvIFJaL0cxTS4g
QWRkIHN1cHBvcnQgZm9yCj4gUlovRzFOIChSOEE3NzQ0KSBTb0MgdG8gdGhlIExWRFMgZW5jb2Rl
ciBkcml2ZXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzQGJwLnJlbmVz
YXMuY29tPgoKUmV2aWV3ZWQtYnk6IFNpbW9uIEhvcm1hbiA8aG9ybXMrcmVuZXNhc0B2ZXJnZS5u
ZXQuYXU+Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2x2ZHMuYyB8IDEg
Kwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9sdmRzLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmNhci1k
dS9yY2FyX2x2ZHMuYwo+IGluZGV4IDk2ZDc0OWEuLmNhZWEyYzUgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9sdmRzLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
cmNhci1kdS9yY2FyX2x2ZHMuYwo+IEBAIC03ODUsNiArNzg1LDcgQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCByY2FyX2x2ZHNfZGV2aWNlX2luZm8gcmNhcl9sdmRzX3I4YTc3OTk1X2luZm8gPSB7Cj4g
IAo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCByY2FyX2x2ZHNfb2ZfdGFibGVb
XSA9IHsKPiAgCXsgLmNvbXBhdGlibGUgPSAicmVuZXNhcyxyOGE3NzQzLWx2ZHMiLCAuZGF0YSA9
ICZyY2FyX2x2ZHNfZ2VuMl9pbmZvIH0sCj4gKwl7IC5jb21wYXRpYmxlID0gInJlbmVzYXMscjhh
Nzc0NC1sdmRzIiwgLmRhdGEgPSAmcmNhcl9sdmRzX2dlbjJfaW5mbyB9LAo+ICAJeyAuY29tcGF0
aWJsZSA9ICJyZW5lc2FzLHI4YTc3NGMwLWx2ZHMiLCAuZGF0YSA9ICZyY2FyX2x2ZHNfcjhhNzc5
OTBfaW5mbyB9LAo+ICAJeyAuY29tcGF0aWJsZSA9ICJyZW5lc2FzLHI4YTc3OTAtbHZkcyIsIC5k
YXRhID0gJnJjYXJfbHZkc19yOGE3NzkwX2luZm8gfSwKPiAgCXsgLmNvbXBhdGlibGUgPSAicmVu
ZXNhcyxyOGE3NzkxLWx2ZHMiLCAuZGF0YSA9ICZyY2FyX2x2ZHNfZ2VuMl9pbmZvIH0sCj4gLS0g
Cj4gMi43LjQKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
