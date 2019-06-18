From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 0/3] Add HDMI support to HiHope RZ/G2M
Date: Tue, 18 Jun 2019 16:18:36 +0100
Message-ID: <1560871119-16570-1-git-send-email-fabrizio.castro@bp.renesas.com>
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
To: Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, xu_shunji@hoperun.com, Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

RGVhciBBbGwsCgp0aGlzIHNlcmllcyBhZGRzIEhETUkgc3VwcG9ydCB0byB0aGUgSGlIb3BlIFJa
L0cyTSBib2FyZC4KClRoYW5rcywKRmFiCgpGYWJyaXppbyBDYXN0cm8gKDMpOgogIGR0LWJpbmRp
bmdzOiBkaXNwbGF5OiByZW5lc2FzOiBBZGQgcjhhNzc0YTEgc3VwcG9ydAogIGFybTY0OiBkdHM6
IHJlbmVzYXM6IHI4YTc3NGExOiBBZGQgSERNSSBlbmNvZGVyIGluc3RhbmNlCiAgYXJtNjQ6IGR0
czogcmVuZXNhczogaGlob3BlLWNvbW1vbjogQWRkIEhETUkgc3VwcG9ydAoKIC4uLi9iaW5kaW5n
cy9kaXNwbGF5L2JyaWRnZS9yZW5lc2FzLGR3LWhkbWkudHh0ICAgIHwgIDQgKy0KIGFyY2gvYXJt
NjQvYm9vdC9kdHMvcmVuZXNhcy9oaWhvcGUtY29tbW9uLmR0c2kgICAgIHwgNjIgKysrKysrKysr
KysrKysrKysrKysrKwogYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3NGExLmR0c2kg
ICAgICAgICAgfCAzMiArKysrKysrKysrKwogMyBmaWxlcyBjaGFuZ2VkLCA5NyBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCgotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
