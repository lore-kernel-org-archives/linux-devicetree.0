From: Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v3 3/6] dt-bindings: allow optional phys in Rockchip dw_hdmi
 binding
Date: Tue, 15 May 2018 15:47:33 +0200
Message-ID: <20180515134736.5824-4-heiko@sntech.de>
References: <20180515134736.5824-1-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180515134736.5824-1-heiko@sntech.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: architt@codeaurora.org, a.hajda@samsung.com
Cc: mark.rutland@arm.com, Jose.Abreu@synopsys.com, algea.cao@rock-chips.com, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com, linux-arm-kernel@lists.infradead.org, zhengyang@rock-chips.com
List-Id: devicetree@vger.kernel.org

U29tZSBuZXdlciBSb2NrY2hpcCBTb0NzIHVzZSBhbiBJbm5vc2lsaWNvbiBoZG1pcGh5IGFjY2Vz
c2VkIHZpYSBnZW5lcmFsCm1taW8sIHNvIGFsbG93IHRoZXNlIHRvIGJlIHJlZmVyZW5jZWQgdmlh
IHRoZSByZWd1bGFyIHBoeSBpbnRlcmZhY2VzCmFuZCB0aGVyZWZvcmUgYWRkIG9wdGlvbmFsIHBo
eS1yZWxhdGVkIHByb3BlcnRpZXMgdG8gdGhlIGJpbmRpbmcuCgpTaWduZWQtb2ZmLWJ5OiBIZWlr
byBTdHVlYm5lciA8aGVpa29Ac250ZWNoLmRlPgpSZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcgPHJv
YmhAa2VybmVsLm9yZz4KLS0tCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JvY2tj
aGlwL2R3X2hkbWktcm9ja2NoaXAudHh0ICAgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvcm9ja2NoaXAvZHdfaGRtaS1yb2NrY2hpcC50eHQgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9yb2NrY2hpcC9kd19oZG1pLXJvY2tjaGlwLnR4dApp
bmRleCBhZGM5NGZjM2M5ZjguLjkzN2JmYjQ3MmUxZCAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcm9ja2NoaXAvZHdfaGRtaS1yb2NrY2hpcC50
eHQKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcm9ja2No
aXAvZHdfaGRtaS1yb2NrY2hpcC50eHQKQEAgLTM0LDYgKzM0LDggQEAgT3B0aW9uYWwgcHJvcGVy
dGllcwogLSBjbG9jay1uYW1lczogTWF5IGNvbnRhaW4gImNlYyIgYXMgZGVmaW5lZCBpbiBkd19o
ZG1pLnR4dC4KIC0gY2xvY2stbmFtZXM6IE1heSBjb250YWluICJncmYiLCBwb3dlciBmb3IgZ3Jm
IGlvLgogLSBjbG9jay1uYW1lczogTWF5IGNvbnRhaW4gInZwbGwiLCBleHRlcm5hbCBjbG9jayBm
b3Igc29tZSBoZG1pIHBoeS4KKy0gcGh5czogZnJvbSBnZW5lcmFsIFBIWSBiaW5kaW5nOiB0aGUg
cGhhbmRsZSBmb3IgdGhlIFBIWSBkZXZpY2UuCistIHBoeS1uYW1lczogU2hvdWxkIGJlICJoZG1p
IiBpZiBwaHlzIHJlZmVyZW5jZXMgYW4gZXh0ZXJuYWwgcGh5LgogCiBFeGFtcGxlOgogCi0tIAoy
LjE3LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
