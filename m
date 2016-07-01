From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 0/2] Toshiba TC358767 eDP bridge driver
Date: Fri,  1 Jul 2016 16:50:08 +0200
Message-ID: <1467384610-29908-1-git-send-email-p.zabel@pengutronix.de>
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
To: dri-devel@lists.freedesktop.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Andrey Gusakov <andrey.gusakov@cogentembedded.com>, Rob Herring <robh+dt@kernel.org>, Chris Healy <Chris.Healy@zii.aero>, Kumar Gala <galak@codeaurora.org>, Thierry Reding <treding@nvidia.com>
List-Id: devicetree@vger.kernel.org

SGksCgp0aGlzIHBhdGNoc2V0IGFkZHMgRFQgYmluZGluZyBkb2NzIGFuZCBhIGRybV9icmlkZ2Ug
ZHJpdmVyIGZvciB0aGUKVG9zaGliYSBUQzM1ODc2NyBlRFAgYnJpZGdlLCBjdXJyZW50bHkgc3Vw
cG9ydGluZyBvbmx5IDI0LWJpdCBEUEkgaW5wdXQKYW5kIGNvbnRyb2wgdmlhIEkyQy4gVGhlIGNo
aXAgaXMgYWxzbyBjYXBhYmxlIHRvIGFjdCBhcyBhIERTSSBzaW5rLCBidXQKdGhlIGRyaXZlciBk
b2Vzbid0IHN1cHBvcnQgdGhhdCB5ZXQuCkl0IGlzIGJhc2VkIG9uIEFuZHJleSdzIGluaXRpYWwg
ZHJpdmVyLCB3aGljaCBjYW4gYmUgZm91bmQgYXQKaHR0cHM6Ly9naXRodWIuY29tL0NvZ2VudEVt
YmVkZGVkL2xpbnV4LXpvZGlhYy5naXQsIGNvbW1pdCA0YWJiMWQwYTlhMWMKKCJkcm0vaTJjOiB0
YzM1ODc2NyBlRFAgZW5jb2RlciBpbml0aWFsIGNvbW1pdCIpLiBJIGhhdmUgdHVybmVkIGl0IGlu
dG8KYSBkcm1fYnJpZGdlIGRyaXZlciBhbmQgY2hhbmdlZCBpdCB0byB1c2UgcmVnbWFwIGFuZCB0
aGUgZHJtX2RwIGhlbHBlcnMuCgpyZWdhcmRzClBoaWxpcHAKCkFuZHJleSBHdXNha292ICgxKToK
ICBkcm0vYnJpZGdlOiB0YzM1ODc2NzogQWRkIERQSSB0byBlRFAgYnJpZGdlIGRyaXZlcgoKUGhp
bGlwcCBaYWJlbCAoMSk6CiAgZHQtYmluZGluZ3M6IHRjMzU4NzY3OiBhZGQgRFQgZG9jdW1lbnRh
dGlvbgoKIC4uLi9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS90b3NoaWJhLHRjMzU4NzY3LnR4dCAg
IHwgICA0OCArCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL0tjb25maWcgICAgICAgICAgICAgICAg
ICAgICB8ICAgIDggKwogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9NYWtlZmlsZSAgICAgICAgICAg
ICAgICAgICAgfCAgICAxICsKIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYyAgICAg
ICAgICAgICAgICAgIHwgMTQxOSArKysrKysrKysrKysrKysrKysrKwogNCBmaWxlcyBjaGFuZ2Vk
LCAxNDc2IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvdG9zaGliYSx0YzM1ODc2Ny50eHQKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMKCi0tIAoy
LjguMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
