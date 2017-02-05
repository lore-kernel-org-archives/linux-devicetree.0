From: Chris Zhong <zyw@rock-chips.com>
Subject: [PATCH v5 5/6] dt-bindings: add power domain node for dw-mipi-rockchip
Date: Sun,  5 Feb 2017 11:54:13 +0800
Message-ID: <1486266854-9887-6-git-send-email-zyw@rock-chips.com>
References: <1486266854-9887-1-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1486266854-9887-1-git-send-email-zyw@rock-chips.com>
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
IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Ci0tLQoKQ2hhbmdlcyBpbiB2NTogTm9uZQpD
aGFuZ2VzIGluIHY0OiBOb25lCkNoYW5nZXMgaW4gdjM6IE5vbmUKCiAuLi4vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L3JvY2tjaGlwL2R3X21pcGlfZHNpX3JvY2tjaGlwLnR4dCAgICAgIHwg
MyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9yb2NrY2hpcC9kd19taXBpX2Rz
aV9yb2NrY2hpcC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9yb2NrY2hpcC9kd19taXBpX2RzaV9yb2NrY2hpcC50eHQKaW5kZXggMGY4MjU2OC4uMTg4ZjZm
NyAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
cm9ja2NoaXAvZHdfbWlwaV9kc2lfcm9ja2NoaXAudHh0CisrKyBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JvY2tjaGlwL2R3X21pcGlfZHNpX3JvY2tjaGlwLnR4
dApAQCAtMTUsNiArMTUsOSBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzOgogLSBwb3J0czogY29udGFp
biBhIHBvcnQgbm9kZSB3aXRoIGVuZHBvaW50IGRlZmluaXRpb25zIGFzIGRlZmluZWQgaW4gWzJd
LgogICBGb3Igdm9wYixzZXQgdGhlIHJlZyA9IDwwPiBhbmQgc2V0IHRoZSByZWcgPSA8MT4gZm9y
IHZvcGwuCiAKK09wdGlvbmFsIHByb3BlcnRpZXM6CistIHBvd2VyLWRvbWFpbnM6IGEgcGhhbmRs
ZSB0byBtaXBpIGRzaSBwb3dlciBkb21haW4gbm9kZS4KKwogWzFdIERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9jbG9jay9jbG9jay1iaW5kaW5ncy50eHQKIFsyXSBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvdmlkZW8taW50ZXJmYWNlcy50eHQKIAotLSAK
Mi42LjMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
