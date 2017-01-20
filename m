From: Chris Zhong <zyw@rock-chips.com>
Subject: [PATCH v3 4/5] dt-bindings: add power domain node for dw-mipi-rockchip
Date: Fri, 20 Jan 2017 18:10:50 +0800
Message-ID: <1484907051-7159-5-git-send-email-zyw@rock-chips.com>
References: <1484907051-7159-1-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1484907051-7159-1-git-send-email-zyw@rock-chips.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dianders@chromium.org, tfiga@chromium.org, heiko@sntech.de, yzq@rock-chips.com, mark.rutland@arm.com, devicetree@vger.kernel.org, robh+dt@kernel.org, galak@codeaurora.org, pawel.moll@arm.com, seanpaul@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, Chris Zhong <zyw@rock-chips.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

U2lnbmVkLW9mZi1ieTogQ2hyaXMgWmhvbmcgPHp5d0Byb2NrLWNoaXBzLmNvbT4KQWNrZWQtYnk6
IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Ci0tLQoKQ2hhbmdlcyBpbiB2MzogTm9uZQoK
IC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcm9ja2NoaXAvZHdfbWlwaV9kc2lfcm9j
a2NoaXAudHh0ICAgICAgfCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3Jv
Y2tjaGlwL2R3X21pcGlfZHNpX3JvY2tjaGlwLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L3JvY2tjaGlwL2R3X21pcGlfZHNpX3JvY2tjaGlwLnR4dAppbmRl
eCAwZjgyNTY4Li4xODhmNmY3IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZGlzcGxheS9yb2NrY2hpcC9kd19taXBpX2RzaV9yb2NrY2hpcC50eHQKKysrIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcm9ja2NoaXAvZHdfbWlw
aV9kc2lfcm9ja2NoaXAudHh0CkBAIC0xNSw2ICsxNSw5IEBAIFJlcXVpcmVkIHByb3BlcnRpZXM6
CiAtIHBvcnRzOiBjb250YWluIGEgcG9ydCBub2RlIHdpdGggZW5kcG9pbnQgZGVmaW5pdGlvbnMg
YXMgZGVmaW5lZCBpbiBbMl0uCiAgIEZvciB2b3BiLHNldCB0aGUgcmVnID0gPDA+IGFuZCBzZXQg
dGhlIHJlZyA9IDwxPiBmb3Igdm9wbC4KIAorT3B0aW9uYWwgcHJvcGVydGllczoKKy0gcG93ZXIt
ZG9tYWluczogYSBwaGFuZGxlIHRvIG1pcGkgZHNpIHBvd2VyIGRvbWFpbiBub2RlLgorCiBbMV0g
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL2Nsb2NrLWJpbmRpbmdzLnR4
dAogWzJdIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS92aWRlby1pbnRl
cmZhY2VzLnR4dAogCi0tIAoyLjYuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
