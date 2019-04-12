From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH V2 0/4] Add RZ/G2M DU support
Date: Fri, 12 Apr 2019 13:38:01 +0100
Message-ID: <1555072685-59276-1-git-send-email-biju.das@bp.renesas.com>
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
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, dri-devel@lists.freedesktop.org, Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

VGhpcyBwYXRjaCBzZXJpZXMgYWltcyB0byBhZGQgYmluZGluZy9kcml2ZXIgc3VwcG9ydCBmb3IK
UjhBNzc0QTEoYS5rLmEgUlovRzJNKSBEVSAod2hpY2ggaXMgdmVyeSBzaW1pbGFyIHRvIHRoZSBS
OEE3Nzk2IERVKTsKaXQgaGFzIG9uZSBSR0Igb3V0cHV0LCBvbmUgTFZEUyBvdXRwdXQgYW5kIG9u
ZSBIRE1JIG91dHB1dC4KClRoaXMgcGF0Y2hzZXQgaXMgYmFzZWQgb24gbGludXhfbmV4dCBuZXh0
LTIwMTkwNDExIGJyYW5jaC4KClYxLS0+VjIKICAqIEluY29ycG9yYXRlZCBLaWVyYW4ncyByZXZp
ZXcgY29tbWVudC4KICAgIChodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzEwODk2
MTY1LykKCkJpanUgRGFzICg0KToKICBkdC1iaW5kaW5nczogZGlzcGxheTogcmVuZXNhczogZHU6
IERvY3VtZW50IHRoZSByOGE3NzRhMSBiaW5kaW5ncwogIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiBy
ZW5lc2FzOiBsdmRzOiBEb2N1bWVudCByOGE3NzRhMSBiaW5kaW5ncwogIGRybTogcmNhci1kdTog
QWRkIFI4QTc3NEExIHN1cHBvcnQKICBkcm06IHJjYXItZHU6IGx2ZHM6IEFkZCByOGE3NzRhMSBz
dXBwb3J0CgogLi4uL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3JlbmVzYXMsbHZkcy50eHQgICAg
ICAgfCAgMSArCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JlbmVzYXMsZHUudHh0
ICAgICB8ICAyICsrCiBkcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2Rydi5jICAgICAg
ICAgICAgICB8IDMwICsrKysrKysrKysrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9yY2Fy
LWR1L3JjYXJfbHZkcy5jICAgICAgICAgICAgICAgIHwgIDEgKwogNCBmaWxlcyBjaGFuZ2VkLCAz
NCBpbnNlcnRpb25zKCspCgotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
