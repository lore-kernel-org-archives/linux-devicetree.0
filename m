From: Mark Yao <mark.yao@rock-chips.com>
Subject: [PATCH v2 0/4] Add RK3399 HDMI Support
Date: Fri,  9 Jun 2017 10:41:10 +0800
Message-ID: <1496976070-29573-1-git-send-email-mark.yao@rock-chips.com>
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
To: Archit Taneja <architt@codeaurora.org>, David Airlie <airlied@linux.ie>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Jose Abreu <Jose.Abreu@synopsys.com>, Neil Armstrong <narmstrong@baylibre.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Mark Yao <mark.yao@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

UkszMzk5IGFuZCBSSzMyODggc2hhcmVkIHRoZSBzYW1lIEhETUkgSVAgY29udHJvbGxlciwgb25s
eSBzb21lCmxpZ2h0IGRpZmZlcmVuY2Ugd2l0aCBHUkYgY29uZmlndXJlLCBhbmQgYW4gZXh0ZXJu
YWwgVlBMTCBjbG9jawpuZWVkIHRvIGNvbmZpZ3VyZS4KCmJhc2Ugb24gWWFraXIncyB2MSB0aHJl
YWQ6CiAgIGh0dHA6Ly9sa21sLml1LmVkdS9oeXBlcm1haWwvbGludXgva2VybmVsLzE2MDcuMS8w
MTQ2OC5odG1sCgpTb21lIFlha2lyJ3MgaGRtaSBwYXRjaGVzIGNhdXNlIGhkbWkgbm8gZGlzcGxh
eSBvbiBteSB0ZXN0LApzbyBJIHJlbW92ZSB0aGVtIG9uIHRoaXMgdGhyZWFkLgoKVGVzdGVkIG9u
IHJrMzM5OSBldmIgYm9hcmQgd2l0aCBrZXJuZWwgNC4xMi4wLXJjMS4KCkNoYW5nZXMgaW4gdjI6
CiAgcmViYXNlIHRvIG5ld2VzdCB1cHRyZWFtLCByZXVzZSBoZG1pX3BoeV9jb25maWd1cmVfZHdj
X2hkbWlfM2RfdHgKCk1hcmsgWWFvICgyKToKICBkcm06IGJyaWRnZTogZHctaGRtaTogRXhwb3J0
IGhkbWlfcGh5X2NvbmZpZ3VyZV9kd2NfaGRtaV8zZF90eAogIGRybS9yb2NrY2hpcDogZHdfaGRt
aTogYWRkIFJLMzM5OSBIRE1JIHN1cHBvcnQKCllha2lyIFlhbmcgKDIpOgogIGRybS9yb2NrY2hp
cDogZHdfaGRtaTogaW50cm9kdWNlIHRoZSBWUExMIGNsb2NrIHNldHRpbmcKICBkcm0vcm9ja2No
aXA6IGR3X2hkbWk6IGludHJvZHVjZSB0aGUgcGNsayBmb3IgZ3JmCgogLi4uL2JpbmRpbmdzL2Rp
c3BsYXkvcm9ja2NoaXAvZHdfaGRtaS1yb2NrY2hpcC50eHQgfCAgIDMgKy0KIGRyaXZlcnMvZ3B1
L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jICAgICAgICAgIHwgICAzICstCiBkcml2ZXJz
L2dwdS9kcm0vcm9ja2NoaXAvZHdfaGRtaS1yb2NrY2hpcC5jICAgICAgICB8IDExMiArKysrKysr
KysrKysrKysrKystLS0KIGluY2x1ZGUvZHJtL2JyaWRnZS9kd19oZG1pLmggICAgICAgICAgICAg
ICAgICAgICAgIHwgICAzICsKIDQgZmlsZXMgY2hhbmdlZCwgMTA3IGluc2VydGlvbnMoKyksIDE0
IGRlbGV0aW9ucygtKQoKLS0gCjEuOS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
