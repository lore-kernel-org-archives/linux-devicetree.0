From: Yakir Yang <ykk@rock-chips.com>
Subject: [RFC PATCH v1 2/2] dt-bindings: add document for rk3229-hdmi
Date: Thu,  7 Jan 2016 12:39:33 +0800
Message-ID: <1452141573-9490-1-git-send-email-ykk@rock-chips.com>
References: <1452141288-9292-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1452141288-9292-1-git-send-email-ykk@rock-chips.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Mark Yao <mark.yao@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, Russell King <rmk+kernel@arm.linux.org.uk>, Philipp Zabel <p.zabel@pengutronix.de>, Andy Yan <andy.yan@rock-chips.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org, Zheng Yang <zhengyang@rock-chips.com>
List-Id: devicetree@vger.kernel.org

U2lnbmVkLW9mZi1ieTogWWFraXIgWWFuZyA8eWtrQHJvY2stY2hpcHMuY29tPgotLS0KIC4uLi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcm9ja2NoaXAvZHdfaGRtaS1yb2NrY2hpcC50eHQg
ICAgICAgICB8IDQgKysrLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L3JvY2tjaGlwL2R3X2hkbWktcm9ja2NoaXAudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcm9ja2NoaXAvZHdfaGRtaS1yb2NrY2hpcC50eHQKaW5k
ZXggNjY4MDkxZi4uMWNkYzYyNyAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvcm9ja2NoaXAvZHdfaGRtaS1yb2NrY2hpcC50eHQKKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcm9ja2NoaXAvZHdfaGRtaS1y
b2NrY2hpcC50eHQKQEAgLTIsNyArMiw3IEBAIFJvY2tjaGlwIHNwZWNpZmljIGV4dGVuc2lvbnMg
dG8gdGhlIFN5bm9wc3lzIERlc2lnbndhcmUgSERNSQogPT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT0KIAogUmVxdWlyZWQgcHJvcGVydGllczoKLS0gY29tcGF0aWJsZTogInJvY2tjaGlw
LHJrMzI4OC1kdy1oZG1pIjsKKy0gY29tcGF0aWJsZTogInJvY2tjaGlwLHJrMzI4OC1kdy1oZG1p
IiwgInJvY2tjaGlwLHJrMzIyOS1kdy1oZG1pIjsKIC0gcmVnOiBQaHlzaWNhbCBiYXNlIGFkZHJl
c3MgYW5kIGxlbmd0aCBvZiB0aGUgY29udHJvbGxlcidzIHJlZ2lzdGVycy4KIC0gY2xvY2tzOiBw
aGFuZGxlIHRvIGhkbWkgaWFoYiBhbmQgaXNmciBjbG9ja3MuCiAtIGNsb2NrLW5hbWVzOiBzaG91
bGQgYmUgImlhaGIiICJpc2ZyIgpAQCAtMTUsOCArMTUsMTAgQEAgUmVxdWlyZWQgcHJvcGVydGll
czoKICAgcmszMjg4IHBsYXRmb3JtCiAKIE9wdGlvbmFsIHByb3BlcnRpZXMKKy0gcmVnOiBQaHlz
aWNhbCBiYXNlIGFkZHJlc3MgYW5kIGxlbmd0aCBvZiB0aGUgZXh0ZXJuYWwgSERNSSBQSFkncyBy
ZWdpc3RlcnMuCiAtIGRkYy1pMmMtYnVzOiBwaGFuZGxlIG9mIGFuIEkyQyBjb250cm9sbGVyIHVz
ZWQgZm9yIEREQyBFRElEIHByb2JpbmcKIC0gY2xvY2tzLCBjbG9jay1uYW1lczogcGhhbmRsZSB0
byB0aGUgSERNSSBDRUMgY2xvY2ssIG5hbWUgc2hvdWxkIGJlICJjZWMiCisJCSAgICAgICBwaGFu
ZGxlIHRvIHRoZSBleHRlcm5hbCBIRE1JIFBIWSBjbG9jaywgbmFtZSBzaG91bGQgYmUgImV4dHBo
eSIKIAogRXhhbXBsZToKIGhkbWk6IGhkbWlAZmY5ODAwMDAgewotLSAKMi4xLjIKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
