From: Yakir Yang <ykk@rock-chips.com>
Subject: [PATCH v1 1/6] drm/rockchip: dw_hdmi: Set cur_ctr to 0 always
Date: Mon, 11 Jul 2016 19:05:36 +0800
Message-ID: <1468235136-29417-1-git-send-email-ykk@rock-chips.com>
References: <1468235079-29152-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1468235079-29152-1-git-send-email-ykk@rock-chips.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Mark Yao <mark.yao@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Russell King <rmk+kernel@arm.linux.org.uk>, Philipp Zabel <p.zabel@pengutronix.de>, Andy Yan <andy.yan@rock-chips.com>
Cc: devicetree@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>, linux-rockchip@lists.infradead.org, Kumar Gala <galak@codeaurora.org>, xhc@rock-chips.com, linux-arm-kernel@lists.infradead.org, Zheng Yang <zhengyang@rock-chips.com>
List-Id: devicetree@vger.kernel.org

RnJvbTogRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPgoKSml0dGVyIHdh
cyBpbXByb3ZlZCBieSBsb3dlcmluZyB0aGUgTVBMTCBiYW5kd2lkdGggdG8gYWNjb3VudCBmb3Ig
aGlnaApmcmVxdWVuY3kgbm9pc2UgaW4gdGhlIHJrMzI4OCBQTEwuICBJbiBlYWNoIGNhc2UgTVBM
TCBiYW5kd2lkdGggd2FzCmxvd2VyZWQgb25seSBlbm91Z2ggdG8gZ2V0IHVzIGEgY29tZm9ydGFi
bGUgbWFyZ2luLiAgV2UgYmVsaWV2ZSB0aGF0Cmxvd2VyaW5nIHRoZSBiYW5kd2lkdGggbGlrZSB0
aGlzIGlzIHNhZmUgZ2l2ZW4gc3VmZmljaWVudCB0ZXN0aW5nLgoKU2lnbmVkLW9mZi1ieTogRG91
Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPgpTaWduZWQtb2ZmLWJ5OiBZYWtp
ciBZYW5nIDx5a2tAcm9jay1jaGlwcy5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlw
L2R3X2hkbWktcm9ja2NoaXAuYyB8IDE2ICsrLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9yb2NrY2hpcC9kd19oZG1pLXJvY2tjaGlwLmMgYi9kcml2ZXJzL2dwdS9kcm0vcm9j
a2NoaXAvZHdfaGRtaS1yb2NrY2hpcC5jCmluZGV4IDgwMTExMGYuLmE2MjExMTggMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9kd19oZG1pLXJvY2tjaGlwLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL3JvY2tjaGlwL2R3X2hkbWktcm9ja2NoaXAuYwpAQCAtMTE1LDIwICsxMTUs
OCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGR3X2hkbWlfbXBsbF9jb25maWcgcm9ja2NoaXBfbXBs
bF9jZmdbXSA9IHsKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHdfaGRtaV9jdXJyX2N0cmwgcm9ja2No
aXBfY3VyX2N0cltdID0gewogCS8qICAgICAgcGl4ZWxjbGsgICAgYnBwOCAgICBicHAxMCAgIGJw
cDEyICovCiAJewotCQk0MDAwMDAwMCwgIHsgMHgwMDE4LCAweDAwMTgsIDB4MDAxOCB9LAotCX0s
IHsKLQkJNjUwMDAwMDAsICB7IDB4MDAyOCwgMHgwMDI4LCAweDAwMjggfSwKLQl9LCB7Ci0JCTY2
MDAwMDAwLCAgeyAweDAwMzgsIDB4MDAzOCwgMHgwMDM4IH0sCi0JfSwgewotCQk3NDI1MDAwMCwg
IHsgMHgwMDI4LCAweDAwMzgsIDB4MDAzOCB9LAotCX0sIHsKLQkJODM1MDAwMDAsICB7IDB4MDAy
OCwgMHgwMDM4LCAweDAwMzggfSwKLQl9LCB7Ci0JCTE0NjI1MDAwMCwgeyAweDAwMzgsIDB4MDAz
OCwgMHgwMDM4IH0sCi0JfSwgewotCQkxNDg1MDAwMDAsIHsgMHgwMDAwLCAweDAwMzgsIDB4MDAz
OCB9LAotCX0sIHsKKwkJNjAwMDAwMDAwLCB7IDB4MDAwMCwgMHgwMDAwLCAweDAwMDAgfSwKKwl9
LCAgewogCQl+MFVMLCAgICAgIHsgMHgwMDAwLCAweDAwMDAsIDB4MDAwMH0sCiAJfQogfTsKLS0g
CjEuOS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
