From: Chris Zhong <zyw@rock-chips.com>
Subject: [RESEND PATCH v7 5/7] dt-bindings: add power domain node for
 dw-mipi-rockchip
Date: Mon, 20 Feb 2017 16:02:21 +0800
Message-ID: <1487577744-2855-6-git-send-email-zyw@rock-chips.com>
References: <1487577744-2855-1-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1487577744-2855-1-git-send-email-zyw@rock-chips.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: john@metanate.com, dianders@chromium.org, tfiga@chromium.org, heiko@sntech.de, yzq@rock-chips.com, mark.rutland@arm.com, devicetree@vger.kernel.org, robh+dt@kernel.org, galak@codeaurora.org, pawel.moll@arm.com, seanpaul@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, Chris Zhong <zyw@rock-chips.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

U2lnbmVkLW9mZi1ieTogQ2hyaXMgWmhvbmcgPHp5d0Byb2NrLWNoaXBzLmNvbT4KQWNrZWQtYnk6
IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Ci0tLQoKQ2hhbmdlcyBpbiB2NjogTm9uZQpD
aGFuZ2VzIGluIHY1OiBOb25lCkNoYW5nZXMgaW4gdjQ6IE5vbmUKQ2hhbmdlcyBpbiB2MzogTm9u
ZQoKIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcm9ja2NoaXAvZHdfbWlwaV9kc2lf
cm9ja2NoaXAudHh0ICAgICAgfCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L3JvY2tjaGlwL2R3X21pcGlfZHNpX3JvY2tjaGlwLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JvY2tjaGlwL2R3X21pcGlfZHNpX3JvY2tjaGlwLnR4dApp
bmRleCAwZjgyNTY4Li4xODhmNmY3IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9yb2NrY2hpcC9kd19taXBpX2RzaV9yb2NrY2hpcC50eHQKKysr
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcm9ja2NoaXAvZHdf
bWlwaV9kc2lfcm9ja2NoaXAudHh0CkBAIC0xNSw2ICsxNSw5IEBAIFJlcXVpcmVkIHByb3BlcnRp
ZXM6CiAtIHBvcnRzOiBjb250YWluIGEgcG9ydCBub2RlIHdpdGggZW5kcG9pbnQgZGVmaW5pdGlv
bnMgYXMgZGVmaW5lZCBpbiBbMl0uCiAgIEZvciB2b3BiLHNldCB0aGUgcmVnID0gPDA+IGFuZCBz
ZXQgdGhlIHJlZyA9IDwxPiBmb3Igdm9wbC4KIAorT3B0aW9uYWwgcHJvcGVydGllczoKKy0gcG93
ZXItZG9tYWluczogYSBwaGFuZGxlIHRvIG1pcGkgZHNpIHBvd2VyIGRvbWFpbiBub2RlLgorCiBb
MV0gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL2Nsb2NrLWJpbmRpbmdz
LnR4dAogWzJdIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS92aWRlby1p
bnRlcmZhY2VzLnR4dAogCi0tIAoyLjYuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
