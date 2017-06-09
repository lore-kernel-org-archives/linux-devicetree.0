From: Mark Yao <mark.yao@rock-chips.com>
Subject: [PATCH v3 0/3] Add RK3399 HDMI Support
Date: Fri,  9 Jun 2017 15:10:28 +0800
Message-ID: <1496992228-10582-1-git-send-email-mark.yao@rock-chips.com>
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
To: Mark Yao <mark.yao@rock-chips.com>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org
List-Id: devicetree@vger.kernel.org

UkszMzk5IGFuZCBSSzMyODggc2hhcmVkIHRoZSBzYW1lIEhETUkgSVAgY29udHJvbGxlciwgb25s
eSBzb21lCmxpZ2h0IGRpZmZlcmVuY2Ugd2l0aCBHUkYgY29uZmlndXJlLCBhbmQgYW4gZXh0ZXJu
YWwgVlBMTCBjbG9jawpuZWVkIHRvIGNvbmZpZ3VyZS4KCmJhc2Ugb24gWWFraXIncyB2MSB0aHJl
YWQ6CiAgIGh0dHA6Ly9sa21sLml1LmVkdS9oeXBlcm1haWwvbGludXgva2VybmVsLzE2MDcuMS8w
MTQ2OC5odG1sCgpyZWx5IG9uIEpvc2UncyBoZG1pIHBoeSBwYXRjaDoKICAgaHR0cHM6Ly9wYXRj
aHdvcmsua2VybmVsLm9yZy9wYXRjaC85NzAyMjI5CgpTb21lIFlha2lyJ3MgaGRtaSBwYXRjaGVz
IGNhdXNlIGhkbWkgbm8gZGlzcGxheSBvbiBteSB0ZXN0LApzbyBJIHJlbW92ZSB0aGVtIG9uIHRo
aXMgdGhyZWFkLgoKVGVzdGVkIG9uIHJrMzM5OSBldmIgYm9hcmQgd2l0aCBrZXJuZWwgNC4xMi4w
LXJjMS4KCkNoYW5nZXMgaW4gdjM6CiAgcmVtb3ZlIGhkbWlfcGh5X2NvbmZpZ3VyZV9kd2NfaGRt
aV8zZF90eCBjYWxsYmFrLgoKQ2hhbmdlcyBpbiB2MjoKICByZWJhc2UgdG8gbmV3ZXN0IHVwdHJl
YW0sIHJldXNlIGhkbWlfcGh5X2NvbmZpZ3VyZV9kd2NfaGRtaV8zZF90eAoKTWFyayBZYW8gKDMp
OgogIGRybS9yb2NrY2hpcDogZHdfaGRtaTogYWRkIFJLMzM5OSBIRE1JIHN1cHBvcnQKICBkcm0v
cm9ja2NoaXA6IGR3X2hkbWk6IGludHJvZHVjZSB0aGUgVlBMTCBjbG9jayBzZXR0aW5nCiAgZHJt
L3JvY2tjaGlwOiBkd19oZG1pOiBpbnRyb2R1Y2UgdGhlIHBjbGsgZm9yIGdyZgoKIC4uLi9iaW5k
aW5ncy9kaXNwbGF5L3JvY2tjaGlwL2R3X2hkbWktcm9ja2NoaXAudHh0IHwgICA2ICstCiBkcml2
ZXJzL2dwdS9kcm0vcm9ja2NoaXAvZHdfaGRtaS1yb2NrY2hpcC5jICAgICAgICB8IDExMCArKysr
KysrKysrKysrKysrKystLS0KIDIgZmlsZXMgY2hhbmdlZCwgMTAyIGluc2VydGlvbnMoKyksIDE0
IGRlbGV0aW9ucygtKQoKLS0gCjEuOS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
