From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH v3 0/5] Add Display support
Date: Tue, 22 Jan 2019 15:25:44 +0000
Message-ID: <1548170749-12773-1-git-send-email-biju.das@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
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
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, Simon Horman <horms@verge.net.au>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

VGhpcyBwYXRjaCBzZXJpZXMgYWltcyB0byBhZGQgZGlzcGxheSBzdXBwb3J0IGZvciBpV2F2ZSBH
MjBELVE3IGJvYXJkIGJhc2VkIG9uIFJaL0cxTi4KClRoaXMgcGF0Y2ggc2VyaWVzIGlzIHRlc3Rl
ZCBhZ2FpbnN0IGxpbnV4LW5leHQKClYxLS0+IFYyCgkqIEFkZCBEVSBzdXBwb3J0IDogUmVtb3Zl
ZCBMVkRTIGRlZmluaXRpb24gZnJvbSByOGE3NzQzIERVIG5vZGUuClYyLS0+IFYzCgkqIEFkZGVk
IExWRFMgc3VwcG9ydCBmb3IgYm90aCByOGE3NzQzIGFuZCByOGE3NzQ0IFNvQy4KCkJpanUgRGFz
ICg1KToKICBBUk06IGR0czogcjhhNzc0MzogQ29udmVydCB0byBuZXcgTFZEUyBEVCBiaW5kaW5n
cwogIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiByZW5lc2FzOiBsdmRzOiBEb2N1bWVudCByOGE3NzQ0
IGJpbmRpbmdzCiAgZHJtOiByY2FyLWR1OiBsdmRzOiBBZGQgcjhhNzc0NCBzdXBwb3J0CiAgQVJN
OiBkdHM6IHI4YTc3NDQ6IEFkZCBEVSBzdXBwb3J0CiAgQVJNOiBkdHM6IHI4YTc3NDQ6IEFkZCBM
VkRTIHN1cHBvcnQKCiAuLi4vYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvcmVuZXNhcyxsdmRzLnR4
dCAgICAgICB8ICAxICsKIGFyY2gvYXJtL2Jvb3QvZHRzL3I4YTc3NDMuZHRzaSAgICAgICAgICAg
ICAgICAgICAgIHwgMzYgKysrKysrKysrKysrKysrKy0tLS0KIGFyY2gvYXJtL2Jvb3QvZHRzL3I4
YTc3NDQuZHRzaSAgICAgICAgICAgICAgICAgICAgIHwgMzggKysrKysrKysrKysrKysrKysrKyst
LQogZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9sdmRzLmMgICAgICAgICAgICAgICAgfCAg
MSArCiA0IGZpbGVzIGNoYW5nZWQsIDY3IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgot
LSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
