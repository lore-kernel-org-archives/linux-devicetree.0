From: Chris Zhong <zyw@rock-chips.com>
Subject: [PATCH 0/7] Rockchip dw-mipi-dsi driver
Date: Fri,  8 Jul 2016 17:04:54 +0800
Message-ID: <1467968701-15620-1-git-send-email-zyw@rock-chips.com>
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
To: dianders@chromium.org, tfiga@chromium.org, heiko@sntech.de, yzq@rock-chips.com
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Chris Zhong <zyw@rock-chips.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

CkhpIGFsbAoKVGhpcyBpcyBhIGJ1bmNoIG9mIGR3LW1pcGktZHNpIGRyaXZlciBmb3IgUkszMzk5
IGFuZCBSSzMyODgsIHRoZXkgaGF2ZQpiZWVuIHRlc3RlZCBvbiByazMzOTkgYW5kIHJrMzI4OCBl
dmIgYm9hcmQuCgpUaGlzIHNlcmllcyBpcyBiYXNlZCBvbiBNYXJrIFlhbydzIGJyYW5jaDoKaHR0
cHM6Ly9naXRodWIuY29tL21hcmt5enEva2VybmVsLWRybS1yb2NrY2hpcC90cmVlL2RybS1yb2Nr
Y2hpcC1uZXh0LTIwMTYtMDUtMjMKCgoKQ2hyaXMgWmhvbmcgKDcpOgogIGR0LWJpbmRpbmdzOiBh
ZGQgcmszMzk5IHN1cHBvcnQgZm9yIGR3LW1pcGktcm9ja2NoaXAKICBEUk06IG1pcGk6IHN1cHBv
cnQgcmszMzk5IG1pcGkgZHNpCiAgZHQtYmluZGluZ3M6IGFkZCBwb3dlciBkb21haW4gbm9kZSBm
b3IgZHctbWlwaS1yb2NrY2hpcAogIGRybS9yb2NrY2hpcDogZHctbWlwaTogYWRkIGR3LW1pcGkg
cG93ZXIgZG9tYWluIHN1cHBvcnQKICBkcm0vcm9ja2NoaXA6IGR3LW1pcGk6IHN1cHBvcnQgSFBE
IHBvbGwKICBkcm0vcm9ja2NoaXA6IGR3LW1pcGk6IGZpeCBwaHkgY2xrIGxhbmUgc3RvcCBzdGF0
ZSB0aW1lb3V0CiAgZHJtL3JvY2tjaGlwOiBkdy1taXBpOiBmaXggaW5zdWZmaWNpZW50IGJhbmR3
aWR0aCBvZiBzb21lIHBhbmVsCgogLi4uL2Rpc3BsYXkvcm9ja2NoaXAvZHdfbWlwaV9kc2lfcm9j
a2NoaXAudHh0ICAgICAgfCAgIDYgKwogZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2R3LW1pcGkt
ZHNpLmMgICAgICAgICAgICAgfCAxMzUgKysrKysrKysrKysrKysrKystLS0tCiAyIGZpbGVzIGNo
YW5nZWQsIDEyMCBpbnNlcnRpb25zKCspLCAyMSBkZWxldGlvbnMoLSkKCi0tIAoyLjYuMwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
