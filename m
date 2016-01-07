From: Yakir Yang <ykk@rock-chips.com>
Subject: [RFC PATCH v2 4/4] dt-bindings: add document for rk3229-hdmi
Date: Thu,  7 Jan 2016 17:05:11 +0800
Message-ID: <1452157511-18891-1-git-send-email-ykk@rock-chips.com>
References: <1452156811-18150-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1452156811-18150-1-git-send-email-ykk@rock-chips.com>
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

U2lnbmVkLW9mZi1ieTogWWFraXIgWWFuZyA8eWtrQHJvY2stY2hpcHMuY29tPgotLS0KQ2hhbmdl
cyBpbiB2MjogTm9uZQoKIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcm9ja2NoaXAv
ZHdfaGRtaS1yb2NrY2hpcC50eHQgICAgICAgICB8IDQgKysrLQogMSBmaWxlIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JvY2tjaGlwL2R3X2hkbWktcm9ja2NoaXAudHh0
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcm9ja2NoaXAvZHdf
aGRtaS1yb2NrY2hpcC50eHQKaW5kZXggNjY4MDkxZi4uMWNkYzYyNyAxMDA2NDQKLS0tIGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcm9ja2NoaXAvZHdfaGRtaS1y
b2NrY2hpcC50eHQKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvcm9ja2NoaXAvZHdfaGRtaS1yb2NrY2hpcC50eHQKQEAgLTIsNyArMiw3IEBAIFJvY2tjaGlw
IHNwZWNpZmljIGV4dGVuc2lvbnMgdG8gdGhlIFN5bm9wc3lzIERlc2lnbndhcmUgSERNSQogPT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KIAogUmVxdWlyZWQgcHJvcGVydGllczoKLS0g
Y29tcGF0aWJsZTogInJvY2tjaGlwLHJrMzI4OC1kdy1oZG1pIjsKKy0gY29tcGF0aWJsZTogInJv
Y2tjaGlwLHJrMzI4OC1kdy1oZG1pIiwgInJvY2tjaGlwLHJrMzIyOS1kdy1oZG1pIjsKIC0gcmVn
OiBQaHlzaWNhbCBiYXNlIGFkZHJlc3MgYW5kIGxlbmd0aCBvZiB0aGUgY29udHJvbGxlcidzIHJl
Z2lzdGVycy4KIC0gY2xvY2tzOiBwaGFuZGxlIHRvIGhkbWkgaWFoYiBhbmQgaXNmciBjbG9ja3Mu
CiAtIGNsb2NrLW5hbWVzOiBzaG91bGQgYmUgImlhaGIiICJpc2ZyIgpAQCAtMTUsOCArMTUsMTAg
QEAgUmVxdWlyZWQgcHJvcGVydGllczoKICAgcmszMjg4IHBsYXRmb3JtCiAKIE9wdGlvbmFsIHBy
b3BlcnRpZXMKKy0gcmVnOiBQaHlzaWNhbCBiYXNlIGFkZHJlc3MgYW5kIGxlbmd0aCBvZiB0aGUg
ZXh0ZXJuYWwgSERNSSBQSFkncyByZWdpc3RlcnMuCiAtIGRkYy1pMmMtYnVzOiBwaGFuZGxlIG9m
IGFuIEkyQyBjb250cm9sbGVyIHVzZWQgZm9yIEREQyBFRElEIHByb2JpbmcKIC0gY2xvY2tzLCBj
bG9jay1uYW1lczogcGhhbmRsZSB0byB0aGUgSERNSSBDRUMgY2xvY2ssIG5hbWUgc2hvdWxkIGJl
ICJjZWMiCisJCSAgICAgICBwaGFuZGxlIHRvIHRoZSBleHRlcm5hbCBIRE1JIFBIWSBjbG9jaywg
bmFtZSBzaG91bGQgYmUgImV4dHBoeSIKIAogRXhhbXBsZToKIGhkbWk6IGhkbWlAZmY5ODAwMDAg
ewotLSAKMi4xLjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
